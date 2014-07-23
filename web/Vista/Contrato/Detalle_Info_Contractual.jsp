<? session_start();
if (isset($_SESSION['IDUSER'])) {
?>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
      <link rel="stylesheet" href="../Vistas/sort/style.css" />
        
        <title>Información Contractual</title>
       <style type="text/css">
            .tables{
               // margin-top: 0px;
               // margin-left: 40px;
              //  font-family: cursive;
             //  font-size:18px;
               border-radius: 3%;
               padding: 0.5%;
               background-color: white;
               width: 60%;
            }
            td {
                padding: 0.5%;
                padding-left: 2%;
            } 
            tr:hover{
                background-color:#c6dcde;     
            }
            
          

        </style>
    </head>
    <body>
    <center>
          <?
          require_once '../Modelo/ModeloContrato.php';
          require_once '../Modelo/ModeloAño.php';
          $idtr=$_REQUEST["idtr"];
          $mda=new ModeloAño();
          $m_rhc=new ModeloContrato();
         
          if($_REQUEST["opc"]=="Actualizar"){
            $idtr=$_REQUEST["idtr"]; 
            $ida=$_REQUEST["ida"]; 
           $list_rhc=$m_rhc->LISTA_ID_CONTRATO_DGP($idtr, $ida);
          $list_combo_a=$m_rhc->LISTA_AÑO_ID_TR_DGP($idtr);
              
          }else{
          $ida=$mda->LISTA_AÑO_MAX_CONT($idtr);
       
             $list_rhc=$m_rhc->LISTA_ID_CONTRATO_DGP($idtr, $ida);
          $list_combo_a=$m_rhc->LISTA_AÑO_ID_TR_DGP($idtr);
          }
        
          require_once '../Modelo/ModeloLista.php';
          $mod_list= new ModeloLista();
    
          ?>
        <?  if (count($list_rhc)==0) {?>
        <h3>Aun no se ha hecho Contrato.</h3>
            <?}else{?>
        <form action="Info_Contractual.php" method="post">
        <table>
               <tr><td><select name="ida">
                <?  for ($o = 0; $o < count($list_combo_a); $o++) {?>
                           <?  if ($ida==$list_combo_a[$o][0]) {?>
                            <option value="<? echo $list_combo_a[$o][0];?>" selected="selected"><? echo $list_combo_a[$o][1];?></option>
                              <?}else{?>
                             <option value="<? echo $list_combo_a[$o][0];?>"><? echo $list_combo_a[$o][1];?></option>
                <?}}?>
                       </select> </td><td><input type="hidden" name="idtr" value="<?echo $idtr;?>"></td><td><input name="opc" value="Actualizar" type="submit"></td></tr>
        </table>
              </form>
        <form>
        <table class="tables">
           <? for ($index = 0; $index < count($list_rhc); $index++) {?>
            <tr><td><strong>Desde:</strong></td><td><? echo $list_rhc[$index][2];?></td><td><strong>Hasta:</strong></td><td><? echo $list_rhc[$index][3];?></td></tr>
            <tr><td><strong>Dirección:</strong></td><td><? echo $list_rhc[$index][29];?> </td></tr>
            <tr><td><strong>Departamento:</strong></td><td><? echo $list_rhc[$index][30];?> </td></tr>
            <tr><td><strong>Area:</strong></td><td><? echo $list_rhc[$index][31];?> </td></tr>
            <tr><td><strong>Sección:</strong></td><td><? echo $list_rhc[$index][32];?> </td></tr>
            <tr><td><strong>Puesto:</strong></td><td><? echo $list_rhc[$index][33];?></td> </tr>
            <tr><td><strong>¿Es Jefe?:</strong></td><td><? 
            
            $list_j=$mod_list->LISTA_JEFE();
            for ($e = 0; $e < count($list_j); $e++) {
                if ($list_rhc[$index][35]==($e+1)) {
                 echo $list_j[$e][0];   
                }
            }
            ?></td> </tr>
            <tr><td><strong>Condición:</strong></td><td><?
            $list_c=$mod_list->LISTA_CONDICION_CONTRATO();
            
            for ($h = 0; $h < count($list_c); $h++) {
                if ($list_rhc[$index][7]==($h+1)) {
                    echo $list_c[$h][0];
                }
            }?> </td></tr>
            <!--<tr><td>Funcion:</td><td><? /*echo $list_rhc[$index][5];*/?> </td></tr>-->
            <tr><td><strong>Sueldo:</strong></td><td><? echo 'S/. '.$list_rhc[$index][8];?></td><td><strong>Reintegro:</strong></td><td><? echo $list_rhc[$index][9];?></td></tr>
             <tr><td><strong>Tipo Pago Horas:</strong></td><td><? echo $list_rhc[$index][42];?> </td></tr>
             <tr><td><strong>Bono Alimentario:</strong></td><td><? echo 'S/. '.$list_rhc[$index][34];?> </td></tr>
             <tr><td><strong>Asignación Familiar:</strong></td><td><? echo 'S/. '.$list_rhc[$index][10];?> </td></tr>
             <tr><td><strong>Horas:</strong></td><td><strong>Semanal:</strong> <? echo $list_rhc[$index][11].' h';?></td><td><strong>Mensual:</strong> <? echo $list_rhc[$index][12].' h';?></td><td><strong>Dias:</strong> <? echo $list_rhc[$index][13].' d';?></td></tr>
             
             <tr><td><strong>Tipo de Trabajador:</strong></td><td><? 
            if ($list_rhc[$index][14]==1) {
                echo 'Trabajador';
            }
            if ($list_rhc[$index][14]==2) {
                echo 'Obrero';
            }?> </td></tr>   
             <tr><td><strong>Régimen Laboral:</strong></td><td><? 
                if ($list_rhc[$index][15]==1) {
                    echo 'Privado';
                }
                ?> </td></tr>   
             <tr><td><strong>Vacaciones:</strong></td><td><strong>Desde:</strong> <? echo $list_rhc[$index][25];?> </td><td><strong>Hasta:</strong> <? echo $list_rhc[$index][26];?> </td></tr>   
             
             <tr><td><strong>Discapacidad:</strong></td><td><? 
                if ($list_rhc[$index][16]==1) {
                    echo 'No';
                }
                if ($list_rhc[$index][16]==2) {
                    echo 'Si';
                }
                ?> </td></tr>   
             <tr><td><strong>Tipo de Contrato:</strong></td><td><? 
             $list_tc=$mod_list->LISTA_TIPO_CONTRATO();
             for ($k = 0; $k < count($list_tc); $k++) {
                 if ($list_rhc[$index][17]==($k+1)) {
                     echo $list_tc[$k][0];
                 }
             }
           ?> </td></tr>   
             <tr><td><strong>Tipo de Convenio:</strong></td><td><?
           if ($list_rhc[$index][37]==1) {
               echo 'CLJ';
           }
           if ($list_rhc[$index][37]==2) {
               echo 'PPP';
           }
           if ($list_rhc[$index][37]==3) {
               echo 'PP';
           }
            ?> </td></tr>   
             <tr><td><strong>¿Firmo contrato?:</strong></td><td><? 
            if ($_SESSION["IDROL"]==6 & $list_rhc[$index][38]==null ) {?>
                     <a href="../Control/ControlContrato.php?fc=s&idc=<?echo $list_rhc[$index][0];?>"  class="boton">SI</a> o <a href="../Control/ControlContrato.php?fc=n&idc=<?echo $list_rhc[$index][0];?>" class="boton">NO</a>
                 </td></tr> 
            <?}else{?>
             <?
                if ($list_rhc[$index][38]==1) {
                    echo 'Si';
                }
                if ($list_rhc[$index][38]==2) {
                    echo 'No';
                }
             ?> </td></tr>  
            <?}?>
           <!--  <tr><td>Nro. de Contrato:</td><td><?/* echo $list_rhc[$index][39];*/?> </td></tr>   -->
             <tr><td><strong>Observaciones:</strong></td><td><? echo $list_rhc[$index][40];?> </td></tr>   
             <tr><td><strong>Régimen Pensionario:</strong></td><td><? 
            if ($list_rhc[$index][18]==1) {
                echo 'Privado';
            }
            if ($list_rhc[$index][18]==1) {
                echo 'SNP';
            }
             ?> </td></tr>   
             <tr><td><strong>Situacion Actual:</strong></td><td><? 
             $list_sa=$mod_list->LISTA_SITUCION_ACTUAL();
             for ($t = 0; $t < count($list_sa); $t++) {
                 if ($list_rhc[$index][27]==($t+1)) {
                     echo $list_sa[$t][0];
                 }
             }
             ?> </td></tr>   
             <tr><td><strong>Filial donde Trabaja:</strong></td><td><?
                         if ($list_rhc[$index][28]==1) {
                             echo 'Lima';
                         }
                         if ($list_rhc[$index][28]==2) {
                             echo 'Juliaca';
                         }
                         if ($list_rhc[$index][28]==3) {
                             echo 'Tarapoto';
                         }
                         ?> </td></tr>   
             <tr><td><strong>Fecha de Cese:</strong></td><td><? echo $list_rhc[$index][4];?> </td></tr>   
            <!--   <tr><td>Nro. Documento:</td><td><? /*echo $list_rhc[$index][43];?> </td></tr>   
           <tr><td>Pares:</td><td><? echo $list_rhc[$index][36];?> </td></tr>   
             <tr><td>Apoyo:</td><td><? echo $list_rhc[$index][41];*/?> </td></tr>   -->
             <?  // echo $list_rhc[$index][49];
      require_once '../Modelo/ModeloPlantilla.php';
      $mdpl= new ModeloPlantilla();
      $l_pl= $mdpl->LIST_PLANTILLA($list_rhc[$index][53], $list_rhc[$index][52], $list_rhc[$index][51], $list_rhc[$index][50], $list_rhc[$index][49]);
      if (count($l_pl!=0)) {
      for ($a = 0; $a < count($l_pl); $a++) {?>
           
             <tr><td colspan="2"></td><td><input class="button blue"  type="submit" value="Editar"></td>
                 <td ><a class="button blue" href="<? echo $l_pl[$a][14];?>?idc=<? echo $list_rhc[$index][0];?>" >Ver Plantilla</a></td></tr>
      <?}}if (count($l_pl)==0) {?>
             <tr><td colspan="2"></td><td><input class="button blue"  type="submit" value="Editar"></td>
                 <td><a  class="button blue" href="../Plantillas/Direccion_general_sistemas.php?idc=<? echo $list_rhc[$index][0];?>">Ver Plantilla</a></td></tr>
           <?}?>
             
                 <? require_once '../Modelo/modelousuario.php';
                    $mdu= new modelousuario();
                 ?>
             <tr style="color: red;"><? if ($list_rhc[$index][20]==null & $list_rhc[$index][22]!=null){?>
                 <td><strong>Modificado por:</strong></td>
                 <td><? 
               $list_u=$mdu->LIST_ID_USER($list_rhc[$index][22]);
             for ($f = 0; $f < count($list_u); $f++) {
                 echo $list_u[$f][4];
             }?>
                 </td>
                 <?}?>
             <? if ($list_rhc[$index][22]==null & $list_rhc[$index][20]!=null ) {?>
             <td><strong>Creado por:</strong></td><td><? 
             $list_us=$mdu->LIST_ID_USER($list_rhc[$index][20]);
             for ($k = 0; $k < count($list_us); $k++) {
                 echo $list_us[$k][4];
             }
             ?></td>
                 <?}?>
             </tr>
             
 <?}?>
        </table>
        </form>
            <?}?>
        </center>
    </body>
</html>
<?php
} else {
    echo"
		<script type='text/javascript'>
		window.location= 'http://localhost/SysDGP/';
		</script >
	";
}