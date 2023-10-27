<?php
session_start();
require_once("../../conexion.php");

//$db->debug=true;

echo"<html> 
       <head>
         <link rel='stylesheet' href='../../css/estilos.css' type='text/css'>
       </head>
       <body>";


$ci = $_POST["ci"];
$ap = $_POST["ap"];
$am = $_POST["am"];
$nombre= $_POST["nombre"]; 
$telefono = $_POST["telefono"];


if(($nombre!="") and  ($ci!="") ){
   $reg = array();
   $reg["id_escuela_futbol"] = 1;
   $reg["ci"] = $ci;
   $reg["ap"] = $ap;
   $reg["am"] = $am;
   $reg["nombre"] = $nombre;
   $reg["telefono"] = $telefono;
   $reg["fec_insercion"] = date("Y-m-d H:i:s");
   $reg["estado"] = 'A';
   $reg["usuario"] = $_SESSION["sesion_id_usuario"];   
   $rs1 = $db->AutoExecute("personas", $reg, "INSERT"); 
   header("Location: personas.php");
   exit();
} else {
           echo"<div class='mensaje'>";
        $mensage = "NO SE INSERTARON LOS DATOS DE LA PERSONA";
        echo"<h1>".$mensage."</h1>";
        
        echo"<a href='persona_nuevo.php'>
                  <input type='button'style='cursor:pointer;border-radius:10px;font-weight:bold;height: 25px;' value='VOLVER>>>>'></input>
             </a>     
            ";
       echo"</div>" ;
   }


echo "</body>
      </html> ";
?> 