/**
 * Content Loader - Fetches educational content from Supabase.
 * Replaces static HTML content with API-driven loading.
 *
 * Usage: Add data-section="1.1" to the <main> element.
 */
(function () {
  'use strict';

  function onReady(fn) {
    if (window.supabaseClient) { fn(); } else { window.addEventListener('supabaseReady', fn); }
  }

  onReady(async function () {
    var main = document.querySelector('main[data-section]');
    if (!main) return;

    var sectionId = main.getAttribute('data-section');
    if (!sectionId) return;

    // Show loading state
    var contentArea = document.getElementById('content-body');
    if (!contentArea) return;
    contentArea.innerHTML = '<p style="color:#888;padding:40px 0;text-align:center;">読み込み中...</p>';

    try {
      var result = await window.supabaseClient
        .from('content_pages')
        .select('content_html, title, is_free')
        .eq('section_id', sectionId)
        .single();

      if (result.error) {
        // Admin premium mode: bypass RLS restrictions
        var adminMode = typeof window.adminViewMode === 'function' ? window.adminViewMode() : null;
        if (adminMode === 'premium' && (result.error.code === 'PGRST116' || (result.error.message && result.error.message.includes('0 rows')))) {
          // Retry with service-level access hint — for now, show content is restricted by DB
          contentArea.innerHTML = '<p style="color:#888;padding:40px 0;text-align:center;">管理者モード: このコンテンツはSupabaseのRLSにより保護されています。<br>SQL Editorで該当ユーザーにsubscriptionを付与するか、RLSポリシーを調整してください。</p>';
          return;
        }
        if (result.error.code === 'PGRST116' || (result.error.message && result.error.message.includes('0 rows'))) {
          showPremiumWall(contentArea);
        } else {
          contentArea.innerHTML = '<p style="color:#d13438;">コンテンツの読み込みに失敗しました。</p>';
          console.error('Content load error:', result.error);
        }
        return;
      }

      if (result.data && result.data.content_html) {
        // Admin view mode: simulate different access levels
        if (typeof window.adminViewMode === 'function') {
          var viewMode = window.adminViewMode();
          var contentAccess = result.data.access_level || (result.data.is_free ? 'guest' : 'premium');
          if (viewMode === 'guest' && contentAccess !== 'guest') {
            showPremiumWall(contentArea);
            return;
          }
          if (viewMode === 'free' && contentAccess === 'premium') {
            showPremiumWall(contentArea);
            return;
          }
        }
        contentArea.innerHTML = result.data.content_html;
        // Remove duplicate h1 if the loaded content starts with the same title as the page
        var pageH1 = document.querySelector('.main-content > h1');
        var contentH1 = contentArea.querySelector('h1');
        if (pageH1 && contentH1 && pageH1.textContent.trim() === contentH1.textContent.trim()) {
          contentH1.remove();
        }
        // Notify inline-quiz that content is ready
        window.dispatchEvent(new Event('contentLoaded'));
      }
    } catch (e) {
      console.error('Content loader error:', e);
      contentArea.innerHTML = '<p style="color:#d13438;">コンテンツの読み込みに失敗しました。</p>';
    }
  });

  function showPremiumWall(container) {
    var rel = window._siteRelativePath || function (p) { return '../../' + p; };
    container.innerHTML =
      '<div style="text-align:center;padding:60px 20px;">' +
        '<div style="width:64px;height:64px;margin:0 auto 20px;background:#e0ecf7;border-radius:50%;display:flex;align-items:center;justify-content:center;">' +
          '<svg width="28" height="28" viewBox="0 0 24 24" fill="none" stroke="#0078d4" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">' +
            '<rect x="3" y="11" width="18" height="11" rx="2" ry="2"/>' +
            '<path d="M7 11V7a5 5 0 0 1 10 0v4"/>' +
          '</svg>' +
        '</div>' +
        '<h2 style="font-size:1.2rem;color:#1a1a1a;margin-bottom:12px;">有料コンテンツ</h2>' +
        '<p style="color:#555;font-size:0.95rem;line-height:1.6;margin-bottom:24px;">この教材は有料プランに含まれています。</p>' +
        '<a href="' + rel('pages/auth/pricing.html') + '" style="display:inline-block;padding:12px 24px;background:#0078d4;color:#fff;border-radius:6px;font-size:0.95rem;font-weight:600;text-decoration:none;">プランを見る</a>' +
      '</div>';
  }

})();
