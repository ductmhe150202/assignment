/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Authentication;

import DAL.AccountDAO;
import Model.Account;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ductm
 */
@WebServlet(name = "BaseAuthenticationController", urlPatterns = {"/BaseAuthenticationController"})
public abstract class BaseAuthenticationController extends HttpServlet {

    private boolean isAuthenticated(HttpServletRequest request) {
        Account account = (Account) request.getSession().getAttribute("account");
        if (account != null) {
            return true;
        }
        else {
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                String username = null;
                String password = null;
                for (Cookie cooky : cookies) {
                    if (cooky.getName().equals("username")){
                        username = cooky.getValue();}
                    else if (cooky.getName().equals("password")){
                        password = cooky.getValue();}
                }
                AccountDAO acc = new AccountDAO();
                account = acc.get(username, password);
                if (account != null) {
                    request.getSession().setAttribute("account", account);
                    return true;
                }
                else {
                    return false;
                }
            }
            else return false;
        }
    }

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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (isAuthenticated(request)) processGet(request, response);
        else {
            String alert = "You must login first";
            request.setAttribute("alert", alert);
            request.getRequestDispatcher("login").forward(request, response);
        }
    }

    protected abstract void processGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException;

    protected abstract void processPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException;
    
    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (isAuthenticated(request)) processPost(request,response);
        else {
            String alert = "You must login first";
            request.setAttribute("alert", alert);
            request.getRequestDispatcher("login").forward(request, response);
        }
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
