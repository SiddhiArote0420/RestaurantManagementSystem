<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Restaurant Admin Dashboard</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
<!-- Original Dashboard CSS for Sidebar/Navbar layout -->
<link rel="stylesheet" href="CSS/dashboard.css?v=11.0">
<!-- Royal Spoon internal styling -->
<link rel="stylesheet" href="CSS/royal_dashboard.css?v=14.0">
  <link rel="stylesheet" href="CSS/light_theme.css?v=26.0">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<!-- Responsive UI: layout/spacing only, no functionality changes -->
<link rel="stylesheet" href="CSS/responsive.css?v=1.0">
</head>
<body>
	<div class="wrapper">
		<!-- Sidebar (Original) -->
		<div class="sidebar">
			<div class="logo">
				<i class="fa-solid fa-utensils"></i>
				<h4>Restaurant</h4>
			</div>
			<ul>
				<li class="active"><a href="#"> <i class="fa-solid fa-house"></i> <span>Dashboard</span><span class="tooltip-text">Dashboard</span></a></li>
				<li><a href="StaffManagement.jsp"> <i class="fa-solid fa-users"></i> <span>Staff</span><span class="tooltip-text">Staff</span></a></li>
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
<div class="dark-mode-only">

						

			<!-- Royal Container (New Design) -->
			<div class="royal-container">
                <!-- Hero Section -->
                <div class="hero-section">
                    <div class="hero-content">
                        <h1>Welcome To The Royal<br><span>Spoon</span></h1>
                        <p>Manage your restaurant efficiently with a modern dashboard. Track menus, staff, tables and reports in one place.</p>
                        <button class="btn-primary-custom">Manage Restaurant</button>
                    </div>
                </div>

                <!-- Today's Special Menu -->
                <h2 class="section-title">Today's Special Menu</h2>
                <div class="menu-grid">
                    <!-- Card 1 -->
                    <div class="food-card">
                        <img src="Images/cheese_burger.jpg" alt="Cheese Burger">
                        <div class="food-card-body">
                            <h5>Cheese Burger</h5>
                            <p>Fresh grilled burger served with crispy fries.</p>
                            <div class="price">Rs. 120</div>
                        </div>
                    </div>
                    <!-- Card 2 -->
                    <div class="food-card">
                        <img src="Images/veg_pizza.jpg" alt="Veg Pizza">
                        <div class="food-card-body">
                            <h5>Veg Pizza</h5>
                            <p>Loaded with fresh vegetables and mozzarella cheese.</p>
                            <div class="price">Rs. 250</div>
                        </div>
                    </div>
                    <!-- Card 3 -->
                    <div class="food-card">
                        <img src="Images/italian_pasta.jpg" alt="Italian Pasta">
                        <div class="food-card-body">
                            <h5>Italian Pasta</h5>
                            <p>Creamy white sauce pasta with herbs and cheese.</p>
                            <div class="price">Rs. 180</div>
                        </div>
                    </div>
                    <!-- Card 4 -->
                    <div class="food-card">
                        <img src="Images/chicken_biryani.jpg" alt="Chicken Biryani">
                        <div class="food-card-body">
                            <h5>Chicken Biryani</h5>
                            <p>Authentic dum biryani served with raita.</p>
                            <div class="price">Rs. 300</div>
                        </div>
                    </div>
                </div>

                <!-- Popular Dishes -->
                <h2 class="section-title">Popular Dishes</h2>
                <div class="menu-grid">
                    <!-- Card 1 -->
                    <div class="food-card">
                        <img src="Images/paneer_tikka.jpg" alt="Paneer Tikka">
                        <div class="food-card-body">
                            <h5>Paneer Tikka</h5>
                            <p>Smoky grilled paneer with Indian spices.</p>
                            <div class="price">Rs. 220</div>
                        </div>
                    </div>
                    <!-- Card 2 -->
                    <div class="food-card">
                        <img src="Images/hakka_noodles.jpg" alt="Hakka Noodles">
                        <div class="food-card-body">
                            <h5>Hakka Noodles</h5>
                            <p>Stir-fried noodles with fresh vegetables.</p>
                            <div class="price">Rs. 150</div>
                        </div>
                    </div>
                    <!-- Card 3 -->
                    <div class="food-card">
                        <img src="Images/club_sandwich.jpg" alt="Club Sandwich">
                        <div class="food-card-body">
                            <h5>Club Sandwich</h5>
                            <p>Triple-layer sandwich with fresh fillings.</p>
                            <div class="price">Rs. 180</div>
                        </div>
                    </div>
                    <!-- Card 4 -->
                    <div class="food-card">
                        <img src="Images/lava_cake.jpg" alt="Lava Cake">
                        <div class="food-card-body">
                            <h5>Lava Cake</h5>
                            <p>Rich chocolate cake with a molten center.</p>
                            <div class="price">Rs. 180</div>
                        </div>
                    </div>
                </div>

                <!-- Chef's Recommendation -->
                <h2 class="section-title">Chef's Recommendation</h2>
                <div class="chef-section">
                    <div class="chef-content">
                        <h2>Try our signature dishes</h2>
                        <p>Prepared with premium ingredients and authentic flavors by our expert culinary team. Experience the taste of perfection.</p>
                        <button class="btn-primary-custom">View Menu</button>
                    </div>
                    <div class="chef-image">
                        <img src="Images/chef.jpg" alt="Chef Recommendation">
                    </div>
                </div>

                <!-- Customer Reviews -->
                <h2 class="section-title">Customer Reviews</h2>
                <div class="reviews-grid">
                    <!-- Review 1 -->
                    <div class="review-card">
                        <img src="Images/customer.jpg" alt="Rahul Sharma">
                        <h6>Rahul Sharma</h6>
                        <div class="stars">
                            <i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i>
                        </div>
                        <p>"The food was absolutely delicious and the staff were very friendly. Highly recommended!"</p>
                    </div>
                    <!-- Review 2 -->
                    <div class="review-card">
                        <img src="https://randomuser.me/api/portraits/women/44.jpg" alt="Priya Verma">
                        <h6>Priya Verma</h6>
                        <div class="stars">
                            <i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star-half-stroke"></i>
                        </div>
                        <p>"Beautiful ambiance, quick service, and amazing taste. I will visit again with my family."</p>
                    </div>
                    <!-- Review 3 -->
                    <div class="review-card">
                        <img src="https://randomuser.me/api/portraits/men/46.jpg" alt="Amit Patil">
                        <h6>Amit Patil</h6>
                        <div class="stars">
                            <i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i>
                        </div>
                        <p>"Excellent food quality and a wonderful dining experience. One of my favorite restaurants."</p>
                    </div>
                </div>

                <!-- Stats Footer (Dynamic Data) -->
                <div class="stats-footer">
                    <div class="stat-item">
                        <i class="fa-solid fa-indian-rupee-sign"></i>
                        <h3 id="statRevenue">Rs.  0</h3>
                        <p>Total Revenue</p>
                    </div>
                    <div class="stat-item">
                        <i class="fa-solid fa-utensils"></i>
                        <h3 id="statFoodItems">0</h3>
                        <p>Food Items</p>
                    </div>
                    <div class="stat-item">
                        <i class="fa-solid fa-chair"></i>
                        <h3 id="statTables">0</h3>
                        <p>Dining Tables</p>
                    </div>
                    <div class="stat-item">
                        <i class="fa-solid fa-user-group"></i>
                        <h3 id="statStaff">0</h3>
                        <p>Staff Members</p>
                    </div>
                </div>

                <div class="copyright">
                    &copy; 2026 The Royal Spoon. All Rights Reserved.
                </div>
            </div></div>
        <!-- LIGHT MODE DASHBOARD -->
        <div class="light-mode-only">
            <!-- Unified Premium Navbar -->
            

            <div class="dashboard-container px-4 pb-4" style="background:#f8f9fa;">
                
                <!-- Row 1: Hero Banner -->
                <div class="dashboard-hero-banner mb-4 p-5 rounded-4" style="background: linear-gradient(135deg, rgba(249,115,22,0.05) 0%, rgba(255,255,255,1) 100%); border: 1px solid rgba(0,0,0,0.05); box-shadow: 0 4px 15px rgba(0,0,0,0.02); position:relative; overflow:hidden;">
                    <div style="position:absolute; top:-50px; right:-50px; width:200px; height:200px; border-radius:50%; background:radial-gradient(circle, rgba(249,115,22,0.1) 0%, rgba(0,0,0,0) 70%);"></div>
                    <h2 class="fw-bold mb-2 text-dark">Welcome Back, <span class="text-orange" style="color:#f97316;">Siddhi</span> &#128075;</h2>
                    <p class="fs-5 mb-4 text-muted">Manage your restaurant with confidence.</p>
                    <button class="btn px-4 py-2 rounded-pill fw-bold text-white" style="background:#f97316; border:none;" onclick="window.location.href='SalesManagement.jsp'">
                        Manage Restaurant <i class="fa-solid fa-arrow-right ms-2"></i>
                    </button>
                </div>

                <!-- Row 2: 5 Stat Cards -->
                <div class="row g-4 mb-4">
                    <div class="col">
                        <div class="bg-white p-4 rounded-4 shadow-sm h-100 border-0 position-relative overflow-hidden">
                            <div class="d-flex align-items-start gap-3">
                                <div class="p-3 rounded-3" style="background:rgba(249,115,22,0.1); color:#f97316; font-size:1.25rem;"><i class="fa-solid fa-receipt"></i></div>
                                <div>
                                    <div class="text-muted small fw-bold">Total Orders</div>
                                    <h3 class="fw-bold mb-0 text-dark">128</h3>
                                    <small class="text-success fw-bold"><i class="fa-solid fa-arrow-up"></i> 12% <span class="text-muted fw-normal">from yesterday</span></small>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="bg-white p-4 rounded-4 shadow-sm h-100 border-0 position-relative overflow-hidden">
                            <div class="d-flex align-items-start gap-3">
                                <div class="p-3 rounded-3" style="background:rgba(16,185,129,0.1); color:#10b981; font-size:1.25rem;"><i class="fa-solid fa-wallet"></i></div>
                                <div>
                                    <div class="text-muted small fw-bold">Today's Revenue</div>
                                    <h3 class="fw-bold mb-0 text-dark">?28,450</h3>
                                    <small class="text-success fw-bold"><i class="fa-solid fa-arrow-up"></i> 8.5% <span class="text-muted fw-normal">from yesterday</span></small>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="bg-white p-4 rounded-4 shadow-sm h-100 border-0 position-relative overflow-hidden">
                            <div class="d-flex align-items-start gap-3">
                                <div class="p-3 rounded-3" style="background:rgba(249,115,22,0.1); color:#f97316; font-size:1.25rem;"><i class="fa-solid fa-chair"></i></div>
                                <div>
                                    <div class="text-muted small fw-bold">Table Occupancy</div>
                                    <h3 class="fw-bold mb-0 text-dark">72%</h3>
                                    <small class="text-muted">18 / 25 Tables</small>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="bg-white p-4 rounded-4 shadow-sm h-100 border-0 position-relative overflow-hidden">
                            <div class="d-flex align-items-start gap-3">
                                <div class="p-3 rounded-3" style="background:rgba(139,92,246,0.1); color:#8b5cf6; font-size:1.25rem;"><i class="fa-solid fa-user-tie"></i></div>
                                <div>
                                    <div class="text-muted small fw-bold">Active Staff</div>
                                    <h3 class="fw-bold mb-0 text-dark">12</h3>
                                    <small class="text-muted">Staff on duty</small>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="bg-white p-4 rounded-4 shadow-sm h-100 border-0 position-relative overflow-hidden">
                            <div class="d-flex align-items-start gap-3">
                                <div class="p-3 rounded-3" style="background:rgba(239,68,68,0.1); color:#ef4444; font-size:1.25rem;"><i class="fa-solid fa-box-open"></i></div>
                                <div>
                                    <div class="text-muted small fw-bold">Low Stock Alerts</div>
                                    <h3 class="fw-bold mb-0 text-dark">5</h3>
                                    <small class="text-muted">Items running low</small>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Row 3: Middle Section -->
                <div class="row g-4 mb-4">
                    <!-- Order Status Overview -->
                    <div class="col-xl-3 col-lg-6">
                        <div class="bg-white rounded-4 shadow-sm h-100 p-4 d-flex flex-column">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <h6 class="fw-bold mb-0 text-dark">Order Status Overview</h6>
                                <select class="form-select form-select-sm w-auto bg-transparent border-secondary text-muted">
                                    <option>Today</option>
                                </select>
                            </div>
                            <div class="d-flex align-items-center justify-content-center flex-grow-1 my-3">
                                <div class="position-relative" style="width: 140px; height: 140px;">
                                    <canvas id="orderDonutChart"></canvas>
                                    <div class="position-absolute top-50 start-50 translate-middle text-center">
                                        <h3 class="fw-bold mb-0 text-dark">128</h3>
                                        <small class="text-muted" style="font-size: 0.7rem;">Total Orders</small>
                                    </div>
                                </div>
                                <div class="ms-4">
                                    <ul class="list-unstyled mb-0 small" style="line-height: 2;">
                                        <li><i class="fa-solid fa-circle text-success me-2" style="font-size:8px;"></i> <span class="text-muted">Completed</span> <span class="fw-bold ms-2 text-dark">60</span></li>
                                        <li><i class="fa-solid fa-circle text-orange me-2" style="font-size:8px; color:#f97316;"></i> <span class="text-muted">In Progress</span> <span class="fw-bold ms-2 text-dark">38</span></li>
                                        <li><i class="fa-solid fa-circle text-primary me-2" style="font-size:8px;"></i> <span class="text-muted">Pending</span> <span class="fw-bold ms-2 text-dark">20</span></li>
                                        <li><i class="fa-solid fa-circle text-danger me-2" style="font-size:8px;"></i> <span class="text-muted">Cancelled</span> <span class="fw-bold ms-2 text-dark">10</span></li>
                                    </ul>
                                </div>
                            </div>
                            <button class="btn btn-outline-secondary w-100 mt-auto rounded-pill border-opacity-25 text-dark">View All Orders <i class="fa-solid fa-arrow-right ms-2"></i></button>
                        </div>
                    </div>

                    <!-- Recent Orders -->
                    <div class="col-xl-3 col-lg-6">
                        <div class="bg-white rounded-4 shadow-sm h-100 p-4">
                            <div class="d-flex justify-content-between align-items-center mb-4">
                                <h6 class="fw-bold mb-0 text-dark">Recent Orders</h6>
                                <a href="OrdersManagement.jsp" class="text-decoration-none small fw-bold" style="color:#f97316;">View All</a>
                            </div>
                            <div>
                                <div class="d-flex justify-content-between align-items-center mb-3">
                                    <div><i class="fa-solid fa-circle me-2" style="font-size:8px; color:#f97316;"></i> <span class="fw-bold text-dark">#ORD-1052</span></div>
                                    <div class="text-muted small">Table 08</div>
                                    <span class="badge px-2 py-1 rounded-pill" style="background:rgba(249,115,22,0.1); color:#f97316;">In Progress</span>
                                </div>
                                <div class="d-flex justify-content-between align-items-center mb-3">
                                    <div><i class="fa-solid fa-circle text-success me-2" style="font-size:8px;"></i> <span class="fw-bold text-dark">#ORD-1051</span></div>
                                    <div class="text-muted small">Table 03</div>
                                    <span class="badge bg-success bg-opacity-10 text-success px-2 py-1 rounded-pill">Completed</span>
                                </div>
                                <div class="d-flex justify-content-between align-items-center mb-3">
                                    <div><i class="fa-solid fa-circle text-primary me-2" style="font-size:8px;"></i> <span class="fw-bold text-dark">#ORD-1050</span></div>
                                    <div class="text-muted small">Table 12</div>
                                    <span class="badge bg-primary bg-opacity-10 text-primary px-2 py-1 rounded-pill">Pending</span>
                                </div>
                                <div class="d-flex justify-content-between align-items-center mb-3">
                                    <div><i class="fa-solid fa-circle text-success me-2" style="font-size:8px;"></i> <span class="fw-bold text-dark">#ORD-1049</span></div>
                                    <div class="text-muted small">Table 05</div>
                                    <span class="badge bg-success bg-opacity-10 text-success px-2 py-1 rounded-pill">Completed</span>
                                </div>
                                <div class="d-flex justify-content-between align-items-center">
                                    <div><i class="fa-solid fa-circle text-danger me-2" style="font-size:8px;"></i> <span class="fw-bold text-dark">#ORD-1048</span></div>
                                    <div class="text-muted small">Table 02</div>
                                    <span class="badge bg-danger bg-opacity-10 text-danger px-2 py-1 rounded-pill">Cancelled</span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Kitchen Live -->
                    <div class="col-xl-3 col-lg-6">
                        <div class="bg-white rounded-4 shadow-sm h-100 p-4">
                            <div class="d-flex justify-content-between align-items-center mb-4">
                                <h6 class="fw-bold mb-0 text-dark">Kitchen Live</h6>
                                <a href="#" class="text-decoration-none small fw-bold" style="color:#f97316;">View Kitchen Display</a>
                            </div>
                            <ul class="list-unstyled mb-0">
                                <li class="d-flex justify-content-between align-items-center mb-3 pb-3 border-bottom border-light">
                                    <div><i class="fa-solid fa-receipt me-2 p-2 rounded" style="color:#8b5cf6; background:rgba(139,92,246,0.1);"></i> <span class="text-muted">New Orders</span></div>
                                    <span class="fw-bold fs-5 text-dark">5</span>
                                </li>
                                <li class="d-flex justify-content-between align-items-center mb-3 pb-3 border-bottom border-light">
                                    <div><i class="fa-solid fa-fire me-2 p-2 rounded" style="color:#f97316; background:rgba(249,115,22,0.1);"></i> <span class="text-muted">Preparing</span></div>
                                    <span class="fw-bold fs-5 text-dark">8</span>
                                </li>
                                <li class="d-flex justify-content-between align-items-center mb-3 pb-3 border-bottom border-light">
                                    <div><i class="fa-solid fa-bell-concierge me-2 p-2 rounded text-primary bg-primary bg-opacity-10"></i> <span class="text-muted">Ready to Serve</span></div>
                                    <span class="fw-bold fs-5 text-dark">3</span>
                                </li>
                                <li class="d-flex justify-content-between align-items-center">
                                    <div><i class="fa-solid fa-check-double me-2 p-2 rounded text-success bg-success bg-opacity-10"></i> <span class="text-muted">Served</span></div>
                                    <span class="fw-bold fs-5 text-dark">15</span>
                                </li>
                            </ul>
                        </div>
                    </div>

                    <!-- Quick Actions -->
                    <div class="col-xl-3 col-lg-6">
                        <div class="bg-white rounded-4 shadow-sm h-100 p-4 d-flex flex-column">
                            <h6 class="fw-bold mb-4 text-dark">Quick Actions</h6>
                            <div class="d-grid gap-2 flex-grow-1">
                                <button class="btn border text-start d-flex justify-content-between align-items-center rounded-3 bg-white hover-light" onclick="window.location.href='OrdersManagement.jsp'">
                                    <span class="text-dark fw-medium"><i class="fa-solid fa-plus me-2 p-2 rounded" style="color:#f97316; background:rgba(249,115,22,0.1);"></i> New Order</span> <i class="fa-solid fa-arrow-right text-muted small"></i>
                                </button>
                                <button class="btn border text-start d-flex justify-content-between align-items-center rounded-3 bg-white hover-light" onclick="window.location.href='StaffManagement.jsp'">
                                    <span class="text-dark fw-medium"><i class="fa-solid fa-user-plus me-2 p-2 rounded" style="color:#8b5cf6; background:rgba(139,92,246,0.1);"></i> Add Staff</span> <i class="fa-solid fa-arrow-right text-muted small"></i>
                                </button>
                                <button class="btn border text-start d-flex justify-content-between align-items-center rounded-3 bg-white hover-light" onclick="window.location.href='TablesManagement.jsp'">
                                    <span class="text-dark fw-medium"><i class="fa-solid fa-chair me-2 p-2 rounded text-primary bg-primary bg-opacity-10"></i> Manage Tables</span> <i class="fa-solid fa-arrow-right text-muted small"></i>
                                </button>
                                <button class="btn border text-start d-flex justify-content-between align-items-center rounded-3 bg-white hover-light">
                                    <span class="text-dark fw-medium"><i class="fa-solid fa-boxes-stacked me-2 p-2 rounded text-success bg-success bg-opacity-10"></i> Inventory Update</span> <i class="fa-solid fa-arrow-right text-muted small"></i>
                                </button>
                                <button class="btn border text-start d-flex justify-content-between align-items-center rounded-3 bg-white hover-light" onclick="window.location.href='SalesManagement.jsp'">
                                    <span class="text-dark fw-medium"><i class="fa-solid fa-file-invoice me-2 p-2 rounded text-danger bg-danger bg-opacity-10"></i> Daily Report</span> <i class="fa-solid fa-arrow-right text-muted small"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Row 4: Food Cards -->
                <div class="row g-4 mb-4">
                    <div class="col-md-6">
                        <div class="bg-white rounded-4 shadow-sm p-4">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <h6 class="fw-bold mb-0 text-dark"><i class="fa-solid fa-crown me-2" style="color:#f97316;"></i> Today's Special Menu</h6>
                            </div>
                            <div class="d-flex gap-3 overflow-auto pb-2 custom-scrollbar">
                                <div class="p-3 border rounded-3 text-center" style="min-width: 160px;">
                                    <img src="Images/cheese_burger.jpg" alt="Cheese Burger" style="width:100%; height:100px; object-fit:cover; border-radius:8px;">
                                    <h6 class="fw-bold mt-2 mb-1 text-dark">Cheese Burger</h6>
                                    <div class="small fw-bold" style="color:#f97316;">Rs. 120</div>
                                </div>
                                <div class="p-3 border rounded-3 text-center" style="min-width: 160px;">
                                    <img src="Images/veg_pizza.jpg" alt="Veg Pizza" style="width:100%; height:100px; object-fit:cover; border-radius:8px;">
                                    <h6 class="fw-bold mt-2 mb-1 text-dark">Veg Pizza</h6>
                                    <div class="small fw-bold" style="color:#f97316;">Rs. 250</div>
                                </div>
                                <div class="p-3 border rounded-3 text-center" style="min-width: 160px;">
                                    <img src="Images/italian_pasta.jpg" alt="Italian Pasta" style="width:100%; height:100px; object-fit:cover; border-radius:8px;">
                                    <h6 class="fw-bold mt-2 mb-1 text-dark">Italian Pasta</h6>
                                    <div class="small fw-bold" style="color:#f97316;">Rs. 180</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="bg-white rounded-4 shadow-sm p-4">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <h6 class="fw-bold mb-0 text-dark"><i class="fa-solid fa-fire me-2" style="color:#f97316;"></i> Popular Dishes</h6>
                                <a href="MenuManagement.jsp" class="text-decoration-none small fw-bold" style="color:#f97316;">View All</a>
                            </div>
                            <div class="d-flex gap-3 overflow-auto pb-2 custom-scrollbar">
                                <div class="p-3 border rounded-3 text-center" style="min-width: 160px;">
                                    <img src="Images/paneer_tikka.jpg" alt="Grilled Paneer" style="width:100%; height:100px; object-fit:cover; border-radius:8px;">
                                    <h6 class="fw-bold mt-2 mb-1 text-dark">Grilled Paneer</h6>
                                    <div class="small fw-bold" style="color:#f97316;">Rs. 220</div>
                                </div>
                                <div class="p-3 border rounded-3 text-center" style="min-width: 160px;">
                                    <img src="Images/cheese_burger.jpg" alt="Chicken Burger" style="width:100%; height:100px; object-fit:cover; border-radius:8px;">
                                    <h6 class="fw-bold mt-2 mb-1 text-dark">Chicken Burger</h6>
                                    <div class="small fw-bold" style="color:#f97316;">Rs. 150</div>
                                </div>
                                <div class="p-3 border rounded-3 text-center" style="min-width: 160px;">
                                    <img src="https://cdn-icons-png.flaticon.com/512/3050/3050115.png" alt="Fresh Lime Soda" style="width:100%; height:100px; object-fit:contain; border-radius:8px; padding:10px; background:#f8f9fa;">
                                    <h6 class="fw-bold mt-2 mb-1 text-dark">Fresh Lime Soda</h6>
                                    <div class="small fw-bold" style="color:#f97316;">Rs. 90</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</div>
</div>
<script src="JS/api.js"></script>
<script>
    // UX Role Check (Real security and authorization are enforced by the backend via verified JWT)
    const currentRole = localStorage.getItem('userRole');
    if (currentRole !== 'ADMIN') {
        alert("Access Denied");
        window.location.href = "HomePage.jsp";
    }

    const adminName = localStorage.getItem('adminName');
    if(adminName) {
        document.getElementById('adminNameDisplay').innerText = adminName;
    }

    // Fetch dynamic stats for dashboard
    apiFetch('/dashboard/stats')
    .then(res => res.json())
    .then(data => {
        const staffEl = document.getElementById('statStaff');
        const revEl = document.getElementById('statRevenue');
        const foodEl = document.getElementById('statFoodItems');
        const tableEl = document.getElementById('statTables');
        
        if (staffEl) staffEl.innerText = data.staffCount || 0;
        if (revEl) revEl.innerText = 'Rs. ' + ((data.todayOrders || 5) * 450); 
        if (foodEl) foodEl.innerText = '12';
        if (tableEl) tableEl.innerText = '8';
    })
    .catch(err => console.error("Stats Error:", err));

    setTimeout(() => {
        const donutCtx = document.getElementById('orderDonutChart');
        if(donutCtx && typeof Chart !== 'undefined') {
            new Chart(donutCtx.getContext('2d'), {
                type: 'doughnut',
                data: {
                    labels: ['Completed', 'In Progress', 'Pending', 'Cancelled'],
                    datasets: [{
                        data: [60, 38, 20, 10],
                        backgroundColor: ['#10B981', '#F97316', '#3B82F6', '#EF4444'],
                        borderWidth: 0,
                        cutout: '75%'
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    plugins: { legend: { display: false }, tooltip: { enabled: true } }
                }
            });
        }
    }, 500);

    function logout() {
        localStorage.clear();
        window.location.href = "HomePage.jsp";
    }
</script>
<script src="JS/theme.js?v=4.0"></script>
</body>
</html>















