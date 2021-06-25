<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Receita</title>
<style>
button {
  background-color: #4CAF50; /* Green */
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
}
#ingredientes {
	font-family: Arial, Helvetica, sans-serif;
	border-collapse: collapse;
	width: 100%;
}

#ingredientes td, #ingredientes th {
	border: 1px solid #ddd;
	padding: 8px;
}

#ingredientes tr:nth-child(even) {
	background-color: #f2f2f2;
}

#ingredientes tr:hover {
	background-color: #ddd;
}

#ingredientes th {
	padding-top: 12px;
	padding-bottom: 12px;
	text-align: left;
	background-color: #f2f2f2;
	color: black;
}

.menu {
	margin-right: 10px;
	font-weight: bolder;
}

a {
	text-decoration: none;
	color: white;
}

input[type=text], select {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}
</style>
</head>
<body>
	<div style="margin: 0 auto; width: 1244px">
		<div
			style="display: flex; flex-flow: row nowrap; justify-content: center; background-color: black; height: 20px">
			<div class="menu">
				<a href="index.jsp">Ingredientes</a>
			</div>
			<div class="menu">
				<a href="receita.jsp">Receitas</a>
			</div>
		</div>
		<h2>Editar Receita</h2>

		<form action="criarReceita2.jsp">
			<label for="fname">Nome da Receita:</label><br> <input
				type="text" id="fname" name="fname" value="Bolo de Chocolate"><br>
			<br> <label for="lname">Modo de Preparo:</label><br>
			<textarea type="text" id="lname" name="lname" value="Doe"></textarea>
			<br>
			<br> <label for="lname">Adicionar Ingrediente:</label><br>
			<select id="cars" name="cars">
				<option value="Farinha de Trigo">Farinha de Trigo</option>
				<option value="saab">Leite</option>
				<option value="fiat">Chocolate</option>
				<option value="audi">Fermento</option>
				<option value="audi">Açucar</option>
				<option value="audi">Creme de Leite</option>
			</select><br>
			<br> <label for="lname">Quantidade:</label><br> <input
				type="text" id="fname" name="fname" value="200g"><br>
			<br> <input type="submit" value="Adicionar Ingrediente">
		</form>
		<br>
		<h4>Todos os Ingredientes:</h4>
		<table>
			<tr>
				<th>Nome</th>
				<th>Quantidade</th>
				<th></th>
			</tr>
			<tr>
				<td><label for="lname">Açucar</label><br></td>
				<td><label for="lname">200g</label><br></td>
				<td><button type="button">Remover</button></td>
			</tr>
			<tr>
				<td><label for="lname">Leite</label><br></td>
				<td><label for="lname">1 xícara</label><br></td>
				<td><button type="button">Remover</button></td>
			</tr>
			<tr>
				<td><label for="lname">Chocolate</label><br></td>
				<td><label for="lname">50g</label><br></td>
				<td><button type="button">Remover</button></td>
			</tr>
			<tr>
				<td><label for="lname">Fermento</label><br></td>
				<td><label for="lname">1 colher de chá</label><br></td>
				<td><button type="button">Remover</button></td>
			</tr>
		</table>
	</div>
</body>
</html>