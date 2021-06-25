
<%@page import="model.IngredienteReceita"%>
<%@page import="model.Receita"%>
<%@page import="service.ReceitasService"%>
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
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
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
		<h2>Criar Receita Nova - Insira os Ingredientes da Receita</h2>
<%
	ReceitasService receitaService = new ReceitasService();
	Receita receita = null;
	if(request.getParameter("id")!=null){
		receita = receitaService.encontrarPorId(Long.parseLong(request.getParameter("id")));
	}
%>


		<form action="/labES/receitas" method="post">
			<br> <label for="lname">Ingrediente:</label><br> <select
				id="ingredientes" name="ingredientes">
				<%
					IngredientesService ingredientesService = new IngredientesService();
				List<Ingrediente> ingredientes = ingredientesService.listarTodos();
				for (Ingrediente ingrediente : ingredientes) {
				%>
				<option value="<%=ingrediente.getId()%>"><%=ingrediente.getNome()%></option>
				<%
					}
				%>
			</select><br> <label for="rqtd">Qtd Ingrediente:</label><br> <input
				name="rqtd" id="rqtd" type="text"><br> <br> <input
				type="button" value="Adicionar Ingrediente"
				onclick="adicionarIngrediente()"> <input
				name="ingredientesInserir" id="ingredientesInserir" value=""
				style="width: 0px">
			<h5>
				Id: <input readonly="readonly" id="idReceitaEditar" name="id" value='<%=(receita != null ? receita.getId():"")%>'>
			</h5>
			<h5>
				Receita: <input name="nome" id="nome" value='<%=(receita != null ? receita.getNome():"")%>'>
			</h5>
			<h5>
				Preparo: 
				<textarea type="text" id="modoPreparo" name="modoPreparo"
				cols="175" rows="15"><%=(receita != null ? receita.getModoPreparo():"")%></textarea>
			</h5>
			<button type="submit" style="margin-top: 15px;">Salvar</button>
		</form>



		<table id="table-ingredientes">
			<tr>
				<th>Id</th>
				<th>Nome</th>
				<th>Quantidade</th>
				<th></th>
			</tr>	
			<%if(receita!= null){ %>
			<%for(IngredienteReceita ingredienteReceita:receita.getIngredienteReceitaList()){ %>
			<form action="/labES/RemoverIngredienteReceita" method="post">
			<tr>
				<td><input readonly="readonly" style="width: 70px" type="text"
                        name="idIngredienteReceita" value="<%=ingredienteReceita.getId()%>"></td>
				<td><input readonly="readonly"  type="text"
                        name="idIngrediente" value="<%=ingredienteReceita.getIngrediente().getNome()%>"></td>
				<td><input readonly="readonly"  type="text"
                        name="idIngrediente" value="<%=ingredienteReceita.getQuantidade()%>"></td>		
                <td><button  type="submit" >Remover</button></td>	
			</tr>
			</form>
			
			<%}} %>		
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
		if(nome != null && preparo != null){
			document.getElementById("nome").value = nome;
			document.getElementById("modoPreparo").value = preparo;
		}
		
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