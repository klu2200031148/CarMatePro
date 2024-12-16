<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Reply to Query</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            max-width: 90%;
        }

        .container h3 {
            text-align: center;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
        }

        .form-group input, .form-group textarea {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 8px;
            box-sizing: border-box;
        }

        .form-group textarea {
            height: 100px;
        }

        .btn {
            display: block;
            width: 100%;
            padding: 10px;
            background-color: #4a90e2;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-align: center;
        }

        .btn:hover {
            background-color: #357abd;
        }
    </style>
</head>
<body>
    <div class="container">
        <h3>Reply to Query</h3>
        <form action="UpdateQuery.jsp" method="post">
            <div class="form-group">
                                <label for="email">Email:</label>
                <input type="text" id="email" name="email" value="<%= request.getParameter("email") %>" readonly>
            </div>
            <div class="form-group">
                <label for="query">Query:</label>
                <textarea id="query" name="query" readonly>
                    <%
                    String idParam = request.getParameter("id");
                  
                    
                    int id = -1; // Default value
                    if (idParam != null && !idParam.isEmpty()) {
                        try {
                            id = Integer.parseInt(idParam);
                        } catch (NumberFormatException e) {
                            out.println("Invalid ID format.");
                            return; // Exit if ID is not a valid integer
                        }
                    } else {
                        out.println("ID parameter is missing.");
                        return; // Exit if ID parameter is missing
                    }

                    

                    try {
                        Connection con = null;
                        PreparedStatement pstmt = null;
                        ResultSet rs = null;
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/epproject", "root", "Kavyasri@142005");
                        pstmt = con.prepareStatement("SELECT query FROM contactus WHERE id=?");
                        pstmt.setInt(1, id);

                        rs = pstmt.executeQuery();

                        if (rs.next()) {
                            out.println(rs.getString("query"));
                        } else {
                            out.println("No query found.");
                        }

                        rs.close();
                        pstmt.close();
                        con.close();
                    } catch (Exception e) {
                        out.println("Error: " + e.getMessage());
                    }
                    %>
                </textarea>
            </div>
            <div class="form-group">
                <label for="answer">Answer:</label>
                <textarea id="answer" name="answer"></textarea>
            </div>
            <input type="hidden" name="id" value="<%= request.getParameter("id") %>">
            <button type="submit" class="btn">Submit</button>
        </form>
    </div>
</body>
</html>

