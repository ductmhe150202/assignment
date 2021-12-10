/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Attendance;

import Controller.Authentication.BaseAuthenticationController;
import DAL.ClassDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DAL.SlotDAO;
import DAL.StudentDAO;
import Model.Account;
import Model.Classs;
import Model.Slot;
import Model.Student;
import java.util.ArrayList;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ductm
 */
public class IndexController extends BaseAuthenticationController {



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
        ClassDAO cdao = new ClassDAO();
        SlotDAO sdao = new SlotDAO();
        ArrayList<Classs> classes = cdao.getAllClass();
        ArrayList<Slot> slots = sdao.getAllSlot();
        HttpSession session = request.getSession();
        session.setAttribute("classes", classes);
        session.setAttribute("slots", slots);
        request.getRequestDispatcher("index.jsp").forward(request, response);
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
        Account account = (Account) request.getSession().getAttribute("account");
        int ClassID = Integer.parseInt(request.getParameter("ClassID"));
        int SlotID = Integer.parseInt(request.getParameter("SlotID"));
        StudentDAO studao = new StudentDAO();
        ArrayList<Student> students = studao.get(ClassID, SlotID, account.getUsername());
        HttpSession session = request.getSession();
        session.setAttribute("students", students);
        session.setAttribute("ClassID", ClassID);
        session.setAttribute("SlotID", SlotID);
        request.getRequestDispatcher("att.jsp").forward(request, response);
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
