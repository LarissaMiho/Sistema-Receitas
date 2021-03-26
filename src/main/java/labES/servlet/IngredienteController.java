package labES.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class NovaReceitaServlet
 */
@WebServlet("/ingredientes")
public class IngredienteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Cadastrando Ingredientes");
		String nomeIngrediente = request.getParameter("nome");
		IngredienteModel ingrediente = new IngredienteModel(1, nomeIngrediente);
		
		
		RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
		request	.setAttribute("ingrediente", ingrediente.getNome());
		rd.forward(request, response);
		
	}

}
