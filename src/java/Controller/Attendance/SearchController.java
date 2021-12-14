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
public class SearchController extends BaseAuthenticationController {

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
        int ClassID = 0, SlotID = 0;
        Date AttDate = Date.valueOf(LocalDate.now());
        request.setAttribute("ClassID", ClassID);
        request.setAttribute("SlotID", SlotID);
        request.setAttribute("AttDate", AttDate);
        request.getRequestDispatcher("search.jsp").forward(request, response);
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
        
        int ClassID = Integer.parseInt(request.getParameter("ClassID"));
        int SlotID = Integer.parseInt(request.getParameter("SlotID"));
        Date AttDate = Date.valueOf(request.getParameter("AttDate"));
        if (ClassID == 0 || SlotID == 0) {
            String alert = "Class/Slot has not been choosen";
            request.setAttribute("alert", alert);
            request.setAttribute("ClassID", ClassID);
            request.setAttribute("SlotID", SlotID);
            request.setAttribute("AttDate", AttDate);
            request.getRequestDispatcher("search.jsp").forward(request, response);
        }
        Account account = (Account) request.getSession().getAttribute("account");
        AttendanceDAO attdao = new AttendanceDAO();
        ArrayList<Attendance> atts = attdao.getAtt(ClassID, SlotID, AttDate, account.getUsername());
        if (atts.isEmpty() == true) {
            String alert = "This class has not been attended yet.";
            request.setAttribute("alert", alert);
            request.setAttribute("ClassID", ClassID);
            request.setAttribute("SlotID", SlotID);
            request.setAttribute("AttDate", AttDate);
            request.getRequestDispatcher("search.jsp").forward(request, response);
            return;
        }
        request.setAttribute("ClassID", ClassID);
        request.setAttribute("SlotID", SlotID);
        request.setAttribute("AttDate", AttDate);
        request.setAttribute("atts", atts);
        request.getRequestDispatcher("search.jsp").forward(request, response);
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
