<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Car Details - CarMatePro</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }
        .navbar {
            background-color: #4a90e2;
            color: #fff;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 20px;
            position: fixed;
            width: 98%;
            top: 0;
            z-index: 1000;
        }
        .logo {
            font-size: 35px;
            font-family: 'Arial';
        }
        .menu ul {
            display: flex;
            list-style-type: none;
            margin: 0;
            padding: 0;
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
        .container {
            margin: 100px auto 50px;
            width: 90%;
            max-width: 1000px;
            background-color: #fff;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }
        .car-details {
            display: flex;
            margin-bottom: 20px;
        }
        .car-image {
            flex: 1;
            padding: 10px;
        }
        .car-image img {
            width: 100%;
            border-radius: 10px;
        }
        .car-info {
            flex: 2;
            padding: 10px;
        }
        .car-info h2 {
            margin-top: 0;
            font-size: 28px;
            color: #333;
        }
        .car-info p {
            font-size: 18px;
            margin: 5px 0;
            color: #555;
        }
        .info-section {
            margin-top: 20px;
        }
        .info-section h3 {
            font-size: 24px;
            color: #333;
            margin-bottom: 10px;
        }
        .info-section p {
            font-size: 16px;
            color: #555;
            white-space: pre-wrap; /* Preserves whitespace and line breaks */
        }
        .info-section .two-columns {
            display: flex;
            flex-wrap: wrap;
        }
        .info-section .column {
            flex: 1;
            padding: 10px;
            box-sizing: border-box;
        }
        .interior-section {
            margin-top: 20px;
        }
        .interior-section .image-container {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }
        .interior-section .image-container:nth-child(even) .interior-image {
            order: 1;
            margin-right: 20px;
        }
        .interior-section .image-container:nth-child(even) .interior-desc {
            order: 2;
        }
        .interior-section .image-container:nth-child(odd) .interior-image {
            order: 2;
            margin-left: 20px;
        }
        .interior-section .image-container:nth-child(odd) .interior-desc {
            order: 1;
        }
        .interior-section .interior-image {
            flex: 1;
        }
        .interior-section .interior-image img {
            width: 100%;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .interior-section .interior-desc {
            flex: 1;
            font-size: 16px;
            color: #555;
            padding: 10px;
        }
      
        .review-box {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            margin-top: 20px;
        }
        .review-box .review-item {
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 10px;
            width: calc(50% - 10px);
            box-sizing: border-box;
        }
        .review-box .review-item p {
            margin: 0;
        }
        .review-box .review-header {
            font-weight: bold;
            margin-bottom: 5px;
        }
        .two-columns {
            display: flex;
            justify-content: space-between;
        }
        .two-columns .column {
            width: 48%;
        }
        .interior-section .image-container {
            display: flex;
            margin-bottom: 20px;
        }
        .interior-section .interior-image {
            width: 50%;
            padding-right: 10px;
        }
        .interior-section .interior-desc {
            width: 50%;
        }
        .interior-section .interior-image img {
            width: 100%;
        }
        .review-form {
            margin-top: 20px;
            padding: 20px;
            border-radius: 10px;
            background-color: #f9f9f9;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .review-form h3 {
            margin-top: 0;
            color: #333;
        }
        .review-form input, .review-form textarea {
            width: 100%;
            padding: 10px;
            margin: 5px 0;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        .review-form button {
            background-color: #4a90e2;
            color: #fff;
            border: none;
            padding: 10px;
            border-radius: 5px;
            cursor: pointer;
        }
        .review-form button:hover {
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
</head>
<body>
    <div class="navbar">
        <div class="logo">CarMatePro</div>
            
    </div>
    <div class="container">
        <% 
        String companyName = request.getParameter("companyname");
        String carName = request.getParameter("carname");
        try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/epproject", "root", "Kavyasri@142005");
             PreparedStatement pstmt = con.prepareStatement("SELECT * FROM cars WHERE companyname=? AND carname=?")) {
            pstmt.setString(1, companyName);
            pstmt.setString(2, carName);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                String carCategory = rs.getString("carcategory");
                String carImage = rs.getString("carimage");
                String price = rs.getString("price");
        %>
        <div class="car-details">
            <div class="car-image">
                <img src="<%=carImage%>" alt="<%=carName%>">
            </div>
            <div class="car-info">
                <h2><%=carName%></h2>
                <p><strong>Company:</strong> <%=companyName%></p>
                <p><strong>Category:</strong> <%=carCategory%></p>
                <p><strong>Price:</strong> ₹<%=price%></p>
            </div>
        </div>
        <% 
            }
        } catch(Exception e) {
            out.println(e);
        }
        %>
        <div class="info-section">
            <h3>Specifications</h3>
            <div class="two-columns">
                <% 
                try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/epproject", "root", "Kavyasri@142005");
                     PreparedStatement pstmt = con.prepareStatement("SELECT * FROM caradditionalinfo WHERE companyname=? AND carname=?")) {
                    pstmt.setString(1, companyName);
                    pstmt.setString(2, carName);
                    ResultSet rs = pstmt.executeQuery();
                    if (rs.next()) {
                        String specifications = rs.getString("specifications");
                        String features = rs.getString("features");
                        String expertReview = rs.getString("expert_review");
                %>
                <div class="column">
                    <p><%=specifications%></p>
                </div>
                <div class="column">
                    <p><%=features%></p>
                </div>
            </div>
        </div>
        <div class="info-section">
            <h3>Overview</h3>
            <p><%=expertReview%></p>
        </div>
        <div class="interior-section">
            <h3>Interior Images</h3>
            <% 
                for (int i = 1; i <= 4; i++) {
                    String interiorImage = rs.getString("interior_image" + i);
                    String interiorDesc = rs.getString("interior_desc" + i);
                    if (interiorImage != null && interiorDesc != null) {
            %>
            <div class="image-container">
                <div class="interior-image">
                    <img src="<%=interiorImage%>" alt="Interior Image <%=i%>">
                </div>
                <div class="interior-desc">
                    <p><%=interiorDesc%></p>
                </div>
            </div>
            <% 
                    }
                }
            %>
        </div>
        <% 
            }
        } catch(Exception e) {
            out.println(e);
        }
        %>
        <div class="info-section">
            <h3>Customer Reviews</h3>
            <div class="review-box">
                <% 
                try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/epproject", "root", "Kavyasri@142005");
                     PreparedStatement pstmt = con.prepareStatement("SELECT * FROM reviews WHERE companyname=? AND carname=?")) {
                    pstmt.setString(1, companyName);
                    pstmt.setString(2, carName);
                    ResultSet rs = pstmt.executeQuery();
                    while (rs.next()) {
                        String email = rs.getString("email");
                        String review = rs.getString("review");
                %>
                <div class="review-item">
                    <p class="review-header"><%=email%></p>
                    <p><%=review%></p>
                </div>
                <% 
                    }
                } catch(Exception e) {
                    out.println(e);
                }
                %>
            </div>
        </div>
        <div class="info-section">
            <h3>Leave a Review</h3>
            <form class="review-form" method="post" action="SubmitReview.jsp">
                <input type="hidden" name="companyname" value="<%=companyName%>">
                <input type="hidden" name="carname" value="<%=carName%>">
                <input type="email" name="email" placeholder="Your Email" required>
                <textarea name="review" placeholder="Your Review" rows="4" required></textarea>
                <button type="submit">Submit</button>
            </form>
        </div>
    </div>
    <div class="footer">
        <p>&copy; 2024 CarMatePro. All rights reserved. <a href="#">Privacy Policy</a> | <a href="#">Terms of Service</a></p>
    </div>
</body>
</html>
