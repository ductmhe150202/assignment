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
import java.util.HashMap;
import java.util.Map;
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
    
    public ArrayList<Attendance> getAtt(int ClassID, int SlotID, Date AttDate, String Lecture) {
        ArrayList<Attendance> atts = new ArrayList<>();
        try {
            String sql= "  select st.StudentID, st.StudentName, att.AttDate, att.Present from Attendance att \n" +
                        "  inner join Student st on att.StudentID = st.StudentID\n" +
                        "  inner join Class c on att.ClassID = c.ClassID\n" +
                        "  where \n" +
                        "  att.ClassID = ? \n" +
                        "  and att.Slot = ? \n" +
                        "  and att.AttDate = ? \n" +
                        "  and att.Lecture = ? ";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, ClassID);
            ps.setInt(2, SlotID);
            ps.setDate(3, AttDate);
            ps.setString(4, Lecture);
            rs = ps.executeQuery();
            while (rs.next()) {
                Attendance att = new Attendance();
                Student st = new Student();
                st.setStudentID(rs.getString("StudentID"));
                st.setStudentName(rs.getString("StudentName"));
                att.setStudent(st);
                att.setAttDate(rs.getDate("AttDate"));
                att.setPresent(rs.getBoolean("Present"));
                atts.add(att);
            }
        } catch (Exception ex) {
            Logger.getLogger(AttendanceDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return atts;
    }
    
    public ArrayList<Attendance> search (int ClassID, int SlotID, Date AttDate, String Lecture){
        ArrayList<Attendance> atts =  new ArrayList<>();
        try {
            String sql = "  select st.StudentID, st.StudentName, att.AttDate, att.Present from Attendance att \n" +
                        "  inner join Student st on att.StudentID = st.StudentID\n" +
                        "  inner join Class c on att.ClassID = c.ClassID\n" +
                        "  where att.Lecture = ? \n";
            
            int indexParam = 1;
            HashMap<Integer, Object[]> parameters = new HashMap<>();
            if (ClassID != -1) {
                sql += "  and att.ClassID = ? \n";
                indexParam++;
                Object[] params = new Object[2];
                params[0] = Integer.class.getTypeName();
                params[1] = ClassID;
                parameters.put(indexParam, params);
            }
            
            if (SlotID != -1) {
                sql += "  and att.Slot = ? \n";
                indexParam++;
                Object[] params = new Object[2];
                params[0] = Integer.class.getTypeName();
                params[1] = SlotID;
                parameters.put(indexParam, params);
            }
            
            if (AttDate.toString().length() > 0) {
                sql += "  and att.AttDate = ? \n";
                indexParam++;
                Object[] params = new Object[2];
                params[0] = Date.class.getTypeName();
                params[1] = AttDate;
                parameters.put(indexParam, params);
            }
            
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, Lecture);
            for (Map.Entry<Integer, Object[]> entry : parameters.entrySet()) {
                Integer index = entry.getKey();
                Object[] params = entry.getValue();
                String type = params[0].toString();
                if (type.equals(Integer.class.getTypeName())) ps.setInt(index, (Integer)params[1]);
                else if (type.equals(Date.class.getTypeName())) ps.setDate(index, (Date)params[1]);
            }
            rs = ps.executeQuery();
            while (rs.next()) {
                Attendance att = new Attendance();
                Student st = new Student();
                st.setStudentID(rs.getString("StudentID"));
                st.setStudentName(rs.getString("StudentName"));
                att.setStudent(st);
                att.setAttDate(rs.getDate("AttDate"));
                att.setPresent(rs.getBoolean("Present"));
                atts.add(att);
            }
        } catch (Exception ex) {
            Logger.getLogger(AttendanceDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return atts;
    }
    
    public static void main(String[] args) {
        ArrayList<Attendance> atts = new ArrayList<>();
//        Attendance att = new Attendance();
//        Student s = new Student();
//        s.setStudentID("HE130064");
//        att.setStudent(s);
//        Classs c = new Classs();
//        c.setClassID(1);
//        att.setClas(c);
//        Slot sl = new Slot();
//        sl.setSlotID(2);
//        att.setSlot(sl);
//        att.setLecture("ductm");
//        att.setAttDate(Date.valueOf(LocalDate.now()));
//        att.setPresent(true);
//        //atts.add(att);
        AttendanceDAO attdao = new AttendanceDAO();
        //attdao.insert(atts);
        atts = attdao.search(-1, -1, Date.valueOf(LocalDate.now()) , "ductm");
        for(Attendance at : atts) {
            System.out.println(at.getStudent().getStudentID());
            System.out.println(at.getStudent().getStudentName());
            System.out.println(at.getAttDate());
            System.out.println(at.isPresent());
            System.out.println("");
        }
    }
}
