package service;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import model.Ingrediente;

public class IngredientesService {
	EntityManagerFactory emf = null;
	EntityManager em = null;
	
	public IngredientesService() {
		emf = Persistence.createEntityManagerFactory("labes");        
        em = emf.createEntityManager();
	}

	public void criar(Ingrediente ingrediente) {
	
        /* Cria��o Mde uma entidade - CREATE */        

        em.getTransaction().begin();
        em.persist(ingrediente);
        em.getTransaction().commit();
        
        em.close();
        emf.close(); 
	}
	
	public void editar(Ingrediente ingrediente) {

        em.getTransaction().begin();
        em.merge(ingrediente);
        em.getTransaction().commit();
        
        em.close();
        emf.close(); 
	}
	
	public Ingrediente encontrarPorId(Long id) {
        String hql = "SELECT i FROM Ingrediente i WHERE i.id = " + id;
        Query query = em.createQuery(hql);
        Ingrediente results = (Ingrediente) query.getResultList().get(0);
        em.close();
        emf.close();
        return results;
    }

	public List<Ingrediente> listarTodos() {
        String hql = "SELECT i FROM Ingrediente i";
        Query query = em.createQuery(hql);
        List<Ingrediente> results = query.getResultList();
        em.close();
        emf.close();
        return results;
    }
}
