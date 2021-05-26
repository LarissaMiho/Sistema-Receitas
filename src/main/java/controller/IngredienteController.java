package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Ingrediente;
import service.IngredientesService;


/**
 * Servlet implementation class NovaReceitaServlet
 */
@WebServlet("/ingredientes")
public class IngredienteController extends HttpServlet{
	
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Cadastrando Ingredientes");
		String nomeIngrediente = request.getParameter("nome");
		String idIngrediente = request.getParameter("id");
		String quantidadeIngrediente = request.getParameter("quantidade");
		System.out.println(idIngrediente+"-------------------------------------------");
		Ingrediente ingrediente = null;
		IngredientesService ingredienteService = new IngredientesService();
		if(idIngrediente == null) {
			ingrediente = new Ingrediente(null, nomeIngrediente, quantidadeIngrediente);
			ingredienteService.criar(ingrediente);
		}else {
			ingrediente = new Ingrediente(Long.parseLong(idIngrediente), nomeIngrediente, quantidadeIngrediente);
			ingredienteService.editar(ingrediente);
		}
		
		
		
		
		
		RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
		//request	.setAttribute("ingrediente", ingrediente.getNome());
		rd.forward(request, response);
		
	}
	

}
