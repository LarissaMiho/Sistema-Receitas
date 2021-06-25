package controller;

import java.io.IOException;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import model.IngredienteReceita;
import model.Receita;
import object.ObjectIngrediente;
import service.IngredienteReceitaService;
import service.IngredientesService;
import service.ReceitasService;

/**
 * Servlet implementation class NovaReceitaServlet
 */
@WebServlet("/receitas")
public class ReceitaController extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

		String nomeReceita = request.getParameter("nome");
		String modoPreparo = request.getParameter("modoPreparo");
		String ingredientesString = request.getParameter("ingredientesInserir");

		String idReceita = request.getParameter("id");

		Receita receita = null;

		ReceitasService receitaService = new ReceitasService();
		IngredientesService ingredientesService = new IngredientesService();
		IngredienteReceitaService ingredienteReceitaService = new IngredienteReceitaService();
		if (idReceita == null || idReceita.equals("")) {
			receita = new Receita(null, nomeReceita, modoPreparo);
			receita = receitaService.criar(receita);
		} else {
			receita = new Receita(Long.parseLong(idReceita), nomeReceita, modoPreparo);
			receitaService.editar(receita);
		}

		List<ObjectIngrediente> listaObjectIngredientes = null;
		if (ingredientesString != null && !ingredientesString.isEmpty() && ingredientesString.length() > 2) {
			Type listType = new TypeToken<ArrayList<ObjectIngrediente>>() {
			}.getType();
			listaObjectIngredientes = new Gson().fromJson(ingredientesString, listType);
			IngredienteReceita ingredienteReceita = null;
			for (ObjectIngrediente objectIngrediente : listaObjectIngredientes) {
				ingredienteReceita = new IngredienteReceita();
				ingredienteReceita.setIngrediente(ingredientesService.encontrarPorId(objectIngrediente.getId()));
				ingredienteReceita.setQuantidade(objectIngrediente.getQtd());
				ingredienteReceita.setReceita(receita);
				ingredienteReceitaService.criar(ingredienteReceita);
			}
		}

		RequestDispatcher rd = request.getRequestDispatcher("receita.jsp");
		rd.forward(request, response);
	}
}
