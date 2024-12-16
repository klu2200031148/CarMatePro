<%@ page import="java.sql.*" %>
<%
String id = request.getParameter("id");
String answer = request.getParameter("answer");

try {
    Connection con = null;
    Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/epproject", "root", "Kavyasri@142005");
    PreparedStatement pstmt = con.prepareStatement("UPDATE contactus SET answer=? WHERE id=?");
    pstmt.setString(1, answer);
    pstmt.setString(2, id);
    int rowsUpdated = pstmt.executeUpdate();

    if (rowsUpdated > 0) {
        out.println("<script>alert('Query answered successfully.');window.location='queryslist.jsp';</script>");
        
    } else {
        out.println("<script>alert('Failed to update the query.');window.location='queryslist.jsp';</script>");
    }
} catch(Exception e) {
    out.println(e);
}
%>
