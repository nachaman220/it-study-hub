/**
 * Sidebar Lock - Shows lock indicators on sidebar links based on access level.
 *
 * Reads data-section from <main> to determine the current exam (az900 or az305),
 * then applies lock icons to sidebar links for sections the user can't access.
 */
(function () {
  'use strict';

  // AZ-900 section access mapping
  var AZ900_ACCESS = {
    '1-1': 'guest',
    '1-2': 'free', '1-3': 'free',
    '2-1': 'premium', '2-2': 'premium', '2-3': 'premium', '2-4': 'premium',
    '3-1': 'premium', '3-2': 'premium', '3-3': 'premium', '3-4': 'premium'
  };

  // AZ-305 section access mapping
  var AZ305_ACCESS = {
    '1.1': 'guest',
    '1.2': 'free', '1.3': 'free', '1.4': 'free', '1.5': 'free', '1.6': 'free', '1.7': 'free',
    '2.1': 'premium', '2.2': 'premium', '2.3': 'premium', '2.4': 'premium',
    '3.1': 'premium', '3.2': 'premium', '3.3': 'premium', '3.4': 'premium',
    '4.1': 'premium', '4.2': 'premium', '4.3': 'premium', '4.4': 'premium'
  };

  function onReady(fn) {
    if (window.supabaseClient) { fn(); } else { window.addEventListener('supabaseReady', fn); }
  }

  onReady(async function () {
    var session = await window.getSession();
    var subscription = session ? await window.getSubscriptionStatus() : null;

    // Admin view mode override
    if (typeof window.adminViewMode === 'function') {
      var viewMode = window.adminViewMode();
      if (viewMode) {
        if (viewMode === 'premium') { subscription = { status: 'active', plan: 'premium', expires_at: null }; }
        else if (viewMode === 'free') { subscription = null; }
        else if (viewMode === 'guest') { session = null; subscription = null; }
      }
    }

    var isPremium = subscription && subscription.status === 'active';
    var isGuest = !session;

    // If premium, no locks needed
    if (isPremium) return;

    // Detect exam type from data-section or URL
    var main = document.querySelector('main[data-section]');
    var sectionId = main ? main.getAttribute('data-section') : '';
    var isAZ900 = sectionId.startsWith('az900') || window.location.pathname.includes('/az-900/');
    var accessMap = isAZ900 ? AZ900_ACCESS : AZ305_ACCESS;

    // Find sidebar nav links
    var links = document.querySelectorAll('.sidebar-nav a');
    links.forEach(function (link) {
      var text = link.textContent.trim();
      // Extract section number (e.g., "1-1" from "1-1 クラウドとは" or "1.1" from "1.1 認証...")
      var match = text.match(/^(\d+[-\.]\d+)/);
      if (!match) return;

      var section = match[1];
      var access = accessMap[section];
      if (!access) return;

      var locked = false;
      var reason = '';

      if (access === 'premium' && !isPremium) {
        locked = true;
        reason = '有料会員限定';
      } else if (access === 'free' && isGuest) {
        locked = true;
        reason = '無料会員登録で解放';
      }

      if (locked) {
        link.style.opacity = '0.5';
        link.style.pointerEvents = 'none';
        link.style.position = 'relative';
        link.title = reason;
      }
    });

    // Add lock legend below sidebar if there are locked items
    var sidebar = document.querySelector('.sidebar');
    if (sidebar) {
      var legend = document.createElement('div');
      legend.style.cssText = 'padding:12px 16px;font-size:0.75rem;color:#999;border-top:1px solid #e0e0e0;margin-top:8px;';
      if (isGuest) {
        legend.innerHTML = '<a href="../auth/login.html?tab=register" style="color:#0078d4;">無料会員登録</a>で一部コンテンツが解放されます';
      } else {
        legend.innerHTML = '<a href="../auth/pricing.html" style="color:#0078d4;">有料プラン</a>で全コンテンツが解放されます';
      }
      sidebar.appendChild(legend);
    }
  });
})();
