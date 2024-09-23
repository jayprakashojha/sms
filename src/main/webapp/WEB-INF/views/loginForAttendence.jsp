<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <style>
        /* Global Styles */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #e9ecef;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .login-container {
            background: #ffffff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
            text-align: center;
            position: relative;
        }

        .login-container::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 8px;
            background: #007bff;
            border-top-left-radius: 12px;
            border-top-right-radius: 12px;
        }

        h2 {
            margin-bottom: 20px;
            color: #333;
            font-size: 24px;
            font-weight: 600;
        }

        .form-group {
            margin-bottom: 20px;
            text-align: left;
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #555;
            font-weight: 500;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 12px;
            border: 1px solid #ced4da;
            border-radius: 6px;
            font-size: 16px;
            box-sizing: border-box;
        }

        input[type="text"]:focus,
        input[type="password"]:focus {
            border-color: #007bff;
            outline: none;
        }

        .btn-submit {
            background-color: #007bff;
            color: #ffffff;
            border: none;
            padding: 12px 20px;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
            font-weight: 600;
            transition: background-color 0.3s ease;
        }

        .btn-submit:hover {
            background-color: #0056b3;
        }

        .error-message {
            margin-top: 20px;
            color: #dc3545;
            font-size: 14px;
        }

        @media (max-width: 600px) {
            .login-container {
                padding: 20px;
                border-radius: 8px;
            }

            h2 {
                font-size: 20px;
            }

            .btn-submit {
                padding: 10px 18px;
                font-size: 14px;
            }
        }
    </style>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const form = document.getElementById('loginForm');

            form.addEventListener('submit', function(event) {
                const username = document.getElementById('username').value.trim();
                const password = document.getElementById('password').value.trim();

                if (username === '' || password === '') {
                    event.preventDefault();
                    alert('Please fill in both fields.');
                }
            });
        });
    </script>
</head>
<body>
    <div class="login-container">
        <h2>Login to Your Account</h2>
        <form id="loginForm" action="LoginServlet" method="POST">
            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" required>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>
            </div>
            <button type="submit" class="btn-submit">Login</button>
        </form>
        <%-- Display error message if any --%>
        <c:if test="${not empty errorMessage}">
            <div class="error-message">
                ${errorMessage}
            </div>
        </c:if>
    </div>
</body>
</html>