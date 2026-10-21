<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Tables Management - Royal Restaurant</title>
<!-- Bootstrap 5 CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<!-- FontAwesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
<!-- Custom CSS -->
<link rel="stylesheet" href="CSS/dashboard.css">
<link rel="stylesheet" href="CSS/royal_dashboard.css?v=14.0">

<style>
    body {
        background-color: #f4f6f9; /* Fallback */
    }
    .page-title { color: #fff !important; }
    .modal-content { background-color: #1e1e1e !important; color: #fff !important; }
    .modal-header { background-color: rgba(255,255,255,0.05) !important; border-bottom: 1px solid rgba(255,255,255,0.1) !important; color: #fff !important; }
    .modal-title { color: #fff !important; }
    .form-control, .form-select { background-color: #2d3748 !important; border: 1px solid #4a5568 !important; color: #fff !important; }
    .form-label { color: #cbd5e0 !important; }
</style>
  <link rel="stylesheet" href="CSS/light_theme.css?v=26.0">
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
				<li><a href="StaffManagement.jsp"> <i class="fa-solid fa-users"></i> <span>Staff</span><span class="tooltip-text">Staff</span></a></li>
				<li><a href="MenuManagement.jsp"> <i class="fa-solid fa-book-open"></i> <span>Menu</span><span class="tooltip-text">Menu</span></a></li>
				<li><a href="OrdersManagement.jsp"> <i class="fa-solid fa-cart-shopping"></i> <span>Orders</span><span class="tooltip-text">Orders</span></a></li>
				<li class="active"><a href="TablesManagement.jsp"> <i class="fa-solid fa-chair"></i> <span>Tables</span><span class="tooltip-text">Tables</span></a></li>
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
						<h3 id="navbarTitleDisplay" style="margin-bottom: 2px;">Table Management</h3>
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
                
                <div class="premium-dark-card">
                    <!-- Toolbar (Search & Add) -->
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <!-- Search Box -->
                        <div class="search-box d-flex align-items-center" style="width: 300px;">
                            <span class="input-group-text"><i class="fa-solid fa-search"></i></span>
                            <input type="text" id="searchInput" class="form-control" placeholder="Search tables..." onkeyup="searchTables()">
                        </div>
                        
                        <button class="btn btn-primary" onclick="openAddModal()">
                            <i class="fa-solid fa-plus me-1"></i> Add New Table
                        </button>
                    </div>

                    <!-- Table Container -->
                    <div class="table-responsive">
                        <table class="table custom-table">
                            <thead>
                                <tr>
                                    <th>Table ID</th>
                                    <th>Table Number</th>
                                    <th>Status</th>
                                    <th class="text-end">Actions</th>
                                </tr>
                            </thead>
                            <tbody id="tableBody">
                                <!-- Populated via JS -->
                            </tbody>
                        </table>
                    </div>
                    
                    <!-- Pagination Controls -->
                    <div class="pagination-container">
                                <button class="btn-pagination" id="prevBtn" onclick="prevPage()">Previous</button>
                                <span id="pageInfo" class="text-white small">Page 1 of 1</span>
                                <button class="btn-pagination next-btn" id="nextBtn" onclick="nextPage()">Next</button>
                            </div>

                    <!-- Empty State -->
                    <div id="emptyState" class="text-center py-5 d-none">
                        <div class="mb-3 text-muted">
                            <i class="fa-solid fa-chair fa-3x"></i>
                        </div>
                        <h5 class="text-white">No Tables Found</h5>
                        <p class="text-muted">You haven't added any tables yet or none match your search.</p>
                    </div>
                </div>
            </div>
		</div>
	</div>

    <!-- Table Modal -->
    <div class="modal fade" id="tableModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content premium-dark-modal">
                <div class="modal-header">
                    <h5 class="modal-title text-white" id="tableModalLabel">Add New Table</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body text-white">
                    <form id="tableForm">
                        <input type="hidden" id="tableId">
                        
                        <div class="mb-3">
                            <label for="tableNumber" class="form-label text-secondary fw-semibold small">Table Number <span class="text-danger">*</span></label>
                            <input type="number" class="form-control" id="tableNumber" required min="1" placeholder="e.g. 1, 2, 3">
                        </div>
                        
                        <div class="mb-3">
                            <label for="tableStatus" class="form-label text-secondary fw-semibold small">Status <span class="text-danger">*</span></label>
                            <select class="form-select" id="tableStatus" required>
                                <option value="Available">Available</option>
                                <option value="Occupied">Occupied</option>
                                <option value="Reserved">Reserved</option>
                            </select>
                        </div>
                    </form>
                </div>
                <div class="modal-footer border-top-0">
                    <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-primary px-4" onclick="saveTable()">Save Table</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="JS/theme.js?v=4.0"></script>
<script src="JS/api.js"></script>
<script>
        const API_URL = `${API_BASE}/tables`;
        let tableModal;
        let isEditMode = false;
        let allTables = [];
        let filteredTables = [];
        
        // Pagination
        let currentPage = 1;
        const itemsPerPage = 5;

        document.addEventListener('DOMContentLoaded', () => {
            // UX Role Check (Real security and authorization are enforced by the backend via verified JWT)
            const currentRole = localStorage.getItem('userRole');
            if (currentRole !== 'ADMIN') {
                showToast("Access Denied!", 'error');
                window.location.href = "HomePage.jsp";
            }
            const adminName = localStorage.getItem('adminName');
            if(adminName) {
                document.getElementById('adminNameDisplay').innerText = adminName;
            }

            tableModal = bootstrap.Modal.getOrCreateInstance(document.getElementById('tableModal'));
            fetchTables();
        });

        // 1. Fetch all tables
        function fetchTables() {
            apiFetch(`${API_URL}/all`)
                .then(res => res.json())
                .then(data => {
                    allTables = data;
                    filteredTables = [];
                    renderTables(allTables);
                })
                .catch(err => {
                    console.error('Error fetching tables:', err);
                    showEmptyState();
                });
        }

        // 2. Render tables in UI (with pagination)
        function renderTables(tables) {
            const tbody = document.getElementById('tableBody');
            const emptyState = document.getElementById('emptyState');
            
            tbody.innerHTML = '';
            
            if (!tables || tables.length === 0) {
                emptyState.classList.remove('d-none');
                document.getElementById('pageInfo').innerText = `Page 1 of 1`;
                document.getElementById('prevBtn').disabled = true;
                document.getElementById('nextBtn').disabled = true;
                return;
            }
            
            emptyState.classList.add('d-none');
            
            const totalPages = Math.ceil(tables.length / itemsPerPage) || 1;
            if(currentPage > totalPages) currentPage = totalPages;

            const start = (currentPage - 1) * itemsPerPage;
            const end = start + itemsPerPage;
            const paginatedData = tables.slice(start, end);

            paginatedData.forEach(table => {
                let badgeClass = table.status === 'Available' ? 'bg-success' : (table.status === 'Occupied' ? 'bg-danger' : 'bg-warning');
                
                const tr = document.createElement('tr');
                tr.innerHTML = `
                    <td class="fw-bold">#${table.tableId}</td>
                    <td class="text-white fw-medium">Table ${table.tableNumber}</td>
                    <td><span class="badge ${badgeClass} px-3 py-2">${table.status}</span></td>
                    <td class="text-end">
                        <button class="btn-edit me-2" onclick="openEditModal(${table.tableId}, ${table.tableNumber}, '${table.status}')">
                            <i class="fa-solid fa-pen"></i> Edit
                        </button>
                        <button class="btn-delete" onclick="deleteTable(${table.tableId})">
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
                renderTables(filteredTables.length > 0 ? filteredTables : allTables);
            }
        }

        function nextPage() {
            const data = filteredTables.length > 0 ? filteredTables : allTables;
            const totalPages = Math.ceil(data.length / itemsPerPage);
            if(currentPage < totalPages) {
                currentPage++;
                renderTables(data);
            }
        }

        // 3. Search Tables
        function searchTables() {
            const input = document.getElementById('searchInput').value.toLowerCase();
            filteredTables = allTables.filter(t => 
                t.tableNumber.toString().includes(input) || 
                t.status.toLowerCase().includes(input)
            );
            currentPage = 1;
            renderTables(filteredTables);
        }

        // 4. Open Modals
        function openAddModal() {
            isEditMode = false;
            document.getElementById('tableForm').reset();
            document.getElementById('tableId').value = '';
            document.getElementById('tableModalLabel').innerText = 'Add New Table';
            tableModal.show();
        }

        function openEditModal(id, number, status) {
            isEditMode = true;
            document.getElementById('tableId').value = id;
            document.getElementById('tableNumber').value = number;
            document.getElementById('tableStatus').value = status;
            document.getElementById('tableModalLabel').innerText = 'Edit Table';
            tableModal.show();
        }

        // 5. Save Table (Add / Update)
        function saveTable() {
            const form = document.getElementById('tableForm');
            if (!form.checkValidity()) {
                form.reportValidity();
                return;
            }

            const id = document.getElementById('tableId').value;
            const number = document.getElementById('tableNumber').value;
            const status = document.getElementById('tableStatus').value;

            const payload = {
                tableNumber: parseInt(number),
                status: status
            };

            const url = isEditMode ? `${API_URL}/update/${id}` : `${API_URL}/add`;
            const method = isEditMode ? 'PUT' : 'POST';

            apiFetch(url, {
                method: method,
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(payload)
            })
            .then(res => res.json())
            .then(data => {
                if (data.success) {
                    tableModal.hide();
                      showToast("Table details saved successfully!", 'success');
                      fetchTables();
                } else {
                    alert('Error: ' + data.message);
                }
            })
            .catch(err => {
                console.error('Error:', err);
                showToast('Connection error', 'error');
            });
        }

        // 6. Delete Table
        function deleteTable(id) {
            showCustomConfirm('Are you sure you want to delete this table?', () => {
                apiFetch(`${API_URL}/delete/${id}`, {
                    method: 'DELETE'
                })
                .then(res => res.json())
                .then(data => {
                    if (data.success) {
                          showToast("Table deleted successfully!", 'success');
                          fetchTables();
                    } else {
                        alert('Error: ' + data.message);
                    }
                })
                .catch(err => {
                    console.error('Error:', err);
                    showToast('Connection error', 'error');
                });
            });
        }
        
        function showEmptyState() {
            document.getElementById('tableBody').innerHTML = '';
            document.getElementById('emptyState').classList.remove('d-none');
            document.getElementById('pageInfo').innerText = `Page 1 of 1`;
            document.getElementById('prevBtn').disabled = true;
            document.getElementById('nextBtn').disabled = true;
        }
    
        function logout() {
            localStorage.clear();
            window.location.href = "HomePage.jsp";
        }
</script>
</body>
</html>




















