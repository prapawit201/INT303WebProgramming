/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package elk.servlet;

import elk.jpa.controller.AccountJpaController;
import elk.jpa.controller.OrderdetailJpaController;
import elk.jpa.controller.OrderlistJpaController;
import elk.jpa.controller.exceptions.RollbackFailureException;
import elk.model.Account;
import elk.model.Orderdetail;
import elk.model.Orderlist;
import elk.model.s.LineItem;
import elk.model.s.ShoppingCart;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
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
 * @author Administrator
 */
public class CheckoutServlet extends HttpServlet {
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
     
        HttpSession session = request.getSession();
        Account accountSession = (Account) session.getAttribute("LoggedIn");
        ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
        
        if(cart == null){
            request.setAttribute("msg_checkout", "Your cart is empty!!!");
            getServletContext().getRequestDispatcher("/Showcart").forward(request, response);
            
        }else{
            System.out.println("HI");
            AccountJpaController accountCtrl = new AccountJpaController(utx, emf);
            Account account = accountCtrl.findAccount(accountSession.getAccountid());
            
            OrderlistJpaController ordersCtrl = new OrderlistJpaController(utx, emf);
            OrderdetailJpaController orderdetailCtrl = new OrderdetailJpaController(utx, emf);
            
            
            List<LineItem> lineItemList = cart.getLineItems();
            
            Orderlist orders = new Orderlist();
            if(ordersCtrl.getOrderlistCount() == 0){
                orders.setOrderno(1);
            }else{
                orders.setOrderno(ordersCtrl.getOrderlistCount()+1);
            }
            
           orders.setOrderdate(new Date());
           orders.setAccountid(account);
           orders.setTotalprice(cart.getTotalPrice());
                try{
                    ordersCtrl.create(orders);
                }catch(RollbackFailureException ex){
                    System.out.println(ex);
                }catch(Exception ex){
                    System.out.println(ex);
                }
            
                for(LineItem lineItem : lineItemList){
                    Orderdetail orderDetail = new Orderdetail();
                    if(orderdetailCtrl.getOrderdetailCount()==0){
                        orderDetail.setOrderdetailid(1);
                    }else{
                        orderDetail.setOrderdetailid(orderdetailCtrl.getOrderdetailCount() + 1 );
                    }
                    orderDetail.setOrderno(orders);
                    
                    orderDetail.setProductcode(lineItem.getProduct().getProductid());
                    orderDetail.setQuantity(lineItem.getQuantity());
                    orderDetail.setPrice(lineItem.getSalePrice());
                    
                    try{
                        orderdetailCtrl.create(orderDetail);
                    }catch(RollbackFailureException ex){
                        System.out.println(ex);
                    }catch(Exception ex){
                        System.out.println(ex);
                    }
                }
                
                session.removeAttribute("cart");
                request.setAttribute("success", "Checkout Success");
                request.setAttribute("msg_checkout", "");
                request.setAttribute("msg", "Your cart is empty!!!");
                getServletContext().getRequestDispatcher("/HomepageView.jsp").forward(request, response);
                
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
