function validateForm(): boolean {

    const firstname = (document.getElementById("firstname") as HTMLInputElement).value.trim();
    const lastname = (document.getElementById("lastname") as HTMLInputElement).value.trim();
    const email = (document.getElementById("email") as HTMLInputElement).value.trim();
    const dobValue = (document.getElementById("dob") as HTMLInputElement).value.trim();
    const admissionDateValue = (document.getElementById("admission_date") as HTMLInputElement).value.trim();
    const stateCode = document.getElementById("statecode") as HTMLInputElement;

    // First name validation

    if (firstname === "" || firstname.length > 50) {
        alert("First Name is required and max 50 characters");
        return false;
    }

    // Last name validation
    if (lastname.length > 50) {
        alert("Last Name max length is 50 characters");
        return false;
    }

    // Email validation
    if (!validateEmail(email)) {
        alert("Valid Email Address is required");
        return false;
    }

    // DOB validation
    if (!dobValue) {
        alert("Date of Birth is required");
        return false;
    }

    const dobDate = new Date(dobValue);
    const today = new Date();

    let age = today.getFullYear() - dobDate.getFullYear();
    const m = today.getMonth() - dobDate.getMonth();
    if (m < 0 || (m === 0 && today.getDate() < dobDate.getDate())) {
        age--;
    }

    if (age < 18) {
        alert("Age must be at least 18 years");
        return false;
    }

    // Admission date validation
    if (!admissionDateValue) {
        alert("Admission date is required");
        return false;
    }



    const admissionDate = new Date(admissionDateValue);
    if(admissionDate < dobDate){
        console.log("svd");
        alert("pagal ho kya");
        return false;
    }

    if (admissionDate > today) {
        alert("Admission date cannot be in the future");
        return false;
    }


    // State code
    stateCode.value = stateCode.value.toUpperCase();
    if (stateCode.value.length > 2) {
        alert("State code max length is 2");
        return false;
    }

    return true;
}

function validateEmail(email: string): boolean {
    const regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return regex.test(email);
}
