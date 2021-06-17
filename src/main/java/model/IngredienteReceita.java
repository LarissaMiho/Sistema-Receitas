package model;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

/**
 *
 * @author mihoj
 */
@Entity
@Table(name = "ingrediente_receita")
@NamedQueries({ @NamedQuery(name = "IngredienteReceita.findAll", query = "SELECT i FROM IngredienteReceita i"),
		@NamedQuery(name = "IngredienteReceita.findById", query = "SELECT i FROM IngredienteReceita i WHERE i.id = :id") })
public class IngredienteReceita implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Basic(optional = false)
	@Column(name = "id")
	private Long id;
	@JoinColumn(name = "ingrediente", referencedColumnName = "id")
	@ManyToOne
	private Ingrediente ingrediente;
	@JoinColumn(name = "receita", referencedColumnName = "id")
	@ManyToOne
	private Receita receita;

	@Column(name = "quantidade")
	private String quantidade;

	public IngredienteReceita() {
	}

	public IngredienteReceita(Long id) {
		this.id = id;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Ingrediente getIngrediente() {
		return ingrediente;
	}

	public void setIngrediente(Ingrediente ingrediente) {
		this.ingrediente = ingrediente;
	}

	public Receita getReceita() {
		return receita;
	}

	public void setReceita(Receita receita) {
		this.receita = receita;
	}

	public String getQuantidade() {
		return quantidade;
	}

	public void setQuantidade(String quantidade) {
		this.quantidade = quantidade;
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
		if (!(object instanceof IngredienteReceita)) {
			return false;
		}
		IngredienteReceita other = (IngredienteReceita) object;
		if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
			return false;
		}
		return true;
	}

	@Override
	public String toString() {
		return "com.mycompany.mavenproject1.IngredienteReceita[ id=" + id + " ]";
	}

}
