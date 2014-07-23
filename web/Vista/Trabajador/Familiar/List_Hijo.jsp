
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Lista Hijos</title>
        <link rel="stylesheet" href="../CSS/listas.css" />
    </head>
    <body>
    <center>
        <? require_once '../Modelo/ModeloDatos_hijos_trabajador.php'; ?>
        <table>
            <thead>
            <tr>
                <th class="cajita">Nro</th>
                <th class="cajita">Apellidos y Nombres</th>
                <th class="cajita">Fecha de Nacimiento</th>              
                <th class="cajita">Sexo</th>              
                <th class="cajita">Tipo Documento</th>
                <th class="cajita">Nro Documento</th>
                <th class="cajita">Presentó</th>
                <th class="cajita">Essalud</th>
                <th class="cajita">Usuario Registro</th>
                <th colspan="2" class="cajita">Opciones</th>
            </tr>  
            </thead>
            <tbody>
                <?
            $idtr=$_REQUEST["idtr"];
            $modelo = new ModeloDatos_hijos_trabajador();
            $listar = $modelo->LISTA_HIJOS($idtr);
            ?>

            <? for ($i = 0; $i < count($listar); $i++) { ?>
                
            <tr>
                    <td class="caji"><? echo $i+1; ?></td>
                    <td class="caji"><? echo $listar[$i]["2"].' '.$listar[$i]["3"].' '.$listar[$i]["4"]; ?></td>
                    
                    <td class="caji"><? echo $listar[$i]["5"]; ?></td>
                    <td class="caji"><? echo $listar[$i]["6"]; ?></td>
                    <td class="caji"><? 
            
                    if ($listar[$i]["7"]==1) {
                echo 'Dni';
            }
                    if ($listar[$i]["7"]==2) {
                echo 'Partida';
            }
            ?></td>
                    <td class="caji"><? echo $listar[$i]["8"]; ?></td>
                    <td class="caji"><?
            if ($listar[$i]["9"]==1) {
                echo 'Si';
            } 
            if ($listar[$i]["9"]==2) {
                echo 'No';
            } 
            ?></td>
                    
                    <td class="caji"><? 
            if ($listar[$i]["10"]==1) {
                echo 'Si';
            }
            
            if ($listar[$i]["10"]==0) {
                echo 'No';
            }
       
            
                    ?></td>
                    <td class="caji"><? 
                    if ($listar[$i]["11"]==1) {
                        echo 'Si';
                    }
                    if ($listar[$i]["11"]==0) {
                        echo 'No';
                    }
                     ?></td>
                    <td class="caji"><a href=""><img src="../Imagenes/lapiz.png" alt="" width="25px" height="25px"/></a></td>
                    <td class="caji"><a href=""><img src="../Imagenes/eliminar.png" alt=""   width="25px" height="25px"/></a></td>                    
                </tr>
            <? } ?>
        </tbody>
        </table>
    </center>
</body>
</html>
