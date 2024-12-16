<%@ page import="java.sql.*, java.io.*" %>
<%
String companyName = request.getParameter("companyname");
String carName = request.getParameter("carname");
String email = request.getParameter("email");
String review = request.getParameter("review");

try {
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/epproject", "root", "Kavyasri@142005");
    PreparedStatement ps = con.prepareStatement("INSERT INTO reviews (companyname, carname, email, review) VALUES (?, ?, ?, ?)");
    ps.setString(1, companyName);
    ps.setString(2, carName);
    ps.setString(3, email);
    ps.setString(4, review);
    ps.executeUpdate();
    out.println("Review inserted successfully.<br>");
} catch(SQLException e) {
    StringWriter sw = new StringWriter();
    PrintWriter pw = new PrintWriter(sw);
    e.printStackTrace(pw);
    out.println(sw.toString());
} catch(Exception e) {
    StringWriter sw = new StringWriter();
    PrintWriter pw = new PrintWriter(sw);
    e.printStackTrace(pw);
    out.println(sw.toString());
}
response.sendRedirect("CarDetails.jsp?companyname=" + companyName + "&carname=" + carName);
%>
