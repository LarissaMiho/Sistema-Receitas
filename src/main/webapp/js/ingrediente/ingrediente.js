function salvarIngrediente(){
	var nome = document.getElementById("nomeIngrediente").value;
	var ingrediente = {
		nome:nome
		
	}
	sendPOSTJSON("ingrediente",ingrediente)
}