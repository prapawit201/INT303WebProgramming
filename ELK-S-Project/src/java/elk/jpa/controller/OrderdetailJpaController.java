/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package elk.jpa.controller;

import elk.jpa.controller.exceptions.NonexistentEntityException;
import elk.jpa.controller.exceptions.PreexistingEntityException;
import elk.jpa.controller.exceptions.RollbackFailureException;
import elk.model.Orderdetail;
import java.io.Serializable;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import elk.model.Orderlist;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.transaction.UserTransaction;

/**
 *
 * @author Windows10
 */
public class OrderdetailJpaController implements Serializable {

    public OrderdetailJpaController(UserTransaction utx, EntityManagerFactory emf) {
        this.utx = utx;
        this.emf = emf;
    }
    private UserTransaction utx = null;
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Orderdetail orderdetail) throws PreexistingEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            Orderlist orderno = orderdetail.getOrderno();
            if (orderno != null) {
                orderno = em.getReference(orderno.getClass(), orderno.getOrderno());
                orderdetail.setOrderno(orderno);
            }
            em.persist(orderdetail);
            if (orderno != null) {
                orderno.getOrderdetailList().add(orderdetail);
                orderno = em.merge(orderno);
            }
            utx.commit();
        } catch (Exception ex) {
            try {
                utx.rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            if (findOrderdetail(orderdetail.getOrderdetailid()) != null) {
                throw new PreexistingEntityException("Orderdetail " + orderdetail + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Orderdetail orderdetail) throws NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            Orderdetail persistentOrderdetail = em.find(Orderdetail.class, orderdetail.getOrderdetailid());
            Orderlist ordernoOld = persistentOrderdetail.getOrderno();
            Orderlist ordernoNew = orderdetail.getOrderno();
            if (ordernoNew != null) {
                ordernoNew = em.getReference(ordernoNew.getClass(), ordernoNew.getOrderno());
                orderdetail.setOrderno(ordernoNew);
            }
            orderdetail = em.merge(orderdetail);
            if (ordernoOld != null && !ordernoOld.equals(ordernoNew)) {
                ordernoOld.getOrderdetailList().remove(orderdetail);
                ordernoOld = em.merge(ordernoOld);
            }
            if (ordernoNew != null && !ordernoNew.equals(ordernoOld)) {
                ordernoNew.getOrderdetailList().add(orderdetail);
                ordernoNew = em.merge(ordernoNew);
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
                Integer id = orderdetail.getOrderdetailid();
                if (findOrderdetail(id) == null) {
                    throw new NonexistentEntityException("The orderdetail with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(Integer id) throws NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            Orderdetail orderdetail;
            try {
                orderdetail = em.getReference(Orderdetail.class, id);
                orderdetail.getOrderdetailid();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The orderdetail with id " + id + " no longer exists.", enfe);
            }
            Orderlist orderno = orderdetail.getOrderno();
            if (orderno != null) {
                orderno.getOrderdetailList().remove(orderdetail);
                orderno = em.merge(orderno);
            }
            em.remove(orderdetail);
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

    public List<Orderdetail> findOrderdetailEntities() {
        return findOrderdetailEntities(true, -1, -1);
    }

    public List<Orderdetail> findOrderdetailEntities(int maxResults, int firstResult) {
        return findOrderdetailEntities(false, maxResults, firstResult);
    }

    private List<Orderdetail> findOrderdetailEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Orderdetail.class));
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

    public Orderdetail findOrderdetail(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Orderdetail.class, id);
        } finally {
            em.close();
        }
    }

    public int getOrderdetailCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Orderdetail> rt = cq.from(Orderdetail.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
