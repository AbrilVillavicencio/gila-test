<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Coding Challenge</title>
    <link rel="stylesheet" href="css/main.css">
</head>
<body>

    <div class="MainContainer">

        <!-- ***************** ENCABEZADO ***************** -->
        <div class="Header_Footer">
            Notification Test
        </div>

        <!-- ***************** CONTENIDO ***************** -->
        <div class="Content">
            <div class="Container_Form">
                <form action="" method="post" id="FormNewMessage" onsubmit="return 0;">
                    <label for="CategoryNot">Select the Category:</label><br>

                    <?php 
                        //Generar Lista con las categorías activas haciendo la petición a la BD
                        $SelectCat      = "";
                        $IdCategory     = -1;
                        $DescriptionCategory = "";

                        include 'database/connection.php';
                        $query = "select idcategory, description from category where status_cat = 1;";
                        $result = $mysqli->query($query);
                        $SelectCat .= "<select name='CategoryNot' id='CategoryNot'>";
                        while ($row = mysqli_fetch_row($result)) {
                            $IdCategory             = $row[0];
                            $DescriptionCategory    = $row[1];

                            $SelectCat .= "<option value='$IdCategory'>$DescriptionCategory</option>";
                        }
                        $mysqli->close();

                        $SelectCat .= "</select>";

                        echo $SelectCat;
                    ?>

                    <br><br>
                    <label for="MessageNot">Message:</label><br>

                    <textarea name="MessageNot" id="MessageNot" cols="5" rows="7" placeholder="Write the message..."></textarea>

                </form>

                <button id="BtnSendMessage">Send Message</button>
            </div>
            <div class="Container_Log">

                <div>
                    <table>
                        <tr>
                            <td colspan="4" style="font-weight: bold; font-size: 1.1rem; text-align: center; padding: .3rem;">
                                LOG OF NOTIFICATIONS
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 10%; font-weight: bold; text-align: center;">Date</td>
                            <td style="width: 10%; font-weight: bold; text-align: center;">Time</td>
                            <td style="width: 40%; font-weight: bold; text-align: center;">Notification</td>
                            <td style="width: 40%; font-weight: bold; text-align: center;">Message</td>
                        </tr>

                    </table>
                </div>

                <div id="Log_Data"></div>

            </div>
        </div>

        <!-- ***************** PIE ***************** -->
        <div class="Header_Footer">
            Abril
        </div>

    </div>

</body>
    <!-- Relacionar archivo JS correspondiente -->
    <script type="text/javascript" src="js/main.js"></script>
</html>