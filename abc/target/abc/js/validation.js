function validateForm() {
    var firstname = document.getElementById("firstname").value.trim();
    var lastname = document.getElementById("lastname").value.trim();
    var email = document.getElementById("email").value.trim();
    var dobValue = document.getElementById("dob").value.trim();
    var admissiondateValue = document.getElementById("admission_date").value.trim();
    var stateCode = document.getElementById("statecode");
    if (firstname === "" || firstname.length > 50) {
        alert("First Name is required and max 50 characters");
        return false;
    }
    if (lastname.length > 50) {
        alert("max Length is 50 character");
        return false;
    }
    if (!validateEmail(email)) {
        alert("Invalid emailAddress");
        return false;
    }
    if (dobValue) {
        var dob = new Date(dobValue);
        var today = new Date();
        var age = today.getFullYear() - dob.getFullYear();
        var m = today.getMonth() - dob.getMonth();
        if (m < 0 || (m == 0 && today.getDate() < dob.getDate())) {
            age--;
        }
        if (age < 18) {
            alert("Age must be at least 18 years");
            return false;
        }
    }
    if (!admissiondateValue) {
        alert("Admission date required");
        return false;
    }
    var admissionDate = new Date(admissiondateValue);
    if (admissionDate > new Date()) {
        alert("Addmission date not Future");
        return false;
    }
    stateCode.value = stateCode.value.toUpperCase();
    if (stateCode.value.length > 2) {
        alert("state code max length");
        return false;
    }
    return true;
}
function validateEmail(email) {
    var regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return regex.test(email);
}
function validateEmailBlure() {
    var email = document.getElementById("email").value.trim();
    if (email && !validateEmail(email)) {
        alert("Invalid Email Format");
    }
}
