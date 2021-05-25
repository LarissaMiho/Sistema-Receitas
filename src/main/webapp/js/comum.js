var rootURL = "http://localhost:8080/";

function sendPOSTJSON(url, data) {
     $.post(rootURL + url, function(data, status){
            alert("Data: " + data + "\nStatus: " + status);
          });
}

function success(data) {
    alert("Enviado com Sucesso!");
}
function errorsendPOSTJSON() {
    alert("Falha ao Enviar")
}