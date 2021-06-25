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
<style>
button {
  background-color: #4CAF50; /* Green */
  border: none;
  color: white;
  padding: 5px 20px;
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
<script type="text/javascript">
	function editar(id, nome){
		document.getElementById("idIngredienteEditar").value = id;
		document.getElementById("nomeIngrediente").value = nome;
	}

</script>
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

		<h2>Lista de Ingredientes</h2>

		<form action="/labES/ingredientes" method="post">	
			<hr>
			<input readonly="readonly" id="idIngredienteEditar" name="id">
			<label for="fname">Adicionar um Ingrediente Novo:</label><br> <br>
			<label for="fname">Nome do Ingrediente:</label><br> <input
				name="nome" id="nomeIngrediente" type="text"><br> <br>
			<td><button type="submit">Salvar</button></td>
			<hr>
		</form>
		<br> 
		<br>
		<table id="ingredientes">
			<tr>
				<th>Id</th>
				<th>Nome</th>
				<th></th>
			</tr>
			<%
				IngredientesService ingredientesService = new IngredientesService();
			List<Ingrediente> ingredientes = ingredientesService.listarTodos();
			for (Ingrediente ingrediente : ingredientes) {
			%>
			<form action="/labES/RemoverIngrediente" method="post">
				<tr>
					<td onClick="editar(<%=ingrediente.getId()%>,'<%=ingrediente.getNome()%>')"><input readonly="readonly" style="width: 70px" type="text"
                        name="idIngrediente" value="<%=ingrediente.getId()%>"></td>
					<td onClick="editar(<%=ingrediente.getId()%>,'<%=ingrediente.getNome()%>')"><span type="text" name="nome"
						 ><%=ingrediente.getNome()%></span></td>
					<td><button  type="submit" >Remover</button></td>
				</tr>
			</form>
			<%
				}
			%>
		</table>
	</div>
</body>
</html>