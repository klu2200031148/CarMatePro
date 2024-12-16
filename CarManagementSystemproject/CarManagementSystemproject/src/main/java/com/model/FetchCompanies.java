package com.model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/FetchCompanies")
public class FetchCompanies extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public class Company {
        private String name;
        private String image;

        public Company(String name, String image) {
            this.name = name;
            this.image = image;
        }

        public String getName() {
            return name;
        }

        public String getImage() {
            return image;
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Company> companyList = new ArrayList<>();
        try {
            // Database connection
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/epproject", "root", "Kavyasri@142005");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT name, image FROM company");

            while (rs.next()) {
                companyList.add(new Company(rs.getString("name"), rs.getString("image")));
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Debugging
        for (Company company : companyList) {
            System.out.println("Company: " + company.getName() + ", Image: " + company.getImage());
        }

        request.setAttribute("companyList", companyList);
        request.getRequestDispatcher("/templates/Home.jsp").forward(request, response);
    }
}
