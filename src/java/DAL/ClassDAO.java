/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAL;

import Context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import Model.Classs;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ductm
 */
public class ClassDAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    public ArrayList<Classs> getAllClass() {
        ArrayList<Classs> classes = new ArrayList<>();
        try {
            String sql = "select * from Class";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()) {
                Classs c = new Classs();
                c.setClassID(rs.getInt("ClassID"));
                c.setClassName(rs.getString("ClassName"));
                classes.add(c);
            }
        } catch (Exception ex) {
            Logger.getLogger(ClassDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return classes;
    }
    public static void main(String[] args) {
        ClassDAO dao = new ClassDAO();
        ArrayList<Classs> classes = dao.getAllClass();
        for (Classs c : classes) {
            System.out.println(c);
        }
    }
}
