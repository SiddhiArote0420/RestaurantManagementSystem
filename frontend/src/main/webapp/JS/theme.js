// theme.js v3.2 - Premium SaaS Global UI Features

// Create toast container immediately on script load (not waiting for DOMContentLoaded)
function getToastContainer() {
    let container = document.getElementById("globalToastContainer");
    if (!container) {
        container = document.createElement("div");
        container.id = "globalToastContainer";
        container.style.cssText = "position: fixed; top: 20px; right: 20px; z-index: 99999; display: flex; flex-direction: column; gap: 10px; pointer-events: none;";
        document.body.appendChild(container);
    }
    return container;
}

// Global UI Toast Function
window.showToast = function(message, type) {
    if (!type) type = "success";
    
    // Ensure body is ready
    if (!document.body) {
        document.addEventListener("DOMContentLoaded", function() {
            window.showToast(message, type);
        });
        return;
    }
    
    const container = getToastContainer();
    const toast = document.createElement("div");
    
    let borderColor = "#22c55e";
    let bgColor = "#16a34a";
    let icon = "fa-circle-check";
    
    if (type === "error" || type === "danger") {
        borderColor = "#ef4444";
        bgColor = "#dc2626";
        icon = "fa-circle-exclamation";
    } else if (type === "warning") {
        borderColor = "#f59e0b";
        bgColor = "#d97706";
        icon = "fa-triangle-exclamation";
    } else if (type === "info") {
        borderColor = "#3b82f6";
        bgColor = "#2563eb";
        icon = "fa-circle-info";
    }
    
    toast.style.cssText = "background:#1E293B; color:#F8F6F2; padding:14px 20px; border-radius:8px; border-left:5px solid " + borderColor + "; box-shadow:0 8px 24px rgba(0,0,0,0.4); display:flex; align-items:center; gap:12px; font-family:'Poppins',sans-serif; font-size:0.9rem; font-weight:500; opacity:0; transform:translateX(120%); transition:all 0.35s ease; pointer-events:auto; min-width:280px; max-width:380px;";
    
    toast.innerHTML = '<i class="fa-solid ' + icon + '" style="color:' + borderColor + '; font-size:1.1rem; flex-shrink:0;"></i><span style="flex:1;">' + message + '</span>';
    container.appendChild(toast);
    
    // Slide in
    setTimeout(function() {
        toast.style.opacity = "1";
        toast.style.transform = "translateX(0)";
    }, 10);
    
    // Auto remove after 3.5 seconds
    setTimeout(function() {
        toast.style.opacity = "0";
        toast.style.transform = "translateX(120%)";
        setTimeout(function() {
            if (toast.parentNode) toast.parentNode.removeChild(toast);
        }, 350);
    }, 3500);
};

// Override window.alert with toast
window.alert = function(message) {
    const msgLower = String(message).toLowerCase();
    let type = "success";
    if (msgLower.indexOf("error") !== -1 || msgLower.indexOf("fail") !== -1 || msgLower.indexOf("denied") !== -1 || msgLower.indexOf("invalid") !== -1) {
        type = "error";
    } else if (msgLower.indexOf("warning") !== -1) {
        type = "warning";
    } else if (msgLower.indexOf("info") !== -1) {
        type = "info";
    }
    window.showToast(message, type);
};

// Sidebar Toggle
function toggleSidebar() {
    var sidebar = document.querySelector(".sidebar");
    var overlay = document.getElementById("mobileOverlay");
    if (!sidebar) return;
    if (!overlay) {
        overlay = document.createElement("div");
        overlay.id = "mobileOverlay";
        overlay.className = "sidebar-overlay";
        overlay.onclick = toggleSidebar;
        document.body.appendChild(overlay);
    }
    var isOpen = sidebar.classList.toggle("open");
    if (isOpen) {
        overlay.classList.add("show");
    } else {
        overlay.classList.remove("show");
    }
}

// Global Custom Confirm Modal
window.showCustomConfirm = function(message, onConfirm) {
    var confirmModal = document.getElementById("customConfirmModal");
    if (!confirmModal) {
        var div = document.createElement("div");
        div.innerHTML = '<div class="modal fade" id="customConfirmModal" tabindex="-1" aria-hidden="true"><div class="modal-dialog modal-dialog-centered modal-sm"><div class="modal-content" style="background-color:#1E293B;border:1px solid rgba(255,138,42,0.3);color:#F8F6F2;border-radius:12px;box-shadow:0 20px 40px rgba(0,0,0,0.5);"><div class="modal-header border-0 pb-0"><h6 class="modal-title fw-bold mb-0" style="color:#FF8A2A;"><i class="fa-solid fa-triangle-exclamation me-2"></i>Confirm Action</h6><button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button></div><div class="modal-body py-3" id="customConfirmMessage" style="font-size:0.95rem;color:#cbd5e1;"></div><div class="modal-footer border-0 pt-0 gap-2"><button type="button" class="btn btn-sm btn-secondary" data-bs-dismiss="modal">Cancel</button><button type="button" class="btn btn-sm" id="customConfirmBtn" style="background:#ef4444;color:#fff;border:none;">Delete</button></div></div></div></div>';
        document.body.appendChild(div.firstChild);
        confirmModal = document.getElementById("customConfirmModal");
    }
    
    document.getElementById("customConfirmMessage").innerText = message;
    
    var bsModal = bootstrap.Modal.getOrCreateInstance(confirmModal);
    
    var oldBtn = document.getElementById("customConfirmBtn");
    var newBtn = oldBtn.cloneNode(true);
    oldBtn.parentNode.replaceChild(newBtn, oldBtn);
    
    newBtn.addEventListener("click", function() {
        bsModal.hide();
        if (typeof onConfirm === "function") {
            onConfirm();
        }
    });
    
    bsModal.show();
};

// Set Greeting Name
document.addEventListener("DOMContentLoaded", function() {
    var greetingNames = document.querySelectorAll(".greeting-name");
    var name = localStorage.getItem("adminName") || localStorage.getItem("chefName") || localStorage.getItem("waiterName") || localStorage.getItem("recName") || "Staff Member";
    greetingNames.forEach(function(el) { el.innerText = name; });
});
