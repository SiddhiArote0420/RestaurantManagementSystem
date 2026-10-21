<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Receptionist Dashboard - Royal Spoon</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
<link rel="stylesheet" href="CSS/dashboard.css?v=2.1">
<link rel="stylesheet" href="CSS/royal_dashboard.css?v=14.0">
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
    
    .btn-orange {
        background-color: #ff8c00;
        color: white;
        border: none;
    }
    .btn-orange:hover {
        background-color: #e07b00;
        color: white;
    }
    
    
    .custom-table thead th {
        background: rgba(255, 140, 0, 0.1);
        color: #ff8c00;
        border-bottom: 1px solid rgba(255,140,0,0.3);
    }
    .custom-table tbody td {
        border-bottom: 1px solid rgba(255,255,255,0.05);
        vertical-align: middle;
    }
</style>
  <link rel="stylesheet" href="CSS/light_theme.css?v=26.0">
<!-- Responsive UI: layout/spacing only, no functionality changes -->
<link rel="stylesheet" href="CSS/responsive.css?v=1.0">
</head>
<body class="dark-theme">

    <div class="wrapper">
        <!-- Sidebar -->
        <div class="sidebar">
            <div class="logo">
                <i class="fa-solid fa-utensils"></i>
                <h4>Receptionist</h4>
            </div>
            <ul>
                <li class="active"><a href="#dashboard" onclick="switchTab('dashboard')"> <i class="fa-solid fa-house"></i> <span>Dashboard</span><span class="tooltip-text">Dashboard</span></a></li>
                <li><a href="#tables" onclick="switchTab('tables')"> <i class="fa-solid fa-chair"></i> <span>Table Management</span><span class="tooltip-text">Table Management</span></a></li>
                <li><a href="#bills" onclick="switchTab('bills')"> <i class="fa-solid fa-file-invoice-dollar"></i> <span>Bills</span><span class="tooltip-text">Bills</span></a></li>

                <li><a href="#history" onclick="switchTab('history')"> <i class="fa-solid fa-clock-rotate-left"></i> <span>Order History</span><span class="tooltip-text">Order History</span></a></li>
                <li><a href="#" onclick="logout()"> <i class="fa-solid fa-right-from-bracket"></i> <span>Logout</span><span class="tooltip-text">Logout</span></a></li>
            </ul>
        </div>

        <!-- Main Content Area -->
        <div class="main">
						<!-- Navbar (SaaS Premium) -->
			<nav class="navbar">
				<div class="nav-left">
					<button class="hamburger" onclick="toggleSidebar()"><i class="fa-solid fa-bars"></i></button>
					<div>
						<h3 id="navbarTitleDisplay" style="margin-bottom: 2px;">Welcome Back</h3>
						<span class="nav-subtitle text-muted" style="font-size: 0.85rem;">Manage your restaurant with confidence, <span class="greeting-name" style="color: #FF8A2A; font-weight: 500;">User</span></span>
					</div>
				</div>
				<div class="nav-right">
					<button class="nav-icon-btn" onclick="toggleTheme()" title="Switch Theme">
						<i class="fa-solid fa-sun"></i>
					</button>
					<div class="user-profile">
						<div class="avatar"><i class="fa-solid fa-user"></i></div>
						<div class="user-info">
							<span class="user-name" id="adminNameDisplay" style="font-size: 1rem; font-weight: 500;">User</span>
						</div>
					</div>
				</div>
			</nav>
            			

            <div class="royal-container">
            
            <!-- Dashboard Tab -->
            <div id="tab-dashboard">
                <div class="dashboard-banner d-flex align-items-center justify-content-between">
                    <div>
                        <h2 class="fw-bold mb-2">Welcome back, <span id="bannerRecName">Receptionist</span>!</h2>
                        <p class="mb-0 fs-5">Manage tables, process payments, and oversee daily operations.</p>
                    </div>
                </div>

                <div class="row g-4 mb-4">
                    <div class="col-md-3">
                        <div class="stat-card d-flex align-items-center">
                            <div class="stat-icon me-3"><i class="fa-solid fa-chair"></i></div>
                            <div>
                                <h3 class="mb-0 fw-bold" id="statAvailableTables">0</h3>
                                <p class="text-muted mb-0 small">Available Tables</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="stat-card d-flex align-items-center">
                            <div class="stat-icon me-3" style="color: #f47c36; background: rgba(244,124,54,0.1);"><i class="fa-solid fa-users"></i></div>
                            <div>
                                <h3 class="mb-0 fw-bold" id="statOccupiedTables">0</h3>
                                <p class="text-muted mb-0 small">Occupied Tables</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="stat-card d-flex align-items-center">
                            <div class="stat-icon me-3" style="color: #1cc88a; background: rgba(28,200,138,0.1);"><i class="fa-solid fa-file-invoice"></i></div>
                            <div>
                                <h3 class="mb-0 fw-bold" id="statPendingBills">0</h3>
                                <p class="text-muted mb-0 small">Pending Bills</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="stat-card d-flex align-items-center">
                            <div class="stat-icon me-3" style="color: #36b9cc; background: rgba(54,185,204,0.1);"><i class="fa-solid fa-indian-rupee-sign"></i></div>
                            <div>
                                <h3 class="mb-0 fw-bold" id="statRevenue">Rs. 0</h3>
                                <p class="text-muted mb-0 small">Today's Revenue</p>
                            </div>
                        </div>
                    </div>
                </div>
                
                <h4 class="fw-bold mb-3" style="color: #ff8c00;">Recent Activities</h4>
                <div class="card bg-dark border-secondary">
                    <div class="card-body">
                        <ul class="list-group list-group-flush" id="recentActivitiesList">
                            <li class="list-group-item bg-transparent text-white border-secondary"><i class="fa-solid fa-circle-info text-info me-2"></i> Loading activities...</li>
                        </ul>
                    </div>
                </div>
            </div>

            <!-- Tables Tab -->
            <div id="tab-tables" style="display:none;">
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h3 class="fw-bold" style="color: #ff8c00;"><i class="fa-solid fa-chair me-2"></i> Table Management</h3>
                </div>
                <div class="row g-4" id="tablesGrid">
                    <!-- Tables dynamically loaded -->
                </div>
            </div>

            <!-- Bills Tab -->
            <div id="tab-bills" style="display:none;">
                <h3 class="fw-bold mb-4" style="color: #ff8c00;"><i class="fa-solid fa-file-invoice-dollar me-2"></i> Pending Bills (Ready for Payment)</h3>
                <div class="table-responsive">
                    <table class="table custom-table">
                        <thead>
                            <tr>
                                <th>Order ID</th>
                                <th>Table</th>
                                <th>Waiter</th>
                                <th>Total Amount</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody id="billsTableBody">
                            <!-- Populated dynamically -->
                        </tbody>
                    </table>
                </div>
                <!-- Pagination Controls -->
                <div class="d-flex justify-content-between align-items-center mt-3" id="billsPagination" style="display:none !important;">
                    <button class="btn btn-outline-secondary btn-sm text-white border-secondary" id="billsPrevBtn" onclick="changeBillsPage(-1)"><i class="fa-solid fa-chevron-left me-1"></i> Prev</button>
                    <span class="text-muted small" id="billsPageInfo">Page 1 of 1</span>
                    <button class="btn btn-outline-secondary btn-sm text-white border-secondary" id="billsNextBtn" onclick="changeBillsPage(1)">Next <i class="fa-solid fa-chevron-right ms-1"></i></button>
                </div>
            </div>



            <!-- History Tab -->
            <div id="tab-history" style="display:none;">
                <h3 class="fw-bold mb-4" style="color: #ff8c00;"><i class="fa-solid fa-clock-rotate-left me-2"></i> Order History</h3>
                <div class="table-responsive">
                    <table class="table custom-table">
                        <thead>
                            <tr>
                                <th>Order ID</th>
                                <th>Table</th>
                                <th>Total Amount</th>
                                <th>Status</th>
                                <th>Date</th>
                            </tr>
                        </thead>
                        <tbody id="historyTableBody">
                            <!-- Populated dynamically -->
                        </tbody>
                    </table>
                </div>
                <!-- Pagination Controls -->
                <div class="d-flex justify-content-between align-items-center mt-3" id="historyPagination" style="display:none !important;">
                    <button class="btn btn-outline-secondary btn-sm text-white border-secondary" id="historyPrevBtn" onclick="changeHistoryPage(-1)"><i class="fa-solid fa-chevron-left me-1"></i> Prev</button>
                    <span class="text-muted small" id="historyPageInfo">Page 1 of 1</span>
                    <button class="btn btn-outline-secondary btn-sm text-white border-secondary" id="historyNextBtn" onclick="changeHistoryPage(1)">Next <i class="fa-solid fa-chevron-right ms-1"></i></button>
                </div>
            </div>

        </div>
    </div>

    <!-- Assign Table Modal -->
    <div class="modal fade" id="assignTableModal" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content bg-dark text-white border-secondary">
                <div class="modal-header border-secondary">
                    <h5 class="modal-title" style="color: #ff8c00;"><i class="fa-solid fa-user-plus me-2"></i> Assign Table <span id="assignTableNumberDisplay"></span></h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <input type="hidden" id="assignTableId">
                    <div class="mb-3">
                        <label class="form-label text-muted">Select Waiter</label>
                        <select class="form-select bg-dark text-white border-secondary" id="waiterSelect">
                            <!-- Populated dynamically -->
                        </select>
                    </div>
                    <div class="mb-3">
                        <label class="form-label text-muted">Customer Count</label>
                        <input type="number" class="form-control bg-dark text-white border-secondary" id="customerCountInput" min="1" value="2">
                    </div>
                </div>
                <div class="modal-footer border-secondary">
                    <button type="button" class="btn btn-outline-light" data-bs-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-orange" onclick="submitTableAssignment()">Assign</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Process Payment Modal -->
    <div class="modal fade" id="paymentModal" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content bg-dark text-white border-secondary">
                <div class="modal-header border-secondary">
                    <h5 class="modal-title" style="color: #ff8c00;"><i class="fa-solid fa-money-bill-wave me-2"></i> Receive Payment</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <input type="hidden" id="paymentOrderId">
                    <input type="hidden" id="paymentTableId">
                    <div class="d-flex justify-content-between mb-3">
                        <span class="text-muted">Order ID:</span>
                        <span class="fw-bold" id="payOrderIdText"></span>
                    </div>
                    <div class="d-flex justify-content-between mb-3">
                        <span class="text-muted">Table:</span>
                        <span class="fw-bold" id="payTableIdText"></span>
                    </div>
                    <div class="d-flex justify-content-between mb-4">
                        <span class="text-muted fs-5">Total Amount:</span>
                        <span class="fw-bold text-success fs-5" id="payAmountText"></span>
                    </div>
                    <div class="mb-3">
                        <label class="form-label text-muted">Payment Mode</label>
                        <select class="form-select bg-dark text-white border-secondary" id="paymentModeSelect">
                            <option value="Cash">Cash</option>
                            <option value="UPI">UPI</option>
                            <option value="Card">Card</option>
                        </select>
                    </div>
                </div>
                <div class="modal-footer border-secondary">
                    <button type="button" class="btn btn-outline-light" data-bs-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-success" onclick="processPaymentSubmit()"><i class="fa-solid fa-check me-2"></i> Confirm Payment</button>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="JS/api.js"></script>
    <script>
        const API_URL = API_BASE;
        
        let allTables = [];
        let allOrders = [];
        let allStaff = [];
        let recentActivities = [];
        
        let billsCurrentPage = 1;
        let historyCurrentPage = 1;
        const itemsPerPage = 8;

        function changeBillsPage(dir) {
            billsCurrentPage += dir;
            renderBillsAndPayments();
        }

        function changeHistoryPage(dir) {
            historyCurrentPage += dir;
            renderHistory();
        }

        let assignModal;
        let payModal;

        // UX Role Check (Real security and authorization are enforced by the backend via verified JWT)
        const currentRole = localStorage.getItem("userRole");
        if(currentRole && currentRole.toUpperCase() !== "RECEPTIONIST" && currentRole.toUpperCase() !== "ADMIN") {
            alert("Access Denied");
            window.location.href = "HomePage.jsp";
        }
        
        const recName = localStorage.getItem("adminName") || "Receptionist";

        document.addEventListener("DOMContentLoaded", () => {
            document.getElementById('adminNameDisplay').innerText = recName;
            document.getElementById('bannerRecName').innerText = recName;
            
            assignModal = new bootstrap.Modal(document.getElementById('assignTableModal'));
            payModal = new bootstrap.Modal(document.getElementById('paymentModal'));
            
            loadInitialData();
        });

        function switchTab(tabId) {
            const tabs = ['dashboard', 'tables', 'bills', 'history'];
            tabs.forEach(t => document.getElementById('tab-' + t).style.display = 'none');
            document.getElementById('tab-' + tabId).style.display = 'block';
            
            document.querySelectorAll('.sidebar ul li').forEach(li => li.classList.remove('active'));
            event.currentTarget.parentElement.classList.add('active');
            
            const tabNames = {
                'dashboard': 'Welcome Back',
                'tables': 'Table Management',
                'bills': 'Bill Management',
                'history': 'Order History'
            };
            document.getElementById('navbarTitleDisplay').innerText = tabNames[tabId] || 'Welcome Back';
        }

        async function loadInitialData() {
            try {
                const tablesRes = await apiFetch(`${API_URL}/tables/all`);
                allTables = await tablesRes.json();
                
                const ordersRes = await apiFetch(`${API_URL}/orders/all`);
                allOrders = await ordersRes.json();
                
                const staffRes = await apiFetch(`${API_URL}/staff/all`);
                allStaff = await staffRes.json();
                
                updateDashboardStats();
                renderTablesGrid();
                renderBillsAndPayments();
                renderHistory();
            } catch (err) {
                console.error("Error loading data", err);
            }
        }

        function updateDashboardStats() {
            const availableCount = allTables.filter(t => t.status === 'Available').length;
            const occupiedCount = allTables.filter(t => t.status === 'Occupied').length;
            
            // SERVED orders are pending bills waiting for payment
            const pendingOrders = allOrders.filter(o => o.overallStatus && o.overallStatus.toUpperCase() === 'SERVED');
            const completedOrders = allOrders.filter(o => o.overallStatus && o.overallStatus.toUpperCase() === 'COMPLETED');
            
            let todayRevenue = 0;
            completedOrders.forEach(o => { todayRevenue += o.totalAmount || 0; });

            document.getElementById('statAvailableTables').innerText = availableCount;
            document.getElementById('statOccupiedTables').innerText = occupiedCount;
            document.getElementById('statPendingBills').innerText = pendingOrders.length;
            document.getElementById('statRevenue').innerText = 'Rs. ' + todayRevenue.toFixed(2);
            
            renderRecentActivities();
        }

        function renderRecentActivities() {
            const list = document.getElementById('recentActivitiesList');
            list.innerHTML = '';
            if (recentActivities.length === 0) {
                list.innerHTML = `<li class="list-group-item bg-transparent text-white border-secondary">No recent activities.</li>`;
                return;
            }
            recentActivities.forEach(act => {
                list.innerHTML += `<li class="list-group-item bg-transparent text-white border-secondary"><i class="fa-solid fa-bell text-warning me-2"></i> ${act}</li>`;
            });
        }
        
        function addActivity(text) {
            recentActivities.unshift(text);
            if(recentActivities.length > 5) recentActivities.pop();
            renderRecentActivities();
        }

        function renderTablesGrid() {
            const grid = document.getElementById('tablesGrid');
            grid.innerHTML = '';
            
            allTables.forEach(table => {
                let badgeClass = table.status === 'Available' ? 'status-available' : 'status-occupied';
                let waiterName = "Not Assigned";
                if(table.assignedStaffId && table.assignedStaffId !== 0) {
                    const w = allStaff.find(s => s.staffId === table.assignedStaffId);
                    if(w) waiterName = w.name;
                }
                
                let btnHtml = '';
                if(table.status === 'Available') {
                    btnHtml = `<button class="btn btn-orange w-100 mt-3" onclick="openAssignModal(${table.tableId}, '${table.tableNumber}')">Assign Table</button>`;
                } else {
                    btnHtml = `<button class="btn btn-outline-light w-100 mt-3" disabled>Occupied</button>`;
                }

                grid.innerHTML += `
                    <div class="col-md-3">
                        <div class="table-card">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <h4 class="fw-bold mb-0">Table ${table.tableNumber}</h4>
                                <span class="status-badge ${badgeClass}">${table.status}</span>
                            </div>
                            <div class="mb-2">
                                <small class="text-muted d-block">Capacity</small>
                                <span class="fw-bold"><i class="fa-solid fa-users me-2"></i>${table.capacity}</span>
                            </div>
                            <div class="mb-2">
                                <small class="text-muted d-block">Assigned Waiter</small>
                                <span class="fw-bold"><i class="fa-solid fa-user-tie me-2"></i>${waiterName}</span>
                            </div>
                            ${btnHtml}
                        </div>
                    </div>
                `;
            });
        }

        function openAssignModal(tableId, tableNumber) {
            document.getElementById('assignTableId').value = tableId;
            document.getElementById('assignTableNumberDisplay').innerText = tableNumber;
            
            const waiterSelect = document.getElementById('waiterSelect');
            waiterSelect.innerHTML = '<option value="">-- Select Waiter --</option>';
            
            allStaff.filter(s => s.role && s.role.toUpperCase() === 'WAITER').forEach(w => {
                waiterSelect.innerHTML += `<option value="${w.staffId}">${w.name}</option>`;
            });
            
            assignModal.show();
        }

        async function submitTableAssignment() {
            const tableId = document.getElementById('assignTableId').value;
            const staffId = document.getElementById('waiterSelect').value;
            const custCount = document.getElementById('customerCountInput').value;
            
            if(!staffId) { alert("Please select a waiter."); return; }
            
            try {
                // Update table status and staff
                const res = await apiFetch(`${API_URL}/tables/updateStatus/${tableId}?status=Occupied&staffId=${staffId}`, { method: 'PUT' });
                if(res.ok) {
                    addActivity(`Table ${document.getElementById('assignTableNumberDisplay').innerText} assigned to Waiter.`);
                    assignModal.hide();
                    await loadInitialData();
                } else {
                    alert("Failed to assign table.");
                }
            } catch(err) { console.error(err); }
        }

        function renderBillsAndPayments() {
            const billsBody = document.getElementById('billsTableBody');
            billsBody.innerHTML = '';
            
            const pendingOrders = allOrders.filter(o => o.overallStatus && o.overallStatus.toUpperCase() === 'SERVED');
            
            if(pendingOrders.length === 0) {
                billsBody.innerHTML = `<tr><td colspan="6" class="text-center text-muted py-4">No pending bills.</td></tr>`;
                document.getElementById('billsPagination').style.display = 'none';
                return;
            }
            
            const totalPages = Math.ceil(pendingOrders.length / itemsPerPage);
            if(billsCurrentPage < 1) billsCurrentPage = 1;
            if(billsCurrentPage > totalPages) billsCurrentPage = totalPages;
            
            const startIndex = (billsCurrentPage - 1) * itemsPerPage;
            const paginatedOrders = pendingOrders.slice(startIndex, startIndex + itemsPerPage);
            
            paginatedOrders.forEach(order => {
                const tableObj = allTables.find(t => t.tableId === order.tableId);
                const tableNumDisplay = tableObj ? tableObj.tableNumber : order.tableId;
                
                let waiterName = "Unknown";
                if(tableObj && tableObj.assignedStaffId && tableObj.assignedStaffId !== 0) {
                    const w = allStaff.find(s => s.staffId === tableObj.assignedStaffId);
                    if(w) waiterName = w.name;
                }
                const total = order.totalAmount ? order.totalAmount.toFixed(2) : '0.00';
                
                billsBody.innerHTML += `
                    <tr>
                        <td class="fw-bold py-3">ORD-${order.orderId}</td>
                        <td class="py-3">Table ${tableNumDisplay}</td>
                        <td class="py-3">${waiterName}</td>
                        <td class="text-success fw-bold py-3">Rs. ${total}</td>
                        <td class="py-3"><span class="badge bg-warning text-dark px-3 py-2 rounded-pill">Awaiting Payment</span></td>
                        <td class="py-3">
                            <button class="btn btn-sm btn-outline-info me-2" onclick="alert('Printing Bill...')"><i class="fa-solid fa-print"></i></button>
                            <button class="btn btn-sm btn-orange" onclick="openPaymentModal(${order.orderId}, ${order.tableId}, ${total})">Receive Payment</button>
                        </td>
                    </tr>
                `;
            });

            document.getElementById('billsPagination').style.display = totalPages > 1 ? 'flex' : 'none';
            document.getElementById('billsPageInfo').innerText = `Page ${billsCurrentPage} of ${totalPages}`;
            document.getElementById('billsPrevBtn').disabled = billsCurrentPage === 1;
            document.getElementById('billsNextBtn').disabled = billsCurrentPage === totalPages;
        }
        
        function openPaymentModal(orderId, tableId, amount) {
            const tableObj = allTables.find(t => t.tableId === tableId);
            const tableNumDisplay = tableObj ? tableObj.tableNumber : tableId;
            
            document.getElementById('paymentOrderId').value = orderId;
            document.getElementById('paymentTableId').value = tableId;
            document.getElementById('payOrderIdText').innerText = "ORD-" + orderId;
            document.getElementById('payTableIdText').innerText = "Table " + tableNumDisplay;
            document.getElementById('payAmountText').innerText = "Rs. " + amount;
            payModal.show();
        }

        async function processPaymentSubmit() {
            const orderId = document.getElementById('paymentOrderId').value;
            const tableId = document.getElementById('paymentTableId').value;
            const amount = document.getElementById('payAmountText').innerText.replace('Rs. ', '');
            const mode = document.getElementById('paymentModeSelect').value;
            await executePayment(orderId, tableId, amount, mode);
            payModal.hide();
        }
        
        async function quickPay(orderId, tableId, amount) {
            const mode = document.getElementById(`directPayMode_${orderId}`).value;
            await executePayment(orderId, tableId, amount, mode);
        }

        async function executePayment(orderId, tableId, amount, mode) {
            try {
                const tableObj = allTables.find(t => t.tableId === tableId);
                const tableNumDisplay = tableObj ? tableObj.tableNumber : tableId;
            
                // 1. Add Payment Record
                const payObj = {
                    orderId: parseInt(orderId),
                    amountPaid: parseFloat(amount),
                    paymentMode: mode,
                    paymentDate: new Date().toISOString().split('T')[0]
                };
                
                const payRes = await apiFetch(`${API_URL}/payments/add`, {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify(payObj)
                });
                
                if(!payRes.ok) throw new Error("Payment Add Failed");
                
                // 2. Update Order Status to COMPLETED
                const orderRes = await apiFetch(`${API_URL}/orders/updateStatus/${orderId}?status=COMPLETED`, { method: 'PUT' });
                
                // 3. Update Table Status to Available and clear staff (0 or null based on backend)
                // Sending staffId=0 to indicate unassignment
                const tableRes = await apiFetch(`${API_URL}/tables/updateStatus/${tableId}?status=Available&staffId=0`, { method: 'PUT' });
                
                addActivity(`Payment of Rs. ${amount} received for Table ${tableNumDisplay} via ${mode}`);
                alert("Payment successful! Table is now Available.");
                await loadInitialData();
            } catch(err) {
                console.error(err);
                alert("Error processing payment.");
            }
        }

        function renderHistory() {
            const tbody = document.getElementById('historyTableBody');
            tbody.innerHTML = '';
            
            const completed = allOrders.filter(o => o.overallStatus && o.overallStatus.toUpperCase() === 'COMPLETED');
            completed.sort((a,b) => b.orderId - a.orderId);

            if(completed.length === 0) {
                tbody.innerHTML = `<tr><td colspan="5" class="text-center text-muted py-4">No completed orders.</td></tr>`;
                document.getElementById('historyPagination').style.display = 'none';
                return;
            }
            
            const totalPages = Math.ceil(completed.length / itemsPerPage);
            if(historyCurrentPage < 1) historyCurrentPage = 1;
            if(historyCurrentPage > totalPages) historyCurrentPage = totalPages;
            
            const startIndex = (historyCurrentPage - 1) * itemsPerPage;
            const paginatedOrders = completed.slice(startIndex, startIndex + itemsPerPage);
            
            paginatedOrders.forEach(o => {
                const tableObj = allTables.find(t => t.tableId === o.tableId);
                const tableNumDisplay = tableObj ? tableObj.tableNumber : o.tableId;
                const total = o.totalAmount ? o.totalAmount.toFixed(2) : '0.00';
                
                tbody.innerHTML += `
                    <tr>
                        <td class="fw-bold py-3">ORD-${o.orderId}</td>
                        <td class="py-3">Table ${tableNumDisplay}</td>
                        <td class="text-success fw-bold py-3">Rs. ${total}</td>
                        <td class="py-3"><span class="badge bg-success bg-opacity-25 text-success px-3 py-2 rounded-pill">COMPLETED</span></td>
                        <td class="py-3 text-muted">${new Date().toLocaleDateString()}</td>
                    </tr>
                `;
            });

            document.getElementById('historyPagination').style.display = totalPages > 1 ? 'flex' : 'none';
            document.getElementById('historyPageInfo').innerText = `Page ${historyCurrentPage} of ${totalPages}`;
            document.getElementById('historyPrevBtn').disabled = historyCurrentPage === 1;
            document.getElementById('historyNextBtn').disabled = historyCurrentPage === totalPages;
        }

        function logout() {
            localStorage.clear();
            window.location.href = "HomePage.jsp";
        }
    </script>
    <script src="JS/theme.js?v=4.0"></script>
</body>
</html>










