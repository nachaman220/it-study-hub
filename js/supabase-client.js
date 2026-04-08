/**
 * Supabase Client - Azure Certification Study Hub
 * Load Supabase JS SDK from CDN and initialize the client.
 */
(function () {
  'use strict';

  var SUPABASE_URL = 'https://wvwhareffgblvwureyqn.supabase.co';
  var SUPABASE_ANON_KEY = 'sb_publishable_5nZlugFkbuENAJaUhmRNDg_0GmkUVfb';

  function loadSupabaseSDK(callback) {
    if (window.supabase) {
      callback();
      return;
    }
    var script = document.createElement('script');
    script.src = 'https://cdn.jsdelivr.net/npm/@supabase/supabase-js@2';
    script.onload = callback;
    script.onerror = function () {
      console.error('Failed to load Supabase SDK');
    };
    document.head.appendChild(script);
  }

  loadSupabaseSDK(function () {
    window.supabaseClient = window.supabase.createClient(SUPABASE_URL, SUPABASE_ANON_KEY);
    // Dispatch a custom event so other scripts know the client is ready
    window.dispatchEvent(new Event('supabaseReady'));
  });

  /**
   * Get the current session, or null if not logged in.
   * @returns {Promise<object|null>}
   */
  window.getSession = async function () {
    if (!window.supabaseClient) return null;
    try {
      var result = await window.supabaseClient.auth.getSession();
      return (result.data && result.data.session) ? result.data.session : null;
    } catch (e) {
      console.error('getSession error:', e);
      return null;
    }
  };

  /**
   * Query the subscriptions table for the current user.
   * @returns {Promise<{status: string, plan: string, expires_at: string}|null>}
   */
  window.getSubscriptionStatus = async function () {
    if (!window.supabaseClient) return null;
    var session = await window.getSession();
    if (!session) return null;

    try {
      var result = await window.supabaseClient
        .from('subscriptions')
        .select('status, plan, expires_at')
        .eq('user_id', session.user.id)
        .order('created_at', { ascending: false })
        .limit(1)
        .single();

      if (result.error || !result.data) {
        return { status: 'free', plan: 'free', expires_at: null };
      }

      var sub = result.data;
      // Check if subscription is still valid
      if (sub.status === 'active' && sub.expires_at) {
        var now = new Date();
        var expires = new Date(sub.expires_at);
        if (expires < now) {
          return { status: 'inactive', plan: sub.plan, expires_at: sub.expires_at };
        }
      }

      return {
        status: sub.status || 'free',
        plan: sub.plan || 'free',
        expires_at: sub.expires_at || null
      };
    } catch (e) {
      console.error('getSubscriptionStatus error:', e);
      return { status: 'free', plan: 'free', expires_at: null };
    }
  };

  /**
   * Sign out the current user and redirect to login page.
   */
  window.signOut = async function () {
    if (!window.supabaseClient) return;
    try {
      await window.supabaseClient.auth.signOut();
    } catch (e) {
      console.error('signOut error:', e);
    }
    window.location.href = getRelativePath('pages/auth/login.html');
  };

  /**
   * Utility: compute a relative path from the current page to the site root.
   * Works by detecting how deep we are based on the path.
   */
  function getRelativePath(target) {
    var path = window.location.pathname;
    // Match /pages/xxx/ pattern (any subdirectory under pages/)
    if (/\/pages\/[^\/]+\//.test(path)) {
      return '../../' + target;
    } else if (path.includes('/pages/')) {
      return '../' + target;
    }
    return target;
  }

  window._siteRelativePath = getRelativePath;

})();
