<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Progress Reports</title>
    <link href="css/main.css" rel="stylesheet" media="all">
</head>
<body>
    <div class="page-wrapper bg-blue p-t-100 p-b-100 font-robo">
        <div class="wrapper wrapper--w680">
            <div class="card card-1">
                <div class="card-body">
                    <center><h2 class="title">View Progress Reports</h2></center>
                    <table border="1" width="100%">
                        <tr>
                            <th>ID</th>
                            <th>Roll No</th>
                            <th>Name</th>
                            <th>Class</th>
                            <th>Section</th>
                            <th>Date</th>
                            <th>Status</th>
                            <th>Teacher's Name</th>
                            <th>Remark</th>
                        </tr>
                        <%
                            // Database connection details
                            String dbURL = "jdbc:mysql://localhost:3306/yourDatabaseName";
                            String dbUser = "yourUsername";
                            String dbPass = "yourPassword";

                            Connection conn = null;
                            Statement stmt = null;
                            ResultSet rs = null;

                            try {
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
                                stmt = conn.createStatement();
                                String sql = "SELECT * FROM StudentAttendance";
                                rs = stmt.executeQuery(sql);

                                while(rs.next()) {
                                    int id = rs.getInt("id");
                                    String rollno = rs.getString("rollno");
                                    String name = rs.getString("name");
                                    int classNum = rs.getInt("class");
                                    String section = rs.getString("section");
                                    java.sql.Date attendance_date = rs.getDate("attendance_date");
                                    String status = rs.getString("status");
                                    String teachersname = rs.getString("teachersname");
                                    String remark = rs.getString("remark");

                                    // Displaying records in the table
                                    %>
                                    <tr>
                                        <td><%= id %></td>
                                        <td><%= rollno %></td>
                                        <td><%= name %></td>
                                        <td><%= classNum %></td>
                                        <td><%= section %></td>
                                        <td><%= attendance_date %></td>
                                        <td><%= status %></td>
                                        <td><%= teachersname %></td>
                                        <td><%= remark %></td>
                                    </tr>
                                    <%
                                }
                            } catch (Exception e) {
                                e.printStackTrace();
                            } finally {
                                if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                                if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                                if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
                            }
                        %>
                    </table>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
