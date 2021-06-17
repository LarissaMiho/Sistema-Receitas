package service;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import model.Ingrediente;
import model.IngredienteReceita;

public class IngredienteReceitaService {
	EntityManagerFactory emf = null;
	EntityManager em = null;
	
	public IngredienteReceitaService() {
		emf = Persistence.createEntityManagerFactory("labes");        
        em = emf.createEntityManager();
	}

	public void criar(IngredienteReceita ingredienteReceita) {
	
        /* Criação Mde uma entidade - CREATE */        

        em.getTransaction().begin();
        em.persist(ingredienteReceita);
        em.getTransaction().commit();
        
        em.close();
        emf.close(); 
	}
	
	public void editar(IngredienteReceita ingredienteReceita) {

        em.getTransaction().begin();
        em.merge(ingredienteReceita);
        em.getTransaction().commit();
        
        em.close();
        emf.close(); 
	}
	
	public Ingrediente encontrarPorId(Long id) {
        String hql = "SELECT i FROM IngredienteReceita i WHERE i.id = " + id;
        Query query = em.createQuery(hql);
        Ingrediente results = (Ingrediente) query.getResultList().get(0);
        em.close();
        emf.close();
        return results;
    }

	public List<Ingrediente> listarTodos() {
        String hql = "SELECT i FROM IngredienteReceita i";
        Query query = em.createQuery(hql);
        List<Ingrediente> results = query.getResultList();
        em.close();
        emf.close();
        return results;
    }
}
