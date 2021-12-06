/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.Time;

/**
 *
 * @author ductm
 */
public class Slot {
    private int SlotID;
    private Time Time;

    public Slot() {
    }

    public Slot(int SlotID, Time Time) {
        this.SlotID = SlotID;
        this.Time = Time;
    }

    public int getSlotID() {
        return SlotID;
    }

    public void setSlotID(int SlotID) {
        this.SlotID = SlotID;
    }

    public Time getTime() {
        return Time;
    }

    public void setTime(Time Time) {
        this.Time = Time;
    }
    
}
