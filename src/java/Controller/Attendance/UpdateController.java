/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Attendance;

import Controller.Authentication.BaseAuthenticationController;
import DAL.AttendanceDAO;
import DAL.ClassDAO;
import Model.Account;
import Model.Attendance;
import Model.Classs;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ductm
 */
public class UpdateController extends BaseAuthenticationController {

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
        int ClassID = Integer.parseInt(request.getParameter("ClassID"));
        ClassDAO cdao = new ClassDAO();
        Classs cl = cdao.getClass(ClassID);
        int SlotID = Integer.parseInt(request.getParameter("SlotID"));
        Date AttDate = Date.valueOf(request.getParameter("AttDate"));
        Account account = (Account) request.getSession().getAttribute("account");
        AttendanceDAO attdao = new AttendanceDAO();
        ArrayList<Attendance> atts = attdao.getAtt(ClassID, SlotID, AttDate, account.getUsername());
        HttpSession session = request.getSession();
        session.setAttribute("classs", cl);
        session.setAttribute("SlotID", SlotID);
        session.setAttribute("atts", atts);
        session.setAttribute("AttDate", AttDate);
        request.getRequestDispatcher("update.jsp").forward(request, response);
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
        request.setCharacterEncoding("UTF-8");
        
        String[] ids = request.getParameterValues("AttID");
        ArrayList<Attendance> atts = new ArrayList<>();
        for(String id : ids) {
            Attendance att = new Attendance();
            att.setAttID(Integer.parseInt(id));
            att.setPresent(request.getParameter("present"+id) != null);
            atts.add(att);
        }
        AttendanceDAO attdao = new AttendanceDAO();
        attdao.update(atts);
        Account account = (Account) request.getSession().getAttribute("account");
        Classs cl = (Classs) request.getSession().getAttribute("classs");
        int SlotID = (Integer) request.getSession().getAttribute("SlotID");
        Date AttDate = (Date) request.getSession().getAttribute("AttDate");
        atts = attdao.getAtt(cl.getClassID(), SlotID, AttDate, account.getUsername());
        request.setAttribute("atts", atts);
        request.getRequestDispatcher("listatt.jsp").forward(request, response);
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
