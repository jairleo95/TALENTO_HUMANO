
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">

        <title>Datos generales</title>
        <link type="text/css" rel="stylesheet" href="../CSS/CSS_DETALLE.css">
    </head>
    
    <body>
    
        <?
        require_once '../Modelo/modelotrabajador.php';
        $mtr=new modelotrabajador();
        $id=$_REQUEST["idtr"];
        $list=$mtr->ListaridTrabajador($id);
        
        ?>
        <form method="post" action="">
        <table class="tables">
            <? for ($index = 0; $index < count($list); $index++) {?>
            
            <tr><td class="text-info">Nacionalidad:</td><td> 
                        <?
                                    require_once '../Modelo/ModeloLista.php';
                                    $mod_list= new ModeloLista();
                                    $l_nac=$mod_list->LISTA_NACIONALIDAD();
                        for ($h = 0; $h < count($l_nac); $h++) {
                            if ($list[$index][8]==$l_nac[$h][0]) {
                            echo $l_nac[$h][1];
                            }
                        } ?>
                    </td></tr>
              <!--   <tr><td>Departamento:</td><td><? echo $list[$index][9]?></td></tr>
                <tr><td>Provincia:</td><td><? echo $list[$index][10]?></td></tr>-->
               <tr><td  class="text-info">Distrito:</td><td><? 
   require_once '../Modelo/ModeloUbigeo.php';
        $md=new ModeloUbigeo();               
        $l_dis=$md->ListarDistrito();
        for ($u = 0; $u < count($l_dis); $u++) {
            if ($list[$index][11]==$l_dis[$u][0]) {
                echo $l_dis[$u][1];
            }
        }      ?>
                   </td></tr>
                 <tr><td  class="text-info">Tipo Documento:</td><td><?
                 $doc=$mod_list->LISTA_DOC();
                 for ($t = 0; $t < count($doc); $t++) {
                     if ($list[$index][4]==($t+1)) {
                         echo $doc[$t][0];
                     }    
                 }
                 ?>
                     </td></tr>
                <tr><td  class="text-info">Numero Documento:</td><td><? echo $list[$index][5]?></td></tr>
                 <tr><td  class="text-info">Estado Civil:</td><td><? 
                 $list_e_c =$mod_list->LISTA_ESTADO_CIVIL();
     
                 for ($r = 0; $r < count($list_e_c); $r++) {
                     if ($list[$index][6]==($r+1)) {
                         echo $list_e_c[$r][0];
                     }
                }
                ?></td></tr>
                 
                 <tr><td  class="text-info">Grupo Sanguíneo:</td><td><? 
                 $list_g_s=$mod_list->LISTA_GS();
                 for ($n = 0; $n < count($list_g_s); $n++) {
                     if ($list[$index][24]==($n+1)) {
                         echo $list_g_s[$n][0];
                     }
                 }
                 ?></td></tr>
                 <tr><td  class="text-info">Factor RH:</td><td><?
                 if ($list[$index][36]==1) {
                     echo 'Positivo';
                 }
                 if ($list[$index][36]==2) {
                     echo 'Negativo';
                 }
                 ?></td></tr>
                 
                <tr><td  class="text-info">Telefono:</td><td><? echo $list[$index][12]?></td></tr>
                <tr><td  class="text-info">Celular:</td><td><? echo $list[$index][13]?></td></tr>
                <tr><td  class="text-info">Correo:</td><td><? echo $list[$index][14]?></td></tr>
               
                
                <tr><td   class="text-info">Sistema Pensionario:</td><td><?
                $list_sp=$mod_list->LISTA_SP();
                for ($d = 0; $d < count($list_sp); $d++) {
                    if ($list[$index][16]==($d+1)) {
                        echo $list_sp[$d][0];
                    }
                }
                 ?></td></tr>
                <tr><td  class="text-info">Nombre AFP:</td><td><? 
                $list_afp=$mod_list->LISTA_NOM_AFP();
                for ($w = 0; $w < count($list_afp); $w++) {
                    if ($list[$index][32]==($w+1)) {
                        echo $list_afp[$w][0];
                    }    
                }?></td></tr>
                <tr><td  class="text-info">Afiliado a EsSalud-vida:</td><td><? 
                if ($list[$index][33]==1) {
                    echo 'Si';
                }
                if ($list[$index][33]==2) {
                    echo 'No';
                }
                ?></td></tr>
                <tr><td  class="text-info">Tipo Trabajador:</td><td><? 
                if ($list[$index][34]=="T") {
                    echo 'Trabajador'; 
                }
                if ($list[$index][34]=="A") {
                    echo 'Alumno'; 
                }
                ?></td></tr>
              
                <tr><td colspan="2"></td><td><input class="btn btn-success"  type="submit" value="Editar"></td></tr>
            <?}?>
        </table>
        </form>
    
    </body>
</html>
