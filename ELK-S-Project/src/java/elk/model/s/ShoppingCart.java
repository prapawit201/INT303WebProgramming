/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package elk.model.s;

import elk.model.Product;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 *
 * @author Books
 */
@Entity
public class ShoppingCart implements Serializable {

    @Id
   private Map<String, LineItem> cart;
    
    public ShoppingCart() {
        cart = new HashMap();
    }
    
    public void add(Product p) {
        LineItem line = cart.get(p.getProductid());
        if (line == null) {
            cart.put(p.getProductid(), new LineItem(p));
        } else {
            line.setQuantity(line.getQuantity() + 1);
        }
    }
    
    public void remove(Product p) {
        this.remove(p.getProductid());
    }
    
    public void remove(String productid) {
        cart.remove(productid);
    }
    
    public double getTotalPrice(){
        double sum = 0;
        Collection<LineItem> lineItems = cart.values();
        for(LineItem lineItem : lineItems){
            sum+=lineItem.getTotalPrice();
        }
        return sum;
    }
    
    public int getTotalQuantity(){
        int sum =0;
        Collection<LineItem> lineItems = cart.values();
        for (LineItem lineItem : lineItems) {
            sum += lineItem.getQuantity();
        }
        return sum;
    }
    
    public List<LineItem> getLineItems(){
        return new ArrayList(cart.values());
    }

    public Map<String, LineItem> getCart() {
        return cart;
    }

    public void setCart(Map<String, LineItem> cart) {
        this.cart = cart;
    }
}
