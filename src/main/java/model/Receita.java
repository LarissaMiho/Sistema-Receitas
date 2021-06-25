package model;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
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
@Table(name = "receita")
@NamedQueries({ @NamedQuery(name = "Receita.findAll", query = "SELECT r FROM Receita r"),
		@NamedQuery(name = "Receita.findById", query = "SELECT r FROM Receita r WHERE r.id = :id"),
		@NamedQuery(name = "Receita.findByNome", query = "SELECT r FROM Receita r WHERE r.nome = :nome"),
		@NamedQuery(name = "Receita.findByModoPreparo", query = "SELECT r FROM Receita r WHERE r.modoPreparo = :modoPreparo") })
public class Receita implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Basic(optional = false)
	@Column(name = "id")
	private Long id;
	@Column(name = "nome")
	private String nome;
	@Column(name = "modo_preparo")
	private String modoPreparo;
	@OneToMany(mappedBy = "receita", fetch = FetchType.EAGER, cascade=CascadeType.REMOVE)
	private List<IngredienteReceita> ingredienteReceitaList;

	public Receita(Long id, String nome, String modoPreparo) {
		super();
		this.id = id;
		this.nome = nome;
		this.modoPreparo = modoPreparo;
	}

	public Receita() {
	}

	public Receita(Long id) {
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

	public String getModoPreparo() {
		return modoPreparo;
	}

	public void setModoPreparo(String modoPreparo) {
		this.modoPreparo = modoPreparo;
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
		if (!(object instanceof Receita)) {
			return false;
		}
		Receita other = (Receita) object;
		if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
			return false;
		}
		return true;
	}

	@Override
	public String toString() {
		return "com.mycompany.mavenproject1.Receita[ id=" + id + " ]";
	}

}
