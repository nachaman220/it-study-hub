/**
 * Admin View Toggle
 *
 * 管理者（特定メールアドレスでログイン中のユーザー）専用。
 * 3段階の表示切り替え: 有料会員 / 無料会員 / 非会員
 *
 * 使い方:
 *   - Ctrl+Shift+A: 管理パネルの表示/非表示（管理者のみ）
 */
(function () {
  'use strict';

  var ADMIN_HASHES = ['c001b6c7cfd7fd0341edb9ac419f619daf3d774ff1fbfd9603fd0f018ff50aab'];

  var isAdminUser = false;

  async function sha256(str) {
    var buf = new TextEncoder().encode(str);
    var hash = await crypto.subtle.digest('SHA-256', buf);
    return Array.from(new Uint8Array(hash)).map(function (b) { return b.toString(16).padStart(2, '0'); }).join('');
  }

  // View modes: 'premium', 'free', 'guest'
  function getViewMode() {
    if (!isAdminUser) return 'premium';
    return localStorage.getItem('adminViewMode') || 'premium';
  }

  function setViewMode(mode) {
    localStorage.setItem('adminViewMode', mode);
  }

  window.adminViewMode = getViewMode;

  function checkAdmin() {
    async function doCheck() {
      if (!window.getSession) return;
      var session = await window.getSession();
      if (session && session.user && session.user.email) {
        var hash = await sha256(session.user.email.toLowerCase());
        if (ADMIN_HASHES.indexOf(hash) !== -1) {
          isAdminUser = true;
          if (localStorage.getItem('adminViewMode')) {
            createPanel();
          }
        } else {
          localStorage.removeItem('adminViewMode');
        }
      } else {
        localStorage.removeItem('adminViewMode');
      }
    }

    if (window.supabaseClient) {
      doCheck();
    } else {
      window.addEventListener('supabaseReady', doCheck);
    }
  }

  var MODE_LABELS = {
    premium: '有料会員',
    free: '無料会員',
    guest: '非会員'
  };
  var MODE_COLORS = {
    premium: '#0078d4',
    free: '#28a745',
    guest: '#6c757d'
  };

  function btnStyle(mode, current) {
    var active = mode === current;
    return 'padding:6px 12px;border:none;border-radius:4px;cursor:pointer;font-size:0.8rem;' +
      (active ? 'background:' + MODE_COLORS[mode] + ';color:#fff;' : 'background:#444;color:#aaa;');
  }

  function createPanel() {
    if (!isAdminUser) return;
    if (document.getElementById('admin-panel')) return;

    var panel = document.createElement('div');
    panel.id = 'admin-panel';
    var mode = getViewMode();
    panel.innerHTML =
      '<div style="position:fixed;bottom:16px;right:16px;background:#1a1a1a;color:#fff;padding:12px 16px;border-radius:8px;box-shadow:0 4px 20px rgba(0,0,0,.3);z-index:99999;font-size:0.85rem;font-family:sans-serif;">' +
        '<div style="margin-bottom:8px;font-weight:600;">管理者パネル</div>' +
        '<div style="display:flex;gap:6px;">' +
          '<button id="admin-btn-premium" style="' + btnStyle('premium', mode) + '">有料会員</button>' +
          '<button id="admin-btn-free" style="' + btnStyle('free', mode) + '">無料会員</button>' +
          '<button id="admin-btn-guest" style="' + btnStyle('guest', mode) + '">非会員</button>' +
        '</div>' +
        '<div style="margin-top:6px;font-size:0.75rem;color:#888;">現在: ' + MODE_LABELS[mode] + 'として閲覧中</div>' +
        '<div style="margin-top:4px;font-size:0.7rem;color:#666;">Ctrl+Shift+A で非表示</div>' +
      '</div>';

    document.body.appendChild(panel);

    ['premium', 'free', 'guest'].forEach(function (m) {
      document.getElementById('admin-btn-' + m).addEventListener('click', function () {
        setViewMode(m);
        location.reload();
      });
    });
  }

  function togglePanel() {
    if (!isAdminUser) return;
    var panel = document.getElementById('admin-panel');
    if (panel) { panel.remove(); } else { createPanel(); }
  }

  document.addEventListener('keydown', function (e) {
    if (e.ctrlKey && e.shiftKey && e.key === 'A') {
      e.preventDefault();
      togglePanel();
    }
  });

  checkAdmin();
})();
