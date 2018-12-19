/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package elk.jpa.controller;

import elk.jpa.controller.exceptions.NonexistentEntityException;
import elk.jpa.controller.exceptions.PreexistingEntityException;
import elk.jpa.controller.exceptions.RollbackFailureException;
import elk.model.Account;
import java.io.Serializable;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import elk.model.Category;
import elk.model.Product;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.transaction.UserTransaction;

/**
 *
 * @author Windows10
 */
public class ProductJpaController implements Serializable {

    public ProductJpaController(UserTransaction utx, EntityManagerFactory emf) {
        this.utx = utx;
        this.emf = emf;
    }
    private UserTransaction utx = null;
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Product product) throws PreexistingEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            Category catid = product.getCatid();
            if (catid != null) {
                catid = em.getReference(catid.getClass(), catid.getCatid());
                product.setCatid(catid);
            }
            em.persist(product);
            if (catid != null) {
                catid.getProductList().add(product);
                catid = em.merge(catid);
            }
            utx.commit();
        } catch (Exception ex) {
            try {
                utx.rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            if (findProduct(product.getProductid()) != null) {
                throw new PreexistingEntityException("Product " + product + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Product product) throws NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            Product persistentProduct = em.find(Product.class, product.getProductid());
            Category catidOld = persistentProduct.getCatid();
            Category catidNew = product.getCatid();
            if (catidNew != null) {
                catidNew = em.getReference(catidNew.getClass(), catidNew.getCatid());
                product.setCatid(catidNew);
            }
            product = em.merge(product);
            if (catidOld != null && !catidOld.equals(catidNew)) {
                catidOld.getProductList().remove(product);
                catidOld = em.merge(catidOld);
            }
            if (catidNew != null && !catidNew.equals(catidOld)) {
                catidNew.getProductList().add(product);
                catidNew = em.merge(catidNew);
            }
            utx.commit();
        } catch (Exception ex) {
            try {
                utx.rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                String id = product.getProductid();
                if (findProduct(id) == null) {
                    throw new NonexistentEntityException("The product with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }
    public List<Product> findProductByCat(Category catid){
        EntityManager em =getEntityManager();
        try{
            Query q =em.createNamedQuery("Product.findByCatid");
            q.setParameter("catid", catid);
            return q.getResultList();
        }catch (NoResultException book) {
            return null;
            
        }finally{
            em.close();
        }
    }

    public void destroy(String id) throws NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            Product product;
            try {
                product = em.getReference(Product.class, id);
                product.getProductid();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The product with id " + id + " no longer exists.", enfe);
            }
            Category catid = product.getCatid();
            if (catid != null) {
                catid.getProductList().remove(product);
                catid = em.merge(catid);
            }
            em.remove(product);
            utx.commit();
        } catch (Exception ex) {
            try {
                utx.rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Product> findProductEntities() {
        return findProductEntities(true, -1, -1);
    }

    public List<Product> findProductEntities(int maxResults, int firstResult) {
        return findProductEntities(false, maxResults, firstResult);
    }

    private List<Product> findProductEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Product.class));
            Query q = em.createQuery(cq);
            if (!all) {
                q.setMaxResults(maxResults);
                q.setFirstResult(firstResult);
            }
            return q.getResultList();
        } finally {
            em.close();
        }
    }

    public Product findProduct(String id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Product.class, id);
        } finally {
            em.close();
        }
    }
    
     public List<Product> findByProductname(String productname) {
        EntityManager em = getEntityManager();
        try {
            Query query = em.createNamedQuery("Product.findByProductname");
            query.setParameter("productname","%"+productname+"%" );
            return query.getResultList();
        }catch(NoResultException no){
            return null;
        }finally {
            em.close();
        }
    }
     
     public Product findByOnlyProduct(String productname) {
        EntityManager em = getEntityManager();
        try {
            Query query = em.createNamedQuery("Product.findByProductid");
            query.setParameter("productid",productname );
            return (Product) query.getSingleResult();
        }catch(NoResultException no){
            return null;
        }finally {
            em.close();
        }
    }

    public int getProductCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Product> rt = cq.from(Product.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
