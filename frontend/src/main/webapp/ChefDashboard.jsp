<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Chef Dashboard - Royal Spoon</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
<link rel="stylesheet" href="CSS/dashboard.css?v=2.1">
<link rel="stylesheet" href="CSS/royal_dashboard.css?v=2.4">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<style>
    body {
        font-family: 'Poppins', sans-serif;
        color: white;
    }
    .royal-container {
        padding: 30px;
        min-height: calc(100vh - 70px);
    }
    
    /* Dashboard Banner */
    .dashboard-banner {
        background: linear-gradient(135deg, rgba(255,140,0,0.8) 0%, rgba(200,80,0,0.8) 100%), url('Images/hero_banner.jpg');
        background-size: cover;
        background-position: center;
        border-radius: 12px;
        padding: 40px;
        color: white;
        margin-bottom: 30px;
        box-shadow: 0 10px 20px rgba(0,0,0,0.3);
        border: 1px solid rgba(255,255,255,0.1);
    }

    /* Stats Cards */
    .stat-card {
        background: rgba(30, 30, 30, 0.85);
        backdrop-filter: blur(10px);
        border: 1px solid rgba(255, 140, 0, 0.2);
        border-radius: 12px;
        padding: 20px;
        color: white;
        transition: transform 0.3s, box-shadow 0.3s;
    }
    .stat-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 10px 20px rgba(255, 140, 0, 0.15);
    }
    .stat-icon {
        background: rgba(255, 140, 0, 0.1);
        color: #ff8c00;
        width: 50px;
        height: 50px;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 1.5rem;
    }
    
    /* Order Cards */
    .order-card {
        background: rgba(30, 30, 30, 0.85);
        backdrop-filter: blur(10px);
        border: 1px solid rgba(255, 255, 255, 0.05);
        border-radius: 12px;
        padding: 20px;
        color: white;
        transition: all 0.3s;
        height: 100%;
        position: relative;
        overflow: hidden;
    }
    .order-card:hover {
        border-color: rgba(255, 140, 0, 0.5);
        transform: translateY(-3px);
    }
    .order-header {
        border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        padding-bottom: 10px;
        margin-bottom: 15px;
    }
    .order-items-list {
        max-height: 200px;
        overflow-y: auto;
        padding-right: 5px;
    }
    /* Custom Scrollbar for items list */
    .order-items-list::-webkit-scrollbar { width: 5px; }
    .order-items-list::-webkit-scrollbar-track { background: rgba(255,255,255,0.05); }
    .order-items-list::-webkit-scrollbar-thumb { background: #ff8c00; border-radius: 10px; }
    
    .item-row {
        background: rgba(255, 255, 255, 0.03);
        border-radius: 6px;
        padding: 8px 12px;
        margin-bottom: 8px;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .btn-orange { background-color: #ff8c00; color: white; border: none; }
    .btn-orange:hover { background-color: #e07b00; color: white; }
    
    /* Status ribbons */
    .ribbon {
        position: absolute;
        top: 15px;
        right: -35px;
        width: 130px;
        text-align: center;
        padding: 5px 0;
        font-size: 0.75rem;
        font-weight: bold;
        transform: rotate(45deg);
        z-index: 10;
        box-shadow: 0 2px 4px rgba(0,0,0,0.2);
    }
    .ribbon-new { background-color: #e74a3b; color: white; }
    .ribbon-preparing { background-color: #f6c23e; color: #333; }
    .ribbon-ready { background-color: #1cc88a; color: white; }

    .custom-table { color: white; }
    .custom-table thead th { background: rgba(255, 140, 0, 0.1); color: #ff8c00; border-bottom: 1px solid rgba(255,140,0,0.3); }
    .custom-table tbody td { border-bottom: 1px solid rgba(255,255,255,0.05); vertical-align: middle; }
</style>
<!-- Responsive UI: layout/spacing only, no functionality changes -->
<link rel="stylesheet" href="CSS/responsive.css?v=1.0">
</head>
<body class="dark-theme">

    <div class="wrapper">
        <!-- Sidebar -->
        <div class="sidebar">
            <div class="logo">
                <i class="fa-solid fa-utensils"></i>
                <h4>Chef</h4>
            </div>
            <ul>
                <li class="active"><a href="#dashboard" onclick="switchTab('dashboard')"> <i class="fa-solid fa-house"></i> Dashboard</a></li>
                <li>
                    <a href="#new-orders" onclick="switchTab('new-orders')"> 
                        <i class="fa-solid fa-inbox"></i> New Orders 
                        <span class="badge bg-danger ms-2" id="badgeNewOrders" style="display:none;">0</span>
                    </a>
                </li>
                <li>
                    <a href="#preparing" onclick="switchTab('preparing')"> 
                        <i class="fa-solid fa-fire-burner"></i> Preparing 
                        <span class="badge bg-warning text-dark ms-2" id="badgePreparing" style="display:none;">0</span>
                    </a>
                </li>
                <li><a href="#ready" onclick="switchTab('ready')"> <i class="fa-solid fa-check-double"></i> <span>Ready to Serve</span><span class="tooltip-text">Ready to Serve</span></a></li>
                <li><a href="#history" onclick="switchTab('history')"> <i class="fa-solid fa-clock-rotate-left"></i> <span>Order History</span><span class="tooltip-text">Order History</span></a></li>
                <li><a href="#availability" onclick="switchTab('availability')"> <i class="fa-solid fa-toggle-on"></i> <span>Menu Availability</span><span class="tooltip-text">Menu Availability</span></a></li>
                <li><a href="#" onclick="logout()"> <i class="fa-solid fa-right-from-bracket"></i> <span>Logout</span><span class="tooltip-text">Logout</span></a></li>
            </ul>
        </div>

        <!-- Main Content Area -->
        <div class="main">
            <!-- Navbar -->
            <nav class="navbar navbar-expand-lg">
                <div class="container-fluid">
                    <button class="hamburger" onclick="toggleSidebar()" aria-label="Toggle sidebar"><i class="fa-solid fa-bars"></i></button>
                    <div>
                        <h3 id="navbarTitle" class="text-white mb-0 fw-bold">Royal Spoon Kitchen</h3>
                        <span id="navbarSubtitle" class="text-muted" style="font-size:0.82rem;">Dashboard Overview</span>
                    </div>
                    <div class="admin-info text-white">
                        <i class="fa-solid fa-user-circle"></i> Welcome, <span id="chefNameDisplay" style="color: #ff8c00; font-weight: 600;">Chef</span>
                    </div>
                </div>
            </nav>

            <div class="royal-container">
                
                <!-- Dashboard Tab -->
                <div id="tab-dashboard">
                    <div class="dashboard-banner d-flex align-items-center justify-content-between">
                        <div>
                            <h2 class="fw-bold mb-2">Welcome Back, <span id="bannerChefName">Chef</span>! 👨‍🍳</h2>
                            <p class="mb-0 fs-5">Manage your kitchen with confidence.</p>
                        </div>
                    </div>

                    <div class="row g-4 mb-4">
                        <div class="col-md-3">
                            <div class="stat-card d-flex align-items-center">
                                <div class="stat-icon me-3" style="color: #e74a3b; background: rgba(231,74,59,0.1);"><i class="fa-solid fa-bell"></i></div>
                                <div>
                                    <h3 class="mb-0 fw-bold" id="statNewOrders">0</h3>
                                    <p class="text-muted mb-0 small">New Orders (Pending)</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="stat-card d-flex align-items-center">
                                <div class="stat-icon me-3" style="color: #f6c23e; background: rgba(246,194,62,0.1);"><i class="fa-solid fa-fire-burner"></i></div>
                                <div>
                                    <h3 class="mb-0 fw-bold" id="statPreparingOrders">0</h3>
                                    <p class="text-muted mb-0 small">Currently Preparing</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="stat-card d-flex align-items-center">
                                <div class="stat-icon me-3" style="color: #1cc88a; background: rgba(28,200,138,0.1);"><i class="fa-solid fa-check-double"></i></div>
                                <div>
                                    <h3 class="mb-0 fw-bold" id="statReadyOrders">0</h3>
                                    <p class="text-muted mb-0 small">Ready to Serve</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="stat-card d-flex align-items-center">
                                <div class="stat-icon me-3" style="color: #36b9cc; background: rgba(54,185,204,0.1);"><i class="fa-solid fa-clipboard-check"></i></div>
                                <div>
                                    <h3 class="mb-0 fw-bold" id="statCompletedOrders">0</h3>
                                    <p class="text-muted mb-0 small">Cooked Today</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- New Orders Tab -->
                <div id="tab-new-orders" style="display:none;">
                    <div class="d-flex justify-content-end mb-4">
                        <button class="btn btn-outline-light btn-sm" onclick="loadKitchenData()"><i class="fa-solid fa-rotate-right me-2"></i>Refresh</button>
                    </div>
                    <div class="row g-4" id="newOrdersGrid">
                        <!-- Populated dynamically -->
                    </div>
                </div>

                <!-- Preparing Tab -->
                <div id="tab-preparing" style="display:none;">
                    <div class="d-flex justify-content-end mb-4">
                        <button class="btn btn-outline-light btn-sm" onclick="loadKitchenData()"><i class="fa-solid fa-rotate-right me-2"></i>Refresh</button>
                    </div>
                    <div class="row g-4" id="preparingGrid">
                        <!-- Populated dynamically -->
                    </div>
                </div>
                
                <!-- Ready to Serve Tab -->
                <div id="tab-ready" style="display:none;">
                    <div class="d-flex justify-content-end mb-4">
                        <button class="btn btn-outline-light btn-sm" onclick="loadKitchenData()"><i class="fa-solid fa-rotate-right me-2"></i>Refresh</button>
                    </div>
                    <div class="row g-4" id="readyGrid">
                        <!-- Populated dynamically -->
                    </div>
                </div>

                <!-- History Tab -->
                <div id="tab-history" style="display:none;">
                    <div class="table-responsive">
                        <table class="table custom-table">
                            <thead>
                                <tr>
                                    <th>Order ID</th>
                                    <th>Table ID</th>
                                    <th>Items</th>
                                    <th>Final Status</th>
                                </tr>
                            </thead>
                            <tbody id="historyTableBody">
                                <!-- Populated dynamically -->
                            </tbody>
                        </table>
                    </div>
                </div>

                <!-- ===================== MENU AVAILABILITY TAB ===================== -->
                <div id="tab-availability" style="display:none;">
                    <div class="d-flex justify-content-end mb-4">
                        <button class="btn btn-outline-light btn-sm" onclick="loadAvailability()"><i class="fa-solid fa-rotate-right me-2"></i>Refresh</button>
                    </div>
                    <div class="mb-3 p-3 rounded" style="background:rgba(255,140,0,0.08);border:1px solid rgba(255,140,0,0.2);">
                        <i class="fa-solid fa-circle-info me-2" style="color:#ff8c00;"></i>
                        <span style="color:#ccc;font-size:0.9rem;">Toggle items that are <strong style="color:#ef4444;">NOT AVAILABLE</strong> today. Waiter will see these as unavailable when taking orders.</span>
                    </div>
                    <div class="row g-3" id="availabilityGrid">
                        <!-- Populated dynamically -->
                    </div>
                </div>

            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="JS/api.js"></script>
    <script>
        const API_URL = API_BASE;
        
        let allOrders = [];
        let allItems = []; // Menu items mapped to IDs for displaying names
        
        // UX Role Check (Real security and authorization are enforced by the backend via verified JWT)
        const currentRole = localStorage.getItem("userRole");
        if(currentRole && currentRole.toUpperCase() !== "CHEF" && currentRole.toUpperCase() !== "ADMIN") {
            alert("Access Denied");
            window.location.href = "HomePage.jsp";
        }
        
        const chefName = localStorage.getItem("adminName") || "Chef";

        document.addEventListener("DOMContentLoaded", () => {
            const nameEl = document.getElementById('chefNameDisplay') || document.getElementById('adminNameDisplay');
            if(nameEl) nameEl.innerText = chefName;
            const bannerEl = document.getElementById('bannerChefName');
            if(bannerEl) bannerEl.innerText = chefName;
            
            // Auto refresh kitchen data every 10 seconds to act like a real live kitchen screen
            setInterval(loadKitchenData, 10000);

            loadKitchenData();
        });

        function switchTab(tabId) {
            const tabs = ['dashboard', 'new-orders', 'preparing', 'ready', 'history', 'availability'];
            tabs.forEach(t => document.getElementById('tab-' + t).style.display = 'none');
            document.getElementById('tab-' + tabId).style.display = 'block';
            
            document.querySelectorAll('.sidebar ul li').forEach(li => li.classList.remove('active'));
            event.currentTarget.parentElement.classList.add('active');

            // Update navbar title based on active tab
            const tabMeta = {
                'dashboard':    { title: 'Royal Spoon Kitchen',      subtitle: 'Dashboard Overview' },
                'new-orders':   { title: 'New Orders',               subtitle: 'Orders waiting to be accepted' },
                'preparing':    { title: 'Currently Preparing',      subtitle: 'Orders on the stove right now' },
                'ready':        { title: 'Ready for Waiter Pickup',  subtitle: 'Food ready to be served' },
                'history':      { title: 'Cooking History',          subtitle: 'All completed orders' },
                'availability': { title: 'Menu Availability',        subtitle: 'Toggle item availability for today' }
            };
            const meta = tabMeta[tabId] || { title: 'Royal Spoon Kitchen', subtitle: '' };
            const titleEl = document.getElementById('navbarTitle');
            const subtitleEl = document.getElementById('navbarSubtitle');
            if(titleEl) titleEl.innerText = meta.title;
            if(subtitleEl) subtitleEl.innerText = meta.subtitle;
            
            if(tabId === 'availability') {
                loadAvailability();
            } else if(tabId !== 'dashboard') {
                loadKitchenData();
            }
        }

        // ===================== MENU AVAILABILITY LOGIC — Real API =====================
        async function loadAvailability() {
            const grid = document.getElementById('availabilityGrid');
            grid.innerHTML = '<div class="col-12 text-center text-muted py-4"><i class="fa-solid fa-spinner fa-spin me-2"></i>Loading menu...</div>';
            try {
                // Always fetch fresh from server to get latest availability
                const menuRes = await apiFetch(`${API_URL}/menu/all`);
                allItems = await menuRes.json();
                renderAvailabilityGrid();
            } catch(err) {
                grid.innerHTML = '<div class="col-12 text-center text-muted py-4">Failed to load menu. Check server connection.</div>';
            }
        }

        function renderAvailabilityGrid() {
            const grid = document.getElementById('availabilityGrid');
            
            if(allItems.length === 0) {
                grid.innerHTML = '<div class="col-12 text-muted text-center py-4">No menu items found.</div>';
                return;
            }

            // Group by category
            const categories = [...new Set(allItems.map(i => i.category))];
            let html = '';
            categories.forEach(cat => {
                const catItems = allItems.filter(i => i.category === cat);
                html += `<div class="col-12"><h5 class="text-warning mb-3 mt-2"><i class="fa-solid fa-tag me-2"></i>${cat}</h5><div class="row g-3">`;
                catItems.forEach(item => {
                    // Use the 'available' field from backend API response
                    const isAvailable = item.available !== false;
                    html += `
                        <div class="col-md-4 col-sm-6">
                            <div class="d-flex align-items-center justify-content-between p-3 rounded" 
                                 id="card_${item.menuId}"
                                 style="background:rgba(30,30,30,0.85);border:1px solid ${isAvailable ? '#1cc88a' : '#ef4444'};transition:all 0.3s;">
                                <div class="flex-grow-1">
                                    <div class="fw-bold" style="color:${isAvailable ? '#fff' : '#ef4444'};">${item.name}</div>
                                    <small style="color:#9ca3af;">Rs. ${parseFloat(item.price).toFixed(2)}</small>
                                    <div class="mt-1">
                                        ${isAvailable 
                                            ? '<span class="badge" style="background:#1cc88a;font-size:0.7rem;"><i class="fa-solid fa-check me-1"></i>Available</span>'
                                            : '<span class="badge" style="background:#ef4444;font-size:0.7rem;"><i class="fa-solid fa-ban me-1"></i>NOT AVAILABLE</span>'}
                                    </div>
                                </div>
                                <div class="form-check form-switch ms-3">
                                    <input class="form-check-input" type="checkbox" role="switch" 
                                           id="avail_${item.menuId}"
                                           ${isAvailable ? 'checked' : ''}
                                           onchange="toggleAvailability(${item.menuId}, this.checked)"
                                           style="width:2.5em;height:1.3em;cursor:pointer;">
                                </div>
                            </div>
                        </div>
                    `;
                });
                html += '</div></div>';
            });
            grid.innerHTML = html;
        }

        async function toggleAvailability(menuId, newStatus) {
            // Optimistic UI — update card immediately
            const card = document.getElementById('card_' + menuId);
            if(card) {
                card.style.borderColor = newStatus ? '#1cc88a' : '#ef4444';
            }

            try {
                const res = await apiFetch(`${API_URL}/menu/${menuId}/availability?status=${newStatus}`, {
                    method: 'PUT'
                });
                if(res.ok) {
                    // Update allItems in memory
                    const item = allItems.find(i => i.menuId === menuId);
                    if(item) item.available = newStatus;
                    renderAvailabilityGrid(); // re-render to update badges
                } else {
                    alert('Failed to update availability. Please try again.');
                    // Revert the toggle
                    const toggle = document.getElementById('avail_' + menuId);
                    if(toggle) toggle.checked = !newStatus;
                    if(card) card.style.borderColor = !newStatus ? '#1cc88a' : '#ef4444';
                }
            } catch(err) {
                console.error('Error updating availability:', err);
                alert('Server connection error.');
                const toggle = document.getElementById('avail_' + menuId);
                if(toggle) toggle.checked = !newStatus;
            }
        }
        // ===================== END AVAILABILITY LOGIC =====================


        async function loadKitchenData() {
            try {
                // Fetch Menu Items so we can map itemId to itemName
                if(allItems.length === 0) {
                    const menuRes = await apiFetch(`${API_URL}/menu/all`);
                    allItems = await menuRes.json();
                }
                
                // Fetch all orders
                const ordersRes = await apiFetch(`${API_URL}/orders/all`);
                allOrders = await ordersRes.json();
                
                // Sort by ID to show oldest first inside the grids (FIFO queue logic)
                allOrders.sort((a,b) => a.orderId - b.orderId);
                
                updateDashboardStats();
                renderNewOrders();
                renderPreparingOrders();
                renderReadyOrders();
                renderHistory();
            } catch (err) {
                console.error("Error loading kitchen data", err);
            }
        }

        function updateDashboardStats() {
            const pendingOrders = allOrders.filter(o => o.overallStatus && o.overallStatus.toUpperCase() === 'PENDING');
            const preparingOrders = allOrders.filter(o => o.overallStatus && o.overallStatus.toUpperCase() === 'PREPARING');
            const readyOrders = allOrders.filter(o => o.overallStatus && o.overallStatus.toUpperCase() === 'READY');
            const completedOrders = allOrders.filter(o => o.overallStatus && (o.overallStatus.toUpperCase() === 'SERVED' || o.overallStatus.toUpperCase() === 'COMPLETED'));
            
            document.getElementById('statNewOrders').innerText = pendingOrders.length;
            document.getElementById('statPreparingOrders').innerText = preparingOrders.length;
            document.getElementById('statReadyOrders').innerText = readyOrders.length;
            document.getElementById('statCompletedOrders').innerText = completedOrders.length;
            
            // Update Badges in Sidebar
            const badgeNew = document.getElementById('badgeNewOrders');
            if(pendingOrders.length > 0) { badgeNew.style.display = 'inline-block'; badgeNew.innerText = pendingOrders.length; }
            else { badgeNew.style.display = 'none'; }
            
            const badgePrep = document.getElementById('badgePreparing');
            if(preparingOrders.length > 0) { badgePrep.style.display = 'inline-block'; badgePrep.innerText = preparingOrders.length; }
            else { badgePrep.style.display = 'none'; }
        }

        function generateOrderHTML(order, ribbonClass, ribbonText, btnClass, btnIcon, btnText, nextStatusAction) {
            let itemsHtml = '';
            const isAddOn = order.overallStatus && order.overallStatus.toUpperCase() !== 'PENDING';

            if(order.items && order.items.length > 0) {
                // For ADD-ON orders: show only PENDING items (the new ones to cook)
                // For fresh PENDING orders: show all items
                const itemsToShow = isAddOn
                    ? order.items.filter(oi => oi.itemStatus && oi.itemStatus.toUpperCase() === 'PENDING')
                    : order.items;

                itemsToShow.forEach(oi => {
                    const itemName = oi.foodName || 'Item';
                    const isNewlyAdded = oi.itemStatus && oi.itemStatus.toUpperCase() === 'PENDING';
                    itemsHtml += `
                        <div class="item-row" style="${isNewlyAdded ? 'border-left:3px solid #ff8c00;background:rgba(255,140,0,0.07);' : ''}">
                            <span>
                                <i class="fa-solid fa-utensils text-muted me-2"></i> ${itemName}
                                ${isNewlyAdded ? '<span class="badge ms-2" style="background:#ff8c00;font-size:0.65rem;vertical-align:middle;">NEW</span>' : ''}
                            </span>
                            <span class="fw-bold px-2 py-1 bg-dark rounded">x${oi.quantity}</span>
                        </div>
                    `;
                });
            }

            if(!itemsHtml) {
                itemsHtml = `<div class="text-muted text-center py-3">No items found</div>`;
            }

            // For ADD-ON orders (SERVED/READY with new PENDING items):
            // Clicking the button should change status to PREPARING so chef can see it in Preparing tab too
            const btnOnClick = `changeOrderStatus(${order.orderId}, '${nextStatusAction}')`;

            return `
                <div class="col-md-4">
                    <div class="order-card">
                        <div class="ribbon ${ribbonClass}">${ribbonText}</div>
                        <div class="order-header">
                            <div class="d-flex justify-content-between align-items-center mb-2">
                                <h4 class="fw-bold mb-0" style="color: #ff8c00;">ORD-${order.orderId}</h4>
                                <span class="badge bg-secondary" style="margin-right: 40px; z-index: 11; position: relative;">Table ${order.tableId}</span>
                            </div>
                            <div class="text-muted small">
                                <i class="fa-solid fa-user me-1"></i> Waiter: <span class="text-white fw-bold">${order.staffName || 'Admin'}</span>
                                ${isAddOn ? `<span class="ms-2 badge" style="background:rgba(255,140,0,0.2);color:#ff8c00;font-size:0.7rem;">Add-on to ${order.overallStatus} order</span>` : ''}
                            </div>
                        </div>
                        <div class="order-items-list mb-3">
                            ${itemsHtml}
                        </div>
                        <button class="btn ${btnClass} w-100 fw-bold py-2" onclick="${btnOnClick}">
                            <i class="${btnIcon} me-2"></i> ${btnText}
                        </button>
                    </div>
                </div>
            `;
        }
        
        function renderNewOrders() {
            const grid = document.getElementById('newOrdersGrid');

            // Show an order if:
            // 1. Overall status is PENDING (fresh order), OR
            // 2. Any item in the order has item_status = 'PENDING' (waiter added more items to an existing order)
            const hasPendingItem = o => o.items && o.items.some(i => i.itemStatus && i.itemStatus.toUpperCase() === 'PENDING');
            const pendingOrders = allOrders.filter(o => {
                const status = o.overallStatus ? o.overallStatus.toUpperCase() : '';
                if (status === 'COMPLETED' || status === 'PAID') return false; // fully done, never show
                return status === 'PENDING' || hasPendingItem(o);
            });
            
            if(pendingOrders.length === 0) {
                grid.innerHTML = `<div class="col-12"><div class="text-center border border-secondary text-white p-3 rounded" style="background: rgba(30,30,30,0.6); backdrop-filter: blur(10px);">No new orders waiting. Great job!</div></div>`;
                return;
            }
            
            grid.innerHTML = pendingOrders.map(o => {
                // Orders with overallStatus != PENDING are "additional items" on an existing order
                const isAdditional = o.overallStatus && o.overallStatus.toUpperCase() !== 'PENDING';
                const ribbonText  = isAdditional ? 'ADD-ON' : 'NEW';
                const ribbonClass = isAdditional ? 'ribbon-preparing' : 'ribbon-new';
                const btnText     = isAdditional ? 'Start Cooking New Items' : 'Accept & Start Cooking';
                return generateOrderHTML(o, ribbonClass, ribbonText, 'btn-primary', 'fa-solid fa-fire', btnText, 'PREPARING');
            }).join('');
        }

        function renderPreparingOrders() {
            const grid = document.getElementById('preparingGrid');
            const preparingOrders = allOrders.filter(o => o.overallStatus && o.overallStatus.toUpperCase() === 'PREPARING');
            
            if(preparingOrders.length === 0) {
                grid.innerHTML = `<div class="col-12"><div class="text-center border border-secondary text-white p-3 rounded" style="background: rgba(30,30,30,0.6); backdrop-filter: blur(10px);">Kitchen is quiet. No orders currently on the stove.</div></div>`;
                return;
            }
            
            grid.innerHTML = preparingOrders.map(o => 
                generateOrderHTML(o, 'ribbon-preparing', 'COOKING', 'btn-success', 'fa-solid fa-check-double', 'Mark as Ready', 'READY')
            ).join('');
        }
        
        function renderReadyOrders() {
            const grid = document.getElementById('readyGrid');
            const readyOrders = allOrders.filter(o => o.overallStatus && o.overallStatus.toUpperCase() === 'READY');
            
            if(readyOrders.length === 0) {
                grid.innerHTML = `<div class="col-12"><div class="text-center border border-secondary text-white p-3 rounded" style="background: rgba(30,30,30,0.6); backdrop-filter: blur(10px);">No orders waiting for pickup.</div></div>`;
                return;
            }
            
            grid.innerHTML = readyOrders.map(order => {
                let itemsHtml = '';
                if(order.items && order.items.length > 0) {
                    order.items.forEach(oi => {
                        const itemName = oi.foodName || 'Item';
                        itemsHtml += `<div class="item-row"><span><i class="fa-solid fa-utensils text-muted me-2"></i> ${itemName}</span><span class="fw-bold px-2 py-1 bg-dark rounded">x${oi.quantity}</span></div>`;
                    });
                }
                return `
                    <div class="col-md-4">
                        <div class="order-card" style="border-color: #1cc88a;">
                            <div class="ribbon ribbon-ready">READY</div>
                            <div class="order-header">
                                <div class="d-flex justify-content-between align-items-center mb-2">
                                    <h4 class="fw-bold mb-0 text-success">ORD-${order.orderId}</h4>
                                    <span class="badge bg-secondary" style="margin-right: 40px; z-index: 11; position: relative;">Table ${order.tableId}</span>
                                </div>
                                <div class="text-muted small">
                                    <i class="fa-solid fa-user me-1"></i> Waiter: <span class="text-white fw-bold">${order.staffName || 'Admin'}</span>
                                </div>
                            </div>
                            <div class="order-items-list mb-3">
                                ${itemsHtml}
                            </div>
                            <div class="alert alert-success text-center mb-0 p-2"><i class="fa-solid fa-bell me-2"></i>Waiting for Waiter...</div>
                        </div>
                    </div>
                `;
            }).join('');
        }

        async function changeOrderStatus(orderId, newStatus) {
            try {
                const res = await apiFetch(`${API_URL}/orders/updateStatus/${orderId}?status=${newStatus}`, { method: 'PUT' });
                if(res.ok) {
                    await loadKitchenData();
                } else {
                    alert("Failed to update status. Please try again.");
                }
            } catch(err) {
                console.error(err);
                alert("Error connecting to server.");
            }
        }

        function renderHistory() {
            const tbody = document.getElementById('historyTableBody');
            const completed = allOrders.filter(o => o.overallStatus && (o.overallStatus.toUpperCase() === 'SERVED' || o.overallStatus.toUpperCase() === 'COMPLETED'));
            
            if(completed.length === 0) {
                tbody.innerHTML = `<tr><td colspan="4" class="text-center text-muted">No completed orders yet.</td></tr>`;
                return;
            }
            
            // Sort history showing newest first
            completed.sort((a,b) => b.orderId - a.orderId);
            
            tbody.innerHTML = completed.map(o => {
                let itemsSummary = '';
                if(o.items && o.items.length > 0) {
                    itemsSummary = o.items.map(oi => {
                        const m = allItems.find(i => i.id === oi.itemId);
                        return m ? `${m.name} (x${oi.quantity})` : `Item#${oi.itemId}`;
                    }).join(', ');
                }
                
                let badgeClass = o.overallStatus.toUpperCase() === 'SERVED' ? 'bg-info' : 'bg-success';
                
                return `
                    <tr>
                        <td class="fw-bold">ORD-${o.orderId}</td>
                        <td>Table ${o.tableId}</td>
                        <td class="text-truncate" style="max-width: 250px;" title="${itemsSummary}">${itemsSummary}</td>
                        <td><span class="badge ${badgeClass}">${o.overallStatus}</span></td>
                    </tr>
                `;
            }).join('');
        }

        function logout() {
            localStorage.clear();
            window.location.href = "HomePage.jsp";
        }
    </script>
<script src="JS/theme.js?v=4.0"></script>
</body>
</html>

