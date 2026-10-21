<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Staff Management - Admin Dashboard</title>
<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- FontAwesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
<!-- Custom CSS -->
<link rel="stylesheet" href="CSS/dashboard.css">
<link rel="stylesheet" href="CSS/royal_dashboard.css?v=14.0">

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

    /* Add Button */
    .btn-add-staff {
        font-weight: 500;
        background-color: #4e73df;
        border-color: #4e73df;
        box-shadow: 0 2px 4px rgba(78, 115, 223, 0.2);
    }
    .btn-add-staff:hover {
        background-color: #2e59d9;
        border-color: #2653d4;
    }

    /* Card & Table */
    .staff-card {
        background: #ffffff;
        border-radius: 8px;
        box-shadow: 0 0.15rem 1.75rem 0 rgba(58, 59, 69, 0.15);
        border: 1px solid #e3e6f0;
        padding: 1.5rem;
    }
    .table {
        margin-bottom: 0;
        color: #5a5c69;
    }
    .table th {
        border-bottom: 2px solid #e3e6f0;
        color: #858796;
        font-weight: 700;
        text-transform: uppercase;
        font-size: 0.75rem;
        letter-spacing: 0.1em;
        padding: 0.75rem 1rem;
    }
    .table td {
        vertical-align: middle;
        padding: 0.75rem 1rem;
        border-bottom: 1px solid #e3e6f0;
        font-size: 0.95rem;
        color: #5a5c69;
    }
    .table tbody tr:hover {
        background-color: #f8f9fc;
    }

    /* Action Buttons */
    
    
    
    
    
    /* Dark Mode Overrides */
    .menu-card, .staff-card, .order-card {
        background: #1e1e1e !important;
        border: 1px solid rgba(255,255,255,0.05) !important;
        color: #fff !important;
    }
    .menu-card, .staff-card, .order-card { /* dummy */
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
</style>
<link rel="stylesheet" href="CSS/royal_dashboard.css?v=14.0">
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
				<li><a href="AdminDashboard.jsp"> <i class="fa-solid fa-house"></i> <span>Dashboard</span><span class="tooltip-text">Dashboard</span></a></li>
				<li class="active"><a href="StaffManagement.jsp"> <i class="fa-solid fa-users"></i> <span>Staff</span><span class="tooltip-text">Staff</span></a></li>
				<li><a href="MenuManagement.jsp"> <i class="fa-solid fa-book-open"></i> <span>Menu</span><span class="tooltip-text">Menu</span></a></li>
				<li><a href="OrdersManagement.jsp"> <i class="fa-solid fa-cart-shopping"></i> <span>Orders</span><span class="tooltip-text">Orders</span></a></li>
				<li><a href="TablesManagement.jsp"> <i class="fa-solid fa-chair"></i> <span>Tables</span><span class="tooltip-text">Tables</span></a></li>
				<li><a href="SalesManagement.jsp"> <i class="fa-solid fa-chart-line"></i> <span>Sales</span><span class="tooltip-text">Sales</span></a></li>
				<li><a href="HomePage.jsp"> <i class="fa-solid fa-right-from-bracket"></i> <span>Logout</span><span class="tooltip-text">Logout</span></a></li>
			</ul>
		</div>

		<!-- Main -->
		<div class="main">
						<!-- Navbar (SaaS Premium) -->
			<nav class="navbar">
				<div class="nav-left">
					<button class="hamburger" onclick="toggleSidebar()"><i class="fa-solid fa-bars"></i></button>
					<div>
						<h3 id="navbarTitleDisplay" style="margin-bottom: 2px;">Staff Management</h3>
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
			

			<!-- Content Container -->
			<div class="royal-container px-4 py-4">
                
                <!-- Search and Add Section -->
                <div class="row mb-4 align-items-center">
                    <div class="col-md-5">
                        <div class="input-group search-box">
                            <span class="input-group-text"><i class="fa-solid fa-search"></i></span>
                            <input type="text" id="searchInput" class="form-control" placeholder="Search staff..." onkeyup="filterTable()">
                        </div>
                    </div>
                    <div class="col-md-7 text-end">
                        <button class="btn btn-primary btn-add-staff" data-bs-toggle="modal" data-bs-target="#staffModal" onclick="openAddModal()">
                            <i class="fa-solid fa-plus me-1"></i> Add New Staff
                        </button>
                    </div>
                </div>

                <!-- Staff Table -->
				<div class="row">
					<div class="col-12">
						<div class="premium-dark-card">
                            <div class="table-responsive">
                                <table class="table custom-table" id="staffTable">
                                    <thead>
                                        <tr>
                                            <th style="width: 10%">Sr. No.</th>
                                            <th style="width: 30%">Name</th>
                                            <th style="width: 30%">Email Address</th>
                                            <th style="width: 15%">Role</th>
                                            <th style="width: 10%">Update</th>
                                            <th style="width: 10%">Delete</th>
                                        </tr>
                                    </thead>
                                    <tbody id="staffTableBody">
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

    <!-- Staff Modal (Add / Edit) -->
    <div class="modal fade" id="staffModal" tabindex="-1" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content shadow">
          <div class="modal-header border-bottom-0 pt-4 pb-0 px-4">
            <h5 class="modal-title fw-bold text-dark" id="staffModalLabel">Add Staff</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body p-4">
            <form id="staffForm">
              <input type="hidden" id="staffId">
              <div class="mb-3">
                <label class="form-label fw-semibold text-secondary small">FULL NAME</label>
                <input type="text" class="form-control" id="staffName" required>
              </div>
              <div class="mb-3">
                <label class="form-label fw-semibold text-secondary small">EMAIL ADDRESS</label>
                <input type="email" class="form-control" id="staffEmail" required>
              </div>
              <div class="mb-3" id="passwordFieldContainer">`n                <label class="form-label fw-semibold text-secondary small">PASSWORD</label>
                <input type="password" class="form-control" id="staffPassword">
              </div>
              <div class="mb-4">
                <label class="form-label fw-semibold text-secondary small">SYSTEM ROLE</label>
                <select class="form-select" id="staffRole" required>
                    <option value="" selected disabled>Select a role...</option>
                    <option value="ADMIN">ADMIN</option>
                    <option value="RECEPTIONIST">RECEPTIONIST</option>
                    <option value="WAITER">WAITER</option>
                    <option value="CHEF">CHEF</option>
                </select>
              </div>
              <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                <button type="button" class="btn btn-light" data-bs-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-primary px-4" onclick="saveStaff()">Save</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="JS/theme.js?v=4.0"></script>
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

        // --- CRUD Logic ---
        const API_URL = `${API_BASE}/staff`;
        let staffList = [];
        let filteredStaffList = [];
        let isUpdateMode = false;
        
        // Pagination
        let currentPage = 1;
        const itemsPerPage = 5;

        // Load all staff
        function loadStaff() {
            apiFetch(API_URL + '/all')
                .then(response => response.json())
                .then(data => {
                    staffList = data;
                    filteredStaffList = data;
                    currentPage = 1;
                    renderTable();
                })
                .catch(err => console.error("Error loading staff:", err));
        }

        // Render Table (with pagination)
        function renderTable() {
            const tbody = document.getElementById('staffTableBody');
            tbody.innerHTML = '';
            
            if(filteredStaffList.length === 0) {
                tbody.innerHTML = `<tr><td colspan="6" class="text-center py-4 text-muted">No staff members found.</td></tr>`;
                document.getElementById('pageInfo').innerText = `Page 1 of 1`;
                document.getElementById('prevBtn').disabled = true;
                document.getElementById('nextBtn').disabled = true;
                return;
            }

            const totalPages = Math.ceil(filteredStaffList.length / itemsPerPage) || 1;
            if(currentPage > totalPages) currentPage = totalPages;
            
            const start = (currentPage - 1) * itemsPerPage;
            const end = start + itemsPerPage;
            const paginatedData = filteredStaffList.slice(start, end);

            let srNo = start + 1;
            paginatedData.forEach(staff => {
                const tr = document.createElement('tr');
                tr.innerHTML = `
                    <td class="text-secondary">${srNo++}</td>
                    <td class="fw-medium text-dark">${staff.name}</td>
                    <td>${staff.email}</td>
                    <td class="fw-medium">${staff.role}</td>
                    <td>
                        <button class="btn-edit" title="Edit Staff" onclick="openEditModal(${staff.staffId})">
                            <i class="fa-solid fa-pen"></i> Update
                        </button>
                    </td>
                    <td>
                        <button class="btn-delete" title="Delete Staff" onclick="deleteStaff(${staff.staffId})">
                            <i class="fa-solid fa-trash"></i> Delete
                        </button>
                    </td>
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
                renderTable();
            }
        }

        function nextPage() {
            const totalPages = Math.ceil(filteredStaffList.length / itemsPerPage);
            if(currentPage < totalPages) {
                currentPage++;
                renderTable();
            }
        }

        // Filter Table (Search)
        function filterTable() {
            const query = document.getElementById('searchInput').value.toLowerCase();
            filteredStaffList = staffList.filter(staff => 
                staff.name.toLowerCase().includes(query) ||
                staff.email.toLowerCase().includes(query) ||
                staff.role.toLowerCase().includes(query)
            );
            currentPage = 1;
            renderTable();
        }

        // Open Modal for Add
        function openAddModal() {
            isUpdateMode = false;
            document.getElementById('staffModalLabel').innerText = "Add New Staff";
            document.getElementById('staffForm').reset();
            document.getElementById('staffId').value = '';
            document.getElementById('staffPassword').required = true;
            document.getElementById('passwordFieldContainer').style.display = 'block';
        }

        // Open Modal for Edit
        function openEditModal(id) {
            isUpdateMode = true;
            document.getElementById('staffModalLabel').innerText = "Update Staff details";
            const staff = staffList.find(s => s.staffId === id);
            
            document.getElementById('staffId').value = staff.staffId;
            document.getElementById('staffName').value = staff.name;
            document.getElementById('staffEmail').value = staff.email;
            document.getElementById('staffRole').value = staff.role;
            document.getElementById('staffPassword').value = ''; 
            document.getElementById('staffPassword').required = false;
            document.getElementById('passwordFieldContainer').style.display = 'none';

            const modal = bootstrap.Modal.getOrCreateInstance(document.getElementById('staffModal'));
            modal.show();
        }

        // Save Staff (Add or Update)
        function saveStaff() {
            const id = document.getElementById('staffId').value;
            const name = document.getElementById('staffName').value;
            const email = document.getElementById('staffEmail').value;
            const password = document.getElementById('staffPassword').value;
            const role = document.getElementById('staffRole').value;

            if(!name || !email || !role) {
                showToast("Please fill all required fields!", 'error');
                return;
            }
            if(!isUpdateMode && !password) {
                showToast("Password is required for new staff!", 'error');
                return;
            }

            const staffData = { name, email, password, role };
            const url = isUpdateMode ? `${API_URL}/update/${id}` : `${API_URL}/add`;
            const method = isUpdateMode ? 'PUT' : 'POST';

            apiFetch(url, {
                method: method,
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(staffData)
            })
            .then(response => {
                if(response.ok) {
                    const modal = bootstrap.Modal.getOrCreateInstance(document.getElementById('staffModal'));
                    modal.hide();
                    showToast("Staff details saved successfully!", 'success');
                    loadStaff(); // Reload table
                } else {
                    showToast("Error saving staff details.", 'error');
                }
            })
            .catch(err => console.error("Error saving staff:", err));
        }

        // Delete Staff
        function deleteStaff(id) {
            showCustomConfirm("Are you sure you want to delete this staff member? This action cannot be undone.", () => {
                apiFetch(`${API_URL}/delete/${id}`, {
                    method: 'DELETE'
                })
                .then(response => {
                    if(response.ok) {
                        showToast("Staff member deleted successfully!", 'success');
                        loadStaff(); // Reload table
                    } else {
                        showToast("Error deleting staff.", 'error');
                    }
                })
                .catch(err => console.error("Error deleting staff:", err));
            });
        }

        // Initialize
        document.addEventListener('DOMContentLoaded', loadStaff);
	
        function logout() {
            localStorage.clear();
            window.location.href = "HomePage.jsp";
        }
</script>
</body>
</html>

















