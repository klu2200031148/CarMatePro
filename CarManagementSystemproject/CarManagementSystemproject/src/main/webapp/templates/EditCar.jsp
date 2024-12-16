<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Car</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 400px;
        }
        .container h2 {
            margin-bottom: 20px;
            font-size: 24px;
            text-align: center;
            color: #333;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        .form-group input,
        .form-group textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        .form-group input[type="number"] {
            -moz-appearance: textfield;
        }
        .form-group input[type="number"]::-webkit-outer-spin-button,
        .form-group input[type="number"]::-webkit-inner-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }
        button {
            width: 100%;
            padding: 10px;
            color: #fff;
            background-color: #4a90e2;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 20px;
        }
        button:hover {
            background-color: #357abd;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Edit Car</h2>
        <% 
        String carName = request.getParameter("carname");
        String companyName = request.getParameter("companyname");
        try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/epproject", "root", "Kavyasri@142005");
             PreparedStatement pstmt = con.prepareStatement("SELECT * FROM cars WHERE carname = ? AND companyname = ?")) {
            pstmt.setString(1, carName);
            pstmt.setString(2, companyName);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    String carCategory = rs.getString("carcategory");
                    String price = rs.getString("price");
                    String otherDetails = rs.getString("otherdetails");
        %>
        <form action="UpdateCar.jsp" method="post">
            <input type="hidden" name="carname" value="<%=carName%>">
            <input type="hidden" name="companyname" value="<%=companyName%>">
            <div class="form-group">
                <label for="carcategory">Car Category</label>
                <input type="text" id="carcategory" name="carcategory" value="<%=carCategory%>" required>
            </div>
            <div class="form-group">
                <label for="price">Price</label>
                <input type="text" id="price" name="price" value="<%=price%>" required>
            </div>
            
            <div class="form-group">
                <label for="otherdetails">About Car</label>
                <textarea id="otherdetails" name="otherdetails" rows="15" required><%=otherDetails%></textarea>
            </div>
            <button type="submit">Update Car</button>
        </form>
        <% 
                }
            }
        } catch(Exception e) {
            out.println(e);
        } 
        %>
    </div>
</body>
</html>
