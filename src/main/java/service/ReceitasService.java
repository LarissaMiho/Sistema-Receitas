package service;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import model.Receita;

public class ReceitasService {

	public void criar(Receita receita) {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("receita");        
        EntityManager em = emf.createEntityManager();
           

        em.getTransaction().begin();
        em.persist(receita);
        em.getTransaction().commit();
        
        em.close();
        emf.close(); 
	}
	
	public void editar(Receita receita) {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("receita");        
        EntityManager em = emf.createEntityManager();
           

        em.getTransaction().begin();
        em.merge(receita);
        em.getTransaction().commit();
        
        em.close();
        emf.close(); 
	}
	
	public List<Receita> listarTodos() {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("receita");
        EntityManager em = emf.createEntityManager();
        String hql = "SELECT i FROM receita i";
        Query query = em.createQuery(hql);
        List<Receita> results = query.getResultList();
        em.close();
        emf.close();
        return results;
    }
}
