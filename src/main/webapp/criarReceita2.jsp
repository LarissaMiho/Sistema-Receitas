
<%@page import="service.IngredientesService"%>
<%@page import="model.Ingrediente"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Receita</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="css/default/table.css">
<script>
	var listaIngrediente = [];
	var nome = "";
	var preparo = "";
	function getParams() {
		const queryString = window.location.search;
		const urlParams = new URLSearchParams(queryString);
		nome = urlParams.get('nome')
		preparo = urlParams.get('preparo')
	}

	function adicionarIngrediente() {
		var e = document.getElementById("ingredientes");
		var idIngrediente = e.value;
		var nomeIngrediente = e.options[e.selectedIndex].text;
		listaIngrediente.push({
			id : idIngrediente,
			nome : nomeIngrediente
		})
		addRowTable();
	}

	function addRowTable() {
		var table = document.getElementById("table-ingredientes");
		var tableString = "<tr><th>Nome</th><th>Quantidade</th><th></th></tr>";
		for (var i = 0; i < listaIngrediente.length; i++) {
			tableString += "<tr>" + "<td><label>"
					+ listaIngrediente[i].nome.split(" | ")[0]
					+ "</label><br></td>" + "<td><label>"
					+ listaIngrediente[i].nome.split(" | ")[1]
					+ "</label><br></td> "
					+ "<td><button type='button'>Remover</button></td>"
					+ "</tr>";
		}
		table.innerHTML = tableString;
	}

	function salvar() {
		var queryIngredientes = "&ingredientes="; 
		for(var i = 0; i < listaIngrediente.length; i++){
			if (listaIngrediente.length -1 == i){
				queryIngredientes += listaIngrediente[i].id;	
			}else{
				queryIngredientes += listaIngrediente[i].id + ",";	
			}
		}
	 	var url = "localhost:8080/receitas?nome=" + nome + "&modoPreparo=" + preparo + queryIngredientes;
		$.post(url, function({}, status) {
			alert("Data: " + data + "\nStatus: " + status);
		});
	}

	getParams();
</script>
</head>

<body>
	<ul>
		<li><a href="index.jsp">Ingredientes</a></li>
		<li><a href="receita.jsp">Receitas</a></li>
	</ul>
	<h2>Criar Receita Nova - Insira os Ingredientes da Receita</h2>



	<form action="/labES/receitas" method="post">
		<h3 for="fname">Bolo Simples</h3>
		<br> <label for="lname">Ingrediente:</label><br> <select
			id="ingredientes" name="ingredientes">
			<%
			IngredientesService ingredientesService = new IngredientesService();
			List<Ingrediente> ingredientes = ingredientesService.listarTodos();
			for (Ingrediente ingrediente : ingredientes) {
			%>
			<option value="<%=ingrediente.getId()%>"><%=ingrediente.getNome() + " | " + ingrediente.getQuantidade()%></option>
			<%
			}
			%>
		</select><br>
		<br> <input type="button" value="Adicionar Ingrediente"
			onclick="adicionarIngrediente()">
	</form>

	<button onclick="salvar()" style="margin-top: 15px;">Salvar</button>

	<table id="table-ingredientes">
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

	</table>

</body>
</html>