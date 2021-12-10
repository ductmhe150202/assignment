/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.Date;

/**
 *
 * @author ductm
 */
public class Attendance {
    private int AttID;
    private Student Student;
    private Classs clas;
    private Slot Slot;
    private String Lecture;
    private Date AttDate;
    private boolean Present;

    public int getAttID() {
        return AttID;
    }

    public void setAttID(int AttID) {
        this.AttID = AttID;
    }

    public Student getStudent() {
        return Student;
    }

    public void setStudent(Student Student) {
        this.Student = Student;
    }

    public Classs getClas() {
        return clas;
    }

    public void setClas(Classs clas) {
        this.clas = clas;
    }

    public Slot getSlot() {
        return Slot;
    }

    public void setSlot(Slot Slot) {
        this.Slot = Slot;
    }

    public String getLecture() {
        return Lecture;
    }

    public void setLecture(String Lecture) {
        this.Lecture = Lecture;
    }

    public Date getAttDate() {
        return AttDate;
    }

    public void setAttDate(Date AttDate) {
        this.AttDate = AttDate;
    }

    public boolean isPresent() {
        return Present;
    }

    public void setPresent(boolean Present) {
        this.Present = Present;
    }
    
}
