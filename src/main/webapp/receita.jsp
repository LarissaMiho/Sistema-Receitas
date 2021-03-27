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
<h2>Lista de Receitas</h2>

<a href="criarReceita.jsp">Criar Receita Nova</a><br><br>
<form action="/action_page.php">
  <label for="fname">Pesquisar Receita:</label><br>
  <input type="text"  value="Chocolate"><br>
  <td><button type="button">Pesquisar</button></td>
</form>
<br>
<table>
  <tr>
    <th>id</th>
    <th>Nome</th>
    <th></th>
    <th></th>
  </tr>
  <tr>
    <td>1</td>
    <td><a href="editarReceita.jsp">Bolo de Chocolate</a></td>
    <td><button   type="button">Remover</button></td>
  </tr>
  <tr>
    <td>2</td>
    <td><a href="editarReceita.jsp">Torta de Chocolate</a></td>
    <td><button type="button">Remover</button></td>
  </tr>
  <tr>
    <td>3</td>
    <td><a href="editarReceita.jsp">Chocolate Quente</a></td>
    <td><button type="button">Remover</button></td>
  </tr>
</table>

</body>
</html>