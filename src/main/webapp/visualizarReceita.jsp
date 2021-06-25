<%@page import="model.IngredienteReceita"%>
<%@page import="service.ReceitasService"%>
<%@page import="model.Receita"%>
<%@page import="java.util.List"%>
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
	width: 200px
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

		<%
			String id = request.getParameter("id");
		ReceitasService receitasService = new ReceitasService();
		Receita receita = receitasService.encontrarPorId(Long.parseLong(id));
		%>

		<h2>Visualizar Receitas</h2>
		<a href="criarReceita.jsp">
			<button>Criar Receita Nova</button>
		</a><br> <br>
		<h4>Nome da receita:</h4>
		<input   type="text" name="nome" value="<%=receita.getNome()%>">
		<hr>
		<h4>Modo de preparar:</h4>
		<span><input   type="text" name="nome" value="<%=receita.getModoPreparo()%>"></span>
		<br>
		<hr>
		<h3>Ingredientes</h3>
		<%
		for(IngredienteReceita ingredienteReceita : receita.getIngredienteReceitaList()){ %>
		<span style="font-weight: bolder"><%=ingredienteReceita.getIngrediente().getNome()%> (<%=ingredienteReceita.getQuantidade()%>)</span>
		<br>
		<%} %>
		<hr>
		<button type="submit">Salvar</button>
		
		<table id="table-ingredientes">
		<tr>
				<th>Nome</th>
				<th>Quantidade</th>
				<th></th>
			</tr>
		<%for(IngredienteReceita ingredienteReceita : receita.getIngredienteReceitaList()){ %>
			<tr>
				<td><%=ingredienteReceita.getIngrediente().getNome()%></td>
				<td><%=ingredienteReceita.getQuantidade()%></td>
				<td></td>
			</tr>
		<%} %>

		</table>
	</div>
</body>
<script>
	var listaIngrediente = [];
	var nome = "";
	var preparo = "";
	function getParams() {
		const queryString = window.location.search;
		const urlParams = new URLSearchParams(queryString);
		nome = urlParams.get('nome')
		preparo = urlParams.get('preparo')
		document.getElementById("nome").value = nome;
		document.getElementById("modoPreparo").value = preparo;
	}

	function adicionarIngrediente() {
		var e = document.getElementById("ingredientes");
		var idIngrediente = e.value;
		var nomeIngrediente = e.options[e.selectedIndex].text;
		var qtdIngrediente = document.getElementById("rqtd").value;
		listaIngrediente.push({
			id : idIngrediente,
			nome : nomeIngrediente,
			qtd : qtdIngrediente
		});
		document.getElementById("ingredientesInserir").value = JSON
				.stringify(listaIngrediente)
		addRowTable();
	}

	function addRowTable() {
		var table = document.getElementById("table-ingredientes");
		var tableString = "<tr><th>Nome</th><th>Quantidade</th><th></th></tr>";
		for (var i = 0; i < listaIngrediente.length; i++) {
			tableString += "<tr>" + "<td><label>" + listaIngrediente[i].nome
					+ "</label><br></td>" + "<td><label>"
					+ listaIngrediente[i].qtd + "</label><br></td> "
					+ "<td><button type='button'>Remover</button></td>"
					+ "</tr>";
		}
		table.innerHTML = tableString;
	}

	function success() {
		alert("Foi")
	}

	getParams();
</script>
</html>