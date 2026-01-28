import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.model.Student;

@WebServlet("/home")
public class HomeServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

            PrintWriter out = response.getWriter();
            List<Student> list=new ArrayList<Student>();

            try (Connection con = DataBase.getConnection()) {

                PreparedStatement ps = con.prepareStatement("SELECT * FROM students");
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    Student s=new Student();
                    s.setId(rs.getInt("id"));
                    s.setFirstName(rs.getString("First_Name"));
                    s.setLastName(rs.getString("Last_Name"));
                    s.setEmail(rs.getString("Email"));
                    s.setDateOfBirth(rs.getString("Date_of_Birth"));
                    s.setGender(rs.getString("Gender"));
                    s.setDateOfAdmission(rs.getString("Date_of_Admission"));
                    s.setStudentClass(rs.getString("Class"));
                    s.setCity(rs.getString("City"));
                    s.setStateCode(rs.getString("State_Code"));
                    s.setCountry(rs.getString("Country"));

                    list.add(s);
                }
                request.setAttribute("students", list);

                RequestDispatcher rd = request.getRequestDispatcher("list.jsp");
                rd.forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }


