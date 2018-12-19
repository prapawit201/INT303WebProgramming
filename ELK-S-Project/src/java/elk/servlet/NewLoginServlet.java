/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package elk.servlet;

import elk.jpa.controller.AccountJpaController;
import elk.model.Account;
import java.io.IOException;
import java.io.PrintWriter;
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
public class NewLoginServlet extends HttpServlet {
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
      
        if(request.getSession().getAttribute("LoggedIn")!=null){
            response.sendRedirect("NewHomepage");
            return;
        }
        
        String  Username = request.getParameter("Username");
        String  Password = request.getParameter("password");
        
            if(Username!=null && Password != null){
                AccountJpaController accountCtrl = new AccountJpaController(utx, emf);
                Account SearchAccount = accountCtrl.findByUsername(Username);
                
                
                if(SearchAccount !=null){
                    if(SearchAccount.getPassword().equalsIgnoreCase(Password)){
                        request.getSession(false).setAttribute("LoggedIn", SearchAccount);
                        
                        response.sendRedirect("NewHomepage");
                        return;
                    }
                    request.setAttribute("msg", "Invalid");
                    getServletContext().getRequestDispatcher("/LoginView.jsp").forward(request, response);
                }
                 request.setAttribute("msg", "Invalid");
                 getServletContext().getRequestDispatcher("/LoginView.jsp").forward(request, response);
            }
         getServletContext().getRequestDispatcher("/LoginView.jsp").forward(request, response);
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
