<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Enquire Now</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            color: #333;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .enquire-form {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
        }
        .enquire-form h2 {
            margin-bottom: 20px;
            font-size: 24px;
        }
        .enquire-form select,
        .enquire-form input {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        .enquire-form button {
            width: 100%;
            padding: 10px;
            background-color: #4a90e2;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .enquire-form button:hover {
            background-color: #357ab7;
        }
    </style>
</head>
<body>
    <div class="enquire-form">
        <h2>Enquire Now</h2>
        <form action="SubmitEnquiryServlet" method="post">
            <select name="title" required>
                <option value="Mr">Mr</option>
                <option value="Ms">Ms</option>
                <option value="Mrs">Mrs</option>
            </select>
            <input type="text" name="name" placeholder="Your Name" required>
            <input type="text" name="mobile" placeholder="Mobile Number" required>
            <input type="email" name="email" placeholder="Your Email" required>
            <select name="city" required>
                <option value="Vijayawada">Vijayawada</option>
                <option value="Hyderabad">Hyderabad</option>
                <option value="Bangalore">Bangalore</option>
                <option value="Chennai">Chennai</option>
            </select>
            <button type="submit">Submit</button>
        </form>
    </div>
</body>
</html>
