<?php
session_start();

require_once("../../conexion.php");
require_once("../../resaltarBusqueda.inc.php");

$ap = $_POST["ap"];
$am = $_POST["am"];
$nombre = $_POST["nombre"];
$ci = $_POST["ci"];

$db->debug=true;

if ($ap or $am or $nombre or $ci){
    $sql3 = $db->Prepare("SELECT*
                            FROM personas
                            WHERE ap LIKE ?
                            AND am LIKE ?
                            AND nombre LIKE ?
                            AND ci LIKE ?
                            AND estado <> 'x'
                            ORDER BY id_persona DESC
                            ");
                            
        $rs3 = $db->GetAll($sql3, array($ap."%", $am."%", $nombre."%", $ci."%"));

        if ($rs3) {
            echo"<center>
                 <table width='60%' border='1'>
                 <tr>
                    <th>C.I</th><th>PATERNO</th><th>MATERNO</th><th>NOMBRES</th><th>?</th>
                    </tr>";
            foreach($rs3 as $k => $fila) {
                    $str = $fila["ci"];
                    $str1 = $fila["ap"];
                    $str2 = $fila["am"];
                    $str3 = $fila["nombre"];
            echo"<tr>
                    <td align='center'>".resaltar($ci, $str)."</td>
                    <td>".resaltar($ap, $str1)."</td>
                    <td>".resaltar($am, $str2)."</td>
                    <td>".resaltar($nombre, $str3)."</td>
                    <td align='center'>
                     <input type='radio' name='opcion' value='' onClick='buscar_persona(".$fila["id_persona"].")'>
                    </td>
                </tr>";
            }
                echo"</table>
                </center>";
        } else {
                echo"<center><b> LA PERSONA NO EXISTE !!</b></center></br>";
                echo"<center>
                    <table class='listado'>

                    <tr>
                        <td><b>(*)CI</b></td>
                        <td><input type='text' name='ci1' size='10'></td>
                    </tr>
                    <tr>
                        <td><b>(*)Paterno</b></td>
                        <td><input type='text' name='ap1' size='10' onkeyup='this.value=this.value.toUpperCase()'></td>
                    </tr>
                    <tr>
                        <td><b>(*)Materno</b></td>
                        <td><input type='text' name='am1' size='10' onkeyup='this.value=this.value.toUpperCase()'></td>
                    </tr>
                    <tr>
                        <td><b>(*)Nombre</b></td><td>
                        <input type='text' name='nombre1' size='10'onkeyup='this.value=this.value.toUpperCase()'></td>
                    </tr>
                    <tr>
                    <td><b>(*)Direccion</b></td>
                    <td><input type='text' name='direccion1' size='10' onkeyup='this.value=this.value.toUpperCase()'></td>
                </tr>
                <tr>
                <td><b>(*)Telefono</b></td>
                <td><input type='text' name='telefono1' size='10'></td>
            </tr>
            <tr>
                <td aling='center' colspan='2'>
                    <input type='button' value='ADICIONAR PERSONA' onClick='insertar_persona()' >
                    </td>
                   </tr>
                </table> 
                </center>
                ";

        }


}
?>


















