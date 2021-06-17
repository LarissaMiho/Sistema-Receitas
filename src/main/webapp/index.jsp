<%@page import="model.Ingrediente"%>
<%@page import="service.IngredientesService"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ingredientes</title>
<link rel="stylesheet" href="css/default/table.css">
</head>
<body>
	<ul>
		<li><a href="index.jsp">Ingredientes</a></li>
		<li><a href="receita.jsp">Receitas</a></li>
	</ul>
	<h2>Lista de Ingredientes</h2>

	<form action="/labES/ingredientes" method="post">
		<label for="fname">Adicionar um Ingrediente Novo:</label><br> <br>
		<label for="fname">Nome do Ingrediente:</label><br> <input
			name="nome" id="nomeIngrediente" type="text"><br><br>
		<td><button type="submit">Adicionar</button></td>
	</form>
	<br>
	<br>
	<form action="/action_page.php">
		<label for="fname">Pesquisar Ingrediente:</label><br> <input
			type="text" value="Chocolate"><br>
		<td><button type="button">Pesquisar</button></td>
	</form>
	<br>
	<table>
		<tr>
			<th>id</th>
			<th>Nome</th>
			<th></th>
			<th></th>
		</tr>
		<%
		IngredientesService ingredientesService = new IngredientesService();
		List<Ingrediente> ingredientes = ingredientesService.listarTodos();
		for (Ingrediente ingrediente : ingredientes) {
		%>
		<form action="/labES/ingredientes" method="post">
			<tr>
				<td><input readonly="readonly" style="width: 16px" type="text"
					name="id" value="<%=ingrediente.getId()%>"></td>
				<td><input type="text" name="nome"
					value="<%=ingrediente.getNome()%>" /></td>
				<td>
					<button type="submit">Salvar</button>
				</td>
				<td><button disabled="disabled" type="button">Remover</button></td>
			</tr>
		</form>
		<%
		}
		%>
	</table>

</body>
</html>