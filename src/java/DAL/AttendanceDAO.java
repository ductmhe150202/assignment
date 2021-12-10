/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAL;

import Context.DBContext;
import Model.Attendance;
import Model.Classs;
import Model.Slot;
import Model.Student;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ductm
 */
public class AttendanceDAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    public void insert (ArrayList<Attendance> atts) {
        try {
            conn = new DBContext().getConnection();
            conn.setAutoCommit(false);
            String sql = "INSERT INTO [Attendance]\n" +
                        "           ([StudentID]\n" +
                        "           ,[ClassID]\n" +
                        "           ,[Slot]\n" +
                        "           ,[Lecture]\n" +
                        "           ,[AttDate]\n" +
                        "           ,[Present])\n" +
                        "     VALUES\n" +
                        "           (?\n" +
                        "           ,?\n" +
                        "           ,?\n" +
                        "           ,?\n" +
                        "           ,?\n" +
                        "           ,?)";
            for(Attendance att : atts) {
                ps = conn.prepareStatement(sql);
                ps.setString(1, att.getStudent().getStudentID());
                ps.setInt(2, att.getClas().getClassID());
                ps.setInt(3, att.getSlot().getSlotID());
                ps.setString(4, att.getLecture());
                ps.setDate(5, att.getAttDate());
                ps.setBoolean(6, att.isPresent());
                ps.executeUpdate();
            }
            conn.commit();
        } catch (Exception ex) {
            Logger.getLogger(AttendanceDAO.class.getName()).log(Level.SEVERE, null, ex);
            try {
                conn = new DBContext().getConnection();
                conn.rollback();
            } catch (Exception ex1) {
                Logger.getLogger(AttendanceDAO.class.getName()).log(Level.SEVERE, null, ex1);
            }
        }
        finally {
            try {
                conn = new DBContext().getConnection();
                conn.setAutoCommit(true);
            } catch (Exception ex1) {
                Logger.getLogger(AttendanceDAO.class.getName()).log(Level.SEVERE, null, ex1);
            }
        }
    }
    public static void main(String[] args) {
        ArrayList<Attendance> atts = new ArrayList<>();
        Attendance att = new Attendance();
        Student s = new Student();
        s.setStudentID("HE130064");
        att.setStudent(s);
        Classs c = new Classs();
        c.setClassID(1);
        att.setClas(c);
        Slot sl = new Slot();
        sl.setSlotID(2);
        att.setSlot(sl);
        att.setLecture("ductm");
        att.setAttDate(Date.valueOf(LocalDate.now()));
        att.setPresent(true);
        atts.add(att);
        AttendanceDAO attdao = new AttendanceDAO();
        attdao.insert(atts);
    }
}
