import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
@WebServlet("/home")
public class HomeServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{

            PrintWriter out = response.getWriter();

            String url="jdbc:mysql://localhost:3306/school";
            String uname="root";
            String pass="";

            Class.forName("com.mysql.cj.jdbc.Driver");
            java.sql.Connection con= DriverManager.getConnection(url,uname,pass);
            String query="insert into students values(?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement ps=con.prepareStatement(query);

            String fname=request.getParameter("firstname");
            String lname=request.getParameter("lastname");
            String email=request.getParameter("email");
            String dob=request.getParameter("dob");
            //   LocalDate dateofbirth=LocalDate.parse(dob);
            String gender=request.getParameter("gender");
            String admissiondate=request.getParameter("admission_date");
            //  LocalDate addDate=LocalDate.parse(admissiondate);
            String studentclass=request.getParameter("classname");
            String city=request.getParameter("city");
            int StateCode=Integer.parseInt(request.getParameter("statecode"));
            String country=request.getParameter("country");


            ps.setString(1, fname);
            ps.setString(2,lname);
            ps.setString(3,email);
            ps.setString(4,dob);
            ps.setString(5,gender);
            ps.setString(6, admissiondate);
            ps.setString(7,studentclass);
            ps.setString(8,city);
            ps.setInt(9, StateCode);
            ps.setString(10, country);

            int n=ps.executeUpdate();

            RequestDispatcher rd=request.getRequestDispatcher("/");
            rd.forward(request, response);



        }catch(Exception e){
            System.out.println(e.getMessage());

        }
    }
}
