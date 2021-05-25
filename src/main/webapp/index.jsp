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

	<form onsubmit="return false;">
		<label for="fname">Adicionar um Ingrediente Novo:</label><br>
		<br> <label for="fname">Nome do Ingrediente:</label><br> <input name="nome" id="nomeIngrediente"
			type="text"><br>
		<td><button type="button" onClick="salvarIngrediente();">Adicionar</button></td>
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
		</tr>
		<tr>
			<td>1</td>
			<td><form action="/action_page.php">
					<input type="text" value="Açúcar">
					<button type="button">Salvar</button>
				</form></td>
			<td><button type="button">Remover</button></td>
		</tr>
		<tr>
			<td>2</td>
			<td><form action="/action_page.php">
					<input type="text" value="Leite">
					<button type="button">Salvar</button>
				</form></td>
			<td><button type="button">Remover</button></td>
		</tr>
		<tr>
			<td>3</td>
			<td><form action="/action_page.php">
					<input type="text" value="Farinha de Trigo">
					<button type="button">Salvar</button>
				</form></td>
			<td><button type="button">Remover</button></td>
		</tr>
		<tr>
			<td>4</td>
			<td><form action="/action_page.php">
					<input type="text" value="Chocolate">
					<button type="button">Salvar</button>
				</form></td>
			<td><button type="button">Remover</button></td>
		</tr>
		<tr>
			<td>5</td>
			<td><form action="/action_page.php">
					<input type="text" value="Fermento">
					<button type="button">Salvar</button>
				</form></td>
			<td><button type="button">Remover</button></td>
		</tr>
		<tr>
			<td>6</td>
			<td><form action="/action_page.php">
					<input type="text" value="Creme de Leite">
					<button type="button">Salvar</button>
				</form></td>
			<td><button type="button">Remover</button></td>
		</tr>
	</table>

</body>
<script type="text/javascript" src="../js/ingrediente/ingrediente.js"></script>
<script type="text/javascript" src="../../js/comum.js"></script>
</html>