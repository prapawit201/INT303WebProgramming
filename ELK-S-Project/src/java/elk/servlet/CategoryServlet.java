/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package elk.servlet;

import elk.jpa.controller.CategoryJpaController;
import elk.jpa.controller.ProductJpaController;
import elk.model.Category;
import elk.model.Product;
import static elk.model.Product_.catid;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.annotation.Resource;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.UserTransaction;

/**
 *
 * @author Administrator
 */
public class CategoryServlet extends HttpServlet {
    @PersistenceUnit(unitName = "ElkfinalProjectPU")
    EntityManagerFactory emf;
    
    @Resource
    UserTransaction utx;

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
        ProductJpaController prodJpa = new ProductJpaController(utx, emf);
        List<Product> product = prodJpa.findProductEntities();
        
        if (request.getParameter("catid")!=null) {
            System.out.println(request.getParameter("catid"));
            CategoryJpaController categoryJpa = new CategoryJpaController(utx,emf);
            Category category = categoryJpa.findCategory(request.getParameter("catid"));
            List<Product> catid = prodJpa.findProductByCat(category);
            System.out.println("catid");
            request.setAttribute("catidresult", catid);
            
            getServletContext().getRequestDispatcher("/CategoryResult.jsp").forward(request, response);
            return ;
        }
        if (product !=null) {
            request.setAttribute("product", product);
            
        }
        getServletContext().getRequestDispatcher("/ProductView.jsp").forward(request, response);
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
        processRequest(request, response);
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
