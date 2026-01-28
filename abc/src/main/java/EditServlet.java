import com.model.Student;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/editStudent")
public class EditServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idParam= req.getParameter("id");

        if (idParam == null) {
            resp.sendRedirect(req.getContextPath() + "/home");
            return;
        }

        try(Connection con=DataBase.getConnection()){
            int id = Integer.parseInt(idParam);
            String sql = "SELECT * FROM students WHERE id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);

            ResultSet rs=ps.executeQuery();
            if (rs.next()) {
                Student s = new Student(
                        rs.getString("First_Name"),
                        rs.getString("Last_Name"),
                        rs.getString("Email"),
                        rs.getString("Date_of_Birth"),
                        rs.getString("Gender"),
                        rs.getString("Date_of_Admission"),
                        rs.getString("Class"),
                        rs.getString("City"),
                        rs.getString("State_Code"),
                        rs.getString("Country")
                );
                s.setId(rs.getInt("id"));

                req.setAttribute("student",s);
                RequestDispatcher rd = req.getRequestDispatcher("edit.jsp");
                rd.forward(req,resp);
                return;
            }

        }catch(Exception e){
            e.printStackTrace();
        }
        resp.sendRedirect(req.getContextPath() + "/home");
    }
}
