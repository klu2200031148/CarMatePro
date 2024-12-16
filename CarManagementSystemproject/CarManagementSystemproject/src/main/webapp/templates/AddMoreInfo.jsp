<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add More Info - CarMatePro</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
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
            width: 99%;
            top: 0;
            z-index: 1000;
        }
        .logo {
            font-size: 35px;
            font-family: Arial;
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
        .form-container {
            background-color: #fff;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            width: 90%;
            max-width: 800px;
            margin: 100px auto 50px; /* Adjusted margin to fit within the viewport */
        }
        .form-container h2 {
            margin-bottom: 20px;
            font-size: 28px;
            text-align: center;
            color: #333;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            margin-bottom: 5px;
            display: block;
            font-weight: bold;
            font-size: 16px;
            color: #333;
        }
        .form-container input, .form-container textarea {
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 8px;
            width: 100%;
            box-sizing: border-box;
            font-size: 16px;
            background-color: #f9f9f9;
        }
        .form-container textarea {
            resize: vertical;
            height: 120px;
        }
        .form-container button {
            padding: 12px 20px;
            color: #fff;
            background-color: #4a90e2;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
            width: 100%;
            margin-top: 10px;
        }
        .form-container button:hover {
            background-color: #357abd;
        }
        .form-container h3 {
            margin-top: 20px;
            font-size: 20px;
            color: #333;
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
        <div class="menu">
            <ul>
                <li><a href="adminpage.html">Home</a></li>
            </ul>
        </div>
    </div>
    <div class="form-container">
        <h2>Add More Info for <%=request.getParameter("carname")%></h2>
        <form action="SaveMoreInfo.jsp" method="post">
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
                    String otherDetails = rs.getString("otherdetails");
            %>
            <input type="hidden" name="companyname" value="<%=companyName%>">
            <input type="hidden" name="carname" value="<%=carName%>">
            <div class="form-group">
                <label for="carcategory">Car Category</label>
                <input type="text" name="carcategory" id="carcategory" value="<%=carCategory%>" readonly>
            </div>
            <div class="form-group">
                <label for="carimage">Car Image</label>
                <input type="text" name="carimage" id="carimage" value="<%=carImage%>" readonly>
            </div>
            <div class="form-group">
                <label for="price">Price</label>
                <input type="text" name="price" id="price" value="<%=price%>" readonly>
            </div>
            <div class="form-group">
                <label for="otherdetails">Other Details</label>
                <textarea name="otherdetails" rows="10" id="otherdetails" readonly><%=otherDetails%></textarea>
            </div>
            <h3>Specifications</h3>
            <div class="form-group">
                <label for="specifications">Specifications</label>
                <textarea name="specifications" id="specifications" placeholder="Enter specifications here, each on a new line"></textarea>
            </div>
            <h3>Top Features</h3>
            <div class="form-group">
                <label for="features">Top Features</label>
                <textarea name="features" id="features" placeholder="Enter features here, each on a new line"></textarea>
            </div>
            <h3>Overview</h3>
            <div class="form-group">
                <label for="expert_review">Overview</label>
                <textarea name="expert_review" id="expert_review"></textarea>
            </div>
            <h3>Interior Images</h3>
            <div class="form-group">
                <label for="interior_image1">Interior Image 1</label>
                <input type="text" name="interior_image1" id="interior_image1" placeholder="Enter URL or path">
                <textarea name="interior_desc1" id="interior_desc1" placeholder="Enter description for Image 1"></textarea>
            </div>
            <div class="form-group">
                <label for="interior_image2">Interior Image 2</label>
                <input type="text" name="interior_image2" id="interior_image2" placeholder="Enter URL or path">
                <textarea name="interior_desc2" id="interior_desc2" placeholder="Enter description for Image 2"></textarea>
            </div>
            <div class="form-group">
                <label for="interior_image3">Interior Image 3</label>
                <input type="text" name="interior_image3" id="interior_image3" placeholder="Enter URL or path">
                <textarea name="interior_desc3" id="interior_desc3" placeholder="Enter description for Image 3"></textarea>
            </div>
            <div class="form-group">
                <label for="interior_image4">Interior Image 4</label>
                <input type="text" name="interior_image4" id="interior_image4" placeholder="Enter URL or path">
                <textarea name="interior_desc4" id="interior_desc4" placeholder="Enter description for Image 4"></textarea>
            </div>
            <button type="submit">Save</button>
            <button type="reset">Reset</button>
            <% 
                }
            } catch(Exception e) {
                out.println(e);
            } 
            %>
        </form>
    </div>
    <div class="footer">
        <p>&copy; 2024 CarMatePro. All rights reserved. <a href="#">Privacy Policy</a></p>
    </div>
</body>
</html>