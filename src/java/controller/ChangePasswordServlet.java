/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.AdminDAO;
import model.AdminDTO;

/**
 *
 * @author Dash F15
 */
@WebServlet(name = "ChangePasswordServlet", urlPatterns = {"/changepass"})
public class ChangePasswordServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        AdminDAO ad = new AdminDAO();
        HttpSession session = request.getSession();
        String username = request.getParameter("user");
        String o_pass = request.getParameter("o_pass");
        String n_pass = request.getParameter("n_pass");
        String rn_pass = request.getParameter("rn_pass");
        AdminDTO admin = ad.checkLogin(username, o_pass);
        if (admin == null) {
            request.setAttribute("error", "Your password is wrong! Please input again!!!");
            request.getRequestDispatcher("changepass.jsp").forward(request, response);
        } else if (!n_pass.equals(rn_pass)) {
            request.setAttribute("error", "New password & Re-type new password does not match! Please input again!!!");
            request.getRequestDispatcher("changepass.jsp").forward(request, response);
        } else {
            ad.changePass(username, n_pass);
            AdminDTO a = ad.checkLogin(username, n_pass);
            session.setAttribute("account", a);
            request.getRequestDispatcher("profile").forward(request, response);
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
        request.getRequestDispatcher("changepass.jsp").forward(request, response);
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
