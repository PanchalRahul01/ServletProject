package com.validation;

import com.model.Student;

import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.regex.Pattern;

public class StudentValidator {


    private static final Pattern emailPattern = Pattern.compile("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$");
    private static final DateTimeFormatter dateFormat = DateTimeFormatter.ofPattern("yyyy-MM-dd");
    public static ArrayList<String> validate(Student stud) {
        ArrayList<String> errors = new ArrayList<>();

        if(stud.getFirstName()== null || stud.getFirstName().trim().isEmpty()){
            errors.add("First Name is Required");
        }else if(stud.getFirstName().length()>50){
            errors.add("First Name is too long");
        }

        if(stud.getLastName()== null && stud.getLastName().length()>50){
            errors.add("LastName Max Length is 50");
        }

        if(stud.getEmail() ==null || stud.getEmail().trim().isEmpty()){
            errors.add("Email is Required");
        } else if (stud.getEmail().length()>100) {
            errors.add("Email max length is 100");
        } else if (!emailPattern.matcher(stud.getEmail()).matches()) {
            errors.add("Invalid Email format");
        }

        if(stud.getDateOfBirth() !=null || !stud.getDateOfBirth().trim().isEmpty()){
            try{
                LocalDate dob = LocalDate.parse(stud.getDateOfBirth(), dateFormat);
                int age= Period.between(dob, LocalDate.now()).getYears();
                if(age<18){
                    errors.add("age must be 18");
                }
            }catch (Exception e){
                errors.add("Invalid Date Format()");
            }
        }

        if(stud.getGender() ==null || stud.getGender().trim().isEmpty()){
            errors.add("Gender is Required");
        }
        else if (!stud.getGender().equalsIgnoreCase("Male")
                && !stud.getGender().equalsIgnoreCase("Female")) {
            errors.add("Gender must be Male or Female");
        }

        if (stud.getDateOfAdmission() ==null || stud.getDateOfAdmission().trim().isEmpty()){
            errors.add("Date of Admission is Required");
        }else {
            try{
                LocalDate doa = LocalDate.parse(stud.getDateOfAdmission(), dateFormat);
                if (doa.isAfter(LocalDate.now())) {
                    errors.add("Date of Admission cannot be greater than today");
                }
            }catch (Exception e){
                errors.add("Date of Admission must be in dd/MM/yyyy format");
            }
        }

       /* Date dateAdmission = new Date(stud.getDateOfAdmission());
        Date datedob =new Date(stud.getDateOfBirth());*/

        /*if(datedob.before(dateAdmission)){
            errors.add("Date of Admission cannot be before Date of Birth");
        }*/

        if (stud.getStudentClass() != null && stud.getStudentClass().length() > 10) {
            errors.add("Class max length is 10");
        }

        if (stud.getCity() != null && stud.getCity().length() > 50) {
            errors.add("City max length is 50");
        }

        if (stud.getStateCode() != null) {
            if (stud.getStateCode().length() > 2) {
                errors.add("State Code max length is 2");
            } else {
                stud.setStateCode(stud.getStateCode().toUpperCase());
            }
        }

        if (stud.getCountry() != null && stud.getCountry().length() > 50) {
            errors.add("Country max length is 50");
        }

        return errors;

    }
}
