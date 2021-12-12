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
public class Schedule {
    private Classs Clas;
    private Student Student;
    private Slot Slot;
    private Account account;

    public Classs getClas() {
        return Clas;
    }

    public void setClas(Classs Clas) {
        this.Clas = Clas;
    }

    public Student getStudent() {
        return Student;
    }

    public void setStudent(Student Student) {
        this.Student = Student;
    }

    public Slot getSlot() {
        return Slot;
    }

    public void setSlot(Slot Slot) {
        this.Slot = Slot;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }
    
}
