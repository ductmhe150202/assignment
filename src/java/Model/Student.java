/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author ductm
 */
public class Student {
    public String StudentID;
    public String StudentName;
    public String Email;
    public String ClassID;

    public Student() {
    }

    public Student(String StudentID, String StudentName, String Email, String ClassID) {
        this.StudentID = StudentID;
        this.StudentName = StudentName;
        this.Email = Email;
        this.ClassID = ClassID;
    }

    public String getStudentID() {
        return StudentID;
    }

    public void setStudentID(String StudentID) {
        this.StudentID = StudentID;
    }

    public String getStudentName() {
        return StudentName;
    }

    public void setStudentName(String StudentName) {
        this.StudentName = StudentName;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getClassID() {
        return ClassID;
    }

    public void setClass(String ClassID) {
        this.ClassID = ClassID;
    }
    
}
