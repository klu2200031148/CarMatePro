<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Car</title>
</head>
<body>
<%
    String carName = request.getParameter("carname");
    String companyName = request.getParameter("companyname");
    String carCategory = request.getParameter("carcategory");
    String price = request.getParameter("price");
    String otherDetails = request.getParameter("otherdetails");
    try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/epproject", "root", "Kavyasri@142005");
         PreparedStatement pstmt = con.prepareStatement("UPDATE cars SET carcategory = ?, price = ?, otherdetails = ? WHERE carname = ? AND companyname = ?")) {
        pstmt.setString(1, carCategory);
        pstmt.setString(2, price);
        pstmt.setString(3, otherDetails);
        pstmt.setString(4, carName);
        pstmt.setString(5, companyName);
        int rowsUpdated = pstmt.executeUpdate();
        if (rowsUpdated > 0) {
            out.println("<script>alert('Car details updated successfully!'); window.location.href='CarList.jsp';</script>");
        } else {
            out.println("<script>alert('Failed to update car details. Please try again.'); window.history.back();</script>");
        }
    } catch(Exception e) {
        out.println(e);
    }
%>
</body>
</html>
