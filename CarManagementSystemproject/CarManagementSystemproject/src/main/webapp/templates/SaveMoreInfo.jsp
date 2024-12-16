<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%
    String companyname = request.getParameter("companyname");
    String carname = request.getParameter("carname");
    String specifications = request.getParameter("specifications");
    String features = request.getParameter("features");
    String expertReview = request.getParameter("expert_review");
    String interiorImage1 = request.getParameter("interior_image1");
    String interiorDesc1 = request.getParameter("interior_desc1");
    String interiorImage2 = request.getParameter("interior_image2");
    String interiorDesc2 = request.getParameter("interior_desc2");
    String interiorImage3 = request.getParameter("interior_image3");
    String interiorDesc3 = request.getParameter("interior_desc3");
    String interiorImage4 = request.getParameter("interior_image4");
    String interiorDesc4 = request.getParameter("interior_desc4");

    Connection con = null;
    PreparedStatement pstmt = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/epproject", "root", "Kavyasri@142005");

        String sql = "INSERT INTO caradditionalinfo (companyname, carname, specifications, features, expert_review, " +
                "interior_image1, interior_desc1, interior_image2, interior_desc2, interior_image3, interior_desc3, interior_image4, interior_desc4) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) " +
                "ON DUPLICATE KEY UPDATE " +
                "specifications = VALUES(specifications), " +
                "features = VALUES(features), " +
                "expert_review = VALUES(expert_review), " +
                "interior_image1 = VALUES(interior_image1), " +
                "interior_desc1 = VALUES(interior_desc1), " +
                "interior_image2 = VALUES(interior_image2), " +
                "interior_desc2 = VALUES(interior_desc2), " +
                "interior_image3 = VALUES(interior_image3), " +
                "interior_desc3 = VALUES(interior_desc3), " +
                "interior_image4 = VALUES(interior_image4), " +
                "interior_desc4 = VALUES(interior_desc4)";

        pstmt = con.prepareStatement(sql);
        pstmt.setString(1, companyname);
        pstmt.setString(2, carname);
        pstmt.setString(3, specifications);
        pstmt.setString(4, features);
        pstmt.setString(5, expertReview);
        pstmt.setString(6, interiorImage1);
        pstmt.setString(7, interiorDesc1);
        pstmt.setString(8, interiorImage2);
        pstmt.setString(9, interiorDesc2);
        pstmt.setString(10, interiorImage3);
        pstmt.setString(11, interiorDesc3);
        pstmt.setString(12, interiorImage4);
        pstmt.setString(13, interiorDesc4);

        int row = pstmt.executeUpdate();

        if (row > 0) {
            out.println("<script>alert('Information added successfully');window.location='CarList.jsp';</script>");

        } else {
            out.println("<h2>Failed to save information. Please try again.</h2>");
        }

    } catch (Exception e) {
        e.printStackTrace();
        out.println("<h2>Error: " + e.getMessage() + "</h2>");
    } finally {
        try {
            if (pstmt != null) pstmt.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
