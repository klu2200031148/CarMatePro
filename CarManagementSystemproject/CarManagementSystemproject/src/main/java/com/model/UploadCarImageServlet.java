package com.model;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@MultipartConfig
@WebServlet("/templates/UploadCarImage")
public class UploadCarImageServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Create the upload directory if it doesn't exist
       

        // Get other form data
        String companyname = request.getParameter("companyname");
        String carcategory = request.getParameter("carcategory");
        String carimage = request.getParameter("carimage");
        String carname = request.getParameter("carname");
        String price = request.getParameter("price");
        String otherdetails = request.getParameter("otherdetails");

        // Save the file path and other data to the database
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/epproject", "root", "Kavyasri@142005");
            String sql = "INSERT INTO cars (companyname, carcategory, carname, carimage, price, otherdetails) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, companyname);
            statement.setString(2, carcategory);
            statement.setString(3, carname);
            statement.setString(4, carimage);
            statement.setString(5, price);
            statement.setString(6, otherdetails);
            statement.executeUpdate();
            conn.close();
        
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error adding car information: " + e.getMessage());
            return;
        }

		DriverManager.println("<script>alert('Car added successfully.');window.location='Carlist.jsp';</script>");

    }
}