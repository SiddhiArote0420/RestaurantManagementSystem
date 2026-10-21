<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RMS - Restaurant Management System</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- FontAwesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="styles.css">
    <style>
     @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap');

:root {
    --primary-orange: #ff8c00;
    --gradient-orange: linear-gradient(90deg, #ff8c00 0%, #e65c00 100%);
    --bg-dark: #121212;
}

body, html {
    height: 100%;
    margin: 0;
    font-family: 'Inter', sans-serif;
    background-color: var(--bg-dark);
}

.main-container {
    min-height: 100vh;
    width: 100vw;
    /* Optional: replace this link with a local image if you want to change the background */
    background: url('https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?ixlib=rb-4.0.3&auto=format&fit=crop&w=1920&q=80') no-repeat center center;
    background-size: cover;
    position: relative;
    /* Flexbox settings ensure the container has perfect top and bottom spacing */
    display: flex;
    align-items: center;
    justify-content: center;
    /* allow scrolling on smaller devices */
    overflow-x: hidden;
    overflow-y: auto; 
}

.bg-overlay {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    /* Dark gradient overlay to match image contrast */
    background: linear-gradient(90deg, rgba(0, 0, 0, 0.9) 0%, rgba(0, 0, 0, 0.5) 100%);
    z-index: 1;
}

.content-wrapper {
    position: relative;
    z-index: 2;
}

.z-index-2 {
    z-index: 2;
}

/* Typography Overrides */
.text-warning {
    color: var(--primary-orange) !important;
}

.text-light-50 {
    color: rgba(255, 255, 255, 0.6);
}

/* Feature Boxes */
.feature-box {
    background: rgba(0, 0, 0, 0.3);
    border: 1px solid rgba(255, 140, 0, 0.3);
    border-radius: 12px;
    backdrop-filter: blur(8px);
    -webkit-backdrop-filter: blur(8px);
    transition: all 0.3s ease;
    min-height: 100px;
}

.feature-box:hover {
    background: rgba(0, 0, 0, 0.5);
    border-color: var(--primary-orange);
    transform: translateY(-3px);
    box-shadow: 0 5px 15px rgba(255,140,0,0.1);
}

/* Glassmorphism Panel */
.glass-panel {
    background: rgba(30, 30, 30, 0.4);
    backdrop-filter: blur(15px);
    -webkit-backdrop-filter: blur(15px);
    border: 1px solid rgba(255, 255, 255, 0.1);
    border-radius: 20px;
    box-shadow: 0 25px 50px rgba(0, 0, 0, 0.5);
}

/* User Avatar */
.user-avatar {
    width: 80px;
    height: 80px;
    background: var(--gradient-orange);
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    box-shadow: 0 10px 20px rgba(255, 140, 0, 0.3);
}

/* Form Inputs */
.glass-input {
    background: transparent;
    border: 1px solid rgba(255, 255, 255, 0.2);
    border-radius: 8px;
    overflow: hidden;
    transition: all 0.3s ease;
}

.glass-input:focus-within {
    border-color: var(--primary-orange);
    background: rgba(255, 255, 255, 0.05);
}

.glass-input .input-group-text {
    background: transparent;
    border: none;
    color: var(--primary-orange);
    padding-left: 15px;
}

.glass-input .form-control {
    background: transparent;
    border: none;
    color: white;
    padding: 12px 15px;
    box-shadow: none;
    font-size: 0.95rem;
}

.glass-input .form-control::placeholder {
    color: rgba(255, 255, 255, 0.4);
}

.glass-input .form-control:focus {
    background: transparent;
    color: white;
}

.cursor-pointer {
    cursor: pointer;
}

/* Checkbox */
.custom-checkbox .form-check-input {
    background-color: transparent;
    border-color: rgba(255, 255, 255, 0.4);
    border-radius: 4px;
    cursor: pointer;
}

.custom-checkbox .form-check-input:checked {
    background-color: var(--primary-orange);
    border-color: var(--primary-orange);
}

.custom-checkbox .form-check-input:focus {
    box-shadow: 0 0 0 3px rgba(255, 140, 0, 0.25);
}

/* Button */
.btn-login {
    background: var(--gradient-orange);
    border: none;
    border-radius: 8px;
    padding: 12px;
    font-size: 1.1rem;
    transition: transform 0.2s, box-shadow 0.2s, background 0.2s;
}

.btn-login:hover {
    transform: translateY(-2px);
    box-shadow: 0 10px 20px rgba(255, 140, 0, 0.4);
    background: linear-gradient(90deg, #ffa333 0%, #e65c00 100%);
}

.btn-login:active {
    transform: translateY(0);
}

/* Footer separator */
.border-secondary {
    border-color: rgba(255, 255, 255, 0.1) !important;
}

/* Responsive Overrides */
@media (max-width: 991px) {
    .bg-overlay {
        background: linear-gradient(180deg, rgba(0, 0, 0, 0.8) 0%, rgba(0, 0, 0, 0.9) 100%);
    }
    .feature-box {
        margin-bottom: 1rem;
    }
}
    </style>
  <link rel="stylesheet" href="CSS/light_theme.css?v=26.0">
</head>
<body>

    <div class="main-container">
        <!-- Background Overlay -->
        <div class="bg-overlay"></div>
        
        <!-- Centered Container Layout -->
        <div class="container content-wrapper py-5 d-flex align-items-center">
            <div class="row align-items-center justify-content-center w-100 m-0">
                
                <!-- Left Side: Branding & Features -->
                <div class="col-lg-6 col-md-10 mb-5 mb-lg-0 left-panel pe-lg-5">
                    <!-- Logo Area -->
                    <div class="logo-area mb-4 d-flex align-items-center justify-content-center justify-content-lg-start">
                        <div class="logo-icon me-3 position-relative">
                            <!-- Using the uploaded logo. Please save the image as 'logo.jpg' or 'logo.png' in this folder -->
                            <img src="Images/restrologo.png" alt="RMS Logo" style="width: 130px; height: 130px; object-fit: cover; background-color: transferant; border-radius: 50%; padding: 5px;">
                        </div>
                        <div>
                            <h1 class="logo-text text-warning mb-0 fw-bold" style="font-size: 3rem; line-height: 1;">RMS</h1>
                            <h4 class="logo-subtext text-white mb-0 fw-bold mt-1" style="letter-spacing: 2px;">RESTAURANT</h4>
                            <small class="text-white fw-light" style="letter-spacing: 1px; font-size: 0.75rem;">MANAGEMENT SYSTEM</small>
                        </div>
                    </div>
                    
                    <!-- Slogan -->
                    <h1 class="slogan fw-bold text-white mb-3 text-center text-lg-start" style="font-size: 2.8rem;">
                        Smart Management,<br>
                        <span class="text-warning">Better</span> Restaurant
                    </h1>
                    <p class="description text-light mb-5 fs-5 fw-light text-center text-lg-start" style="opacity: 0.8;">
                        All-in-one solution to manage your<br class="d-none d-lg-block">restaurant operations efficiently.
                    </p>
                    
                    <!-- Feature Boxes (2x2 grid on mobile) -->
                    <div class="row g-3 feature-boxes pe-lg-5 justify-content-center">
                        <div class="col-6 col-sm-3">
                            <div class="feature-box text-center p-3 h-100 d-flex flex-column justify-content-center align-items-center">
                                <i class="fa-solid fa-bell-concierge text-warning fs-3 mb-2"></i>
                                <p class="mb-0 text-light small fw-light">Order<br>Management</p>
                            </div>
                        </div>
                        <div class="col-6 col-sm-3">
                            <div class="feature-box text-center p-3 h-100 d-flex flex-column justify-content-center align-items-center">
                                <i class="fa-solid fa-chair text-warning fs-3 mb-2"></i>
                                <p class="mb-0 text-light small fw-light">Table<br>Management</p>
                            </div>
                        </div>
                        <div class="col-6 col-sm-3">
                            <div class="feature-box text-center p-3 h-100 d-flex flex-column justify-content-center align-items-center">
                                <i class="fa-solid fa-fire-burner text-warning fs-3 mb-2"></i>
                                <p class="mb-0 text-light small fw-light">Kitchen<br>Display</p>
                            </div>
                        </div>
                        <div class="col-6 col-sm-3">
                            <div class="feature-box text-center p-3 h-100 d-flex flex-column justify-content-center align-items-center">
                                <i class="fa-solid fa-file-invoice-dollar text-warning fs-3 mb-2"></i>
                                <p class="mb-0 text-light small fw-light">Billing &<br>Payments</p>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Right Side: Login Form -->
                <div class="col-lg-5 offset-lg-1 col-md-8 mx-md-auto z-index-2">
                    <div class="login-card glass-panel p-4 p-md-5">
                        <!-- User Icon -->
                        <div class="text-center mb-4">
                            <div class="user-avatar mx-auto mb-3">
                                <i class="fa-solid fa-user text-white fs-1"></i>
                            </div>
                            <h3 class="text-white fw-semibold mb-1">Welcome Back!</h3>
                            <p class="text-light-50 fw-light" style="font-size: 0.9rem;">Sign in to continue to your account</p>
                        </div>

                        <!-- Form -->
                        <form id="loginForm">
                            <div class="mb-4">
                                <label class="form-label text-light fw-light small mb-2">Email Address</label>
                                <div class="input-group glass-input">
                                    <span class="input-group-text"><i class="fa-solid fa-envelope text-warning"></i></span>
                                    <input type="email" id="emailInput" class="form-control text-light" placeholder="Enter Email" required>
                                </div>
                            </div>
                            
                            <div class="mb-4">
                                <label class="form-label text-light fw-light small mb-2">Password</label>
                                <div class="input-group glass-input">
                                    <span class="input-group-text"><i class="fa-solid fa-lock text-warning"></i></span>
                                    <input type="password" class="form-control text-light" id="passwordInput" placeholder="Enter Password" required>
                                    <span class="input-group-text cursor-pointer toggle-password" style="border-left: none;">
                                        <i class="fa-regular fa-eye text-light-50" id="toggleIcon"></i>
                                    </span>
                                </div>
                            </div>
                            
                            <div class="d-flex justify-content-between align-items-center mb-4 mt-3">
                                <div class="form-check custom-checkbox d-flex align-items-center m-0">
                                    <input class="form-check-input m-0 me-2" type="checkbox" id="rememberMe">
                                    <label class="form-check-label text-light fw-light small" for="rememberMe" style="opacity: 0.8;">
                                        Remember Me
                                    </label>
                                </div>
                                <a href="#" class="text-warning text-decoration-none small fw-light">Forgot Password?</a>
                            </div>
                            
                            <div id="loginMessage" class="mt-2 mb-3 text-center small fw-bold" style="display: none;"></div>
                            
                            
                            <button type="submit" class="btn btn-warning w-100 py-2 fw-bold text-white btn-login mb-4 d-flex justify-content-center align-items-center">
                                <i class="fa-solid fa-arrow-right-to-bracket me-2"></i> <span style="letter-spacing: 1px;">ACCESS DASHBOARD</span>
                            </button>
                        </form>
                        
                        <!-- Footer -->
                        <div class="text-center mt-3 pt-3">
                            <small class="text-light-50 fw-light" style="font-size: 0.8rem; color: #9ca3af !important;">
                                <i class="fa-solid fa-shield-halved text-warning me-1"></i> Secure access for authorized staff only.
                            </small>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
    document.getElementById('loginForm').addEventListener('submit', function(e) {
        e.preventDefault();
        
        const email = document.getElementById('emailInput').value;
        const password = document.getElementById('passwordInput').value;
        
        const loginData = {
            email: email,
            password: password
        };
        
        // Make sure to use the correct port for the backend (e.g. 8082)
        fetch('http://localhost:8082/api/login', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(loginData)
        })
        .then(response => response.json())
        .then(data => {
            if(data.success) {
                // Show Success Message
                const msgBox = document.getElementById('loginMessage');
                msgBox.style.display = 'block';
                msgBox.className = 'mt-2 mb-3 text-center small fw-bold text-success';
                msgBox.innerHTML = '<i class="fa-solid fa-circle-check"></i> Login Successful!';
                
                // Save token, role and name in localStorage
                if (data.token) {
                    localStorage.setItem('token', data.token);
                }
                localStorage.setItem('adminName', data.name);
                localStorage.setItem('userRole', data.role);
                if (data.staffId) {
                    localStorage.setItem('staffId', data.staffId);
                }
                
                // Role-based redirection is for UX routing only; real security is enforced by backend JWT
                setTimeout(() => {
                    if(data.role.toUpperCase() === "ADMIN") {
                        window.location.href = "AdminDashboard.jsp";
                    } else if(data.role.toUpperCase() === "WAITER" || data.role.toUpperCase() === "WEITER") {
                        window.location.href = "WaiterDashboard.jsp";
                    } else if(data.role.toUpperCase() === "CHEF" || data.role.toUpperCase() === "CHEAF") {
                        window.location.href = "ChefDashboard.jsp";
                    } else if(data.role.toUpperCase() === "RECEPTIONIST") {
                        window.location.href = "ReceptionistDashboard.jsp";
                    } else {
                        msgBox.className = 'mt-2 mb-3 text-center small fw-bold text-danger';
                        msgBox.innerHTML = '<i class="fa-solid fa-circle-exclamation"></i> Role not recognized!';
                    }
                }, 800);
            } else {
                const msgBox = document.getElementById('loginMessage');
                msgBox.style.display = 'block';
                msgBox.className = 'mt-2 mb-3 text-center small fw-bold text-danger';
                msgBox.innerHTML = '<i class="fa-solid fa-circle-xmark"></i> ' + (data.message || "Login failed");
            }
        })
        .catch(error => {
            console.error('Error:', error);
            const msgBox = document.getElementById('loginMessage');
            msgBox.style.display = 'block';
            msgBox.className = 'mt-2 mb-3 text-center small fw-bold text-danger';
            msgBox.innerHTML = '<i class="fa-solid fa-plug-circle-xmark"></i> Connection error. Is the backend running?';
        });
    });
    </script>
<script src="JS/theme.js?v=4.0"></script>
</body>
</html>






