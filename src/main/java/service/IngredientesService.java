package service;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import model.Ingrediente;

public class IngredientesService {

	public static void criar(String nome) {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("ingrediente");        
        EntityManager em = emf.createEntityManager();
        
        /* Criação Mde uma entidade - CREATE */        
        Ingrediente u0 = new Ingrediente();
        u0.setNome(nome);
        em.getTransaction().begin();
        em.persist(u0);
        em.getTransaction().commit();
        
        em.close();
        emf.close(); 
	}
}
