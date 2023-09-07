// Funcion para realizar la accion de enviar el mensaje por medio de un formulario
function SendMessage(){
    let ContentMessage = document.getElementById("MessageNot").value;
    if(ContentMessage != ""){
        var UpForm = document.getElementById("FormNewMessage");
        var UpScript = new XMLHttpRequest();
        UpScript.addEventListener("load", function () {

            //Validar resultado del JSON
            ArrayJSON = JSON.parse(this.responseText);
            if (ArrayJSON.Result == 1) {
                alert(ArrayJSON.AlertMessage);
                document.getElementById("MessageNot").value = "";
                document.getElementById("CategoryNot").value = 1;
                ObtainLog();
            } else {
                alert(ArrayJSON.AlertMessage);
            }

        }, false);
        UpScript.open("POST", "scripts/send_message.php");
        UpScript.send(new FormData(UpForm));
    }else{
        alert("Please add a valid message.");
    }
}

// Obtener información de los registros en el Log
function ObtainLog(){
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function () {
    if (this.readyState == 4 && this.status == 200) {
      
        //Validar si el resultado es correcto o incorrecto
        ArrayJSON = JSON.parse(this.responseText);
        if (ArrayJSON.Result == 1) {
            document.getElementById("Log_Data").innerHTML = ArrayJSON.TableNots;
        } else {
            document.getElementById("Log_Data").innerHTML = ArrayJSON.TableNots;
        }
    }
  };
  xmlhttp.open("GET", "scripts/obtain_log.php", true);
  xmlhttp.send();
}


// Listeners para ejecutar las funciones
window.addEventListener("load", ObtainLog);
document.getElementById("BtnSendMessage").addEventListener("click", SendMessage);