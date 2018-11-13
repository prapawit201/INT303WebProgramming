/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bab.servlet;

import bab.controller.AccountJpaController;
import bab.controller.HistoryJpaController;
import bab.model.Account;
import bab.model.History;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.annotation.Resource;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;

/**
 *
 * @author Windows10
 */
public class WithdrawServlet extends HttpServlet {

    @PersistenceUnit(unitName = "BabPU")
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
        HttpSession session = request.getSession(false);
        session.removeAttribute("complete");
        if (session.getAttribute("account") == null) {
            response.sendRedirect("Login");
            return;
        }
        String withdraw = request.getParameter("withdraw");
        Account account = (Account) session.getAttribute("account");
        if (withdraw != null) {
            int numWithdraw = Integer.parseInt(withdraw);
            int accountid = account.getAccountid();
            if (numWithdraw > 0) {
                AccountJpaController accJpa = new AccountJpaController(utx, emf);
                Account acc = accJpa.findAccount(accountid);
                if (acc != null) {
                    int balanceDB = acc.getBalance();
                    if (balanceDB >= numWithdraw) {
                        balanceDB = balanceDB - numWithdraw;
                        acc.setBalance(balanceDB);
                        session.setAttribute("account", acc);
                        try {
                            accJpa.edit(acc);
                            HistoryJpaController hisJpa = new HistoryJpaController(utx, emf);
                            History his = new History(hisJpa.getHistoryCount() + 1);
                            his.setAccountid(acc);
                            his.setAmount(numWithdraw);
                            his.setBalance(balanceDB);
                            his.setMethod("withdraw");
                            his.setTime(new Date());
                            hisJpa.create(his);
                        } catch (Exception ex) {
                            System.out.println(ex);
                        }
                        session.setAttribute("complete", "withdraw Complete");
                        response.sendRedirect("Myaccount");
                        return;
                    }
                }
                session.setAttribute("complete", "withdraw Error");
                response.sendRedirect("Myaccount");
                return;
            }
            session.setAttribute("complete", "withdraw Error");
            response.sendRedirect("Myaccount");
            return;
        }
        getServletContext().getRequestDispatcher("/WithdrawView.jsp").forward(request, response);
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
