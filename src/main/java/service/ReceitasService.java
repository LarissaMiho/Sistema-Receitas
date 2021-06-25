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
		getConnections();
	}

	public void getConnections() {
		emf = Persistence.createEntityManagerFactory("labes");
		em = emf.createEntityManager();
	}

	public Receita criar(Receita receita) {
		getConnections();
		em.getTransaction().begin();
		em.persist(receita);
		em.getTransaction().commit();

		em.close();
		emf.close();
		return receita;
	}
	
	public void deletar(Receita receita) {
		getConnections();
		em.getTransaction().begin();
		em.remove(em.contains(receita) ? receita : em.merge(receita));
		em.getTransaction().commit();
		em.close();
		emf.close();	
	}

	public void editar(Receita receita) {
		getConnections();
		em.getTransaction().begin();
		em.merge(receita);
		em.getTransaction().commit();

		em.close();
		emf.close();
	}

	public Receita encontrarPorId(Long id) {
		getConnections();
		String hql = "SELECT r FROM Receita r WHERE r.id = " + id;
		Query query = em.createQuery(hql);
		Receita results = (Receita) query.getResultList().get(0);
		em.close();
		emf.close();
		return results;
	}

	public List<Receita> listarTodos() {
		getConnections();
		String hql = "SELECT i FROM Receita i";
		Query query = em.createQuery(hql);
		List<Receita> results = query.getResultList();
		em.close();
		emf.close();
		return results;
	}
}
