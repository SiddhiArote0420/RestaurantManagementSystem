<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Menu Management - Royal Restaurant</title>
<!-- Bootstrap 5 CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<!-- FontAwesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
<!-- Custom CSS -->
<link rel="stylesheet" href="CSS/dashboard.css">
<link rel="stylesheet" href="CSS/royal_dashboard.css?v=14.0">
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
				<li class="active"><a href="MenuManagement.jsp"> <i class="fa-solid fa-book-open"></i> <span>Menu</span><span class="tooltip-text">Menu</span></a></li>
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
						<h3 id="navbarTitleDisplay" style="margin-bottom: 2px;">Menu Management</h3>
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
                            <input type="text" id="searchInput" class="form-control" placeholder="Search menu by name or category..." onkeyup="filterTable()">
                        </div>
                    </div>
                    <div class="col-md-7 text-end">
                        <button class="btn btn-primary btn-add-item" data-bs-toggle="modal" data-bs-target="#menuModal" onclick="openAddModal()">
                            <i class="fa-solid fa-plus me-1"></i> Add New Item
                        </button>
                    </div>
                </div>

                <!-- Menu Table -->
				<div class="row">
					<div class="col-12">
						<div class="premium-dark-card">
                            <div class="table-responsive">
                                <table class="table custom-table" id="menuTable">
                                    <thead>
                                        <tr>
                                            <th style="width: 10%">Sr. No.</th>
                                            <th style="width: 30%">Item Name</th>
                                            <th style="width: 20%">Category</th>
                                            <th style="width: 15%">Price (Rs)</th>
                                            <th style="width: 10%">Update</th>
                                            <th style="width: 10%">Delete</th>
                                        </tr>
                                    </thead>
                                    <tbody id="menuTableBody">
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

    <!-- Menu Modal (Add / Edit) -->
    <div class="modal fade" id="menuModal" tabindex="-1" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content shadow premium-dark-modal">
          <div class="modal-header border-bottom-0 pt-4 pb-0 px-4">
            <h5 class="modal-title fw-bold text-white" id="menuModalLabel">Add Menu Item</h5>
            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body p-4 text-white">
            <form id="menuForm">
              <input type="hidden" id="menuId">
              <div class="mb-3">
                <label class="form-label fw-semibold small">ITEM NAME</label>
                <input type="text" class="form-control" id="menuName" required>
              </div>
              <div class="mb-3">
                <label class="form-label fw-semibold small">CATEGORY</label>
                <select class="form-select" id="menuCategory" required>
                    <option value="" selected disabled>Select category...</option>
                    <option value="Starters">Starters</option>
                    <option value="Main Course">Main Course</option>
                    <option value="Breads">Breads</option>
                    <option value="Desserts">Desserts</option>
                    <option value="Beverages">Beverages</option>
                </select>
              </div>
              <div class="mb-3">
                <label class="form-label fw-semibold small">PRICE (Rs)</label>
                <input type="number" step="0.01" class="form-control" id="menuPrice" required>
              </div>
              <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-primary px-4" onclick="saveMenu()">Save</button>
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
            showToast("Access Denied", 'error');
            window.location.href = "HomePage.jsp";
        }

        const adminName = localStorage.getItem('adminName');
        if(adminName) {
            document.getElementById('adminNameDisplay').innerText = adminName;
        }

        // --- CRUD Logic ---
        const API_URL = `${API_BASE}/menu`;
        let menuList = [];
        let filteredMenu = [];
        let isUpdateMode = false;
        
        // Pagination
        let currentPage = 1;
        const itemsPerPage = 5;

        // Load all menu items
        function loadMenu() {
            apiFetch(API_URL + '/all')
                .then(response => response.json())
                .then(data => {
                    menuList = data;
                    filteredMenu = [];
                    renderTable(menuList);
                })
                .catch(err => console.error("Error loading menu:", err));
        }

        // Render Table (with pagination)
        function renderTable(data) {
            const tbody = document.getElementById('menuTableBody');
            tbody.innerHTML = '';
            
            if(data.length === 0) {
                tbody.innerHTML = `<tr><td colspan="6" class="text-center py-4 text-muted">No menu items found.</td></tr>`;
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

            let srNo = start + 1;
            paginatedData.forEach(item => {
                const tr = document.createElement('tr');
                tr.innerHTML = `
                    <td class="text-secondary fw-bold">${srNo++}</td>
                    <td class="fw-medium text-white">${item.name}</td>
                    <td>${item.category}</td>
                    <td class="fw-bold text-success">Rs. ${parseFloat(item.price).toFixed(2)}</td>
                    <td>
                        <button class="btn-edit" title="Edit Item" onclick="openEditModal(${item.menuId})">
                            <i class="fa-solid fa-pen"></i> Update
                        </button>
                    </td>
                    <td>
                        <button class="btn-delete" title="Delete Item" onclick="deleteMenu(${item.menuId})">
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
                renderTable(filteredMenu.length > 0 ? filteredMenu : menuList);
            }
        }

        function nextPage() {
            const data = filteredMenu.length > 0 ? filteredMenu : menuList;
            const totalPages = Math.ceil(data.length / itemsPerPage);
            if(currentPage < totalPages) {
                currentPage++;
                renderTable(data);
            }
        }

        // Filter Table (Search)
        function filterTable() {
            const query = document.getElementById('searchInput').value.toLowerCase();
            filteredMenu = menuList.filter(item => 
                item.name.toLowerCase().includes(query) ||
                item.category.toLowerCase().includes(query)
            );
            currentPage = 1;
            renderTable(filteredMenu);
        }

        // Open Modal for Add
        function openAddModal() {
            isUpdateMode = false;
            document.getElementById('menuModalLabel').innerText = "Add Menu Item";
            document.getElementById('menuForm').reset();
            document.getElementById('menuId').value = '';
        }

        // Open Modal for Edit
        function openEditModal(id) {
            isUpdateMode = true;
            document.getElementById('menuModalLabel').innerText = "Update Menu Item";
            const item = menuList.find(m => m.menuId === id);
            
            document.getElementById('menuId').value = item.menuId;
            document.getElementById('menuName').value = item.name;
            document.getElementById('menuCategory').value = item.category;
            document.getElementById('menuPrice').value = item.price;

            const modal = bootstrap.Modal.getOrCreateInstance(document.getElementById('menuModal'));
            modal.show();
        }

        // Save Menu (Add or Update)
        function saveMenu() {
            const id = document.getElementById('menuId').value;
            const name = document.getElementById('menuName').value;
            const category = document.getElementById('menuCategory').value;
            const price = document.getElementById('menuPrice').value;

            if(!name || !category || !price) {
                showToast("Please fill all required fields!", 'error');
                return;
            }

            const menuData = { name, category, price: parseFloat(price) };
            const url = isUpdateMode ? `${API_URL}/update/${id}` : `${API_URL}/add`;
            const method = isUpdateMode ? 'PUT' : 'POST';

            apiFetch(url, {
                method: method,
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(menuData)
            })
            .then(response => {
                if(response.ok) {
                    const modal = bootstrap.Modal.getOrCreateInstance(document.getElementById('menuModal'));
                    modal.hide();
                      showToast("Menu item saved successfully!", 'success');
                      loadMenu(); // Reload table
                } else {
                    showToast("Error saving menu item.", 'error');
                }
            })
            .catch(err => console.error("Error saving menu:", err));
        }

        // Delete Menu
        function deleteMenu(id) {
            showCustomConfirm("Are you sure you want to delete this menu item?", () => {
                apiFetch(`${API_URL}/delete/${id}`, {
                    method: 'DELETE'
                })
                .then(response => {
                    if(response.ok) {
                          showToast("Menu item deleted successfully!", 'success');
                          loadMenu(); // Reload table
                    } else {
                        showToast("Error deleting menu item.", 'error');
                    }
                })
                .catch(err => console.error("Error deleting menu:", err));
            });
        }

        // Initialize
        document.addEventListener('DOMContentLoaded', loadMenu);
	
        function logout() {
            localStorage.clear();
            window.location.href = "HomePage.jsp";
        }
</script>
</body>
</html>




















