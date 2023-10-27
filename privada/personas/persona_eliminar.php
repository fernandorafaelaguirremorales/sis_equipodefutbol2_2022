<?php
session_start();
require_once("../../conexion.php");
require_once("../../libreria_menu.php");

/*echo"llega";
$db->debug=true;*/

$_id_persona = $_REQUEST["id_persona"];

echo"<html>
    <head>
    <link rel='stylesheet' href='../../css/estilos.css' type='text/css'>
    </head>
    <body>";

     //$db->debug=true;

     $sql = $db->Prepare("SELECT *
                     FROM usuarios   
                     WHERE id_persona = ?
                     AND estado <> 'X'                        
                        ");
$rs = $db->GetAll($sql,array($_id_persona));

if(!$rs){
    $reg = array ();
    $reg["estado"] = 'x';
    $reg["usuario"] = $_SESSION["sesion_id_usuario"];
    $rs1 = $db->AutoExecute("personas", $reg, "UPDATE", "id_persona='".$_id_persona."'");
    header("Location:personas.php");
    exit();

}else{
  echo "<div class='mensaje'>";
  $mensage = "NO SE ELIMINAR LOS DATOS DE LA PERSONA POR QUE TIENE HERENCIA";
  echo"<h1>".$mensage."</h1>";

  echo"<a href = 'personas.php'>
        <input type ='button' style='cursor:pointer;border-radius:10px;font-weight:bold;height: 25px;' value='VOLVER>>>>'></input> 

        </a>
        ";
        echo "</div>";
        
}

echo"</body>
</html>";

?>



