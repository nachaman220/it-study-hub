/**
 * Exam Index Page - Dynamic card display based on user access level.
 *
 * Cards with data-access="premium" are grayed out for non-premium users.
 * Cards with data-access="free" are grayed out for guests (not logged in).
 * Cards with data-access="guest" are always accessible.
 *
 * Premium users see no badges — everything is clean and accessible.
 */
(function () {
  'use strict';

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
    var isFree = session && !isPremium;
    var isGuest = !session;

    var cards = document.querySelectorAll('.card[data-access]');
    cards.forEach(function (card) {
      var access = card.getAttribute('data-access');
      var locked = false;
      var reason = '';

      if (access === 'premium' && !isPremium) {
        locked = true;
        reason = '有料会員限定';
      } else if (access === 'free' && isGuest) {
        locked = true;
        reason = '無料会員登録で解放';
      }

      // Remove all badge elements for premium users
      if (isPremium) {
        var badges = card.querySelectorAll('.card-badges');
        badges.forEach(function (b) { b.remove(); });
      }

      if (locked) {
        // Disable link
        card.removeAttribute('href');
        card.style.cursor = 'not-allowed';
        card.style.opacity = '0.65';
        card.style.position = 'relative';

        // Remove existing badges
        var badges = card.querySelectorAll('.card-badges');
        badges.forEach(function (b) { b.remove(); });

        // Add lock overlay
        var overlay = document.createElement('div');
        overlay.style.cssText = 'position:absolute;top:0;left:0;right:0;bottom:0;display:flex;align-items:center;justify-content:center;background:rgba(255,255,255,0.5);border-radius:8px;';
        overlay.innerHTML = '<div style="background:#6c757d;color:#fff;padding:6px 16px;border-radius:20px;font-size:0.85rem;font-weight:600;">' +
          reason + '</div>';
        card.appendChild(overlay);

        // Prevent click
        card.addEventListener('click', function (e) { e.preventDefault(); });
      } else if (!isPremium) {
        // For accessible cards of non-premium users, keep badges
        // (already in HTML)
      } else {
        // Premium user — remove badge container if present
        var badges = card.querySelectorAll('.card-badges');
        badges.forEach(function (b) { b.remove(); });
      }
    });

    // Also clean up the free-note on quiz card for premium users
    if (isPremium) {
      var notes = document.querySelectorAll('.free-note');
      notes.forEach(function (n) { n.remove(); });
    }
  });
})();
