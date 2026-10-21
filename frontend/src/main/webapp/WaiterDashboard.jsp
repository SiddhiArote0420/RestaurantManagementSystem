<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Waiter Dashboard</title>
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
        background: linear-gradient(135deg, rgba(255,140,0,0.8) 0%, rgba(200,80,0,0.8) 100%), url('images/hero_banner.jpg');
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

    /* Table Cards */
    .table-card {
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
    .table-card::before {
        content: '';
        position: absolute;
        top: 0; left: 0; width: 4px; height: 100%;
        background: #ff8c00;
    }
    .table-card:hover {
        border-color: rgba(255, 140, 0, 0.5);
        transform: translateY(-3px);
    }
    .status-badge {
        font-size: 0.8rem;
        padding: 5px 10px;
        border-radius: 20px;
        font-weight: 500;
    }
    .status-available { background: rgba(28, 200, 138, 0.2); color: #1cc88a; }
    .status-occupied { background: rgba(244, 124, 54, 0.2); color: #f47c36; }

    /* Menu & Order Overlay */
    .menu-item-card {
        background: rgba(40, 40, 40, 0.9);
        border: 1px solid rgba(255,255,255,0.05);
        border-radius: 8px;
        padding: 15px;
        margin-bottom: 15px;
        display: flex;
        align-items: center;
        color: white;
        transition: transform 0.2s;
    }
    .menu-item-card:hover {
        transform: scale(1.02);
        border-color: rgba(255,140,0,0.4);
    }
    .menu-icon-wrapper {
        width: 50px; height: 50px;
        border-radius: 8px;
        margin-right: 15px;
        background: rgba(255,255,255,0.1);
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 1.5rem;
        color: #f47c36;
    }
    .menu-item-card h6 {
        color: #ffffff !important;
    }
    .qty-btn {
        background: transparent;
        border: 1px solid #ff8c00;
        color: #ff8c00;
        width: 28px; height: 28px;
        border-radius: 4px;
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 0;
        font-size: 14px;
        transition: all 0.2s;
    }
    .qty-btn:hover {
        background: #ff8c00;
        color: white;
    }
    
    .btn-orange {
        background-color: #ff8c00;
        color: white;
        border: none;
    }
    .btn-orange:hover {
        background-color: #e07b00;
        color: white;
    }

    /* Modal styling overrides */
    .premium-modal .modal-content {
        background-color: #1e1e1e !important;
        border: 1px solid rgba(255,140,0,0.3);
        color: white;
    }
    .premium-modal .modal-header {
        border-bottom: 1px solid rgba(255,255,255,0.05);
    }
    .premium-modal .modal-footer {
        border-top: 1px solid rgba(255,255,255,0.05);
        background: rgba(0,0,0,0.2);
    }
    .cart-item {
        border-bottom: 1px solid rgba(255,255,255,0.05);
        padding: 15px 0;
    }
    .text-muted { color: #adb5bd !important; }

    /* Active Orders Table */
    .table-dark-custom {
        background: transparent;
        color: white;
    }
    .table-dark-custom th {
        background: rgba(255,140,0,0.1);
        color: #ff8c00;
        border-bottom: 1px solid rgba(255,140,0,0.2);
    }
    .table-dark-custom td {
        background: rgba(30,30,30,0.6);
        border-bottom: 1px solid rgba(255,255,255,0.05);
        color: #d1d3e2;
    }
    
    /* Dynamic Workflow Badges */
    .badge-pending { background-color: #f6c23e; color: #000; }
    .badge-preparing { background-color: #4e73df; color: #fff; }
    .badge-ready { background-color: #1cc88a; color: #fff; }
    .badge-served { background-color: #6f42c1; color: #fff; }
    .badge-completed { background-color: #858796; color: #fff; }

    /* Category Filter Pills */
    .cat-filter-btn {
        padding: 5px 14px;
        border-radius: 20px;
        font-size: 0.78rem;
        font-weight: 600;
        border: 1px solid rgba(255,255,255,0.15);
        background: rgba(255,255,255,0.05);
        color: #adb5bd;
        cursor: pointer;
        transition: all 0.2s ease;
        white-space: nowrap;
    }
    .cat-filter-btn:hover {
        border-color: rgba(255,140,0,0.5);
        color: #ff8c00;
        background: rgba(255,140,0,0.08);
    }
    .cat-filter-btn.active {
        background: rgba(255,140,0,0.2);
        border-color: #ff8c00;
        color: #ff8c00;
    }

    /* Not Available card in menu */
    .unavail-box {
        background: rgba(239,68,68,0.08);
        border: 1px dashed rgba(239,68,68,0.35);
        border-radius: 8px;
        padding: 6px 12px;
        color: #ef4444;
        font-size: 0.75rem;
        font-weight: 600;
        text-align: center;
    }
</style>
<!-- Responsive UI: layout/spacing only, no functionality changes -->
<link rel="stylesheet" href="CSS/responsive.css?v=1.0">
</head>
<body>
	<div class="wrapper">
		<!-- Sidebar -->
		<div class="sidebar">
			<div class="logo">
				<i class="fa-solid fa-utensils"></i>
				<h4>Restaurant</h4>
			</div>
			<ul>
				<li class="active"><a href="#dashboard" onclick="switchTab('dashboard')"> <i class="fa-solid fa-house"></i> Dashboard</a></li>
				<li><a href="#tables" onclick="switchTab('tables')"> <i class="fa-solid fa-chair"></i> My Tables</a></li>
				<li><a href="#orders" onclick="switchTab('orders')"> <i class="fa-solid fa-bell-concierge"></i> Active Orders</a></li>
				<li><a href="#" onclick="logout()"> <i class="fa-solid fa-right-from-bracket"></i> Logout</a></li>
			</ul>
		</div>

		<!-- Main -->
		<div class="main">
			<!-- Navbar -->
			<nav class="navbar navbar-expand-lg">
				<div class="container-fluid">
					<button class="hamburger" onclick="toggleSidebar()" aria-label="Toggle sidebar"><i class="fa-solid fa-bars"></i></button>
					<h3 style="color: #ff8c00;">Waiter Dashboard</h3>
					<div class="admin-info text-white">
						<i class="fa-solid fa-user-circle"></i> Welcome, <span id="waiterNameDisplay" style="color: #ff8c00; font-weight: 600;">Waiter</span>
					</div>
				</div>
			</nav>

			<!-- Container -->
			<div class="royal-container">
			
			    <!-- DASHBOARD TAB -->
			    <div id="tab-dashboard">
                    <div class="dashboard-banner d-flex align-items-center justify-content-between">
                        <div>
                            <h2 class="fw-bold mb-2">Welcome back, <span id="bannerWaiterName">Waiter</span>!</h2>
                            <p class="mb-0 fs-5">Ready for another great shift? You have <span id="bannerTableCount" class="fw-bold text-white">0</span> tables assigned to you.</p>
                        </div>
                        <i class="fa-solid fa-mug-hot fa-4x text-white opacity-50"></i>
                    </div>

                    <h4 class="text-white mb-4">Overview</h4>
                    <div class="row mb-4">
                        <div class="col-md-3">
                            <div class="stat-card d-flex align-items-center">
                                <div class="stat-icon me-3"><i class="fa-solid fa-chair"></i></div>
                                <div>
                                    <h6 class="text-muted mb-1">My Tables</h6>
                                    <h3 class="mb-0" id="statMyTables">0</h3>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="stat-card d-flex align-items-center">
                                <div class="stat-icon me-3"><i class="fa-solid fa-bell-concierge"></i></div>
                                <div>
                                    <h6 class="text-muted mb-1">Active Orders</h6>
                                    <h3 class="mb-0" id="statActiveOrders">0</h3>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="stat-card d-flex align-items-center">
                                <div class="stat-icon me-3" style="background: rgba(28, 200, 138, 0.1); color: #1cc88a;"><i class="fa-solid fa-check-double"></i></div>
                                <div>
                                    <h6 class="text-muted mb-1">Orders Served</h6>
                                    <h3 class="mb-0" id="statServedOrders">0</h3>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="stat-card d-flex align-items-center">
                                <div class="stat-icon me-3" style="background: rgba(54, 185, 204, 0.1); color: #36b9cc;"><i class="fa-solid fa-indian-rupee-sign"></i></div>
                                <div>
                                    <h6 class="text-muted mb-1">Total Amount</h6>
                                    <h3 class="mb-0">Rs. <span id="statTotalAmount">0</span></h3>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- MY TABLES TAB -->
                <div id="tab-tables" style="display:none;">
                    <h4 class="text-white mb-4">My Assigned Tables</h4>
                    <div class="row" id="tablesContainer">
                        <!-- Tables rendered here -->
                    </div>
                </div>

                <!-- ACTIVE ORDERS TAB -->
                <div id="tab-orders" style="display:none;">
                    <h4 class="text-white mb-4">My Active Orders</h4>
                    <div class="table-responsive">
                        <table class="table table-dark-custom align-middle">
                            <thead>
                                <tr>
                                    <th>Order ID</th>
                                    <th>Table No</th>
                                    <th>Amount</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody id="activeOrdersTableBody">
                                <!-- Orders rendered here -->
                            </tbody>
                        </table>
                    </div>
                </div>

			</div>
		</div>
	</div>

    <!-- ORDER MODAL -->
    <div class="modal fade premium-modal" id="orderModal" tabindex="-1" aria-hidden="true" data-bs-backdrop="static">
        <div class="modal-dialog modal-xl modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" style="color: #ff8c00;">Order for Table <span id="modalTableNumber"></span> <span id="modalOrderStateBadge" class="ms-2"></span></h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body p-4">
                    <div class="row">
                        <!-- Menu Section -->
                        <div class="col-md-7 border-end border-secondary pe-4">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <h5 class="mb-0">Menu</h5>
                                <div class="input-group" style="width: 240px;">
                                    <span class="input-group-text bg-dark text-white border-secondary"><i class="fa-solid fa-magnifying-glass"></i></span>
                                    <input type="text" id="menuSearchInput" class="form-control bg-dark text-white border-secondary" placeholder="Search food..." onkeyup="filterMenu()">
                                </div>
                            </div>
                            <!-- Category Filter Tabs -->
                            <div id="categoryFilterBar" class="d-flex flex-wrap gap-2 mb-3">
                                <!-- Populated dynamically by renderCategoryFilters() -->
                            </div>
                            <div style="max-height: 450px; overflow-y: auto; padding-right: 10px;" id="menuContainer">
                                <!-- Menu Items rendered here -->
                            </div>
                        </div>
                        <!-- Cart Section -->
                        <div class="col-md-5 ps-4 d-flex flex-column">
                            <h5 class="mb-3">Current Order</h5>
                            <div style="flex-grow: 1; max-height: 400px; overflow-y: auto;" id="cartContainer">
                                <!-- Cart Items rendered here -->
                                <div class="text-center text-muted mt-5" id="emptyCartMsg">No items added yet.</div>
                            </div>
                            <div class="mt-4 pt-3 border-top border-secondary">
                                <div class="d-flex justify-content-between mb-3">
                                    <h5 class="mb-0">Grand Total:</h5>
                                    <h4 class="mb-0 text-success">Rs. <span id="cartTotal">0.00</span></h4>
                                </div>
                                <button id="submitOrderBtn" class="btn btn-orange w-100 py-3 fs-5 fw-bold" onclick="submitOrder()">
                                    <i class="fa-solid fa-fire-burner me-2"></i> Place Order
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

	    <script>
        // Suppress JS errors - log to console only
        window.onerror = function(message, source, lineno, colno, error) {
            console.error("JS Error: " + message + " at line " + lineno);
            return true;
        };
        window.onunhandledrejection = function(event) {
            console.error("Promise Error: " + event.reason);
        };
    </script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="JS/api.js"></script>
	<script>
        const API_URL = API_BASE;
        
        // Mock logged in waiter for now.
        let currentWaiterId = 2; // Assuming staff ID 2 is a Waiter
        let currentWaiterName = "Rahul";
        
        // UX Role Check (Real security and authorization are enforced by the backend via verified JWT)
        const userRole = localStorage.getItem("userRole");
        if(userRole && localStorage.getItem("staffId")) {
            currentWaiterId = parseInt(localStorage.getItem("staffId"));
            currentWaiterName = localStorage.getItem("adminName") || "Waiter";
        }
        
        const nameDisplayEl = document.getElementById('waiterNameDisplay') || document.getElementById('adminNameDisplay');
        if(nameDisplayEl) nameDisplayEl.innerText = currentWaiterName;

        let myTables = [];
        let activeOrders = [];
        let fullMenu = [];
        let currentCart = {}; // { foodId: {id, name, price, qty} }
        let currentSelectedTableId = null;
        let currentEditOrderId = null; // null if new order, orderId if editing
        let orderModal;

        // Font Awesome Icons for categories mapping
        const categoryIcons = {
            'Starters': 'fa-solid fa-bowl-rice',
            'Main Course': 'fa-solid fa-pizza-slice',
            'Desserts': 'fa-solid fa-ice-cream',
            'Beverages': 'fa-solid fa-wine-glass',
            'Default': 'fa-solid fa-utensils'
        };

        document.addEventListener("DOMContentLoaded", () => {
            orderModal = new bootstrap.Modal(document.getElementById('orderModal'));
            
            // Set Waiter Name
            const nameEl = document.getElementById('waiterNameDisplay') || document.getElementById('adminNameDisplay');
            if (nameEl) nameEl.innerText = currentWaiterName;
            
            // Auto-refresh orders every 5 seconds
            setInterval(loadInitialData, 5000);

            loadInitialData();
        });

        function switchTab(tabId) {
            document.getElementById('tab-dashboard').style.display = 'none';
            document.getElementById('tab-tables').style.display = 'none';
            document.getElementById('tab-orders').style.display = 'none';
            
            document.getElementById('tab-' + tabId).style.display = 'block';
            
            document.querySelectorAll('.sidebar ul li').forEach(li => li.classList.remove('active'));
            event.currentTarget.parentElement.classList.add('active');
        }

        async function loadInitialData() {
            try {
                // Load Tables
                const tablesRes = await apiFetch(`${API_URL}/tables/all`);
                const allTables = await tablesRes.json();
                
                myTables = allTables.filter(t => t.assignedStaffId === currentWaiterId);
                
                // Load Orders
                const ordersRes = await apiFetch(`${API_URL}/orders/all`);
                const allOrders = await ordersRes.json();
                
                // Filter orders to ONLY those that belong to the tables assigned to this waiter
                activeOrders = allOrders.filter(o => {
                    return myTables.some(t => t.tableId === o.tableId);
                });
                
                // Load Menu
                const menuRes = await apiFetch(`${API_URL}/menu/all`);
                fullMenu = await menuRes.json();

                updateDashboardStats();
                renderMyTables();
                renderActiveOrders();
            } catch (err) {
                console.error("Error loading data:", err);
            }
        }

        function updateDashboardStats() {
            document.getElementById('bannerWaiterName').innerText = currentWaiterName;
            document.getElementById('bannerTableCount').innerText = myTables.length;
            
            document.getElementById('statMyTables').innerText = myTables.length;
            const myActiveOrders = activeOrders.filter(o => o.overallStatus !== 'COMPLETED');
            document.getElementById('statActiveOrders').innerText = myActiveOrders.length;
            
            const myServedOrders = activeOrders.filter(o => o.overallStatus === 'SERVED' || o.overallStatus === 'COMPLETED');
            document.getElementById('statServedOrders').innerText = myServedOrders.length;
            
            const totalAmt = activeOrders.reduce((sum, order) => sum + (order.totalAmount || 0), 0);
            document.getElementById('statTotalAmount').innerText = totalAmt.toFixed(2);
        }

        function renderMyTables() {
            const container = document.getElementById('tablesContainer');
            container.innerHTML = '';
            
            if(myTables.length === 0) {
                container.innerHTML = '<div class="col-12 text-muted">No tables assigned to you currently.</div>';
                return;
            }

            myTables.forEach(table => {
                // Find if table has an active order
                const tableOrder = activeOrders.find(o => o.tableId === table.tableId && o.overallStatus && o.overallStatus.toUpperCase() !== 'COMPLETED');
                const isOccupied = tableOrder != null;
                
                let badgeClass = 'status-available';
                let statusText = 'Available';
                
                if (isOccupied) {
                    badgeClass = getBadgeClass(tableOrder.overallStatus);
                    statusText = tableOrder.overallStatus;
                }

                const html = `
                    <div class="col-md-4 mb-4">
                        <div class="table-card">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <div>
                                    <h6 class="text-muted mb-0">Table</h6>
                                    <h2 class="mb-0" style="color: #ff8c00;">${table.tableNumber}</h2>
                                </div>
                                <span class="badge ${badgeClass} fs-6 px-3 py-2">${statusText}</span>
                            </div>
                            <div class="mb-4 text-muted border-top border-secondary pt-3 mt-3">
                                <i class="fa-solid fa-users me-2"></i> ${table.customerCount || 0} Customers
                            </div>
                            <button class="btn btn-outline-light w-100 fw-bold" onclick="handleTableClick(${table.tableId}, ${table.tableNumber}, ${isOccupied ? tableOrder.orderId : null})">
                                ${isOccupied ? '<i class="fa-regular fa-eye me-2"></i> View Order' : '<i class="fa-solid fa-plus me-2"></i> Take Order'}
                            </button>
                        </div>
                    </div>
                `;
                container.innerHTML += html;
            });
        }

        function getBadgeClass(status) {
            status = status ? status.toUpperCase() : '';
            if (status === 'PENDING') return 'bg-warning text-dark';
            if (status === 'PREPARING') return 'badge-preparing';
            if (status === 'READY') return 'badge-ready';
            if (status === 'SERVED') return 'badge-served';
            if (status === 'COMPLETED') return 'badge-completed';
            return 'bg-secondary';
        }

        function renderActiveOrders() {
            const tbody = document.getElementById('activeOrdersTableBody');
            tbody.innerHTML = '';
            
            // Don't show COMPLETED in active orders
            const myOrders = activeOrders.filter(o => o.overallStatus !== 'COMPLETED');
            
            if(myOrders.length === 0) {
                tbody.innerHTML = '<tr><td colspan="5" class="text-center text-muted">No active orders.</td></tr>';
                return;
            }

            myOrders.forEach(order => {
                const status = order.overallStatus ? order.overallStatus.toUpperCase() : 'UNKNOWN';
                const badgeClass = getBadgeClass(status);

                let actionsHtml = '';
                if (status === 'PENDING') {
                    actionsHtml = `
                        <button class="btn btn-sm btn-outline-warning me-2" onclick="editOrder(${order.orderId}, ${order.tableId})"><i class="fa-solid fa-pen"></i> Edit</button>
                        <button class="btn btn-sm btn-outline-danger" onclick="cancelOrder(${order.orderId})"><i class="fa-solid fa-trash"></i> Cancel</button>
                    `;
                } else if (status === 'READY') {
                    actionsHtml = `
                        <button class="btn btn-sm btn-success fw-bold me-2" onclick="updateOrderStatus(${order.orderId}, 'SERVED')"><i class="fa-solid fa-bell-concierge me-1"></i> Serve Food</button>
                        <button class="btn btn-sm btn-outline-info" onclick="openAddMoreModal(${order.orderId}, ${order.tableId})"><i class="fa-solid fa-circle-plus me-1"></i> Add More</button>
                    `;
                } else if (status === 'PREPARING') {
                    actionsHtml = `
                        <span class="text-muted fst-italic small me-2">Cooking...</span>
                        <button class="btn btn-sm btn-outline-info" onclick="openAddMoreModal(${order.orderId}, ${order.tableId})"><i class="fa-solid fa-circle-plus me-1"></i> Add More</button>
                    `;
                } else if (status === 'SERVED') {
                    actionsHtml = `
                        <span class="text-muted fst-italic small me-2">Waiting for payment</span>
                        <button class="btn btn-sm btn-outline-info" onclick="openAddMoreModal(${order.orderId}, ${order.tableId})"><i class="fa-solid fa-circle-plus me-1"></i> Add More</button>
                    `;
                }

                const tableObj = myTables.find(t => t.tableId === order.tableId);
                const tableNumDisplay = tableObj ? tableObj.tableNumber : order.tableId;

                tbody.innerHTML += `
                    <tr>
                        <td class="fw-bold text-white">ORD-${order.orderId}</td>
                        <td>Table ${tableNumDisplay}</td>
                        <td class="fw-bold text-success">Rs. ${order.totalAmount ? order.totalAmount.toFixed(2) : '0.00'}</td>
                        <td><span class="badge ${badgeClass}">${status}</span></td>
                        <td>${actionsHtml}</td>
                    </tr>
                `;
            });
        }

        // --- ORDER MANAGEMENT LOGIC ---

        function handleTableClick(tableId, tableNumber, existingOrderId) {
            if (existingOrderId) {
                // Table is occupied.
                const order = activeOrders.find(o => o.orderId === existingOrderId);
                const status = order.overallStatus.toUpperCase();
                
                if (status === 'PENDING') {
                    editOrder(existingOrderId, tableId);
                } else {
                    // Just view (cannot edit)
                    openOrderInterface(tableId, tableNumber, existingOrderId, true); // true = readonly
                }
            } else {
                // New Order
                openOrderInterface(tableId, tableNumber, null, false);
            }
        }

        function editOrder(orderId, tableId) {
            const tableObj = myTables.find(t => t.tableId === tableId);
            openOrderInterface(tableId, tableObj ? tableObj.tableNumber : '-', orderId, false);
        }

        // ===================== ADD MORE ITEMS FEATURE =====================

        function openAddMoreModal(orderId, tableId) {
            const order = activeOrders.find(o => o.orderId === orderId);
            if (!order) return;

            const tableObj = myTables.find(t => t.tableId === tableId);
            const tableNumber = tableObj ? tableObj.tableNumber : tableId;

            // Set modal header
            document.getElementById('modalTableNumber').innerText = tableNumber;
            const badgeSpan = document.getElementById('modalOrderStateBadge');
            badgeSpan.className = 'badge fs-6 bg-info ms-2';
            badgeSpan.innerText = '+ Adding Items';

            // Store which order we are adding to
            currentEditOrderId = orderId;
            currentSelectedTableId = tableId;

            // Cart starts EMPTY — only newly selected items go in cart
            currentCart = {};

            // Clear search
            const searchInput = document.getElementById('menuSearchInput');
            if (searchInput) searchInput.value = '';

            // Render existing items as read-only summary above the menu
            const existingItemsHtml = order.items && order.items.length > 0
                ? order.items.map(i => `
                    <div class="d-flex justify-content-between align-items-center py-1 px-2 mb-1 rounded"
                         style="background:rgba(255,255,255,0.04);font-size:0.85rem;">
                        <span style="color:#adb5bd;">
                            <i class="fa-solid fa-check-circle me-2" style="color:#1cc88a;"></i>${i.foodName}
                        </span>
                        <span style="color:#adb5bd;">x${i.quantity}</span>
                    </div>`).join('')
                : '<div class="text-muted small">No previous items.</div>';

            // Inject existing items summary into cart area header
            const cartContainer = document.getElementById('cartContainer');
            cartContainer.innerHTML = `
                <div class="mb-3 p-2 rounded" style="background:rgba(28,200,138,0.06);border:1px solid rgba(28,200,138,0.2);">
                    <div class="fw-bold mb-2" style="color:#1cc88a;font-size:0.8rem;">
                        <i class="fa-solid fa-list-check me-1"></i> ALREADY ORDERED (ORD-${orderId})
                    </div>
                    ${existingItemsHtml}
                </div>
                <div class="fw-bold mb-2" style="color:#ff8c00;font-size:0.85rem;">
                    <i class="fa-solid fa-circle-plus me-1"></i> NEW ITEMS TO ADD
                </div>
                <div id="addMoreCartItems">
                    <div class="text-center text-muted mt-2" id="emptyCartMsg">Select items from the menu.</div>
                </div>
            `;

            // Override submitBtn for Add More mode
            const submitBtn = document.getElementById('submitOrderBtn');
            submitBtn.style.display = 'block';
            submitBtn.className = 'btn btn-info w-100 py-3 fs-5 fw-bold';
            submitBtn.innerHTML = '<i class="fa-solid fa-circle-plus me-2"></i> Confirm Add Items';
            submitBtn.onclick = function() { submitAddMoreItems(orderId, order.totalAmount || 0); };

            // Render menu (available to add)
            renderMenu(false);

            orderModal.show();
        }

        async function submitAddMoreItems(orderId, existingTotal) {
            const cartItems = Object.values(currentCart);
            if (cartItems.length === 0) {
                showToast('Please select at least one item to add.', 'error');
                return;
            }

            const submitBtn = document.getElementById('submitOrderBtn');
            submitBtn.disabled = true;
            submitBtn.innerHTML = '<i class="fa-solid fa-spinner fa-spin me-2"></i> Adding...';

            // Calculate new items total
            const newItemsTotal = cartItems.reduce((sum, item) => sum + (item.price * item.qty), 0);
            const updatedTotal = existingTotal + newItemsTotal;

            const payload = {
                totalAmount: parseFloat(updatedTotal.toFixed(2)),
                items: cartItems.map(item => ({
                    foodId: item.id,
                    quantity: item.qty
                }))
            };

            try {
                const res = await apiFetch(`${API_URL}/orders/addItems/${orderId}`, {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify(payload)
                });
                const result = await res.json();
                if (result.success) {
                    showToast(`✅ ${cartItems.length} item(s) added to ORD-${orderId}!`, 'success');
                    orderModal.hide();
                    currentCart = {};
                    loadInitialData(); // Refresh orders & stats
                } else {
                    showToast('Failed to add items: ' + result.message, 'error');
                }
            } catch (err) {
                console.error('Add more items error:', err);
                showToast('Connection error. Please try again.', 'error');
            } finally {
                submitBtn.disabled = false;
                submitBtn.innerHTML = '<i class="fa-solid fa-circle-plus me-2"></i> Confirm Add Items';
            }
        }

        // ===================== END ADD MORE ITEMS FEATURE =====================

        function openOrderInterface(tableId, tableNumber, orderIdToEdit, isReadOnly) {
            currentSelectedTableId = tableId;
            currentEditOrderId = orderIdToEdit;
            document.getElementById('modalTableNumber').innerText = tableNumber;
            
            // Set Badge
            const badgeSpan = document.getElementById('modalOrderStateBadge');
            if (orderIdToEdit) {
                const order = activeOrders.find(o => o.orderId === orderIdToEdit);
                badgeSpan.className = 'badge fs-6 ' + getBadgeClass(order.overallStatus);
                badgeSpan.innerText = order.overallStatus;
            } else {
                badgeSpan.className = '';
                badgeSpan.innerText = '';
            }

            // Populate Cart if editing
            currentCart = {};
            if (orderIdToEdit) {
                const order = activeOrders.find(o => o.orderId === orderIdToEdit);
                if (order && order.items) {
                    order.items.forEach(item => {
                        // We need foodId, but DTO might only have foodName.
                        // Let's reverse lookup foodId from fullMenu based on name
                        const menuMatch = fullMenu.find(m => m.name === item.foodName);
                        const id = menuMatch ? menuMatch.menuId : Math.random(); // Fallback if name changed
                        currentCart[id] = { id: id, name: item.foodName, price: item.price, qty: item.quantity };
                    });
                }
            }
            
            // Adjust buttons
            const submitBtn = document.getElementById('submitOrderBtn');
            if (isReadOnly) {
                // If it's read-only, check if it's READY. If so, show "Serve Food" button.
                const order = activeOrders.find(o => o.orderId === orderIdToEdit);
                if (order && order.overallStatus && order.overallStatus.toUpperCase() === 'READY') {
                    submitBtn.style.display = 'block';
                    submitBtn.className = 'btn btn-success w-100 py-3 fs-5 fw-bold';
                    submitBtn.innerHTML = '<i class="fa-solid fa-bell-concierge me-2"></i> Serve Food';
                    submitBtn.onclick = function() {
                        updateOrderStatus(order.orderId, 'SERVED');
                        orderModal.hide();
                    };
                } else {
                    submitBtn.style.display = 'none';
                }
            } else {
                submitBtn.style.display = 'block';
                submitBtn.className = 'btn btn-orange w-100 py-3 fs-5 fw-bold';
                submitBtn.onclick = submitOrder;
                if (orderIdToEdit) {
                    submitBtn.innerHTML = '<i class="fa-solid fa-arrows-rotate me-2"></i> Update Order';
                } else {
                    submitBtn.innerHTML = '<i class="fa-solid fa-fire-burner me-2"></i> Place Order';
                }
            }

            // Clear search input
            const searchInput = document.getElementById('menuSearchInput');
            if (searchInput) searchInput.value = '';

            renderMenu(isReadOnly);
            renderCart(isReadOnly);
            orderModal.show();
        }

        // Active category filter — 'All' by default
        let activeCategory = 'All';

        function renderCategoryFilters() {
            const bar = document.getElementById('categoryFilterBar');
            if(!bar) return;

            const categories = ['All', ...new Set(fullMenu.map(i => i.category))];
            bar.innerHTML = categories.map(cat => `
                <button 
                    onclick="setCategoryFilter('${cat}')"
                    id="catBtn_${cat.replace(/\s+/g,'_')}"
                    class="cat-filter-btn ${cat === activeCategory ? 'active' : ''}">
                    ${cat}
                </button>
            `).join('');
        }

        function setCategoryFilter(cat) {
            activeCategory = cat;
            renderCategoryFilters();
            filterMenu();
        }

        function renderMenu(isReadOnly) {
            const container = document.getElementById('menuContainer');
            container.innerHTML = '';
            activeCategory = 'All'; // reset filter on each open
            
            fullMenu.forEach(item => {
                const iconClass = categoryIcons[item.category] || categoryIcons['Default'];
                const isUnavailable = item.available === false;
                
                const html = `
                    <div class="menu-item-card" 
                         data-category="${item.category}"
                         data-name="${item.name.toLowerCase()}"
                         style="${isUnavailable ? 'opacity:0.6;' : ''}">
                        <div class="menu-icon-wrapper" 
                             style="${isUnavailable ? 'background:rgba(239,68,68,0.08);color:#ef4444;' : ''}">
                            <i class="${isUnavailable ? 'fa-solid fa-fire-flame-curved' : iconClass}" 
                               style="${isUnavailable ? 'color:#ef4444;' : ''}"></i>
                        </div>
                        <div class="flex-grow-1">
                            <h6 class="mb-1" style="color:${isUnavailable ? '#ef4444' : '#ffffff'};">${item.name}</h6>
                            <div class="text-muted small">${item.category}</div>
                            <div style="font-weight:600; margin-top:2px;">
                                ${isUnavailable 
                                    ? '<span style="color:#ef4444;font-size:0.78rem;"><i class="fa-solid fa-circle-xmark me-1"></i>Not available today</span>'
                                    : '<span style="color:#1cc88a;">Rs. ' + item.price.toFixed(2) + '</span>'}
                            </div>
                        </div>
                        <div class="text-end">
                            ${isUnavailable 
                                ? `<div style="background:rgba(239,68,68,0.1);border:1px dashed rgba(239,68,68,0.4);border-radius:8px;padding:6px 10px;text-align:center;">
                                       <div style="color:#ef4444;font-size:0.75rem;font-weight:600;line-height:1.3;">
                                           <i class="fa-solid fa-ban mb-1" style="font-size:1rem;display:block;"></i>
                                           Not Available
                                       </div>
                                   </div>`
                                : `<button class="btn btn-sm px-3 py-1 fw-semibold" 
                                           style="background:rgba(255,140,0,0.15);color:#ff8c00;border:1px solid rgba(255,140,0,0.4);border-radius:8px;transition:all 0.2s;"
                                           onmouseover="this.style.background='rgba(255,140,0,0.35)'"
                                           onmouseout="this.style.background='rgba(255,140,0,0.15)'"
                                           onclick="addToCart(${item.menuId}, '${item.name.replace(/'/g, "\\'")}', ${item.price})"
                                           ${isReadOnly ? 'disabled' : ''}>
                                       <i class="fa-solid fa-plus me-1"></i>Add
                                   </button>`
                            }
                        </div>
                    </div>
                `;
                container.innerHTML += html;
            });

            renderCategoryFilters();
        }

        function filterMenu() {
            const query = document.getElementById('menuSearchInput')?.value.toLowerCase() || '';
            const cards = document.querySelectorAll('#menuContainer .menu-item-card');
            
            cards.forEach(card => {
                const name = card.dataset.name || '';
                const cat  = card.dataset.category || '';
                const matchesSearch = name.includes(query);
                const matchesCat = (activeCategory === 'All') || (cat === activeCategory);
                card.style.display = (matchesSearch && matchesCat) ? 'flex' : 'none';
            });
        }

        function addToCart(foodId, name, price) {
            if(currentCart[foodId]) {
                currentCart[foodId].qty++;
            } else {
                currentCart[foodId] = { id: foodId, name: name, price: price, qty: 1 };
            }
            renderCart(false);
        }

        function updateCartQty(foodId, change) {
            if(currentCart[foodId]) {
                currentCart[foodId].qty += change;
                if(currentCart[foodId].qty <= 0) {
                    delete currentCart[foodId];
                }
                renderCart(false); // Can never be readonly if buttons are clicked
            }
        }
        
        function removeCartItem(foodId) {
            delete currentCart[foodId];
            renderCart(false);
        }

        function renderCart(isReadOnly) {
            // In "Add More" mode the cart area has a sub-div #addMoreCartItems.
            // We render new items there to preserve the "already ordered" summary above.
            const addMoreTarget = document.getElementById('addMoreCartItems');
            const container = addMoreTarget || document.getElementById('cartContainer');

            const keys = Object.keys(currentCart);
            if(keys.length === 0) {
                if (addMoreTarget) {
                    addMoreTarget.innerHTML = '<div class="text-center text-muted mt-2" id="emptyCartMsg">Select items from the menu.</div>';
                } else {
                    container.innerHTML = '<div class="text-center text-muted mt-5" id="emptyCartMsg">No items added yet.</div>';
                }
                document.getElementById('cartTotal').innerText = '0.00';
                return;
            }
            
            container.innerHTML = '';
            
            let total = 0;
            
            keys.forEach(key => {
                const item = currentCart[key];
                const itemTotal = item.price * item.qty;
                total += itemTotal;
                
                let controlsHtml = '';
                if (!isReadOnly) {
                    controlsHtml = `
                        <div class="d-flex flex-column align-items-end ms-3">
                            <button class="btn btn-sm text-danger p-0 mb-1" onclick="removeCartItem(${item.id})"><i class="fa-solid fa-xmark"></i></button>
                            <div class="d-flex align-items-center bg-dark rounded border border-secondary p-1">
                                <button class="qty-btn border-0" onclick="updateCartQty(${item.id}, -1)">-</button>
                                <span class="mx-2 fw-bold text-white">${item.qty}</span>
                                <button class="qty-btn border-0" onclick="updateCartQty(${item.id}, 1)">+</button>
                            </div>
                        </div>
                    `;
                } else {
                    controlsHtml = `<div class="ms-3 fw-bold text-white fs-5">x${item.qty}</div>`;
                }
                
                const html = `
                    <div class="cart-item d-flex justify-content-between align-items-center">
                        <div class="flex-grow-1">
                            <h6 class="mb-1 text-white">${item.name}</h6>
                            <small class="text-muted">Rs. ${item.price.toFixed(2)}</small>
                        </div>
                        <div class="text-end">
                            <span class="fw-bold" style="color: #ff8c00;">Rs. ${itemTotal.toFixed(2)}</span>
                        </div>
                        ${controlsHtml}
                    </div>
                `;
                container.innerHTML += html;
            });
            
            document.getElementById('cartTotal').innerText = total.toFixed(2);
        }

        async function submitOrder() {
            const keys = Object.keys(currentCart);
            if(keys.length === 0) {
                showToast("Please add items to the order first.", 'warning');
                return;
            }

            const items = keys.map(k => ({
                foodId: currentCart[k].id,
                quantity: currentCart[k].qty
            }));

            const totalAmount = parseFloat(document.getElementById('cartTotal').innerText);

            const payload = {
                tableId: currentSelectedTableId,
                staffId: currentWaiterId,
                totalAmount: totalAmount,
                items: items
            };

            const isEditing = currentEditOrderId !== null;
            const url = isEditing ? `${API_URL}/orders/update/${currentEditOrderId}` : `${API_URL}/orders/add`;
            const method = isEditing ? 'PUT' : 'POST';

            // Disable button to prevent double submit
            const btn = document.getElementById('submitOrderBtn');
            if(btn) { btn.disabled = true; btn.innerHTML = '<i class="fa-solid fa-spinner fa-spin me-2"></i> Sending...'; }

            try {
                const res = await apiFetch(url, {
                    method: method,
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify(payload)
                });

                if(res.ok) {
                    // Order placed / updated successfully
                    orderModal.hide();
                    await loadInitialData();
                    if (!isEditing) {
                        showToast('🎉 Order placed successfully!', 'success');
                        switchTab('orders');
                    } else {
                        showToast('✅ Order updated successfully!', 'success');
                    }
                } else {
                    // Server returned error status
                    let errMsg = "Failed to send order. Please try again.";
                    try {
                        const errData = await res.json();
                        if(errData && errData.message) errMsg = errData.message;
                    } catch(e) {}
                    showToast(errMsg, 'error');
                }
            } catch (err) {
                console.error("Error submitting order", err);
                showToast("Connection error. Please check if server is running.", 'error');
            } finally {
                // Re-enable button
                if(btn) {
                    btn.disabled = false;
                    btn.innerHTML = isEditing
                        ? '<i class="fa-solid fa-arrows-rotate me-2"></i> Update Order'
                        : '<i class="fa-solid fa-fire-burner me-2"></i> Place Order';
                }
            }
        }

        
        async function updateOrderStatus(orderId, newStatus) {
            try {
                const res = await apiFetch(`${API_URL}/orders/updateStatus/${orderId}?status=${newStatus}`, { method: 'PUT' });
                const result = await res.json();
                if(result.success) {
                    await loadInitialData();
                } else {
                    alert("Failed to update status.");
                }
            } catch (err) {
                console.error(err);
            }
        }
        
        async function cancelOrder(orderId) {
            if(confirm("Are you sure you want to CANCEL this order? This action cannot be undone.")) {
                try {
                    const res = await apiFetch(`${API_URL}/orders/delete/${orderId}`, { method: 'DELETE' });
                    if(res.ok) {
                        await loadInitialData();
                    } else {
                        alert("Failed to cancel order.");
                    }
                } catch(err) { console.error(err); }
            }
        }

        function logout() {
            localStorage.clear();
            window.location.href = "HomePage.jsp";
        }
	</script>
<script src="JS/theme.js?v=4.0"></script>
</body>
</html>



