import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/ViewServlet")
public class ViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "jdbc:mysql://localhost:3306/student";
		String user = "root";
		String dbPassword = "1234";

		// Retrieve the selected class from the request parameters
		String selectedClass = request.getParameter("classadmission");
		System.out.println("Selected Class: " + selectedClass);
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		// Form for selecting class
		// Form for selecting class with centered styling
		out.println("<!DOCTYPE html>");
		out.println("<html lang='en'>");
		out.println("<head>");
		out.println("<meta charset='UTF-8'>");
		out.println("<meta name='viewport' content='width=device-width, initial-scale=1.0'>");
		out.println("<title>Student Records</title>");
		out.println("<style>");
		out.println(
				"body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background-color: #f8f9fa; margin: 0; padding: 20px; display: flex; justify-content: center; align-items: center; height: 100vh; }");
		out.println(
				".container { max-width: 1200px; width: 100%; background: #ffffff; padding: 20px; border-radius: 8px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); }");
		out.println("h2 { margin-bottom: 20px; color: #333; text-align: center; }");
		out.println(".form-container { text-align: center; margin-bottom: 20px; }");
		out.println("form { display: inline-block; }");
		out.println("label { font-size: 1.1em; margin-right: 10px; }");
		out.println("select { padding: 8px 12px; font-size: 1em; }");
		out.println(
				"button { padding: 8px 16px; font-size: 1em; background-color: #007bff; color: white; border: none; border-radius: 4px; cursor: pointer; }");
		out.println("button:hover { background-color: #0056b3; }");
		out.println(".table-container { max-height: 600px; overflow-y: auto; }");
		out.println("table { width: 100%; border-collapse: collapse; margin-top: 20px; }");
		out.println("table, th, td { border: 1px solid #ddd; }");
		out.println("th, td { padding: 12px; text-align: left; }");
		out.println("th { background-color: #007bff; color: white; }");
		out.println("tr:nth-child(even) { background-color: #f2f2f2; }");
		out.println("</style>");
		out.println("</head>");
		out.println("<body>");
		out.println("<div class='container'>");

		// Display form and data
		out.println("<h2>Student Records</h2>");

		out.println("<div class='form-container'>");
		out.println("<form method='get' action='ViewServlet'>");
		out.println("<label for='classadmission'>Select Class:</label>");
		out.println("<select id='classadmission' name='classadmission'>");
		out.println("<option value=''>All Classes</option>");

		for (int i = 1; i <= 12; i++) {
			String classValue = Integer.toString(i);
			out.println("<option value='" + classValue + "'" + (classValue.equals(selectedClass) ? " selected" : "")
					+ ">" + classValue + "</option>");
		}
		out.println("</select>");
		out.println("<button type='submit'>Filter</button>");
		
		    
		out.println("</form>");

		if (selectedClass == null || selectedClass.isEmpty()) {
		    // No class selected, just show the form
		    out.println("<p>Please select a class to view the student records.</p>");
		} else {
		    // Class selected, show the data
		    try (Connection conn = DriverManager.getConnection(url, user, dbPassword)) {
		        // Construct the SQL query with optional filtering
		        String query = "SELECT * FROM registration_form WHERE classadmission = ?";
		        try (PreparedStatement pstmt = conn.prepareStatement(query)) {
		            // Set the parameter if filtering by class
		            pstmt.setString(1, selectedClass);

		            try (ResultSet rs = pstmt.executeQuery()) {
		                // Start HTML output
		                out.println("<!DOCTYPE html>");
		                out.println("<html lang='en'>");
		                out.println("<head>");
		                out.println("<meta charset='UTF-8'>");
		                out.println("<meta name='viewport' content='width=device-width, initial-scale=1.0'>");
		                out.println("<title>Student Records</title>");
		                out.println("<style>");
		                out.println(
		                        "body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background-color: #f8f9fa; margin: 0; padding: 20px; }");
		                out.println(
		                        ".container { max-width: 1200px; margin: auto; background: #ffffff; padding: 20px; border-radius: 8px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); }");
		                out.println("h2 { margin-bottom: 20px; color: #333; }");
		                out.println(".table-container { max-height: 600px; overflow-y: auto; }");
		                out.println("table { width: 100%; border-collapse: collapse; }");
		                out.println("table, th, td { border: 1px solid #ddd; }");
		                out.println("th, td { padding: 12px; text-align: left; }");
		                out.println("th { background-color: #007bff; color: white; }");
		                out.println("tr:nth-child(even) { background-color: #f2f2f2; }");
		                out.println("</style>");
		                out.println("</head>");
		                out.println("<body>");
		                out.println("<div class='container'>");
		                out.println("<h2>Student Records</h2>");

		                // Table for displaying student records inside a form
		                out.println("<form method='post' action='InsertAttendanceServlet'>"); //  `UpdateAttendanceServlet` handles the form submission
		                out.println("<div class='table-container'>");
		                out.println("<table>");
		                out.println("<thead>");
		                out.println("<tr>");
		                out.println("<th>ID</th>");
		                out.println("<th>Name</th>");
		                out.println("<th>Father's Name</th>");
		                out.println("<th>Email</th>");
		                out.println("<th>Class Admission</th>");
		                out.println("<th>Photo</th>");
		                out.println("<th>Present</th>");
		                out.println("</tr>");
		                out.println("</thead>");
		                out.println("<tbody>");

		                // Iterate through result set and generate table rows
		                while (rs.next()) {
		                    out.println("<tr>");
		                    out.println("<td>" + rs.getInt("stdid") + "</td>");
		                    out.println("<td>" + getValueOrNull(rs.getString("name")) + "</td>");
		                    out.println("<td>" + getValueOrNull(rs.getString("fathername")) + "</td>");
		                    out.println("<td>" + getValueOrNull(rs.getString("email")) + "</td>");
		                    out.println("<td>" + getValueOrNull(rs.getString("classadmission")) + "</td>");
		                    out.println("<td>" + getPhotoHtml(rs.getBytes("photo")) + "</td>");
		                    out.println("<td><input type='checkbox' name='present_" + rs.getInt("stdid") + "'></td>");
		                    out.println("</tr>");
		                }

		                out.println("</tbody>");
		                out.println("</table>");
		                out.println("<button type='submit'>Submit Attendance</button>");
		                out.println("</div>");
		                out.println("</form>");
		                out.println("</div>");
		                out.println("</body>");
		                out.println("</html>");
		            }
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		        out.println("<html><body><h1>An error occurred while retrieving student records.</h1></body></html>");
		    } finally {
		        out.close();
		    }
		}

	}

	private String getValueOrNull(String value) {
		return value != null ? value : "NULL";
	}

	private String getPhotoHtml(byte[] photo) {
		if (photo == null || photo.length == 0) {
			return "<img src='default.jpg' alt='No Photo' width='100'>";
		} else {
			String base64Photo = java.util.Base64.getEncoder().encodeToString(photo);
			return "<img src='data:image/jpeg;base64," + base64Photo + "' alt='Photo' width='100'>";
		}
	}
}
