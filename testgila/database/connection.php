<?php

// Crear conexion con la BD
$mysqli = new mysqli("localhost", "root", "", "test_gila");

if ($mysqli->connect_errno) {
    echo "Fallo al conectar a MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
}