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

<form action="criarReceita2.jsp">
  <label for="fname">Nome da Receita:</label><br>
  <input type="text" id="fname" name="fname" value="Bolo Simples"><br><br>
  <label for="lname">Modo de Preparo:</label><br>
  <textarea type="text" id="lname" name="lname" value="Doe"></textarea><br><br>  
  <input type="submit" value="Avançar">
</form>

</body>
</html>