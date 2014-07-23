
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
            <link type="text/css" rel="stylesheet" href="../CSS/CSS_DETALLE.css">
        
        <title>Aspecto Social</title>
   
    </head>
    <body>
  
           <?
        require_once '../Modelo/modelotrabajador.php';
        $mtr=new modelotrabajador();
        $id=$_REQUEST["idtr"];
        $list=$mtr->ListaridTrabajador($id);
        
        ?>
        <form>
        <table class="tables">
             <? for ($index = 0; $index < count($list); $index++) {?>
            
            
            <tr><td colspan="2"><div class="title">Direccion</div></td></tr> 
            <tr><td class="text-info">Dirección :</td><td><?
            
                                require_once '../Modelo/ModeloLista.php';
                                $mod_list= new ModeloLista();
                                $list_d1=$mod_list->LISTA_DOM_D1_ID();
                                for ($x = 0; $x < count($list_d1); $x++) {
                                    if ($list[$index][37]==($x+1)) {
                                        echo $list_d1[$x][0];
                                    }
                                }

                                if ($list[$index][39]==1) {
                                    echo ' '.$list[$index][38].'Número';
                                }
                                if ($list[$index][39]==2) {
                                    echo ' '.$list[$index][38].'Lote';
                                }
                                
                                if ($list[$index][39]==3) {
                                    echo ' '.$list[$index][38].'S/N';
                                }
                                
                                $list_d5=$mod_list->LISTA_DOM_D5_ID();
                                for ($c = 0; $c < count($list_d5); $c++) {
                                    if ($list[$index][41]==($c+1)) {
                                         echo ' '.$list[$index][40].' '.$list_d5[$c][0];
                                    }
                                }
                 echo ' '.$list[$index][42];
                    
                    ?></td></tr>
            
             <tr><td class="text-info">Referencia:</td><td><? echo $list[$index][43]?></td></tr>
             <tr><td class="text-info">Distrito:</td><td><? 
        require_once '../Modelo/ModeloUbigeo.php';
        $mod_u=new ModeloUbigeo();
        
        $list_dir=$mod_u->ListarDistrito();
        for ($y = 0; $y < count($list_dir); $y++) {
            if (trim($list[$index][44])==$list_dir[$y][0]) {
                echo $list_dir[$y][1];
            }
             }
        ?></td></tr>
                          

             <tr><td colspan="2"><div class="title">Direccion</div></td></tr>
             
              <tr><td class="text-info">Dirección :</td><td><? 
              
              
              
               $list_d1_2=$mod_list->LISTA_DOM_D1_ID();
                                for ($x = 0; $x < count($list_d1_2); $x++) {
                                    if ($list[$index][45]==($x+1)) {
                                        echo $list_d1_2[$x][0];
                                    }
                                }

                                if ($list[$index][47]==1) {
                                    echo ' '.$list[$index][46].'Número';
                                }
                                if ($list[$index][47]==2) {
                                    echo ' '.$list[$index][46].'Lote';
                                }
                                
                                if ($list[$index][47]==3) {
                                    echo ' '.$list[$index][46].'S/N';
                                }
                                
                                $list_d5_2=$mod_list->LISTA_DOM_D5_ID();
                                for ($c = 0; $c < count($list_d5_2); $c++) {
                                    if ($list[$index][49]==($c+1)) {
                                         echo ' '.$list[$index][48].' '.$list_d5_2[$c][0];
                                    }
                                }
                 echo ' '.$list[$index][50];

                    ?></td></tr>
              <tr><td class="text-info">Distrito:</td><td><? 
              $mod_ub=new ModeloUbigeo();
              $list_dir_2=$mod_ub->ListarDistrito();
              for ($d = 0; $d < count($list_dir_2); $d++) {
                  if ($list[$index][51]==$list_dir_2[$d][0]) {
                      echo $list_dir_2[$d][1];
                         }
                         
              }
             ?></td></tr>
              
             <tr><td colspan="2"><div class="title">Ingresos de Quinta Categoria</div></td></tr> 
             <tr><td class="text-info">Empresa:</td><td><? echo $list[$index][52]?></td></tr>
             <tr><td class="text-info">RUC:</td><td><? echo $list[$index][53]?></td></tr>
             <tr><td class="text-info">Otras Empresas:</td><td><? echo $list[$index][54]?></td></tr>
             
             <tr><td colspan="2"><div class="title">Información Religiosa</div></td></tr>
             <tr><td class="text-info">Religión:</td><td><? 
                 if ($list[$index][26]==1) {
                     echo'Adventista';
                 }
                 if ($list[$index][26]==2) {
                     echo'Catolico';
                 }
                 if ($list[$index][26]==3) {
                     echo'Otros';
                 }?></td></tr>
             <tr><td class="text-info">Iglesia:</td><td><? echo $list[$index][27]?></td></tr>
             <tr><td class="text-info">Cargo en la Iglesia:</td><td><? echo $list[$index][28]?></td></tr>
             <tr><td class="text-info">Autoridad:</td><td><? 
    if ($list[$index][29]==1) {
        echo 'Pastor';     
    }
    if ($list[$index][29]==2) {
        echo 'Primer Anciano';
    }
    if ($list[$index][29]==3) {
        echo 'Sacerdote';
    }
    ?></td></tr>
             <tr><td class="text-info">Nombres y Apellidos:</td><td><? echo $list[$index][30]?></td></tr>
             <tr><td class="text-info">Telefono/Celular:</td><td><? echo $list[$index][31]?></td></tr>
             
              
             <?}?>
        <tr><td colspan="2"></td><td><input class="btn btn-success"  type="submit" value="Editar"></td></tr>
       </table>
            </form>

    </body>
</html>
