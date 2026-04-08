/**
 * Auth Guard - IT Study Hub
 * Checks access level on every page and manages user menu in header.
 */
(function () {
  'use strict';

  // Wait for Supabase client to be ready
  function onReady(fn) {
    if (window.supabaseClient) {
      fn();
    } else {
      window.addEventListener('supabaseReady', fn);
    }
  }

  onReady(async function () {
    var session = await window.getSession();

    // Concurrent session check: verify session token matches
    if (session && window.supabaseClient) {
      var localToken = localStorage.getItem('session_token');
      if (localToken) {
        try {
          var userResult = await window.supabaseClient.auth.getUser();
          if (userResult.data && userResult.data.user) {
            var metaToken = userResult.data.user.user_metadata && userResult.data.user.user_metadata.session_token;
            if (metaToken && localToken !== metaToken) {
              // Another device logged in - sign out this session
              localStorage.removeItem('session_token');
              await window.supabaseClient.auth.signOut();
              session = null;
            }
          }
        } catch (e) {
          console.error('Session check error:', e);
        }
      }
    }

    var subscription = session ? await window.getSubscriptionStatus() : null;
    var accessLevel = document.body.getAttribute('data-access') || 'free';

    // Admin view mode: simulate different access levels
    if (typeof window.adminViewMode === 'function') {
      var viewMode = window.adminViewMode();
      if (viewMode === 'premium') {
        subscription = { status: 'active', plan: 'premium', expires_at: null };
      } else if (viewMode === 'free') {
        subscription = null; // logged in but no subscription
      } else if (viewMode === 'guest') {
        session = null;      // not logged in at all
        subscription = null;
      }
    }

    addUserMenu(session);
    enforceAccess(accessLevel, session, subscription);
    handleQuizPage(session, subscription);
  });

  /**
   * Add user menu to the site header.
   */
  /**
   * Escape HTML special characters to prevent XSS.
   */
  function escapeHtml(str) {
    var div = document.createElement('div');
    div.appendChild(document.createTextNode(str));
    return div.innerHTML;
  }

  function addUserMenu(session) {
    var header = document.querySelector('.site-header');
    if (!header) return;

    // Remove existing menu if any
    var existing = header.querySelector('.user-menu');
    if (existing) existing.remove();

    var menu = document.createElement('div');
    menu.className = 'user-menu';
    menu.style.cssText = 'display:flex;align-items:center;gap:10px;font-size:0.85rem;';

    if (session && session.user) {
      menu.innerHTML =
        '<a href="' + rel('pages/auth/mypage.html') + '" style="color:#fff;padding:6px 18px;background:rgba(255,255,255,0.15);border:1px solid rgba(255,255,255,0.6);border-radius:4px;font-size:0.85rem;white-space:nowrap;text-decoration:none;font-weight:600;" ' +
        'onmouseover="this.style.background=\'rgba(255,255,255,0.25)\'" onmouseout="this.style.background=\'rgba(255,255,255,0.15)\'">マイページ &gt;</a>';
      header.appendChild(menu);
    } else {
      menu.innerHTML =
        '<a href="' + rel('pages/auth/login.html') + '" style="color:#fff;padding:6px 16px;border:1px solid rgba(255,255,255,0.6);border-radius:4px;font-size:0.85rem;white-space:nowrap;text-decoration:none;" ' +
        'onmouseover="this.style.background=\'rgba(255,255,255,0.15)\'" onmouseout="this.style.background=\'none\'">ログイン &gt;</a>' +
        '<a href="' + rel('pages/auth/register.html') + '" style="color:#0078d4;padding:6px 16px;background:#fff;border:1px solid #fff;border-radius:4px;font-size:0.85rem;white-space:nowrap;text-decoration:none;font-weight:600;" ' +
        'onmouseover="this.style.background=\'#e0ecf7\'" onmouseout="this.style.background=\'#fff\'">無料会員登録 &gt;</a>';
      header.appendChild(menu);
    }
  }

  /**
   * Enforce access based on page level.
   */
  function enforceAccess(level, session, subscription) {
    if (level === 'free') return;

    if (level === 'auth' && !session) {
      // Redirect to login, preserving the current page as redirect target
      var returnUrl = encodeURIComponent(window.location.href);
      window.location.href = rel('pages/auth/login.html') + '?redirect=' + returnUrl;
      return;
    }

    if (level === 'premium') {
      if (!session) {
        showPremiumOverlay(false);
        return;
      }
      if (!subscription || (subscription.status !== 'active')) {
        showPremiumOverlay(true);
        return;
      }
    }
  }

  /**
   * Show premium content overlay/modal.
   */
  function showPremiumOverlay(isLoggedIn) {
    // Create backdrop
    var backdrop = document.createElement('div');
    backdrop.id = 'premium-overlay-backdrop';
    backdrop.style.cssText =
      'position:fixed;top:0;left:0;right:0;bottom:0;background:rgba(0,0,0,0.55);' +
      'z-index:9999;display:flex;align-items:center;justify-content:center;';

    var card = document.createElement('div');
    card.style.cssText =
      'background:#fff;border-radius:12px;padding:40px 36px;max-width:420px;width:90%;' +
      'text-align:center;box-shadow:0 8px 32px rgba(0,0,0,0.25);';

    var lockIcon =
      '<div style="width:64px;height:64px;margin:0 auto 20px;background:#e0ecf7;border-radius:50%;display:flex;align-items:center;justify-content:center;">' +
      '<svg width="28" height="28" viewBox="0 0 24 24" fill="none" stroke="#0078d4" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">' +
      '<rect x="3" y="11" width="18" height="11" rx="2" ry="2"/>' +
      '<path d="M7 11V7a5 5 0 0 1 10 0v4"/>' +
      '</svg></div>';

    var message = '<h2 style="font-size:1.2rem;color:#1a1a1a;margin-bottom:12px;">有料コンテンツ</h2>' +
      '<p style="color:#555;font-size:0.95rem;line-height:1.6;margin-bottom:24px;">この内容は有料プランに含まれています</p>';

    var buttons = '<div style="display:flex;flex-direction:column;gap:10px;">';
    buttons += '<a href="' + rel('pages/auth/pricing.html') + '" style="display:block;padding:12px 24px;background:#0078d4;color:#fff;border-radius:6px;font-size:0.95rem;font-weight:600;text-decoration:none;transition:background 0.15s;" ' +
      'onmouseover="this.style.background=\'#005a9e\'" onmouseout="this.style.background=\'#0078d4\'">プランを見る</a>';

    if (!isLoggedIn) {
      buttons += '<a href="' + rel('pages/auth/login.html') + '?redirect=' + encodeURIComponent(window.location.href) + '" ' +
        'style="display:block;padding:12px 24px;background:#fff;color:#0078d4;border:1px solid #0078d4;border-radius:6px;font-size:0.95rem;font-weight:600;text-decoration:none;transition:background 0.15s;" ' +
        'onmouseover="this.style.background=\'#e0ecf7\'" onmouseout="this.style.background=\'#fff\'">ログイン</a>';
    }
    buttons += '</div>';

    card.innerHTML = lockIcon + message + buttons;
    backdrop.appendChild(card);
    document.body.appendChild(backdrop);

    // Prevent scrolling the page behind the overlay
    document.body.style.overflow = 'hidden';
  }

  /**
   * Handle quiz page: if free user, replace with free questions only.
   */
  function handleQuizPage(session, subscription) {
    // Only apply to the all-questions quiz page
    var path = window.location.pathname;
    if (!path.includes('/pages/quiz/all.html') && !path.endsWith('/quiz/all.html')) return;

    // If user has active subscription, do nothing
    if (subscription && subscription.status === 'active') return;

    // For free users (not logged in, or no active sub), replace quiz with free questions
    var container = document.getElementById('quiz-container');
    if (!container) return;

    // Clear existing quiz
    container.innerHTML = '<p style="color:#666;margin-bottom:16px;">無料プランでは10問の練習問題をお試しいただけます。すべての問題にアクセスするには有料プランへのアップグレードが必要です。</p>' +
      '<p style="margin-bottom:24px;"><a href="' + rel('pages/auth/pricing.html') + '" style="color:#0078d4;font-weight:600;">有料プランを見る &rarr;</a></p>' +
      '<div id="free-quiz-container"></div>';

    // Load free questions script
    var script = document.createElement('script');
    script.src = rel('questions/free-questions.js');
    script.onload = function () {
      if (typeof FREE_QUIZ_QUESTIONS !== 'undefined' && typeof Quiz !== 'undefined') {
        var freeQuiz = new Quiz('free-quiz-container');
        freeQuiz.loadFromArray(FREE_QUIZ_QUESTIONS, true);
      }
    };
    document.head.appendChild(script);
  }

  /**
   * Compute relative path from current page to site root resource.
   */
  function rel(target) {
    if (window._siteRelativePath) {
      return window._siteRelativePath(target);
    }
    // Count depth from site root by finding how many /pages/xxx/ segments are in the path
    var path = window.location.pathname;
    // Match everything after the site root (e.g., /it-study-hub/)
    var match = path.match(/\/pages\/[^\/]+\//);
    if (match) {
      // We're at depth 2 (pages/something/) — go up 2 levels
      return '../../' + target;
    } else if (path.includes('/pages/')) {
      return '../' + target;
    }
    return target;
  }

})();
