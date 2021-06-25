package object;

import java.util.List;

public class ObjectReceita {
	private Long id;
	private String nome;
	private String modoPreparo;
	private List<ObjectIngrediente> ingredientes;

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

	public List<ObjectIngrediente> getIngredientes() {
		return ingredientes;
	}

	public void setIngredientes(List<ObjectIngrediente> ingredientes) {
		this.ingredientes = ingredientes;
	}

}
