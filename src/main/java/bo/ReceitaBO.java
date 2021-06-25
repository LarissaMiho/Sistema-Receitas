package bo;

import model.IngredienteReceita;
import model.Receita;
import object.ObjectIngrediente;
import object.ObjectReceita;
import service.IngredienteReceitaService;
import service.IngredientesService;
import service.ReceitasService;

public class ReceitaBO {

	private static ReceitaBO instance;
	
	public static ReceitaBO getInstance() {
		if (instance == null) {
			instance = new ReceitaBO();
		}
		return instance;
	}
	
	public ObjectReceita salvar(ObjectReceita objectReceita) {
		ReceitasService receitaService = new ReceitasService();
		Receita receita = new Receita();
		receita.setId(objectReceita.getId());
		receita.setNome(objectReceita.getNome());
		receita.setModoPreparo(objectReceita.getModoPreparo());
		
		receita = receitaService.criar(receita);
		
		IngredienteReceitaService ingredienteReceitaService = new IngredienteReceitaService();
		IngredientesService ingredienteService = new IngredientesService();
		IngredienteReceita ingredienteReceita = null;
		for(ObjectIngrediente ingrediente : objectReceita.getIngredientes()) {
			ingredienteReceita = new IngredienteReceita();
			ingredienteReceita.setId(ingrediente.getId());
			ingredienteReceita.setIngrediente(ingredienteService.encontrarPorId(ingrediente.getId()));
			ingredienteReceita.setQuantidade(ingrediente.getQtd());
			if (ingrediente.getId() == null) {
				ingredienteReceitaService.criar(ingredienteReceita);	
			}else {
				ingredienteReceitaService.editar(ingredienteReceita);
			}
		}
		objectReceita.setId(receita.getId());
		return objectReceita;
	}
}
