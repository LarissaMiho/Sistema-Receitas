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

	<form action="/action_page.php">
		<label for="fname">Adicionar um Ingrediente Novo:</label><br>
		<br> <label for="fname">Nome do Ingrediente:</label><br> <input
			type="text" value="Caramelo"><br>
		<td><button type="button">Adicionar</button></td>
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
		<tr>
			<td>1</td>
			<td><input type="text" value="Açucar"></td>
			<td><button type="button">Salvar</button></td>
			<td><button type="button">Remover</button></td>
		</tr>
		<tr>
			<td>2</td>
			<td><input type="text" value="Leite"></td>
			<td><button type="button">Salvar</button></td>
			<td><button type="button">Remover</button></td>
		</tr>
		<tr>
			<td>3</td>
			<td><input type="text" value="Farinha de Trigo"></td>
			<td><button type="button">Salvar</button></td>
			<td><button type="button">Remover</button></td>
		</tr>
		<tr>
			<td>4</td>
			<td><input type="text" value="Chocolate"></td>
			<td><button type="button">Salvar</button></td>
			<td><button type="button">Remover</button></td>
		</tr>
		<tr>
			<td>5</td>
			<td><input type="text" value="Fermento"></td>
			<td><button type="button">Salvar</button></td>
			<td><button type="button">Remover</button></td>
		</tr>
		<tr>
			<td>6</td>
			<td><input type="text" value="Creme de Leite"></td>
			<td><button type="button">Salvar</button></td>
			<td><button type="button">Remover</button></td>
		</tr>
	</table>

</body>
</html>