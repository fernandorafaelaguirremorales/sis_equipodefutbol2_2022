<?php
session_start();
require_once("../../conexion.php");

/*echo"llega";
$db->debug=true;*/

$_id_usuario = $_REQUEST["id_usuario"];

echo"<html>
    <head>
    <link rel='stylesheet' href='../../css/estilos.css' type='text/css'>
    </head>
    <body>";

     /*$db->debug=true;*/


     $sql = $db->Prepare("SELECT *
                     FROM usuario_roles  
                     WHERE id_usuario = ?
                     AND estado <> 'X'                        
                        ");
$rs = $db->GetAll($sql,array($_id_usuario));



if(!$rs){
    $reg = array ();
    $reg["estado"] = 'x';
    $reg["usuario"] = $_SESSION["sesion_id_usuario"];
    $rs1 = $db->AutoExecute("usuarios", $reg, "UPDATE", "id_usuario='".$_id_usuario."'");
    header("Location:usuarios.php");
    exit();

}else{
  echo "<div class='mensaje'>";
  $mensage = "NO SE ELIMINAR LOS DATOS DEL USUARIO POR QUE TIENE HERENCIA";
  echo"<h1>".$mensage."</h1>";

  echo"<a href = 'usuarios.php'>
        <input type ='button' style='cursor:pointer;border-radius:10px;font-weight:bold;height: 25px;' value='VOLVER>>>>'></input> 

        </a>
        ";
        echo "</div>";
        
}

echo"</body>
</html>";

?>







SELECT DISTINCT TABLE_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE COLUMN_NAME = 'id_usuario'
AND TABLE_SCHEMA ='escueladefutbol';
