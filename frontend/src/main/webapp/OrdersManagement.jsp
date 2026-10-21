<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Orders Management - Admin Dashboard</title>
<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- FontAwesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
<!-- Custom CSS -->
<link rel="stylesheet" href="CSS/dashboard.css">
<link rel="stylesheet" href="CSS/royal_dashboard.css?v=2.3">

<style>
    body {
        font-family: 'Inter', sans-serif;
        background-color: #1a1a2e;
        color: #e2e8f0;
    }
    
    /* Page Title */
    .page-title {
        font-weight: 600;
        color: #fff;
        margin-bottom: 0;
        font-size: 1.5rem;
    }

    /* Search Bar */
    .search-box {
        border-radius: 5px;
        overflow: hidden;
        border: 1px solid #d1d3e2;
        background: #fff;
    }
    .search-box input {
        border: none;
        padding: 0.6rem 1rem;
        font-size: 0.95rem;
        color: #6e707e;
    }
    .search-box input:focus {
        box-shadow: none;
        outline: none;
    }
    .search-box .input-group-text {
        border: none;
        background: transparent;
        color: #b7b9cc;
        padding-left: 1rem;
    }

    /* Card & Table */
    .orders-card {
        background: #ffffff;
        border-radius: 8px;
        box-shadow: 0 0.15rem 1.75rem 0 rgba(58, 59, 69, 0.15);
        border: 1px solid #e3e6f0;
        padding: 1.5rem;
    }
    

    /* Action Buttons */
    .btn-view, .btn-delete {
        background: transparent;
        border: none;
        padding: 0.375rem 0.75rem;
        font-size: 0.9rem;
        border-radius: 4px;
        font-weight: 500;
    }
    .btn-view {
        color: #4e73df;
    }
    .btn-view:hover {
        background-color: #eaecf4;
        color: #2e59d9;
    }
    .btn-delete {
        color: #e74a3b;
    }
    .btn-delete:hover {
        background-color: #fceceb;
        color: #be2617;
    }
    
    /* Status Badges */
    .status-badge {
        padding: 0.35em 0.65em;
        font-size: 0.75em;
        font-weight: 700;
        border-radius: 0.25rem;
    }
    .status-pending { background-color: #fff3cd; color: #856404; }
    .status-preparing { background-color: #cce5ff; color: #004085; }
    .status-served { background-color: #d1e7dd; color: #0f5132; }
    .status-completed { background-color: #6c757d; color: #fff; }
    .status-paid { background-color: #d4edda; color: #155724; }

    /* Order Details Items List */
    .order-items-list {
        list-style: none;
        padding-left: 0;
    }
    .order-items-list li {
        padding: 8px 0;
        border-bottom: 1px solid #eee;
        display: flex;
        justify-content: space-between;
    }
    .order-items-list li:last-child {
        border-bottom: none;
    }
    /* Dark Mode Overrides */
    .menu-card, .staff-card, .order-card {
        background: #1e1e1e !important;
        border: 1px solid rgba(255,255,255,0.05) !important;
        color: #fff !important;
    }
    .menu-card { /* dummy */
        background: #1e1e1e !important;
        border: 1px solid rgba(255,255,255,0.05) !important;
        color: #fff !important;
    }
    .page-title { color: #fff !important; }
    .modal-content { background-color: #1e1e1e !important; color: #fff !important; }
    .modal-header { background-color: rgba(255,255,255,0.05) !important; border-bottom: 1px solid rgba(255,255,255,0.1) !important; color: #fff !important; }
    .modal-title { color: #fff !important; }
    .form-control, .form-select { background-color: #2d3748 !important; border: 1px solid #4a5568 !important; color: #fff !important; }
    .form-label { color: #cbd5e0 !important; }

    .modal-content.premium-dark-modal {
        background-color: #1e1e1e !important;
        color: #ffffff !important;
        border: 1px solid rgba(255,255,255,0.1);
    }
    .modal-content.premium-dark-modal * {
        color: #ffffff !important;
    }
    .modal-content.premium-dark-modal .text-primary { color: #4e73df !important; }
    .modal-content.premium-dark-modal .text-success { color: #1cc88a !important; }
    .modal-content.premium-dark-modal .text-muted { color: #a0aec0 !important; }
</style>
<link rel="stylesheet" href="CSS/royal_dashboard.css?v=2.5">
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
				<li><a href="AdminDashboard.jsp"> <i class="fa-solid fa-house"></i> Dashboard</a></li>
				<li><a href="StaffManagement.jsp"> <i class="fa-solid fa-users"></i> Staff</a></li>
				<li><a href="MenuManagement.jsp"> <i class="fa-solid fa-book-open"></i> Menu</a></li>
				<li class="active"><a href="OrdersManagement.jsp"> <i class="fa-solid fa-cart-shopping"></i> Orders</a></li>
				<li><a href="TablesManagement.jsp"> <i class="fa-solid fa-chair"></i> Tables</a></li>
				<li><a href="SalesManagement.jsp"> <i class="fa-solid fa-chart-line"></i> Sales</a></li>
				<li><a href="HomePage.jsp"> <i class="fa-solid fa-right-from-bracket"></i> Logout</a></li>
			</ul>
		</div>

		<!-- Main -->
		<div class="main">
			<!-- Navbar -->
			<nav class="navbar navbar-expand-lg py-3" style="background-color: #16213e; border-bottom: 1px solid #2d3748;">
				<div class="container-fluid px-4">
					<h3 class="page-title">Orders Management</h3>
					<div class="admin-info d-flex align-items-center gap-3">
                        <i class="fa-solid fa-circle-user fs-4 text-white"></i>
						<span class="fw-medium" style="color: #a0aec0;">Welcome, <span id="adminNameDisplay" class="text-white">User</span></span>
					</div>
				</div>
			</nav>

			<!-- Content Container -->
			<div class="royal-container px-4 py-4">
                
                <!-- Search and Toolbar Section -->
                <div class="row mb-4 align-items-center">
                    <div class="col-md-5">
                        <div class="input-group search-box">
                            <span class="input-group-text"><i class="fa-solid fa-search"></i></span>
                            <input type="text" id="searchInput" class="form-control" placeholder="Search by Table or Status..." onkeyup="filterTable()">
                        </div>
                    </div>
                </div>

                <!-- Orders Table -->
				<div class="row">
					<div class="col-12">
						<div class="premium-dark-card">
                            <div class="table-responsive">
                                <table class="table custom-table" id="ordersTable">
                                    <thead>
                                        <tr>
                                            <th style="width: 10%">Order ID</th>
                                            <th style="width: 10%">Table No</th>
                                            <th style="width: 20%">Staff (Waiter)</th>
                                            <th style="width: 15%">Total (Rs. )</th>
                                            <th style="width: 15%">Status</th>
                                            <th style="width: 15%">View Details</th>
                                            <th style="width: 15%">Cancel Order</th>
                                        </tr>
                                    </thead>
                                    <tbody id="ordersTableBody">
                                        <!-- Data will be populated here by JS -->
                                    </tbody>
                                </table>
                            </div>
                            
                            <!-- Pagination Controls -->
                            <div class="pagination-container">
                                <button class="btn-pagination" id="prevBtn" onclick="prevPage()">Previous</button>
                                <span id="pageInfo" class="text-white small">Page 1 of 1</span>
                                <button class="btn-pagination next-btn" id="nextBtn" onclick="nextPage()">Next</button>
                            </div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

    <!-- View Details Modal -->
    <div class="modal fade" id="orderDetailsModal" tabindex="-1" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content shadow premium-dark-modal">
          <div class="modal-header border-bottom-0 pt-4 pb-0 px-4">
            <h5 class="modal-title fw-bold text-white" style="color: #f47c36 !important;">Order Details (ID: <span id="modalOrderId"></span>)</h5>
            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body p-4 text-white">
             <div class="d-flex justify-content-between mb-3 border-bottom pb-2">
                 <strong>Table: <span id="modalTableNo" class="text-primary"></span></strong>
                 <strong>Staff: <span id="modalStaffName"></span></strong>
             </div>
             
             <h6 class="fw-bold mb-3 text-white">Items Ordered:</h6>
             <ul class="order-items-list" id="modalItemsList">
                 <!-- Items populated dynamically -->
             </ul>
             
             <div class="d-flex justify-content-between mt-4 pt-3 border-top">
                 <span class="fs-5 fw-bold text-white">Total Amount:</span>
                 <span class="fs-5 fw-bold text-success">Rs.  <span id="modalTotalAmount"></span></span>
             </div>
          </div>
        </div>
      </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="JS/api.js"></script>
	<script>
        // UX Role Check (Real security and authorization are enforced by the backend via verified JWT)
        const currentRole = localStorage.getItem('userRole');
        if (currentRole !== 'ADMIN') {
            alert("तुम्हाला हे पेज पाहण्याचा अधिकार नाही! (Access Denied)");
            window.location.href = "HomePage.jsp";
        }

        const adminName = localStorage.getItem('adminName');
        if(adminName) {
            document.getElementById('adminNameDisplay').innerText = adminName;
        }

        // --- Orders Logic ---
        const API_URL = `${API_BASE}/orders`;
        let allOrders = [];
        let filteredOrders = [];
        
        // Pagination
        let currentPage = 1;
        const itemsPerPage = 5;

        // Load all orders
        function loadOrders() {
            apiFetch(API_URL + '/all')
                .then(response => response.json())
                .then(data => {
                    allOrders = data;
                    filteredOrders = [];
                    renderTable(allOrders);
                })
                .catch(err => console.error("Error loading orders:", err));
        }

        // Render Table (with pagination)
        function renderTable(data) {
            const tbody = document.getElementById('ordersTableBody');
            tbody.innerHTML = '';
            
            if(data.length === 0) {
                tbody.innerHTML = `<tr><td colspan="7" class="text-center py-4 text-muted">No live orders found.</td></tr>`;
                document.getElementById('pageInfo').innerText = `Page 1 of 1`;
                document.getElementById('prevBtn').disabled = true;
                document.getElementById('nextBtn').disabled = true;
                return;
            }

            const totalPages = Math.ceil(data.length / itemsPerPage) || 1;
            if(currentPage > totalPages) currentPage = totalPages;

            const start = (currentPage - 1) * itemsPerPage;
            const end = start + itemsPerPage;
            const paginatedData = data.slice(start, end);

            paginatedData.forEach(order => {
                const status = (order.overallStatus || 'PENDING').toUpperCase();
                let badgeClass = 'status-pending';
                if(status === 'PREPARING') badgeClass = 'status-preparing';
                else if(status === 'SERVED') badgeClass = 'status-served';
                else if(status === 'COMPLETED') badgeClass = 'status-completed';
                else if(status === 'PAID') badgeClass = 'status-paid';

                // Disable Cancel button for COMPLETED or SERVED orders
                const isFinished = (status === 'COMPLETED' || status === 'SERVED');
                const cancelBtn = isFinished
                    ? `<button class="btn-delete" disabled title="Cannot cancel a completed order" style="opacity:0.4;cursor:not-allowed;">
                            <i class="fa-solid fa-ban"></i> Cancel
                       </button>`
                    : `<button class="btn-delete" title="Cancel Order" onclick="deleteOrder(${order.orderId})">
                            <i class="fa-solid fa-ban"></i> Cancel
                       </button>`;

                const tr = document.createElement('tr');
                tr.innerHTML = `
                    <td class="text-secondary fw-bold">#${order.orderId}</td>
                    <td class="fw-medium">Table ${order.tableId}</td>
                    <td>${order.staffName || 'N/A'}</td>
                    <td class="fw-bold text-success">Rs. ${parseFloat(order.totalAmount || 0).toFixed(2)}</td>
                    <td><span class="status-badge ${badgeClass}">${order.overallStatus || 'Pending'}</span></td>
                    <td>
                        <button class="btn-edit" title="View Order Bill" onclick="viewDetails(${order.orderId})">
                            <i class="fa-solid fa-file-invoice"></i> View Bill
                        </button>
                    </td>
                    <td>${cancelBtn}</td>
                `;
                tbody.appendChild(tr);
            });
            
            // Update Pagination Controls
            document.getElementById('pageInfo').innerText = `Page ${currentPage} of ${totalPages}`;
            document.getElementById('prevBtn').disabled = currentPage === 1;
            document.getElementById('nextBtn').disabled = currentPage === totalPages;
        }

        function prevPage() {
            if(currentPage > 1) {
                currentPage--;
                renderTable(filteredOrders.length > 0 ? filteredOrders : allOrders);
            }
        }

        function nextPage() {
            const data = filteredOrders.length > 0 ? filteredOrders : allOrders;
            const totalPages = Math.ceil(data.length / itemsPerPage);
            if(currentPage < totalPages) {
                currentPage++;
                renderTable(data);
            }
        }

        // Filter Table (Search)
        function filterTable() {
            const term = document.getElementById('searchInput').value.toLowerCase();
            filteredOrders = allOrders.filter(o => 
                (o.overallStatus && o.overallStatus.toLowerCase().includes(term)) ||
                (o.tableId && o.tableId.toString().includes(term)) ||
                (o.staffName && o.staffName.toLowerCase().includes(term))
            );
            currentPage = 1;
            renderTable(filteredOrders);
        }

        // View Order Details
        function viewDetails(orderId) {
            const order = allOrders.find(o => o.orderId === orderId);
            if(!order) return;

            document.getElementById('modalOrderId').innerText = order.orderId;
            document.getElementById('modalTableNo').innerText = order.tableId;
            document.getElementById('modalStaffName').innerText = order.staffName;
            document.getElementById('modalTotalAmount').innerText = parseFloat(order.totalAmount).toFixed(2);

            const itemsList = document.getElementById('modalItemsList');
            itemsList.innerHTML = '';
            
            if(order.items && order.items.length > 0) {
                order.items.forEach(item => {
                    const li = document.createElement('li');
                    li.innerHTML = `
                        <span>${item.foodName} <small style="color: #a0aec0;">x${item.quantity}</small></span>
                        <span>Rs.  ${(item.price * item.quantity).toFixed(2)}</span>
                    `;
                    itemsList.appendChild(li);
                });
            } else {
                itemsList.innerHTML = '<li class="text-muted">No items found for this order.</li>';
            }

            const modal = new bootstrap.Modal(document.getElementById('orderDetailsModal'));
            modal.show();
        }

        // Delete (Cancel) Order
        function deleteOrder(id) {
            if(confirm("Are you sure you want to CANCEL this order? This action cannot be undone.")) {
                apiFetch(`${API_URL}/delete/${id}`, {
                    method: 'DELETE'
                })
                .then(response => {
                    if(response.ok) {
                        loadOrders(); // Reload table
                    } else {
                        alert("Error cancelling order.");
                    }
                })
                .catch(err => console.error("Error deleting order:", err));
            }
        }

        // Initialize
        document.addEventListener('DOMContentLoaded', loadOrders);
	
        function logout() {
            localStorage.clear();
            window.location.href = "HomePage.jsp";
        }
</script>
</body>
</html>















