<? session_start();?>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<link type="text/css" rel="stylesheet" href="../../../css/Css_Detalle/CSS_DETALLE.css">
<link type="text/css" rel="stylesheet" href="../../../css/Css_Detalle/style.css"> 
        <title>Familiares</title>
  
    </head>
    <body>
    <center>
          <?
        require_once '../Modelo/ModeloPadre_Madre_Conyugue.php';
        $m_pmc=new ModeloPadre_Madre_Conyugue();
        $id=$_REQUEST["idtr"];
        $list=$m_pmc->LISTA_PMC_TR($id);
        
        require_once '../Modelo/ModeloDatos_hijos_trabajador.php';
        $mdh=new ModeloDatos_hijos_trabajador();
        $list_h=$mdh->LISTA_HIJOS($id);
        
        
        ?>
        <? if (count($list)!=0) {?>
        <form >
            <div>
                <table class="table_info" >
                     <tr><td colspan="2"><div class="title">Datos de Padre y Madre</div></td></tr>
           <? for ($index = 0; $index < count($list); $index++) {?>
             
            <tr><td class="text-info">Nombres y Apellidos del padre:</td><td class="text-info-left"><? echo $list[$index][1]?></td></tr>
            <tr><td class="text-info">Nombres y Apellidos de la Madre :</td><td class="text-info-left"><? echo $list[$index][2]?></td></tr>
           </table>
            </div>
            
            <div style="display:/*none*/" >
                <table  class="table_info"  >
                     <tr><td colspan="2"><div class="title">Conyugue</div></td></tr>
            <tr><td class="text-info">Trabaja en UPeU:</td><td class="text-info-left"><?
                if ($list[$index][3]==1) {
                 echo 'Si';    
                }
                if ($list[$index][3]==0) {
                 echo 'No';    
                }
                ?></td></tr>
            <tr><td class="text-info">Apellidos y Nombres:</td><td class="text-info-left"><? echo $list[$index][4]?></td></tr>
            <tr><td class="text-info">Fecha de Nacimiento:</td><td class="text-info-left"><? echo $list[$index][5]?></td></tr>
            <tr ><td class="text-info">Documento</td><td class="text-info-left"><? 
                    if ($list[$index][6]==1) {
            echo 'DNI';            
                    }
                    if ($list[$index][6]==2) {
            echo 'Pasaporte';            
                    }
            ?></td></tr>
             <tr><td class="text-info">Numero Documento:</td><td class="text-info-left"><? echo $list[$index][7]?></td></tr>
            <tr><td class="text-info">Inscripcion Vigente en EsSalud:</td><td class="text-info-left"><?
                if ( $list[$index][8]==1) {
                    echo 'Si'; 
                }
                if ( $list[$index][8]==0) {
                    echo 'No'; 
                }
           ?></td></tr>
            </table>
            </div>
            <table>
          
            
           <?}?>
        <tr><td colspan="2"></td><td><input class="btn btn-success" type="submit" value="Editar"></td></tr>
        </table>
        </form>
        <?}else{?>
        <center>
            <label>Aun no se ha registrado los datos del familiar</label>
            <?  if ($_SESSION["IDROL"]==2) {?>
            <a href="Reg_Padre_Madre_Conyugue.jsp?idtr=<?echo $id?>">Registrar</a>
            <?}?>
        </center>
        <? } ?>
</center>
    </body>
</html>
<center>
<?
 $id=$_REQUEST["idtr"];
 
            $mod_dht = new ModeloDatos_hijos_trabajador();
            $list_dht = $mod_dht->LISTA_HIJOS($id);
            $r=count($list_dht);
           
            if ($r!=0) {
?>
            <?  include './List_datos_hijos_trabajador.php';?>
                <? if ($_SESSION["IDROL"]==2) {?>
                <a href="Reg_Datos_Hijo.jsp?idtr=<?echo $id;?>" class="button blue">Agregar un hijo</a>
                    <?}?>
            <?}else{?>

<label>No se ha registrado ningun Hijo(a)</label><br>

<?  if ($_SESSION["IDROL"]==2) {?>
<a href="Reg_Datos_Hijo.jsp?idtr=<?echo $id;?>" class="">Registrar</a>
<?}?>
</center>
                <?}?>