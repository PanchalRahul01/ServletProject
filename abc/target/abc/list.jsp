<!DOCTYPE html>
<html>
<head>
    <title>Student Management System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background-color: #f4f7f6; padding-top: 30px; }
        .table-container { background: white; padding: 25px; border-radius: 12px; box-shadow: 0 5px 15px rgba(0,0,0,0.05); }
        .btn-add { margin-bottom: 20px; }
    </style>
</head>
<body>

<div class="container-fluid px-5">
    <div class="table-container">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2 class="text-primary fw-bold">Student Records</h2>
            <a href="data.jsp" class="btn btn-success btn-add">
                <i class="bi bi-plus-lg"></i> + Add New Student
            </a>
        </div>




        <div class="table-responsive">
            <table class="table table-hover align-middle">
                <thead class="table-dark">
                <tr>
                    <th>Name</th>
                    <th>Gender</th>
                    <th>Age</th>
                    <th>Class</th>
                    <th>Location</th>
                    <th class="text-center">Action</th>
                </tr>
                </thead>
                <tbody>
                <%@page import="java.util.ArrayList" %>
                <%@ page import="com.model.Student" %>
                <%@ page import="java.util.List" %>
                <%@ page import="java.time.format.DateTimeFormatter" %>
                <%@ page import="java.time.LocalDate" %>
                <%@ page import="java.time.Period" %>
                <%@ page import="java.time.temporal.ChronoUnit" %>
                <%
                    List<Student> list = (List<Student>) request.getAttribute("students");
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                    if (list != null && !list.isEmpty()) {
                        for(Student s : list) {
                            LocalDate dob =LocalDate.parse(s.getDateOfBirth(),formatter);
                            Period age = Period.between(dob, LocalDate.now());
                            LocalDate afterYears = dob.plusYears(age.getYears());
                            long remainingDays = ChronoUnit.DAYS.between(afterYears, LocalDate.now());
                            long weeks = remainingDays / 7;
                            long days = remainingDays % 7;
                            %>
                <tr>
                    <td><%= s.getFirstName() %> <%= s.getLastName() %></td>
                    <td><%= s.getGender() %></td>
                    <td><%= age.getYears() %> years
                        <% if (weeks != 0) { %>,
                        <%= weeks %> weeks
                        <% } %>
                        <% if (days != 0) { %>,
                        <%= days %> days
                        <% } %></td>
                    <td><%= s.getStudentClass() %>th</td>
                    <td><%= s.getCity() %>, <%= s.getStateCode() %>, <%= s.getCountry() %></td>
                    <td class="text-center">
                        <a href="editStudent?id=<%= s.getId() %>" class="btn btn-outline-primary btn-sm">Edit</a>
                        <a href="delete?id=<%= s.getId() %>" class="btn btn-outline-danger btn-sm"
                           onclick="return confirm('Are you sure you want to delete this student?')">Delete</a>
                    </td>
                </tr>
                <%
                    }
                } else {
                %>
                <tr>
                    <td colspan="6" class="text-center text-muted">No records found.</td>
                </tr>
                <% } %>
                </tbody>
            </table>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>