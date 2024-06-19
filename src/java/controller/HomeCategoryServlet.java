/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.CategoryDAO;
import model.CategoryDTO;
import model.ProductDAO;
import model.ProductDTO;

/**
 *
 * @author Dash F15
 */
@WebServlet(name = "ListCategoryServlet", urlPatterns = {"/home"})
public class HomeCategoryServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ListCategoryServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("</body>");
            out.println("</html>");
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
//        processRequest(request, response);
        CategoryDAO cd = new CategoryDAO();
        ProductDAO pd = new ProductDAO();
        List<CategoryDTO> clist = cd.getAllCategories();
        List<ProductDTO> pList = pd.getAllProduct();
        List<ProductDTO> ipList = pd.getProductByCid(1);
        List<ProductDTO> samList = pd.getProductByCid(2);
        List<ProductDTO> opList = pd.getProductByCid(3);
        List<ProductDTO> top4_New = pd.getNewProducts();
        List<ProductDTO> top4_Quantity = pd.getQuantityProducts();
        ProductDTO ip1 = ipList.get(0);
        ProductDTO sam1 = samList.get(0);
        ProductDTO op1 = opList.get(0);
        request.setAttribute("ip1", ip1);
        request.setAttribute("sam1", sam1);
        request.setAttribute("op1", op1);

        request.setAttribute("top4N", top4_New);
        request.setAttribute("top4Q", top4_Quantity);
        HttpSession session = request.getSession();
        session.setAttribute("list", clist);
        request.getRequestDispatcher("home.jsp").forward(request, response);
//        request.getRequestDispatcher("list").forward(request, response);
//        request.getRequestDispatcher("product").forward(request, response);
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
//        processRequest(request, response);
        CategoryDAO cd = new CategoryDAO();
        ProductDAO pd = new ProductDAO();
        List<CategoryDTO> clist = cd.getAllCategories();
        List<ProductDTO> pList = pd.getAllProduct();
        List<ProductDTO> ipList = pd.getProductByCid(1);
        List<ProductDTO> samList = pd.getProductByCid(2);
        List<ProductDTO> opList = pd.getProductByCid(3);
        List<ProductDTO> top4_New = pd.getNewProducts();
        List<ProductDTO> top4_Quantity = pd.getQuantityProducts();
        ProductDTO ip1 = ipList.get(0);
        ProductDTO sam1 = samList.get(0);
        ProductDTO op1 = opList.get(0);
        request.setAttribute("ip1", ip1);
        request.setAttribute("sam1", sam1);
        request.setAttribute("op1", op1);

        request.setAttribute("top4N", top4_New);
        request.setAttribute("top4Q", top4_Quantity);
        HttpSession session = request.getSession();
        session.setAttribute("list", clist);
        request.getRequestDispatcher("home.jsp").forward(request, response);
//        request.getRequestDispatcher("list").forward(request, response);
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
