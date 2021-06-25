package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.IngredienteReceita;
import model.Receita;
import service.IngredienteReceitaService;
import service.ReceitasService;

@WebServlet("/RemoverIngredienteReceita")
public class RemoverIngredienteReceitaController extends HttpServlet{

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String id = request.getParameter("idIngredienteReceita");
		IngredienteReceitaService ingredienteReceitasService = new IngredienteReceitaService();
		IngredienteReceita ingredienteReceita = ingredienteReceitasService.encontrarPorId(Long.parseLong(id));

		ingredienteReceitasService.deletar(ingredienteReceita);

		RequestDispatcher rd = request.getRequestDispatcher("criarReceita2.jsp?id="+ingredienteReceita.getReceita().getId());
		rd.forward(request, response);
	}

}

