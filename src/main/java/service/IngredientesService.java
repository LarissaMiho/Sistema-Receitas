package service;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import model.Ingrediente;

public class IngredientesService {

	public void criar(Ingrediente ingrediente) {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("ingrediente");        
        EntityManager em = emf.createEntityManager();
        
        /* Criação Mde uma entidade - CREATE */        

        em.getTransaction().begin();
        em.persist(ingrediente);
        em.getTransaction().commit();
        
        em.close();
        emf.close(); 
	}
	
	public void editar(Ingrediente ingrediente) {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("ingrediente");        
        EntityManager em = emf.createEntityManager();
        
        /* Criação Mde uma entidade - CREATE */        

        em.getTransaction().begin();
        em.merge(ingrediente);
        em.getTransaction().commit();
        
        em.close();
        emf.close(); 
	}
	
	public List<Ingrediente> listarTodos() {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("ingrediente");
        EntityManager em = emf.createEntityManager();
        String hql = "SELECT i FROM ingrediente i";
        Query query = em.createQuery(hql);
        List<Ingrediente> results = query.getResultList();
        em.close();
        emf.close();
        return results;
    }
}
