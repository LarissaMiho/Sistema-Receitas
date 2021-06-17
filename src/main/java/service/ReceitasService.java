package service;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import model.Receita;

public class ReceitasService {

	EntityManagerFactory emf = null;
	EntityManager em = null;
	
	public ReceitasService() {
		emf = Persistence.createEntityManagerFactory("labes");        
        em = emf.createEntityManager();
	}
		
	
	public  Receita criar(Receita receita) {
        em.getTransaction().begin();
        em.persist(receita);
        em.getTransaction().commit();
        
        em.close();
        emf.close(); 
        return receita;
	}
	
	public void editar(Receita receita) {
        em.getTransaction().begin();
        em.merge(receita);
        em.getTransaction().commit();
        
        em.close();
        emf.close(); 
	}
	
	public List<Receita> listarTodos() {
        String hql = "SELECT i FROM receita i";
        Query query = em.createQuery(hql);
        List<Receita> results = query.getResultList();
        em.close();
        emf.close();
        return results;
    }
}
