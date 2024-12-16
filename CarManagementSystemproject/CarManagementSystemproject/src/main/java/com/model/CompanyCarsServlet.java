package com.model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/templates/companyCars")
public class CompanyCarsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String companyName = request.getParameter("company");

        List<Car> cars = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/epproject", "root", "Kavyasri@142005");
            String sql = "SELECT * FROM cars WHERE companyname = ?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, companyName);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Car car = new Car();
       
                car.setCompanyName(resultSet.getString("companyname"));
                car.setCarCategory(resultSet.getString("carcategory"));
                car.setCarName(resultSet.getString("carname"));
                car.setCarImage(resultSet.getString("carimage"));
                car.setPrice(resultSet.getDouble("price"));
                car.setOtherDetails(resultSet.getString("otherdetails"));
                cars.add(car);
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("cars", cars);
        request.getRequestDispatcher("/templates/companyCars.jsp").forward(request, response);
    }
}
