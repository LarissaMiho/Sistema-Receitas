package model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;


@Entity(name="receita")
public class Receita {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(name="nome")
	private String nome;
	
	@Column(name="modoPreparo")
	private String modoPreparo;
	
	@Column(name="ingredientes")
	private List<Ingrediente> ingredientes;

	public Receita(Long id, String nome, String modoPreparo) {
		super();
		this.id = id;
		this.nome = nome;
		this.modoPreparo = modoPreparo;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}
	

	public String getModoPreparo() {
		return modoPreparo;
	}







	public void setModoPreparo(String modoPreparo) {
		this.modoPreparo = modoPreparo;
	}







	public List<Ingrediente> getIngredientes() {
		return ingredientes;
	}

	public void setIngredientes(List<Ingrediente> ingredientes) {
		this.ingredientes = ingredientes;
	}

	
}
