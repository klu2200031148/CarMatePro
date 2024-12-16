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
            width: 60%;
            margin: 60px auto;
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
        function confirmDelete(name) {
            if (confirm("Are you sure you want to delete this Company?")) {
                window.location.href = "DeleteCompany.jsp?name=" + name;
            }
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
                <li><a href="Addcompany.html">Add Company</a></li>
                <li><a href="index.html">Logout</a></li> <!-- Link to add admin page -->
            </ul>
        </div>
    </div>

    <div class="content">
        <!-- Admins Table -->
        <div class="table-container">
            <h3 align="center"><u>Company List</u></h3>
            <table>
                <tr bgcolor="lightblue">
                    <th>Company Name</th>
                    <th>Delete</th>
                </tr>
                <% 
                try {
                    Connection con = null;
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/epproject", "root", "Kavyasri@142005");
                    PreparedStatement pstmt = con.prepareStatement("SELECT * FROM company");
                    ResultSet rs = pstmt.executeQuery();

                    while (rs.next()) {
                %>
                <tr>
    
                    <td><%=rs.getString("name")%></td>
                    <td><button onclick="confirmDelete('<%=rs.getString("name")%>')">Delete</button></td>
                    
                    
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
   
    <!-- Footer -->
    <div class="footer">
        <p>&copy; 2024 CarMatePro. All rights reserved. | <a href="#">Privacy Policy</a> | <a href="#">Terms of Service</a></p>
    </div>
</body>
</html>