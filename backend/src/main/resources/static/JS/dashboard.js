/**
 * 
 */
document.addEventListener("DOMContentLoaded", function () {

    loadDashboardCards();
    loadSalesChart();

});

// ==========================
// Load Dashboard Cards
// ==========================
function loadDashboardCards() {

    // Total Staff
    fetch("http://localhost:8082/api/staff/count")
        .then(res => res.json())
        .then(data => {
            document.getElementById("staffCount").innerText = data;
        })
        .catch(err => console.log(err));

    // Total Menu
    fetch("http://localhost:8082/api/menu/count")
        .then(res => res.json())
        .then(data => {
            document.getElementById("menuCount").innerText = data;
        })
        .catch(err => console.log(err));

    // Today's Orders
    fetch("http://localhost:8082/api/orders/todayCount")
        .then(res => res.json())
        .then(data => {
            document.getElementById("todayOrders").innerText = data;
        })
        .catch(err => console.log(err));

}


// ==========================
// Sales Graph
// ==========================
function loadSalesChart() {

    fetch("http://localhost:8082/api/orders/monthlySales")
        .then(response => response.json())
        .then(data => {

            const labels = [];
            const values = [];

            data.forEach(item => {
                labels.push(item.month);
                values.push(item.totalSales);
            });

            const ctx = document.getElementById("salesChart").getContext("2d");

            new Chart(ctx, {

                type: "line",

                data: {
                    labels: labels,

                    datasets: [{
                        label: "Monthly Sales",

                        data: values,

                        borderWidth: 3,

                        tension: 0.4,

                        fill: true,

                        backgroundColor: "rgba(13,110,253,0.15)",

                        borderColor: "#0d6efd",

                        pointRadius: 4,

                        pointBackgroundColor: "#0d6efd"

                    }]
                },

                options: {

                    responsive: true,

                    plugins: {

                        legend: {
                            labels: {
                                color: "#fff"
                            }
                        }

                    },

                    scales: {

                        x: {
                            ticks: {
                                color: "#fff"
                            },
                            grid: {
                                color: "rgba(255,255,255,0.08)"
                            }
                        },

                        y: {
                            beginAtZero: true,
                            ticks: {
                                color: "#fff"
                            },
                            grid: {
                                color: "rgba(255,255,255,0.08)"
                            }
                        }

                    }

                }

            });

        })
        .catch(error => console.log(error));

}