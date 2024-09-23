import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/InsertAttendanceServlet")
public class InsertAttendanceServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String url = "jdbc:mysql://localhost:3306/student";
        String user = "root";
        String dbPassword = "1234";

        String selectedClass = request.getParameter("classadmission");

        // Use INSERT ... ON DUPLICATE KEY UPDATE to handle both insertion and updating
        String query = "INSERT INTO students_attendance (stdid, name, fathername, email, classadmission, photo, present) " +
                       "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DriverManager.getConnection(url, user, dbPassword);
             PreparedStatement pstmt = conn.prepareStatement(query)) {

            boolean hasRecords = false; // Flag to check if any records are added to batch

            // Iterate through parameters and update the database
            for (String parameterName : request.getParameterMap().keySet()) {
                if (parameterName.startsWith("present_")) {
                    int studentId = Integer.parseInt(parameterName.substring("present_".length()));

                    // Retrieve all parameters for this student
                    String name = request.getParameter("name_" + studentId);
                    String fathername = request.getParameter("fathername_" + studentId);
                    String email = request.getParameter("email_" + studentId);
                    String photo = request.getParameter("photo_" + studentId);
                    boolean present = request.getParameter(parameterName) != null;

                    // Debugging output
                    System.out.println("Adding student record:");
                    System.out.println("ID: " + studentId);
                    System.out.println("Name: " + name);
                    System.out.println("Father's Name: " + fathername);
                    System.out.println("Email: " + email);
                    System.out.println("Photo: " + photo);
                    System.out.println("Present: " + present);

                    // Set parameters in the PreparedStatement
                    pstmt.setInt(1, studentId);
                    pstmt.setString(2, name);
                    pstmt.setString(3, fathername);
                    pstmt.setString(4, email);
                    pstmt.setString(5, selectedClass); // assuming classadmission is the same for all records
                    pstmt.setString(6, photo);
                    pstmt.setBoolean(7, present);

                    pstmt.addBatch(); // Add to batch
                    hasRecords = true; // Record added to batch
                }
            }

            if (hasRecords) {
                // Execute all the updates in one batch
                pstmt.executeBatch();
            }

            // Redirect back to ViewServlet with a success message
            response.sendRedirect("ViewServlet?classadmission=" + selectedClass + "&message=Attendance updated successfully.");

        } catch (SQLException e) {
            e.printStackTrace();
            // Redirect back to ViewServlet with an error message
            response.sendRedirect("ViewServlet?classadmission=" + selectedClass + "&message=Error updating attendance.");
        }
    }
}
