<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin - Manage Cars</title>
    <!-- Include your CSS styles here -->
    <style>
        /* Your existing styles */
    </style>
</head>
<body>
    <!-- Include your navbar and form-container if needed -->

    <!-- Car List -->
    <div class="car-list">
        <% 
        String carCategory = request.getParameter("carcategory");
        String companyName = request.getParameter("companyname");
        String carName = request.getParameter("carname");

        String sql = "SELECT * FROM cars WHERE 1=1";
        if (carCategory != null && !carCategory.isEmpty()) {
            sql += " AND carcategory = ?";
        }
        if (companyName != null && !companyName.isEmpty()) {
            sql += " AND companyname = ?";
        }
        if (carName != null && !carName.isEmpty()) {
            sql += " AND carname LIKE ?";
        }

        try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/epproject", "root", "Kavyasri@142005");
             PreparedStatement pstmt = con.prepareStatement(sql)) {
            
            int parameterIndex = 1;
            if (carCategory != null && !carCategory.isEmpty()) {
                pstmt.setString(parameterIndex++, carCategory);
            }
            if (companyName != null && !companyName.isEmpty()) {
                pstmt.setString(parameterIndex++, companyName);
            }
            if (carName != null && !carName.isEmpty()) {
                pstmt.setString(parameterIndex++, "%" + carName + "%");
            }

            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                String carImage = rs.getString("carimage");
                String category = rs.getString("carcategory");
                String company = rs.getString("companyname");
                String name = rs.getString("carname");
                String price = rs.getString("price");
                String details = rs.getString("otherdetails");
        %>
        <div class="car-item">
            <!-- Display car details as per your styling -->
        </div>
        <% 
            }
        } catch (SQLException e) {
            out.println("Error: " + e.getMessage());
        }
        %>
    </div>

    <!-- Include your footer if needed -->
</body>
</html>
