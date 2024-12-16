<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Registered Users and Admins</title>
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

        .content {
            flex: 1;
            padding: 20px;
        }

        .table-container {
            margin-bottom: 40px;
        }

        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }

        th {
            background-color: #4a90e2;
            color: white;
        }

        .user-table th {
            background-color: lightblue;
            color: #333;
        }

        .user-table td {
            background-color: #f9f9f9;
        }

        button {
            padding: 5px 10px;
            color: #fff;
            background-color: #4a90e2;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #357abd;
        }

        .footer {
            background-color: #333;
            color: #f2f2f2;
            text-align: center;
            padding: 10px;
            width: 100%;
            position: fixed;
            bottom: 0;
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
    <script>
    function replyquery(id, email) {
        var url = "ReplyQuery.jsp?id=" + encodeURIComponent(id) + "&email=" + encodeURIComponent(email);
        window.location.href = url;
    }
    </script>
</head>
<body>
    <!-- Navbar -->
    <div class="navbar">
        <div class="logo">CarMatePro</div>
        <div class="menu">
            <ul>
                <li><a href="adminpage.html">Home</a></li>
            </ul>
        </div>
    </div>

    <div class="content">
        <!-- Admins Table -->
        <div class="table-container">
            <h3 align="center"><u>View Registered Admins</u></h3>
            <table>
                <tr bgcolor="lightblue">
                   <th>Id</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Query</th>
                    <th>Answer</th>
                    <th>Action</th>
                </tr>
                <% 
                try {
                    Connection con = null;
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/epproject", "root", "Kavyasri@142005");
                    PreparedStatement pstmt = con.prepareStatement("SELECT * FROM contactus");
                    ResultSet rs = pstmt.executeQuery();

                    while (rs.next()) {
                %>
                <tr>
                    <td><%=rs.getString("id") %></td>
                    <td><%=rs.getString("name")%></td>
                    <td><%=rs.getString("email")%></td>
                    <td><%=rs.getString("query")%></td>
                    <td><%=rs.getString("answer")%></td>
                    <td><button onclick="replyquery('<%=rs.getString("id") %>', '<%=rs.getString("email") %>')">Reply</button></td>
                </tr>
                <% 
                    }
                } catch(Exception e) {
                    out.println(e);
                } 
                %>
            </table>
        </div>
    </div>

    <!-- Hidden Form for Redirecting -->
    <form id="replyForm" action="ReplyQuery.jsp" method="get" style="display: none;">
        <input type="hidden" id="emailInput" name="email" value="">
    </form>
    
    <!-- Footer -->
    <div class="footer">
        <p>&copy; 2024 CarMatePro. All rights reserved. | <a href="#">Privacy Policy</a> | <a href="#">Terms of Service</a></p>
    </div>
</body>
</html>
