/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAL;

import Context.DBContext;
import Model.Schedule;
import Model.Student;
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
public class StudentDAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    public ArrayList<Student> get(int ClassID, int SlotID, String username) {
        ArrayList<Student> students = new ArrayList<>();
        try {
            String sql = "select s.StudentID, s.StudentName from Schedule s1\n" +
                         "inner join Class c on s1.ClassID = c.ClassID\n" +
                         "inner join Student s on s1.StudentID = s.StudentID\n" +
                         "inner join Slot s2 on s1.SlotID = s2.SlotID\n" +
                         "inner join Account a on s1.Lecture = a.Username\n" +
                         "where c.ClassID = ?\n" +
                         "and s2.SlotID = ?\n" +
                         "and a.Username = ?";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, ClassID);
            ps.setInt(2, SlotID);
            ps.setString(3, username);
            rs = ps.executeQuery();
            while(rs.next()) {
                Student s = new Student();
                s.setStudentID(rs.getString("StudentID"));
                s.setStudentName(rs.getString("StudentName"));
                students.add(s);
            }
        } catch (Exception ex) {
            Logger.getLogger(StudentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return students;
    }
    public static void main(String[] args) {
        StudentDAO dao = new StudentDAO();
        ArrayList<Student> students = dao.get(1, 2, "ductm");
        for (Student s : students) {
            System.out.println(s);
        }
    }
}
