<%@page import="java.sql.*" %>
<%
String name = request.getParameter("name");
String email = request.getParameter("email");
String query = request.getParameter("query");

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/epproject", "root", "Kavyasri@142005");

    PreparedStatement pstmt = con.prepareStatement("INSERT INTO contactus(name, email, query) VALUES (?, ?, ?)");
    pstmt.setString(1, name);
    pstmt.setString(2, email);
    pstmt.setString(3, query);    
    pstmt.executeUpdate();

    con.close();
    
    out.println("<script>alert('Query submiited successfully you will get answer soon.');window.location='Contactus.jsp';</script>");

} catch (Exception e) {
    out.println(e);
}
%>
