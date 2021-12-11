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
    private Time Start;
    private Time End;

    public int getSlotID() {
        return SlotID;
    }

    public void setSlotID(int SlotID) {
        this.SlotID = SlotID;
    }

    public Time getStart() {
        return Start;
    }

    public void setStart(Time Start) {
        this.Start = Start;
    }

    public Time getEnd() {
        return End;
    }

    public void setEnd(Time End) {
        this.End = End;
    }

    @Override
    public String toString() {
        return "Slot{" + "SlotID=" + SlotID + ", Start=" + Start + ", End=" + End + '}';
    }
    
}
