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
@WebServlet("/receitas")
public class ReceitaController extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        response.getWriter().println("Hello");
        RequestDispatcher rd = request.getRequestDispatcher("receita.jsp");
		rd.forward(request, response);
    }
}
