<%@page import="java.sql.*" %>
<%
String name = request.getParameter("name");
String email = request.getParameter("email");
String feedback = request.getParameter("feedback");


try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/epproject", "root", "Kavyasri@142005");

    PreparedStatement pstmt = con.prepareStatement("INSERT INTO feedback(name, email, feedback) VALUES (?, ?, ?)");
    pstmt.setString(1, name);
    pstmt.setString(2, email);
    pstmt.setString(3, feedback);    
    pstmt.executeUpdate();

    con.close();
    
    out.println("<script>alert('Feedback submiited successfully, ThankYou :)');window.location='Home.jsp';</script>");

} catch (Exception e) {
    out.println(e);
}
%>
