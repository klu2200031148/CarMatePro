<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Car Information</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }
        .navbar {
            background-color: #4a90e2;
            color: #fff;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 20px;
            position: fixed;
            width: 100%;
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
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            margin: 100px auto 20px auto; /* Adjust margin to avoid overlap with fixed navbar */
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .form-container h2 {
            margin-bottom: 20px;
            font-size: 24px;
            text-align: center;
        }
        .form-group {
            display: flex;
            justify-content: space-between;
            width: 100%;
        }
        .form-container label {
            display: block;
            margin-bottom: 5px;
            text-align: left;
            width: 100%;
        }
        .form-container input,
        .form-container select,
        .form-container textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 10px;
            box-sizing: border-box;
        }
        .form-group select {
            width: 68%;
        }
        button {
            padding: 10px 20px;
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
</head>
<body>
    <!-- Navbar -->
    <div class="navbar">
        <div class="logo">CarMatePro</div>
        <div class="menu">
            <ul>
                <li><a href="CarList.jsp">Car List</a></li>
                <li><a href="index.html">LOGOUT</a></li>
            </ul>
        </div>
    </div>

    <div class="form-container">
        <h2>Add Car Information</h2>
        <form action="UploadCarImage" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="companyName">Company Name</label>
                <select name="companyname" id="companyname" required>
                    <option value="">Select</option>
                    <% 
                    try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/epproject", "root", "Kavyasri@142005");
                         PreparedStatement pstmt = con.prepareStatement("SELECT name FROM company");
                         ResultSet rs = pstmt.executeQuery()) {
                        while (rs.next()) {
                            String companyName = rs.getString("name");
                    %>
                            <option value="<%=companyName%>"><%=companyName%></option>
                    <% 
                        }
                    } catch(Exception e) {
                        out.println(e);
                    } 
                    %>
                </select>
            </div>
            <div class="form-group">
                <label for="carCategory">Car Category</label>
                <select name="carcategory" id="carcategory" required>
                    <option value="">Select</option>
                    <option value="upcoming">Upcoming</option>
                    <option value="current">Current</option>
                    <option value="expired">Expired</option>
                </select>
            </div>

            <label for="carName">Car Name</label>
            <input type="text" id="carname" name="carname" required>

            <label for="carimage">Add Car Image</label>
    <input type="text" name="carimage" id="carimage" placeholder="Enter URL or path">
                       
            <label for="price">Price</label>
            <input type="text" id="price" name="price" required>
            
            <label for="otherDetails">About Car</label>
            <textarea id="otherdetails" name="otherdetails" rows="15"></textarea>

            <div class="button-group">
                <button type="submit">Submit</button>
                <button type="reset">Reset</button>
            </div>
        </form>
    </div>
    <div class="footer">
        <p>CarMatePro � 2024. All rights reserved.</p>
    </div>
</body>
</html>
