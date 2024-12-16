<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.ResultSet, java.sql.SQLException, java.sql.Statement" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Reviews - CarMatePro</title>
    <style>
        /* Reset and basic styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        /* Navbar styles */
        .navbar {
            background-color: #4a90e2;
            color: #fff;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 20px;
        }

        .logo {
            font-size: 35px;
            font-family: Arial;
        }

        .menu ul {
            display: flex;
            list-style-type: none;
        }

        .menu ul li {
            margin-left: 20px;
        }

        .menu ul li a {
            text-decoration: none;
            color: #fff;
            font-weight: bold;
            transition: color 0.3s ease;
        }

        .menu ul li a:hover {
            color: #ff7200;
        }

        /* Main content area */
        .main-content {
            flex: 1;
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .review-item {
            margin-bottom: 20px;
            padding: 15px;
            border: 1px solid #ddd;
            border-radius: 8px;
        }

        .review-item h2 {
            font-size: 20px;
            margin-bottom: 10px;
            color: #333;
        }

        .review-item p {
            font-size: 16px;
            color: #666;
        }

        /* Footer styles */
        .footer {
            background: #333;
            color: #fff;
            text-align: center;
            padding: 20px 0;
            position: relative;
            bottom: 0;
            width: 100%;
        }

        .footer p {
            margin: 0;
            padding: 0;
            font-family: Arial, Helvetica, sans-serif;
            font-size: 14px;
        }

        .footer a {
            color: #4a90e2;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .footer a:hover {
            color: #fff;
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <div class="navbar">
        <h2 class="logo">CarMatePro FeedBack</h2>
        <div class="menu">
            <ul>
                <li><a href="adminpage.html">Home</a></li>
            </ul>
        </div>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <h1>Customer Reviews</h1>

        <% 
            // Database connection
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/epproject", "root", "Kavyasri@142005");
                stmt = conn.createStatement();
                String sql = "SELECT name, feedback FROM feedback";
                rs = stmt.executeQuery(sql);

                while (rs.next()) {
                    String name = rs.getString("name");
                    String feedback = rs.getString("feedback");
        %>
        <div class="review-item">
            <h2><%= name %></h2>
            <p><%= feedback %></p>
        </div>
        <% 
                }
            } catch (Exception e) {
                e.printStackTrace();
                %>
                <p>Error fetching reviews. Please try again later.</p>
                <%
            } finally {
                try {
                    if (rs != null) rs.close();
                    if (stmt != null) stmt.close();
                    if (conn != null) conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        %>
    </div>

    <!-- Footer -->
    <div class="footer">
        <p>&copy; 2024 CarMatePro. All Rights Reserved. | <a href="#">Privacy Policy</a> | <a href="#">Terms of Service</a></p>
    </div>
</body>
</html>
