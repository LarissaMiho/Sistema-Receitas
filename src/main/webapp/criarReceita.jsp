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

		<h2>Criar Receita Nova</h2>

		<form>
			<label for="fname">Nome da Receita:</label><br> <input
				type="text" id="receita-nome" name="nome"><br> <br>
			<label for="lname">Modo de Preparo:</label><br>
			<textarea type="text" id="receita-preparo" name="modoPreparo"
				cols="175" rows="15"></textarea>
			<br> <br> <input type="button" value="Avançar"
				onclick="avancar()">
		</form>
	</div>
</body>
<script>
	function avancar() {
		var nome = document.getElementById("receita-nome").value;
		var preparo = document.getElementById("receita-preparo").value;
		window.location.href = "./criarReceita2.jsp?nome=" + nome + "&preparo="
				+ preparo;
	}
</script>
</html>