package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Ingrediente;
import model.Receita;
import service.ReceitasService;



/**
 * Servlet implementation class NovaReceitaServlet
 */
@WebServlet("/receitas")
public class ReceitaController extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
    	
    	System.out.println("Cadastrando Receita");
		String nomeReceita = request.getParameter("nome");
		String modoPreparo = request.getParameter("modoPreparo");
		String ingredientesString = request.getParameter("ingredientes");
		
		String idReceita = request.getParameter("id");
		System.out.println(idReceita+"-------------------------------------------");
		Receita receita = null;
		
		ReceitasService receitaService = new ReceitasService();
		if(idReceita == null) {
			receita = new Receita(null, nomeReceita, modoPreparo);
			receitaService.criar(receita);
		}else {
			receita = new Receita(Long.parseLong(idReceita), nomeReceita, modoPreparo);
			receitaService.editar(receita);
		}
    	
    
        RequestDispatcher rd = request.getRequestDispatcher("receita.jsp");
		rd.forward(request, response);
    }
}
