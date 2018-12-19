/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package elk.model.s;

import com.sun.org.glassfish.gmbal.Description;
import elk.model.Product;
import java.math.BigDecimal;
import javax.enterprise.inject.Model;

/**
 *
 * @author Books
 */
public class LineItem {
    Product product;
    double salePrice;
    int quantity;
    Model model;
    Description description;

    public LineItem() {
    }

    public LineItem(Product product, int quantity) {
        this.product = product;
        this.quantity = quantity;
        this.salePrice=product.getPrice();// edited
        this.model=model;
        this.description=description;
    }
    
    public LineItem(Product product) {
        this(product,1);
    }
    
    public Double getTotalPrice(){
        System.out.println(this.salePrice);
        System.out.println(this.quantity);
        return this.salePrice*this.quantity;//edited
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Double getSalePrice() {
        return salePrice;
    }

    public void setSalePrice(Double salePrice) {
        this.salePrice = salePrice;//edited
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
    
}


