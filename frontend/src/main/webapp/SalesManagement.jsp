<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Sales Management - Advanced Dashboard</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2&#8377;family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="CSS/dashboard.css">
<link rel="stylesheet" href="CSS/royal_dashboard.css&#8377;v=2.6">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<style>
    /* Advanced Dashboard Specific Styles */
    body {
        font-family: 'Inter', sans-serif;
        background-color: #0f0f0f; /* Very dark background */
        color: #e2e8f0;
    }
    
    .advanced-card {
        background-color: #1a1a1a;
        border-radius: 12px;
        border: 1px solid #333;
        padding: 1.5rem;
        box-shadow: 0 4px 15px rgba(0,0,0,0.5);
    }

    /* Top Summary Cards */
    .summary-card {
        display: flex;
        justify-content: space-between;
        align-items: flex-start;
    }
    .summary-title {
        color: #a0aec0;
        font-size: 0.9rem;
        font-weight: 600;
        margin-bottom: 0.5rem;
    }
    .summary-value {
        color: #f47c36;
        font-size: 1.8rem;
        font-weight: 700;
        margin-bottom: 0.5rem;
    }
    .summary-subtext {
        font-size: 0.8rem;
        color: #48bb78; /* Green */
        font-weight: 500;
    }
    .summary-icon {
        width: 45px;
        height: 45px;
        background-color: rgba(244, 124, 54, 0.1);
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        color: #f47c36;
        font-size: 1.2rem;
    }

    /* Chart Containers */
    .chart-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 1rem;
        border-bottom: 1px solid #333;
        padding-bottom: 0.8rem;
    }
    .chart-title {
        color: #fff;
        font-size: 1.1rem;
        font-weight: 600;
        margin: 0;
    }
    .chart-canvas-container {
        position: relative;
        height: 300px;
        width: 100%;
    }

        /* Table Overrides */
    .table-dark-custom {
        color: #e2e8f0 !important;
        margin-bottom: 0;
        background-color: transparent !important;
    }
    .table-dark-custom th {
        border-bottom: 1px solid #333 !important;
        background-color: transparent !important;
        color: #a0aec0 !important;
        font-weight: 600;
        font-size: 0.85rem;
        text-transform: uppercase;
        padding: 1rem;
    }
    .table-dark-custom td {
        border-bottom: 1px solid #222 !important;
        background-color: transparent !important;
        padding: 1rem;
        vertical-align: middle;
        color: #cbd5e0 !important;
    }
    .table-dark-custom tbody tr:hover {
        background-color: rgba(255, 255, 255, 0.05) !important;
    }
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
				<li><a href="TablesManagement.jsp"> <i class="fa-solid fa-chair"></i> <span>Tables</span><span class="tooltip-text">Tables</span></a></li>
				<li class="active"><a href="SalesManagement.jsp"> <i class="fa-solid fa-chart-line"></i> <span>Sales</span><span class="tooltip-text">Sales</span></a></li>
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
						<h3 id="navbarTitleDisplay" style="margin-bottom: 2px;">Bill Management</h3>
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
			<div class="container-fluid px-4 pb-4">
                
                <!-- 4 Summary Cards -->
                <div class="row mb-4">
                    <!-- Total Sales -->
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="advanced-card summary-card">
                            <div>
                                <div class="summary-title">Total Sales</div>
                                <div class="summary-value" id="totalSalesDisplay">â‚¹ 0</div>
                                <div class="summary-subtext">+18.6% <span class="text-secondary fw-normal">vs last month</span></div>
                            </div>
                            <div class="summary-icon"><i class="fa-solid fa-arrow-trend-up"></i></div>
                        </div>
                    </div>
                    
                    <!-- Today's Sales -->
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="advanced-card summary-card">
                            <div>
                                <div class="summary-title">Today's Sales</div>
                                <div class="summary-value" id="todaySalesDisplay">â‚¹ 0</div>
                                <div class="summary-subtext">+12.4% <span class="text-secondary fw-normal">vs yesterday</span></div>
                            </div>
                            <div class="summary-icon"><i class="fa-solid fa-calendar-day"></i></div>
                        </div>
                    </div>
                    
                    <!-- Total Bills -->
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="advanced-card summary-card">
                            <div>
                                <div class="summary-title">Total Bills</div>
                                <div class="summary-value" id="totalBillsDisplay" style="color: #f47c36;">0</div>
                                <div class="summary-subtext">+8.7% <span class="text-secondary fw-normal">vs last month</span></div>
                            </div>
                            <div class="summary-icon"><i class="fa-solid fa-receipt"></i></div>
                        </div>
                    </div>
                    
                    <!-- Average Bill -->
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="advanced-card summary-card">
                            <div>
                                <div class="summary-title">Average Bill</div>
                                <div class="summary-value" id="avgBillDisplay">â‚¹ 0</div>
                                <div class="summary-subtext">+5.3% <span class="text-secondary fw-normal">vs last month</span></div>
                            </div>
                            <div class="summary-icon"><i class="fa-solid fa-wallet"></i></div>
                        </div>
                    </div>
                </div>

                <!-- Charts Row -->
                <div class="row mb-4">
                    <!-- Line Chart -->
                    <div class="col-xl-8 col-lg-7 mb-4 mb-lg-0">
                        <div class="advanced-card h-100">
                            <div class="chart-header">
                                <h6 class="chart-title"><i class="fa-solid fa-chart-line text-warning me-2"></i> Weekly Sales Overview</h6>
                                <select class="form-select form-select-sm w-auto bg-dark text-white border-secondary">
                                    <option>This Week</option>
                                </select>
                            </div>
                            <div class="chart-canvas-container">
                                <canvas id="salesLineChart"></canvas>
                            </div>
                        </div>
                    </div>
                    <!-- Doughnut Chart -->
                    <div class="col-xl-4 col-lg-5">
                        <div class="advanced-card h-100">
                            <div class="chart-header">
                                <h6 class="chart-title">Payment Methods</h6>
                            </div>
                            <div class="chart-canvas-container" style="height: 250px;">
                                <canvas id="paymentDoughnutChart"></canvas>
                            </div>
                            <!-- Custom Legend Below Chart -->
                            <div class="row mt-3 text-center" id="doughnutLegend">
                                <div class="col-4">
                                    <div style="color: #f47c36; font-size: 0.8rem;"><i class="fa-solid fa-circle text-warning"></i> Cash</div>
                                    <div class="fw-bold mt-1" style="font-size: 0.85rem;" id="legendCash">â‚¹0 (0%)</div>
                                </div>
                                <div class="col-4">
                                    <div style="color: #4e73df; font-size: 0.8rem;"><i class="fa-solid fa-circle text-primary"></i> UPI</div>
                                    <div class="fw-bold mt-1" style="font-size: 0.85rem;" id="legendUpi">â‚¹0 (0%)</div>
                                </div>
                                <div class="col-4">
                                    <div style="color: #1cc88a; font-size: 0.8rem;"><i class="fa-solid fa-circle text-success"></i> Card</div>
                                    <div class="fw-bold mt-1" style="font-size: 0.85rem;" id="legendCard">â‚¹0 (0%)</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Recent Sales Table -->
                <div class="advanced-card">
                    <div class="chart-header border-bottom-0 mb-0 pb-3">
                        <h6 class="chart-title"><i class="fa-solid fa-file-invoice text-warning me-2"></i> Recent Sales</h6>
                        <button class="btn btn-sm" style="background-color: #f47c36; color: white; border-radius: 6px;" data-bs-toggle="modal" data-bs-target="#paymentModal" onclick="openAddModal()">
                            Add Sale <i class="fa-solid fa-chevron-right ms-1" style="font-size: 0.7rem;"></i>
                        </button>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-borderless table-dark-custom" id="salesTable">
                            <thead>
                                <tr>
                                    <th>Bill ID</th>
                                    <th>Customer / Order</th>
                                    <th>Amount</th>
                                    <th>Payment Mode</th>
                                    <th>Date</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody id="salesTableBody">
                                <!-- Data populated by JS -->
                            </tbody>
                        </table>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <!-- Add/Edit Payment Modal -->
    <div class="modal fade" id="paymentModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content premium-dark-modal" style="background-color: #1a1a1a; color: white; border: 1px solid #333;">
                <div class="modal-header border-secondary">
                    <h5 class="modal-title" style="color: #f47c36;" id="modalTitle">Add Sale</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <form id="paymentForm">
                        <input type="hidden" id="paymentId">
                        <div class="mb-3">
                            <label class="form-label text-secondary">Order ID</label>
                            <input type="number" class="form-control bg-dark text-white border-secondary" id="orderId" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label text-secondary">Payment Mode</label>
                            <select class="form-select bg-dark text-white border-secondary" id="paymentMode" required>
                                <option value="CASH">Cash</option>
                                <option value="CARD">Card</option>
                                <option value="UPI">UPI</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label class="form-label text-secondary">Date</label>
                            <input type="date" class="form-control bg-dark text-white border-secondary" id="paymentDate" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label text-secondary">Amount (â‚¹)</label>
                            <input type="number" class="form-control bg-dark text-white border-secondary" id="amountPaid" step="0.01" required>
                        </div>
                    </form>
                </div>
                <div class="modal-footer border-secondary">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="button" class="btn" style="background-color: #f47c36; color: white;" onclick="savePayment()">Save Sale</button>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="JS/theme.js?v=4.0"></script>
<script src="JS/api.js"></script>
    <script>
        // UX Role Check (Real security and authorization are enforced by the backend via verified JWT)
        const currentRole = localStorage.getItem('userRole');
        if (currentRole && currentRole !== 'ADMIN') {
            alert("Access Denied");
            window.location.href = "HomePage.jsp";
        }

        const API_URL = `${API_BASE}/payments`;
        let paymentsList = [];
        let paymentModal;
        let lineChartInstance = null;
        let doughnutChartInstance = null;

        document.addEventListener("DOMContentLoaded", () => {
            paymentModal = bootstrap.Modal.getOrCreateInstance(document.getElementById('paymentModal'));
            
            // Set Chart.js Defaults for Dark Theme
            Chart.defaults.color = '#858796';
            Chart.defaults.font.family = "'Inter', sans-serif";
            
            loadPayments();
            document.getElementById('paymentDate').valueAsDate = new Date();
        });

        function loadPayments() {
            apiFetch(`${API_URL}/all`)
                .then(res => res.json())
                .then(data => {
                    paymentsList = data;
                    renderTable(paymentsList);
                    updateDashboard(paymentsList);
                })
                .catch(err => console.error("Error loading payments:", err));
        }

        // --- DASHBOARD LOGIC ---
        function formatMoney(amount) {
            return new Intl.NumberFormat('en-IN', { maximumFractionDigits: 0 }).format(amount);
        }

        function updateDashboard(data) {
            // 1. Calculate Top Cards
            let totalSales = 0;
            let totalBills = data.length;
            
            const todayStr = new Date().toISOString().split('T')[0];
            let todaySales = 0;

            let cashTotal = 0, upiTotal = 0, cardTotal = 0;

            // Group by Date for the last 7 days
            const last7Days = [];
            const salesByDate = {};
            
            for(let i=6; i>=0; i--) {
                const d = new Date();
                d.setDate(d.getDate() - i);
                const dateStr = d.toISOString().split('T')[0];
                const dayName = d.toLocaleDateString('en-US', { weekday: 'short' });
                last7Days.push(dayName);
                salesByDate[dateStr] = 0;
            }

            data.forEach(p => {
                const amt = parseFloat(p.amountPaid || 0);
                totalSales += amt;
                
                const dateOnly = p.paymentDate.split('T')[0];
                if (dateOnly === todayStr) {
                    todaySales += amt;
                }

                if (salesByDate[dateOnly] !== undefined) {
                    salesByDate[dateOnly] += amt;
                }

                const mode = p.paymentMode.toUpperCase();
                if(mode === 'CASH') cashTotal += amt;
                else if(mode === 'UPI') upiTotal += amt;
                else if(mode === 'CARD') cardTotal += amt;
            });

            const avgBill = totalBills > 0 ? (totalSales / totalBills) : 0;

            document.getElementById('totalSalesDisplay').innerHTML = `&#8377; ${formatMoney(totalSales)}`;
            document.getElementById('todaySalesDisplay').innerHTML = `&#8377; ${formatMoney(todaySales)}`;
            document.getElementById('totalBillsDisplay').innerText = totalBills;
            document.getElementById('avgBillDisplay').innerHTML = `&#8377; ${formatMoney(avgBill)}`;

            // 2. Update Doughnut Chart
            let pctCash = totalSales > 0 ? Math.round((cashTotal/totalSales)*100) : 0;
            let pctUpi = totalSales > 0 ? Math.round((upiTotal/totalSales)*100) : 0;
            let pctCard = totalSales > 0 ? Math.round((cardTotal/totalSales)*100) : 0;

            document.getElementById('legendCash').innerHTML = `&#8377;${formatMoney(cashTotal)} (${pctCash}%)`;
            document.getElementById('legendUpi').innerHTML = `&#8377;${formatMoney(upiTotal)} (${pctUpi}%)`;
            document.getElementById('legendCard').innerHTML = `&#8377;${formatMoney(cardTotal)} (${pctCard}%)`;

            renderDoughnutChart(cashTotal, upiTotal, cardTotal);

            // 3. Update Line Chart
            const lineData = Object.values(salesByDate);
            renderLineChart(last7Days, lineData);
        }

        function renderDoughnutChart(cash, upi, card) {
            const ctx = document.getElementById("paymentDoughnutChart");
            if (doughnutChartInstance) doughnutChartInstance.destroy();
            
            doughnutChartInstance = new Chart(ctx, {
                type: 'doughnut',
                data: {
                    labels: ["Cash", "UPI", "Card"],
                    datasets: [{
                        data: [cash, upi, card],
                        backgroundColor: ['#f6c23e', '#4e73df', '#1cc88a'],
                        hoverBackgroundColor: ['#dda20a', '#2e59d9', '#17a673'],
                        borderWidth: 0
                    }],
                },
                options: {
                    maintainAspectRatio: false,
                    cutout: '70%',
                    plugins: {
                        legend: { display: false } // We use custom HTML legend
                    }
                }
            });
        }

        function renderLineChart(labels, dataArr) {
            const ctx = document.getElementById("salesLineChart");
            if (lineChartInstance) lineChartInstance.destroy();

            // Create gradient
            let gradient = ctx.getContext('2d').createLinearGradient(0, 0, 0, 300);
            gradient.addColorStop(0, 'rgba(244, 124, 54, 0.4)');
            gradient.addColorStop(1, 'rgba(244, 124, 54, 0.0)');

            lineChartInstance = new Chart(ctx, {
                type: 'line',
                data: {
                    labels: labels,
                    datasets: [{
                        label: "Sales (â‚¹)",
                        lineTension: 0.3,
                        backgroundColor: gradient,
                        borderColor: "#f47c36",
                        pointRadius: 4,
                        pointBackgroundColor: "#f47c36",
                        pointBorderColor: "#fff",
                        pointHoverRadius: 6,
                        pointHoverBackgroundColor: "#fff",
                        pointHoverBorderColor: "#f47c36",
                        fill: true,
                        data: dataArr,
                    }],
                },
                options: {
                    maintainAspectRatio: false,
                    plugins: {
                        legend: { display: false }
                    },
                    scales: {
                        x: {
                            grid: { display: false, drawBorder: false },
                            ticks: { color: '#858796' }
                        },
                        y: {
                            grid: {
                                color: "rgba(255, 255, 255, 0.05)",
                                drawBorder: false,
                                zeroLineColor: "rgba(255, 255, 255, 0.1)"
                            },
                            ticks: {
                                color: '#858796',
                                callback: function(value) { return (value >= 1000) ? (value/1000) + 'k' : value; }
                            }
                        }
                    }
                }
            });
        }

        // --- TABLE CRUD LOGIC ---
        function renderTable(data) {
            const tbody = document.getElementById('salesTableBody');
            tbody.innerHTML = '';
            
            if (data.length === 0) {
                tbody.innerHTML = `<tr><td colspan="6" class="text-center text-muted">No recent sales found.</td></tr>`;
                return;
            }
            
            // Show only latest 15 in the table to match "Recent Sales" vibe
            const recentData = data.slice(0, 15);
            
            recentData.forEach(payment => {
                const date = new Date(payment.paymentDate).toLocaleDateString('en-GB', { day:'numeric', month:'short', year:'numeric' });
                
                let modeIcon = '';
                if(payment.paymentMode.toUpperCase() === 'CASH') modeIcon = '<i class="fa-solid fa-money-bill text-success me-1"></i> Cash';
                else if(payment.paymentMode.toUpperCase() === 'UPI') modeIcon = '<i class="fa-solid fa-mobile-screen text-primary me-1"></i> UPI';
                else modeIcon = '<i class="fa-regular fa-credit-card text-info me-1"></i> Card';

                const tr = document.createElement('tr');
                tr.innerHTML = `
                    <td class="text-secondary">BILL-${1000 + payment.paymentId}</td>
                    <td>Order ${payment.orderId || '-'}</td>
                    <td style="color: #f47c36; font-weight: 600;">&#8377; ${formatMoney(payment.amountPaid)}</td>
                    <td>${modeIcon}</td>
                    <td class="text-secondary">${date}</td>
                    <td>
                        <button class="btn btn-sm text-secondary hover-white" onclick="editPayment(${payment.paymentId})" title="Edit">
                            <i class="fa-solid fa-pen"></i>
                        </button>
                        <button class="btn btn-sm text-secondary hover-danger" onclick="deletePayment(${payment.paymentId})" title="Delete">
                            <i class="fa-solid fa-trash"></i>
                        </button>
                    </td>
                `;
                tbody.appendChild(tr);
            });
        }

        function openAddModal() {
            document.getElementById('paymentForm').reset();
            document.getElementById('paymentId').value = '';
            document.getElementById('paymentDate').valueAsDate = new Date();
            document.getElementById('modalTitle').innerText = 'Add Sale';
        }

        function editPayment(id) {
            const payment = paymentsList.find(p => p.paymentId === id);
            if(payment) {
                document.getElementById('paymentId').value = payment.paymentId;
                document.getElementById('orderId').value = payment.orderId || '';
                document.getElementById('paymentMode').value = payment.paymentMode.toUpperCase();
                document.getElementById('paymentDate').value = payment.paymentDate.split('T')[0];
                document.getElementById('amountPaid').value = payment.amountPaid;
                
                document.getElementById('modalTitle').innerText = 'Edit Sale';
                paymentModal.show();
            }
        }

        function savePayment() {
            const id = document.getElementById('paymentId').value;
            const data = {
                orderId: document.getElementById('orderId').value ? parseInt(document.getElementById('orderId').value) : null,
                paymentMode: document.getElementById('paymentMode').value,
                paymentDate: document.getElementById('paymentDate').value,
                amountPaid: parseFloat(document.getElementById('amountPaid').value)
            };

            const url = id ? `${API_URL}/update/${id}` : `${API_URL}/add`;
            const method = id ? 'PUT' : 'POST';

            apiFetch(url, {
                method: method,
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(data)
            })
            .then(res => res.json())
            .then(result => {
                if (result.success) {
                    paymentModal.hide();
                    loadPayments(); // Reloads data AND updates charts seamlessly!
                } else {
                    showToast('Error saving payment', 'error');
                }
            })
            .catch(err => console.error("Error saving payment:", err));
        }

        function deletePayment(id) {
            showCustomConfirm("Are you sure you want to delete this bill?", () => {
                apiFetch(`${API_URL}/delete/${id}`, { method: 'DELETE' })
                    .then(res => res.json())
                    .then(result => {
                        if(result.success) loadPayments();
                        else showToast('Error deleting bill', 'error');
        });
            });
        }
    
        function logout() {
            localStorage.clear();
            window.location.href = "HomePage.jsp";
        }
</script>
</body>
</html>



























