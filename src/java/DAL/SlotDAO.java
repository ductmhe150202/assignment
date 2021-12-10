/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAL;

import Context.DBContext;
import Model.Slot;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ductm
 */
public class SlotDAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    public ArrayList<Slot> getAllSlot() {
        ArrayList<Slot> slots = new ArrayList<>();
        try {
            String sql = "select * from Slot";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()) {
                Slot s = new Slot();
                s.setSlotID(rs.getInt("SlotID"));
                s.setStart(rs.getTime("Start"));
                s.setEnd(rs.getTime("End"));
                slots.add(s);
            }
        }   catch (Exception ex) {
                Logger.getLogger(SlotDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        return slots;
    }
    public static void main(String[] args) {
        SlotDAO dao = new SlotDAO();
        ArrayList<Slot> slots = dao.getAllSlot();
        for (Slot s : slots) {
            System.out.println(s);
        }
    }
}
