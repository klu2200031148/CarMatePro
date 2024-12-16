<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin - Manage Cars</title>
    <style>
        /* Add your CSS styling here */
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
            width: 98%;
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
            
            background-image: url('https://img.freepik.com/premium-photo/magnifying-glass-blue-background-search-concept_661495-10922.jpg?size=626&ext=jpg&ga=GA1.1.2008272138.1722124800&semt=ais_user');
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 80%;
            margin: 100px auto 20px auto; /* Adjust margin to center the form */
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .form-container h2 {
            margin-bottom: 20px;
            font-size: 28px;
            text-align: center;
            color: #333;
        }
        .form-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            width: 100%;
            margin-bottom: 20px;
        }
        .form-group {
            display: flex;
            flex-direction: column;
            width: 45%; /* Adjust width as needed */
            margin-right: 10px;
        }
        .form-group label {
            margin-bottom: 5px;
            text-align: left;
        }
        .form-container select {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            width: 100%; /* Ensure dropdowns take full width */
        }
        .button-group {
            display: flex;
            justify-content: space-between;
            width: 100%;
            margin-top: 20px; /* Space between form and buttons */
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
        .car-list {
            width: 80%;
            margin: 20px auto;
            display: flex;
            flex-direction: column;
            gap: 20px;
        }
        .car-item {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            display: flex;
            align-items: center;
            position: relative;
            gap: 20px;
        }
        .car-item img {
            width: 150px;
            height: 100px;
            border-radius: 10px;
            object-fit: cover;
        }
        .car-details {
            flex: 1;
            display: flex;
            flex-direction: column;
            gap: 10px;
        }
        .car-details p {
            margin: 5px 0;
        }
        .car-actions {
            position: absolute;
            top: 10px;
            right: 10px;
            display: flex;
            gap: 10px;
        }
        .car-actions button {
            padding: 5px 10px;
            color: #fff;
            background-color: #4a90e2;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .car-actions button:hover {
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
        function editCar(companyName, carName) {
            window.location.href = 'EditCar.jsp?companyname=' + encodeURIComponent(companyName) +  '&carname=' + encodeURIComponent(carName);
        }
        function knowMore(companyName, carName) {
            window.location.href = 'CarDetails.jsp?companyname=' + encodeURIComponent(companyName) + '&carname=' + encodeURIComponent(carName);
        }
             
        function addMoreInfo(companyName, carName) {
            window.location.href = 'AddMoreInfo.jsp?companyname=' + encodeURIComponent(companyName) +  '&carname=' + encodeURIComponent(carName);
        }

        function confirmDelete(carName) {
            if (confirm('Are you sure you want to delete ' + carName + '?')) {
                var xhr = new XMLHttpRequest();
                xhr.open('POST', 'DeleteCar.jsp', true);
                xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
                xhr.onload = function() {
                    if (xhr.status === 200) {
                        alert('Car ' + carName + ' deleted successfully!');
                        window.location.reload();
                    } else {
                        alert('Failed to delete car ' + carName + '. Please try again.');
                    }
                };
                xhr.send('carname=' + encodeURIComponent(carName));
            }
        }
    </script>
</head>
<body>
    <!-- Navbar and Search Form -->
    <div class="navbar">
        <div class="logo">CarMatePro</div>
        <div class="menu">
            <ul>
                <li><a href="Addcar.jsp">ADD CAR</a></li>
                <li><a href="adminpage.html">HOME</a></li>
            </ul>
        </div>
    </div>

    <div class="form-container">
        <h2>Admin - Manage Cars</h2>
        <form action="CarList.jsp" method="get">
            <div class="form-row">
                <div class="form-group">
                    <label for="carcategory">Car Category</label>
                    <select name="carcategory" id="carcategory">
                        <option value="">All</option>
                        <option value="upcoming">Upcoming</option>
                        <option value="current">Current</option>
                        <option value="expired">Expired</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="companyname">Company Name</label>
                    <select name="companyname" id="companyname">
                        <option value="">All</option>
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
            </div>
            <div class="button-group">
                <button type="submit">Search</button>
            </div>
        </form>
    </div>

    <!-- Car List -->
    <div class="car-list">
        <% 
        String carCategory = request.getParameter("carcategory");
        String companyName = request.getParameter("companyname");
        
        String query = "SELECT * FROM cars WHERE 1=1";
        
        if (carCategory != null && !carCategory.isEmpty()) {
            query += " AND carcategory = '" + carCategory + "'";
        }
        if (companyName != null && !companyName.isEmpty()) {
            query += " AND companyname = '" + companyName + "'";
        }
        
        try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/epproject", "root", "Kavyasri@142005");
             Statement stmt = con.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {
            
            while (rs.next()) {
                String carCompany = rs.getString("companyname");
                String carName = rs.getString("carname");
                String carPrice = rs.getString("price");
                String imagePath = rs.getString("carimage");
        %>
                <div class="car-item">
                    <img src="<%=imagePath%>" alt="<%=carName%>">
                    <div class="car-details">
                        <p>Company: <%=carCompany%></p>
                        <p>Name: <%=carName%></p>
                        <p>Price: ₹<%=carPrice%></p>
                    </div>
                    <div class="car-actions">
                        <button onclick="editCar('<%=carCompany%>', '<%=carName%>')">Edit</button>
                        <button onclick="confirmDelete('<%=carName%>')">Delete</button>
                          <button onclick="addMoreInfo('<%=carCompany%>', '<%=carName%>')">Add More Info</button>
                        <button onclick="knowMore('<%=carCompany%>', '<%=carName%>')">Know More</button>
                    </div>
                </div>
        <% 
            }
        } catch(Exception e) {
            out.println(e);
        } 
        %>
    </div>

    <!-- Footer -->
    <div class="footer">
        <p>&copy; 2024 CarMatePro. All rights reserved.</p>
    </div>
</body>
</html>
