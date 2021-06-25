package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Receita;
import service.ReceitasService;

@WebServlet("/RemoverReceita")
public class RemoverReceitaController extends HttpServlet{

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String id = request.getParameter("idReceita");
		ReceitasService receitasService = new ReceitasService();
		Receita receita = receitasService.encontrarPorId(Long.parseLong(id));

		receitasService.deletar(receita);

		RequestDispatcher rd = request.getRequestDispatcher("receita.jsp");
		rd.forward(request, response);
	}

}
