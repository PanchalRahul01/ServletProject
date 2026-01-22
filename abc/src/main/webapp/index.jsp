<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
<!DOCTYPE html>
<html>
<head>
    <title>AngularJS Example</title>
    <meta charset="UTF-8">
    <script src="./angular/angular.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>

<body ng-app="myApp" ng-controller="myctrl">

<h1>Student Form</h1>

<div style="width: 500px ; height: 600px">

    <form class="row g-3" action="<%= request.getContextPath() %>/home" method="post">
        <div class="col-md-6">
            <label for="inputFirstName" class="form-label">FirstName</label>
            <input type="text" class="form-control" name="firstname" ng-model="student.firstname">
        </div>

        <div class="col-md-6">
            <label for="inputLastName" class="form-label">LastName</label>
            <input type="text" class="form-control" name="lastname" ng-model="student.lastname">

        </div>

        <div class="col-md-6">
            <label for="inputEmail4" class="form-label">Email</label>
            <input type="email" class="form-control" name="email" ng-model="student.email">
        </div>

        <div class="col-12">
            <label for="inputAddress" class="form-label">Date of Birth</label>
            <input type="date" class="form-control" name="dob" ng-model="student.dob">
        </div>


        <label>Gender</label>
        <div class="form-check">
            <input class="form-check-input" type="radio" name="gender" ng-model="student.gender" id="flexRadioDefault1">
            <label class="form-check-label" for="flexRadioDefault1">
                Male
            </label>
        </div>
        <div class="form-check">
            <input class="form-check-input" type="radio" name="gender" ng-model="student.gender" id="flexRadioDefault2" checked>
            <label class="form-check-label" for="flexRadioDefault2">
                Female
            </label>
        </div>

        <div class="col-12">
            <label for="admissiondate" class="form-label">Date of Admission:</label>
            <input type="date" class="form-control" name="admission_date" ng-model="admission_date">
        </div>


        <div class="col-md-6">
            <label for="inputclass" class="form-label">Class</label>
            <input type="number" class="form-control" name="classname" ng-model="student.classname">
        </div>


        <div class="col-md-6">
            <label for="inputCity" class="form-label">City</label>
            <input type="text" class="form-control" name="city" ng-model="student.city">
        </div>

        <div class="col-md-4">
            <label for="inputState" class="form-label">State Code</label>
            <input type="number" class="form-control" name="statecode" ng-model="student.statecode">
        </div>

        <div class="col-md-2">
            <label for="inputcountry" class="form-label">country</label>
            <input type="text" class="form-control" name="country" ng-model="student.country">
        </div>


        <div class="col-12">
            <button type="submit" class="btn btn-primary">submit</button>
        </div>
    </form>
</div>


</body>

<script>
    var app = angular.module("myApp", []);
    app.controller("myctrl",function($scope){
        $scope.student={};
    });
</script>
</html>

