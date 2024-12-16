<%@page import="java.sql.*" %>
<%
String name = request.getParameter("companyname");
String image = request.getParameter("companyimage");

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/epproject", "root", "Kavyasri@142005");

    PreparedStatement pstmt = con.prepareStatement("INSERT INTO company (name, image) VALUES (?, ?)");
    pstmt.setString(1, name);
    pstmt.setString(2, image);
    
    pstmt.executeUpdate();

    con.close();
    
    response.sendRedirect("Companylist.jsp");
} catch (Exception e) {
    out.println(e);
}
%>
