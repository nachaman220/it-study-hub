// Sidebar toggle (mobile)
document.addEventListener("DOMContentLoaded", () => {
  const hamburger = document.querySelector(".hamburger");
  const sidebar = document.querySelector(".sidebar");
  const overlay = document.querySelector(".sidebar-overlay");

  if (hamburger && sidebar) {
    hamburger.addEventListener("click", () => {
      sidebar.classList.toggle("open");
      if (overlay) overlay.classList.toggle("open");
    });
  }

  if (overlay) {
    overlay.addEventListener("click", () => {
      sidebar.classList.remove("open");
      overlay.classList.remove("open");
    });
  }

  // Mark active sidebar link
  const currentPath = window.location.pathname;
  document.querySelectorAll(".sidebar-nav a").forEach((link) => {
    if (currentPath.endsWith(link.getAttribute("href")?.replace(/^\.\//, "").replace(/^\.\.\//, ""))) {
      link.classList.add("active");
    }
  });
});
