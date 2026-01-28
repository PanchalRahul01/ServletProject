import com.model.Student;
import com.validation.StudentValidator;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;

@WebServlet("/update")
public class updateServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fname=request.getParameter("firstname");
        String lname=request.getParameter("lastname");
        String email=request.getParameter("email");
        String dob=request.getParameter("dob");
        String gender=request.getParameter("gender");
        String admissiondate=request.getParameter("admission_date");
        String studentclass=request.getParameter("classname");
        String city=request.getParameter("city");
        String StateCode=(request.getParameter("statecode"));
        String country=request.getParameter("country");
        int id = Integer.parseInt(request.getParameter("id"));

        Student stud=new Student(
            fname,lname,email,dob,gender,admissiondate,studentclass,city,StateCode,country
        );

        ArrayList<String> errors= StudentValidator.validate(stud);

        if (!errors.isEmpty()) {
            System.out.println("=== Validation Errors ===");
            for (String error : errors) {
                System.out.println(error);
            }
            response.sendRedirect(request.getContextPath() + "/data.jsp");
            return;
        }

        String sql ="update students set First_Name=?,Last_Name=?,Email=?,Date_of_Birth=?,Gender=?,Date_of_Admission=?,Class=?,City=?,State_Code=?,Country=? where id=?";

        try (Connection con = DataBase.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {


            ps.setString(1, fname);
            ps.setString(2,lname);
            ps.setString(3,email);
            ps.setString(4,dob);
            ps.setString(5,gender);
            ps.setString(6, admissiondate);
            ps.setString(7,studentclass);
            ps.setString(8,city);
            ps.setString(9, StateCode);
            ps.setString(10, country);
            ps.setInt(11, id);

            ps.executeUpdate();
            response.sendRedirect(request.getContextPath() + "/home");

        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
