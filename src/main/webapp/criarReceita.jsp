<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Receita</title>
<link rel="stylesheet" href="css/default/table.css"> 
</head>
<body>
<ul>
  <li><a href="index.jsp">Ingredientes</a></li>
  <li><a href="receita.jsp">Receitas</a></li>
</ul>
<h2>Criar Receita Nova</h2>

<form >
  <label for="fname">Nome da Receita:</label><br>
  <input type="text" id="receita-nome" name="nome"><br><br>
  <label for="lname">Modo de Preparo:</label><br>
  <textarea type="text" id="receita-preparo" name="modoPreparo"></textarea><br><br>  
  <input type="button" value="Avançar" onclick="avancar()">
</form>

</body>
<script>
	function avancar(){
		var nome = document.getElementById("receita-nome").value;
		var preparo = document.getElementById("receita-preparo").value;
		window.location.href = "./criarReceita2.jsp?nome=" + nome + "&preparo=" + preparo;
	}

</script>
</html>