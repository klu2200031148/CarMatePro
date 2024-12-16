<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.sql.*, java.util.*, java.io.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cars by Company</title>
  <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            color: #333;
        }
        .navbar {
            width: 99%;
            height: 75px;
            background-color: #4a90e2;
            display: flex;
            align-items: center;
            padding: 0 20px;
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
            color: #d1ecf1;
        }
        .content {
            flex-grow: 1;
            color: #333;
            text-align: center;
            padding: 40px 10px;
        }
        .content h1 {
            font-family: 'Times New Roman', serif;
            font-size: 40px;
            margin-bottom: 20px;
        }
        .car-list {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 20px;
        }
        .car-item {
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 10px;
            padding: 20px;
            width: 80%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            transition: box-shadow 0.3s ease;
        }
        .car-item:hover {
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }
        .car-item img {
            max-width: 200px;
            border-radius: 10px;
        }
        .car-details {
            flex-grow: 1;
            padding-left: 20px;
            text-align: left;
        }
        .car-details p {
            margin: 5px 0;
        }
        .more-info-btn {
            margin-top: 10px;
            padding: 10px 15px;
            background-color: #4a90e2;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .more-info-btn:hover {
            background-color: #357ab7;
        }
        .footer {
            background-color: #333;
            color: #f2f2f2;
            text-align: center;
            padding: 10px;
            position: fixed;
            left: 0;
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
    <div class="navbar">
        <h2 class="logo">CarMatePro</h2>
        <div class="menu">
            <ul>
                <li><a href="FetchCompanies">HOME</a></li>
                
            </ul>
        </div>
    </div>
    
    <div class="content">
        <h1>Cars by ${param.company}</h1>
        <div class="car-list">
            <%
                String company = request.getParameter("company");
                if (company == null || company.isEmpty()) {
                    out.println("No company specified.");
                } else {
                    Connection conn = null;
                    Statement stmt = null;
                    ResultSet rs = null;

                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/epproject", "root", "Kavyasri@142005");
                        stmt = conn.createStatement();
                        String sql = "SELECT carcategory, carname, carimage, price, otherdetails FROM cars WHERE companyname='" + company + "'";
                        rs = stmt.executeQuery(sql);
                        
                        boolean hasResults = false;
                        while (rs.next()) {
                            hasResults = true;                           
                            String category = rs.getString("carcategory");
                            String carname = rs.getString("carname");
                            String image = rs.getString("carimage");
                            String price = rs.getString("price");
                            String details = rs.getString("otherdetails");
            %>
                            <div class="car-item">
                                <img src="<%= image %>" alt="<%= category %>">
                                <div class="car-details">
                                    <p><strong>Category:</strong> <%= category %></p>
                                    <p><strong>Carname:</strong> <%= carname %></p>
                                    <p><strong>Price:</strong> ₹<%= price %></p>
                                    <p><strong>About Car:</strong> <%= details %></p>
                                    <form action="CarDetails.jsp" method="GET">
                                        <input type="hidden" name="companyname" value="<%= company %>">
                                        <input type="hidden" name="carname" value="<%= carname %>">
                                        <button type="submit" class="more-info-btn">More Info</button>
                                    </form>
                                </div>
                            </div>
            <%
                        }
                        if (!hasResults) {
                            out.println("No cars available for this company.");
                        }
                    } catch (Exception e) {
                        StringWriter sw = new StringWriter();
                        PrintWriter pw = new PrintWriter(sw);
                        e.printStackTrace(pw);
                        out.println("Error: " + sw.toString());

                        // Print debugging information
                        try (ResultSet rsCols = stmt.executeQuery("SHOW COLUMNS FROM cars")) {
                            out.println("<br/>Columns in 'cars' table:<br/>");
                            while (rsCols.next()) {
                                out.println(rsCols.getString("Field") + "<br/>");
                            }
                        } catch (SQLException se) {
                            StringWriter sw2 = new StringWriter();
                            PrintWriter pw2 = new PrintWriter(sw2);
                            se.printStackTrace(pw2);
                            out.println("Error: " + sw2.toString());
                        }
                    } finally {
                        try {
                            if (rs != null) rs.close();
                            if (stmt != null) stmt.close();
                            if (conn != null) conn.close();
                        } catch (SQLException se) {
                            StringWriter sw3 = new StringWriter();
                            PrintWriter pw3 = new PrintWriter(sw3);
                            se.printStackTrace(pw3);
                            out.println("Error: " + sw3.toString());
                        }
                    }
                }
            %>
        </div>
    </div>
      
    <div class="footer">
        <p>&copy; 2024 CarMatePro. All Rights Reserved. | <a href="#">Privacy Policy</a> | <a href="#">Terms of Service</a></p>
    </div>
</body>
</html>
