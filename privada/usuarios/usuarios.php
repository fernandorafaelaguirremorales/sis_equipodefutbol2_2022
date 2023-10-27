<?php
session_start();
require_once("../../conexion.php");
require_once("../../libreria_menu.php");

//$db->debug=true;

echo"<html> 
       <head>
         <link rel='stylesheet' href='../../css/estilos.css' type='text/css'>
       </head>
       <body>
       <p> &nbsp;</p>";

$sql = $db->Prepare("SELECT CONCAT_WS(' ', p.ap, p.am, p.nombre) AS persona, u.* 
                     FROM personas p, usuarios u
                     WHERE p.id_persona = u.id_persona
                     AND p.estado = 'A' 
                     AND u.estado = 'A' 
                     ORDER BY u.id_usuario DESC                      
                        ");
$rs = $db->GetAll($sql);
  
if ($rs) {
        echo"<center>
        <h1>LISTADO DE USUARIO</h1>
              <table class='listado'>
                <tr>                                   
                  <th>Nro</th><th>PERSONA</th><th>USUARIO</th>
                  <th><img src='../../imagenes/modificar.gif'></th><th><img src='../../imagenes/borrar.jpeg'></th>
                </tr>";
                $b=1;

            foreach ($rs as $k => $fila) {                                       
                echo"<tr>
                        <td align='center'>".$b."</td>
                        <td>".$fila['persona']."</td>                        
                        <td>".$fila['nom_usu']."</td>
                        <td align='center'>
                        
                          <form name='formModif".$fila["id_usuario"]."' method='post' action='usuario_modificar.php'>
                         
                          <input type='hidden' name='id_usuario' value='".$fila['id_usuario']."'>
                          <input type='hidden' name='id_persona' value='".$fila['id_persona']."'>

                            <a href='javascript:document.formModif".$fila['id_usuario'].".submit();' title='Modificar Persona Sistema'>
                              Modificar>>
                             </a>
                          </form>
                        </td>
                        <td align='center'>  
                          <form name='formElimi".$fila["id_usuario"]."' method='post' action='usuario_eliminar.php'>
                            <input type='hidden' name='id_usuario' value='".$fila["id_usuario"]."'>
                            <a href='javascript:document.formElimi".$fila['id_usuario'].".submit();' 
                            title='Eliminar usuario Sistema' 
                            onclick='javascript:return(confirm(\"Desea realmente Eliminar al usuario ".$fila["nom_usu"]." ?\"))'; location.href='persona_eliminar.php''> 
                              Eliminar>>
                            </a>
                          </form>                        
                        </td>
                     </tr>";
                     $b=$b+1;
            }
             echo"</table>
          </center>";
    }

echo "</body>
      </html> ";

 ?>