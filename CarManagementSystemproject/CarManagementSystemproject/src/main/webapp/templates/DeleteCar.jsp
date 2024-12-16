<%@ page import="java.sql.*" %>
<%
String name = request.getParameter("carname");

try {
    // Load the JDBC driver
    Class.forName("com.mysql.cj.jdbc.Driver");
    
    // Establish the connection
    try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/epproject", "root", "Kavyasri@142005");
         PreparedStatement pstmt = con.prepareStatement("DELETE FROM cars WHERE carname = ?")) {
        
        // Set the parameter for the prepared statement
        pstmt.setString(1, name);
        
        // Execute the update
        int rowsAffected = pstmt.executeUpdate();
        
        // Check the result and provide feedback
        if (rowsAffected > 0) {
            out.println("<script>alert('Car deleted successfully.');</script>");
        } else {
            out.println("<script>alert('Failed to delete Car.');</script>");
        }
    } catch (SQLException e) {
        out.println("<script>alert('Database error: " + e.getMessage() + "');</script>");
        e.printStackTrace(System.err); // For debugging purposes
    }
} catch (ClassNotFoundException e) {
    out.println("<script>alert('JDBC Driver not found: " + e.getMessage() + "');</script>");
    e.printStackTrace(System.err); // For debugging purposes
}

// Redirect back to the car list page
response.setHeader("Refresh", "0; URL=CarList.jsp");
%>
