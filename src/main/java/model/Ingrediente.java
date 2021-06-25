package model;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author mihoj
 */
@Entity
@Table(name = "ingrediente")
@NamedQueries({ @NamedQuery(name = "Ingrediente.findAll", query = "SELECT i FROM Ingrediente i"),
		@NamedQuery(name = "Ingrediente.findById", query = "SELECT i FROM Ingrediente i WHERE i.id = :id"),
		@NamedQuery(name = "Ingrediente.findByNome", query = "SELECT i FROM Ingrediente i WHERE i.nome = :nome") })
public class Ingrediente implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Basic(optional = false)
	@Column(name = "id")
	private Long id;
	@Column(name = "nome")
	private String nome;
	@OneToMany(mappedBy = "ingrediente", fetch = FetchType.EAGER)
	private List<IngredienteReceita> ingredienteReceitaList;

	public Ingrediente(Long id, String nome) {
		super();
		this.id = id;
		this.nome = nome;
	}

	public Ingrediente() {
	}

	public Ingrediente(Long id) {
		this.id = id;
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

	public List<IngredienteReceita> getIngredienteReceitaList() {
		return ingredienteReceitaList;
	}

	public void setIngredienteReceitaList(List<IngredienteReceita> ingredienteReceitaList) {
		this.ingredienteReceitaList = ingredienteReceitaList;
	}

	@Override
	public int hashCode() {
		int hash = 0;
		hash += (id != null ? id.hashCode() : 0);
		return hash;
	}

	@Override
	public boolean equals(Object object) {
		// TODO: Warning - this method won't work in the case the id fields are not set
		if (!(object instanceof Ingrediente)) {
			return false;
		}
		Ingrediente other = (Ingrediente) object;
		if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
			return false;
		}
		return true;
	}

	@Override
	public String toString() {
		return "com.mycompany.mavenproject1.Ingrediente[ id=" + id + " ]";
	}

}
