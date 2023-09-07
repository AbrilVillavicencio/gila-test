<?php

//Declarar variables para validar los resultados
$Res = 0;
$Msg = "Error.";

//Inicializar variables
$IdCategory = -1;
$Message    = "";

//Inicializar JSON
$ResJson = ' {"Result":0,"AlertMessage":"Error."} ';

if(isset($_POST['CategoryNot']) && isset($_POST['MessageNot'])){
    $IdCategory = $_POST['CategoryNot'];
    $Message    = $_POST['MessageNot'];
    


    include '../database/connection.php'; // Incluir archivo de conexión a la BD
    $query = "call sp_addmessage($IdCategory, '$Message');"; //Ejecutar procedimiento almacenado
    $result = $mysqli->query($query);
    while ($row = mysqli_fetch_row($result)) {
        $Res        = $row[0];
        $Msg        = $row[1];
    }
    $mysqli->close();

    //Estructurar JSON con los resultados obtenidos de la ejecución del Procedimiento 
    $ResJson = ' {"Result":'.$Res.',"AlertMessage":"'.$Msg.'"} ';
}

echo $ResJson;