package com.model;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/templates/SubmitReviewServlet")
public class SubmitReviewServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String carName = request.getParameter("carname");
        String companyName = request.getParameter("companyname");
        String reviewText = request.getParameter("review");
        Date reviewDate = new Date();

        try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/epproject", "root", "Kavyasri@142005");
             PreparedStatement pstmt = con.prepareStatement("INSERT INTO reviews (name, carname, companyname, review_text, review_date) VALUES (?, ?, ?, ?, ?)")) {
            pstmt.setString(1, name);
            pstmt.setString(2, carName);
            pstmt.setString(3, companyName);
            pstmt.setString(4, reviewText);
            pstmt.setDate(5, new java.sql.Date(reviewDate.getTime()));
            pstmt.executeUpdate();
            response.sendRedirect("CarDetails.jsp?companyname=" + companyName + "&carname=" + carName);
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error.");
        }
    }
}
