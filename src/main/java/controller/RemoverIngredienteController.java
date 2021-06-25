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

@WebServlet("/RemoverIngrediente")
public class RemoverIngredienteController extends HttpServlet{
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String id = request.getParameter("idIngrediente");
		IngredientesService ingredienteService = new IngredientesService();
		Ingrediente ingrediente = ingredienteService.encontrarPorId(Long.parseLong(id));
		if(ingrediente.getIngredienteReceitaList()!= null && ingrediente.getIngredienteReceitaList().isEmpty()) {
			ingredienteService.deletar(ingrediente);
		}

		RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
		rd.forward(request, response);
	}
}
