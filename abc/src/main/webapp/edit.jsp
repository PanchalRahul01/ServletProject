<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.model.Student" %>

<%
    Student student = (Student) request.getAttribute("student");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Student - Bootstrap 5</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="js/validation.js"></script>
    <style>
        body { background-color: #f8f9fa; }
        .form-container {
            max-width: 600px;
            margin: 50px auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }
    </style>
</head>

<body>

<div class="container">
    <div class="form-container">

        <h1 class="mb-4 text-center">Edit Student</h1>

        <form action="<%= request.getContextPath() %>/update"
              method="post"
              class="row g-3" onsubmit=" return validateForm()">

            <input type="hidden" name="id" value="<%= student.getId() %>">

            <div class="col-md-6">
                <label class="form-label">First Name</label>
                <input type="text" class="form-control" name="firstname" id="firstname" value="<%= student.getFirstName() %>" maxlength="50">
            </div>

            <div class="col-md-6">
                <label class="form-label">Last Name</label>
                <input type="text" class="form-control" name="lastname" id="lastname" value="<%= student.getLastName() %>" maxlength="50">
            </div>

            <div class="col-12">
                <label class="form-label">Email</label>
                <input type="email" class="form-control" name="email" id="email" value="<%= student.getEmail() %>" maxlength="100">
            </div>

            <div class="col-md-6">
                <label class="form-label">Date of Birth</label>
                <input type="date" class="form-control" name="dob" id="dob" value="<%= student.getDateOfBirth() %>">
            </div>

            <div class="col-md-6">
                <label class="form-label d-block">Gender</label>

                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="gender" value="Male"<%= "Male".equals(student.getGender()) ? "checked" : "" %>>
                    <label class="form-check-label">Male</label>
                </div>

                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="gender" value="Female"<%= "Female".equals(student.getGender()) ? "checked" : "" %>>
                    <label class="form-check-label">Female</label>
                </div>
            </div>

            <div class="col-md-6">
                <label class="form-label">Date of Admission</label>
                <input type="date" class="form-control" name="admission_date" id="admission_date" value="<%= student.getDateOfAdmission() %>">
            </div>

            <div class="col-md-6">
                <label class="form-label">Class</label>
                <input type="number" class="form-control" name="classname" id="classname" value="<%= student.getStudentClass() %>">
            </div>

            <div class="col-md-4">
                <label class="form-label">City</label>
                <input type="text" class="form-control" name="city" id="city" value="<%= student.getCity() %>">
            </div>

            <div class="col-md-4">
                <label class="form-label">State Code</label>
                <input type="text" class="form-control" name="statecode" id="statecode" value="<%= student.getStateCode() %>" maxlength="2">
            </div>

            <div class="col-md-4">
                <label class="form-label">Country</label>
                <input type="text" class="form-control" name="country" id="country" value="<%= student.getCountry() %>">
            </div>

            <div class="col-12 mt-4">
                <button type="submit" class="btn btn-success w-100" onclick="return confirm('Are you sure you want to Update this student?')">
                    Update Student
                </button>
            </div>

        </form>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>