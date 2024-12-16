<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - CarMatePro</title>
    <style>
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
            justify-content: space-between;
            min-height: 100vh;
            overflow-x: hidden;
        }

        .navbar {
            width: 100%;
            height: 75px;
            background-color: #4a90e2;
            display: flex;
            align-items: center;
            padding: 0 20px;
            position: fixed;
            top: 0;
            left: 0;
            z-index: 1000;
        }

        .logo {
            color: #fff;
            font-size: 35px;
            font-family: Arial;
        }

        .menu {
            display: flex;
            margin-left: auto;
        }

        ul {
            display: flex;
        }

        ul li {
            list-style: none;
            margin-left: 30px;
        }

        ul li a {
            text-decoration: none;
            color: #fff;
            font-family: Arial;
            font-weight: bold;
            transition: 0.4s ease-in-out;
        }

        ul li a:hover {
            color: #fff;
        }

        .main-content {
            flex: 1;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding-top: 100px; /* Height of the navbar */
            padding-bottom: 75px; /* Space for footer */
        }

        .contact-info {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        .contact-info h2 {
            font-size: 32px;
            margin-bottom: 10px;
            color: #4a90e2;
        }

        .contact-info p {
            font-size: 18px;
            margin-bottom: 5px;
        }

        .contact-info p strong {
            color: #333;
        }

        .contact-queries {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            width: 100%;
            max-width: 1200px;
            margin-top: 20px;
        }

        .contact-container {
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 500px;
            margin-right: 20px;
        }

        .contact-container h3 {
            margin-bottom: 20px;
            color: #333;
            font-size: 24px;
            font-weight: 600;
            text-align: center;
        }

        .contact-container label {
            display: block;
            margin-bottom: 5px;
            color: #666;
            text-align: left;
            font-weight: 500;
        }

        .contact-container input,
        .contact-container textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 16px;
        }

        .contact-container button {
            background-color: #4a90e2;
            color: #fff;
            padding: 12px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 18px;
            transition: background-color 0.3s;
            width: 100%;
        }

        .contact-container button:hover {
            background-color: #357ABD;
        }

        .footer {
            width: 100%;
            background: #333;
            color: #fff;
            text-align: center;
            padding: 20px 0;
            position: fixed;
            bottom: 0;
            left: 0;
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

        .query-table {
            width: 100%;
            max-width: 500px;
            border-collapse: collapse;
            background-color: #fff;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .query-table th, .query-table td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: left;
        }

        .query-table th {
            background-color: #4a90e2;
            color: white;
        }

        .query-table tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .query-table tr:hover {
            background-color: #f1f1f1;
        }
    </style>
</head>
<body>

    <div class="navbar">
        <h2 class="logo">CarMatePro</h2>
        <div class="menu">
            <ul>
                <li><a href="FetchCompanies">HOME</a></li>
            </ul>
        </div>
    </div>

    <div class="main-content">
        <div class="contact-info">
            <h2>Contact Us</h2>
            <p>If you have any questions or need further information, please don't hesitate to contact us.<br> You can reach us by phone, email, or by filling out the form below. Our team is here to assist you.</p>
            <p><strong>Phone:</strong> +91 9988998899</p>
            <p><strong>Email:</strong> info@carmatepro.com</p>
        </div>

        <div class="contact-queries">
            <div class="contact-container">
                <h3>Send Us a Message</h3>
                <form action="Contactus1.jsp" method="post">
                    <label for="name">Name:</label>
                    <input type="text" id="name" name="name" required>
                    
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" required>
                    
                    <label for="query">Query:</label>
                    <textarea id="query" name="query" rows="4" required></textarea>
                    
                    <button type="submit">Submit</button>
                </form>
            </div>

            <div>
                <h3>Your Queries</h3>
                <table class="query-table">
                    <tr>
                        <th>Query</th>
                        <th>Answer</th>
                    </tr>
                    <% 
                        String email = (String) session.getAttribute("email");
                        if (email == null) {
                    %>
                    <tr>
                        <td colspan="2">Please log in to view your queries.</td>
                    </tr>
                    <% 
                        } else {
                            Connection con = null;
                            PreparedStatement pstmt = null;
                            ResultSet rs = null;
                            try {
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/epproject", "root", "Kavyasri@142005");
                                pstmt = con.prepareStatement("SELECT query, answer FROM contactus WHERE email=?");
                                pstmt.setString(1, email);
                                rs = pstmt.executeQuery();
                                while (rs.next()) {
                    %>
                    <tr>
                        <td><%= rs.getString("query") %></td>
                        <td><%= rs.getString("answer") %></td>
                    </tr>
                    <% 
                                }
                            } catch (Exception e) {
                                e.printStackTrace();
                    %>
                    <tr>
                        <td colspan="2">Error loading your queries. Please try again later.</td>
                    </tr>
                    <% 
                            } finally {
                                try {
                                    if (rs != null) rs.close();
                                    if (pstmt != null) pstmt.close();
                                    if (con != null) con.close();
                                } catch (SQLException e) {
                                    e.printStackTrace();
                                }
                            }
                        }
                    %>
                </table>
            </div>
        </div>
    </div>

    <div class="footer">
        <p>&copy; 2024 CarMatePro. All Rights Reserved. | <a href="#">Privacy Policy</a> | <a href="#">Terms of Service</a></p>
    </div>

</body>
</html>
