/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package elk.model;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Administrator
 */
@Entity
@Table(name = "CATEGORY")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Category.findAll", query = "SELECT c FROM Category c")
    , @NamedQuery(name = "Category.findByCatid", query = "SELECT c FROM Category c WHERE c.catid = :catid")
    , @NamedQuery(name = "Category.findByCatname", query = "SELECT c FROM Category c WHERE c.catname like :catname")})
public class Category implements Serializable {

    @OneToMany(mappedBy = "catid")
    private List<Product> productList;

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "CATID")
    private String catid;
    @Size(max = 100)
    @Column(name = "CATNAME")
    private String catname;

    public Category() {
    }

    public Category(String catid) {
        this.catid = catid;
    }

    public String getCatid() {
        return catid;
    }

    public void setCatid(String catid) {
        this.catid = catid;
    }

    public String getCatname() {
        return catname;
    }

    public void setCatname(String catname) {
        this.catname = catname;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (catid != null ? catid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Category)) {
            return false;
        }
        Category other = (Category) object;
        if ((this.catid == null && other.catid != null) || (this.catid != null && !this.catid.equals(other.catid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "elk.model.Category[ catid=" + catid + " ]";
    }

    @XmlTransient
    public List<Product> getProductList() {
        return productList;
    }

    public void setProductList(List<Product> productList) {
        this.productList = productList;
    }
    
}
