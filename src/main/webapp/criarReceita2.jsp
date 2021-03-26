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
<h2>Criar Receita Nova - Insira os Ingredientes da Receita</h2>

<form action="/action_page.php">
  <h3 for="fname">Bolo Simples</h3><br>

  <label for="lname">Ingrediente:</label><br>
  <select id="cars" name="cars">
  <option value="Farinha de Trigo">Farinha de Trigo</option>
  <option value="saab">Leite</option>
  <option value="fiat">Chocolate</option>
  <option value="audi">Fermento</option>
  <option value="audi">Açucar</option>
  <option value="audi">Creme de Leite</option>
</select><br><br>
  <label for="lname">Quantidade:</label><br>
  <input type="text" id="fname" name="fname" value="200g"><br><br>
  
  <input type="submit" value="Adicionar Ingrediente">
</form>

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

</body>
</html>