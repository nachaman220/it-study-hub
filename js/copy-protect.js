/**
 * Copy Protection - IT Study Hub
 * Prevents content scraping via right-click, text selection, and keyboard shortcuts.
 */
(function () {
  'use strict';

  // Disable right-click context menu
  document.addEventListener('contextmenu', function (e) {
    e.preventDefault();
  });

  // Disable text selection via mouse drag
  document.addEventListener('selectstart', function (e) {
    // Allow selection in input/textarea fields
    if (e.target.tagName === 'INPUT' || e.target.tagName === 'TEXTAREA') return;
    e.preventDefault();
  });

  // Disable copy/cut keyboard shortcuts and developer tools shortcuts
  document.addEventListener('keydown', function (e) {
    // Allow input/textarea fields
    if (e.target.tagName === 'INPUT' || e.target.tagName === 'TEXTAREA') return;

    // Block Ctrl+C, Ctrl+X, Ctrl+A (copy, cut, select all)
    if (e.ctrlKey && (e.key === 'c' || e.key === 'x' || e.key === 'a')) {
      e.preventDefault();
    }

    // Block Ctrl+U (view source)
    if (e.ctrlKey && e.key === 'u') {
      e.preventDefault();
    }

    // Block Ctrl+S (save page)
    if (e.ctrlKey && e.key === 's') {
      e.preventDefault();
    }

    // Block Ctrl+P (print) to prevent print-to-PDF scraping
    if (e.ctrlKey && e.key === 'p') {
      e.preventDefault();
    }
  });

  // Disable drag on images and links
  document.addEventListener('dragstart', function (e) {
    e.preventDefault();
  });

  // Disable copy event
  document.addEventListener('copy', function (e) {
    if (e.target.tagName === 'INPUT' || e.target.tagName === 'TEXTAREA') return;
    e.preventDefault();
  });
})();
