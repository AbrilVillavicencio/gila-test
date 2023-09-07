<?php

$TableNots     = "";

$Res = 0;
$ResJson = ' {"Result":0} ';

//Declarar Variables que se ocuparan al obtener los datos solicitados a la BD
$DateNot        = "";
$TimeNot        = "";
$ContentNot     = "";
$MessageNot     = "";

// Incluir archivo de conexión para ejecutar query
include '../database/connection.php';
$query = '
            select 	cast(a.datelog as date) date_notif,
                    cast(a.datelog as time) time_notif,
                    concat(d.name_user, 
                            " received a ", 
                            f.description,
                            " notification from the subscription of the ", 
                            e.description, 
                            " channel.") notif,
                            a.message
            from 	log_notif a,
                    rel_log_user b,
                    rel_user_catnotif c,
                    user_info d,
                    category e,
                    notification f
            where	a.idlog = b.idlog and
                    b.idrel = c.idrel and 
                    c.iduser = d.iduser and 
                    c.idcategory = e.idcategory and
                    c.idnotification = f.idnotification
            order by a.datelog desc
            ;';

$result = $mysqli->query($query);

//Validar que se haya ejecutado la consulta SQL
if($result){ // Si se ejecuto correctamente obtenemos la información 
    $Res = 1;

    $TableNots .= "<table>";
    while ($row = mysqli_fetch_row($result)) {
        $DateNot        = $row[0];
        $TimeNot        = $row[1];
        $ContentNot     = $row[2];
        $MessageNot     = $row[3];

        $TableNots .= "<tr>
                        <td style='width: 10%; text-align: center;'>$DateNot</td>
                        <td style='width: 10%; text-align: center;'>$TimeNot</td>
                        <td style='width: 40%;'>$ContentNot</td>
                        <td style='width: 40%;'>$MessageNot</td>
                    </tr>";
    }
    $TableNots .= "</table>";
}else{ // Si no se ejecuto, mandar mensaje de error al usuario
    $Res = 0;
    $TableNots = "Error obtaining requested information.";
}

$mysqli->close();

// Enviar resultados en JSON 
$ResJson = ' {"Result":'.$Res.', "TableNots":'.json_encode($TableNots).'} ';
echo $ResJson;
