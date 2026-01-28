<!DOCTYPE html>
<html>
<head>
        <title>Student Form - Bootstrap 5</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

        <style>
                body { background-color: #f8f9fa; }
                .form-container { max-width: 600px; margin: 50px auto; background: white; padding: 30px; border-radius: 10px; box-shadow: 0 4px 6px rgba(0,0,0,0.1); }
        </style>
        <script src="js/validation.js"></script>
</head>
<body>

<div class="container">
        <div class="form-container">

                <h1 class="mb-4 text-center">Student Form</h1>

                <form action="<%= request.getContextPath()%>/add" method="post" class="row g-3" onsubmit=" return validateForm()">

                        <div class="col-md-6">
                                <label class="form-label">First Name</label>
                                <input type="text" class="form-control" id="firstname" name="firstname" placeholder="John" maxlength="50">
                        </div>

                        <div class="col-md-6">
                                <label class="form-label">Last Name</label>
                                <input type="text" class="form-control" id="lastname" name="lastname" placeholder="Doe" maxlength="50">
                        </div>

                        <div class="col-12">
                                <label class="form-label">Email</label>
                                <input type="email" class="form-control" id="email" name="email" placeholder="name@example.com" maxlength="100">
                        </div>

                        <div class="col-md-6">
                                <label class="form-label">Date of Birth</label>
                                <input type="date" class="form-control" name="dob" id="dob">
                        </div>

                        <div class="col-md-6">
                                <label class="form-label d-block">Gender</label>

                                <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="gender" value="Male" id="male">
                                        <label class="form-check-label" for="male">Male</label>
                                </div>

                                <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="gender" value="Female" id="female">
                                        <label class="form-check-label" for="female">Female</label>
                                </div>
                        </div>

                        <div class="col-md-6">
                                <label class="form-label">Date of Admission</label>
                                <input type="date" class="form-control"  name="admission_date" id="admission_date">
                        </div>

                        <div class="col-md-6">
                                <label class="form-label">Class</label>
                                <input type="number" class="form-control" id="classname" name="classname" maxlength="10">
                        </div>

                        <div class="col-md-4">
                                <label class="form-label">City</label>
                                <input type="text" class="form-control" id="city" name="city" maxlength="50">
                        </div>

                        <div class="col-md-4">
                                <label class="form-label">State Code</label>
                                <input type="text" class="form-control" id="statecode" name="statecode" maxlength="2">
                        </div>

                        <div class="col-md-4">
                                <label class="form-label">Country</label>
                                <input type="text" class="form-control" id="country" name="country" maxlength="50">
                        </div>

                        <div class="col-12 mt-4">
                                <button type="submit" class="btn btn-primary w-100">Submit</button>
                        </div>

                </form>
        </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>