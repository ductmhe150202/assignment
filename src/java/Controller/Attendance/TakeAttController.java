/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Attendance;

import Controller.Authentication.BaseAuthenticationController;
import DAL.AttendanceDAO;
import Model.Account;
import Model.Attendance;
import Model.Classs;
import Model.Slot;
import Model.Student;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ductm
 */
public class TakeAttController extends BaseAuthenticationController {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int ClassID = Integer.parseInt(request.getParameter("cid"));
        int SlotID = Integer.parseInt(request.getParameter("slid"));
        Account account = (Account) request.getSession().getAttribute("account");
        String[] ids = request.getParameterValues("sid");
        ArrayList<Attendance> atts = new ArrayList<>();
        for(String id : ids) {
            Attendance att = new Attendance();
            Student s = new Student();
            s.setStudentID(id);
            att.setStudent(s);
            Classs c = new Classs();
            c.setClassID(ClassID);
            att.setClas(c);
            Slot sl = new Slot();
            sl.setSlotID(SlotID);
            att.setSlot(sl);
            att.setLecture(account.getUsername());
            att.setAttDate(Date.valueOf(LocalDate.now()));
            att.setPresent(request.getParameter("present"+id)!=null);
            atts.add(att);
        }
        AttendanceDAO AttDAO = new AttendanceDAO();
        AttDAO.insert(atts);
        response.getWriter().println("Done");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
