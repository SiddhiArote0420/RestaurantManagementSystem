/**
 * Global API Client Configuration
 * Real security and authorization are enforced by the backend using verified JWTs.
 */
const API_BASE = 'http://localhost:8082/api';

/**
 * apiFetch wraps fetch to:
 * - Prepend API_BASE if a relative path is provided
 * - Attach Authorization: Bearer <token>
 * - Attach Content-Type: application/json if a request body is present (and not FormData)
 * - On 401: Clear localStorage and redirect to HomePage.jsp
 * - On 403: Show an access denied message without crashing the page
 */
async function apiFetch(path, options = {}) {
    let url = path;
    if (!url.startsWith('http://') && !url.startsWith('https://')) {
        if (!url.startsWith('/')) {
            url = '/' + url;
        }
        url = API_BASE + url;
    }

    const headers = Object.assign({}, options.headers || {});

    // Attach Bearer token from localStorage
    const token = localStorage.getItem('token');
    if (token) {
        headers['Authorization'] = 'Bearer ' + token;
    }

    // Attach Content-Type if body is present and not FormData and not already set
    if (options.body && !headers['Content-Type'] && !(options.body instanceof FormData)) {
        headers['Content-Type'] = 'application/json';
    }

    const fetchOptions = {
        ...options,
        headers: headers
    };

    try {
        const response = await fetch(url, fetchOptions);

        if (response.status === 401) {
            localStorage.clear();
            window.location.href = 'HomePage.jsp';
            return response;
        }

        if (response.status === 403) {
            console.warn('Access denied (HTTP 403):', url);
            const msg = 'Access denied: You do not have permission to perform this action.';
            if (typeof showToast === 'function') {
                showToast(msg, 'error');
            } else {
                alert(msg);
            }
            return response;
        }

        return response;
    } catch (error) {
        console.error('apiFetch request failed:', error);
        throw error;
    }
}