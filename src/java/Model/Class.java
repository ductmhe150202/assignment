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
public class Class {
    private String ClassID;
    private int Slot;

    public Class() {
    }

    public Class(String ClassID, int Slot) {
        this.ClassID = ClassID;
        this.Slot = Slot;
    }

    public String getClassID() {
        return ClassID;
    }

    public void setClassID(String ClassID) {
        this.ClassID = ClassID;
    }

    public int getSlot() {
        return Slot;
    }

    public void setSlot(int Slot) {
        this.Slot = Slot;
    }
    
}
