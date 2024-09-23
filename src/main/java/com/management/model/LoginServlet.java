import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        String url = "jdbc:mysql://localhost:3306/student";
        String user = "root";
        String dbPassword = "1234";

        try (Connection conn = DriverManager.getConnection(url, user, dbPassword)) {
            String query = "SELECT * FROM registration_form WHERE email = ? AND password = ?";
            try (PreparedStatement pstmt = conn.prepareStatement(query)) {
                pstmt.setString(1, username);
                pstmt.setString(2, password);
                try (ResultSet rs = pstmt.executeQuery()) {
                	if (rs.next()) {
                	    HttpSession session = request.getSession();
                	    session.setAttribute("username", username);
                	    response.setContentType("text/html");
                	    PrintWriter out = response.getWriter();
                	    
                	    out.println("<!DOCTYPE html>");
                	    out.println("<html lang='en'>");
                	    out.println("<head>");
                	    out.println("<meta charset='UTF-8'>");
                	    out.println("<meta name='viewport' content='width=device-width, initial-scale=1.0'>");
                	    out.println("<title>Login Successful</title>");
                	    out.println("<style>");
                	    out.println("body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background-color: #f8f9fa; margin: 0; padding: 0; }");
                	    out.println(".container { max-width: 500px; margin: 50px auto; background: #ffffff; padding: 30px; border-radius: 12px; box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2); text-align: center; }");
                	    out.println("h1 { color: #4caf50; margin-bottom: 20px; font-size: 2em; }"); // Subtle green color
                	    out.println("p { margin-top: 20px; }");
                	    out.println("a { display: inline-block; padding: 10px 20px; font-size: 1.1em; color: #ffffff; background-color: #007bff; border-radius: 5px; text-decoration: none; transition: background-color 0.3s, transform 0.3s; }");
                	    out.println("a:hover { background-color: #0056b3; transform: scale(1.05); }");
                	    out.println("a:focus { outline: none; }");
                	    out.println("</style>");
                	    out.println("</head>");
                	    out.println("<body>");
                	    out.println("<div class='container'>");
                	    out.println("<h1>Login Successful!</h1>");
                	    out.println("<p><a href='ViewServlet'>Go to Student Records</a></p>");
                	    out.println("</div>");
                	    out.println("</body>");
                	    out.println("</html>");



                	}
 else {
                        request.setAttribute("errorMessage", "Invalid credentials.");
                        request.getRequestDispatcher("/login.jsp").forward(request, response);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred.");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
    }
}