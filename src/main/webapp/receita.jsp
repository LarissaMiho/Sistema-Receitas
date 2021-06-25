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
<script type="text/javascript">
	function editar(id){
		window.location.href="criarReceita2.jsp?id="+id;
	}

</script>
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
			ReceitasService receitasService = new ReceitasService();
		List<Receita> listaReceita = null;
		listaReceita = receitasService.listarTodos();
		%>

		<h2>Lista de Receitas</h2>
		<a href="criarReceita.jsp">
			<button>Criar Receita Nova</button>
		</a><br> 
		<br>
		<table>
			<tr>
				<th>id</th>
				<th>Nome</th>
				<th></th>
				<th></th>
			</tr>
			<%
				for (Receita receita : listaReceita) {
			%>
			<tr>
				<form action="/labES/RemoverReceita" method="post">
				<td><a href="visualizarReceita.jsp?id=<%=receita.getId()%>"
					target="_blank" style="color: black"> <input
						readonly="readonly" style="width: 70px" type="text"
						name="idReceita" value="<%=receita.getId()%>">
				</a></td>
				<td><a href="visualizarReceita.jsp?id=<%=receita.getId()%>"
					target="_blank" style="color: black"><span><%=receita.getNome()%></span></a></td>
				<td><button onClick="editar(<%=receita.getId()%>)" type="button">Editar</button></td>
					
				<td><button type="submit">Remover</button></td>
				</form>
			</tr>
			<%
				}
			%>
		</table>
	</div>
</body>
</html>