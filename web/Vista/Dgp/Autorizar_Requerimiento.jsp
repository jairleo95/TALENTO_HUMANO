<? session_start();
if (isset($_SESSION['IDUSER'])) {
$idempleado=$_SESSION["IDPER"];

$iduser=$_SESSION["IDUSUARIO"];
require '../Modelo/ModeloAutorizacion.php';
require '../Modelo/modelopersonal.php';
$mde=new modelopersonal();
$list_emp=$mde->LIST_IDPUESTO_PERS($idempleado);
$idpu=$list_emp[0][2];
$mtr = new ModeloAutorizacion();
$listra = $mtr->ListaridAutorizacion($idpu,$iduser);
$s = count($listra);
?>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Autorizacion</title>

        <link type="text/css" rel="stylesheet" href="../../css/Css_Reporte/Reportes.css">
     <!--  <link type="text/css" rel="stylesheet" href="../CSS/form.css">
-->
    </head>
  

    <body class="body">  
        <div class="spacing">
            <center><h1 class="spacing">Requerimientos por Autorizar</h1></center>
        </div>
    <center>
        <div class="container theme-showcase">
      

            <table >

                <tr><td   colspan="4"> Requerimientos (<? echo $s; ?>)</td>
                  
                   </table>       
            <table class="tinytable" >
                   
                <tr class="tab_cabe">
                    <td><strong>Nro</strong></td>
                    <td><strong>Foto</strong> </td>
                    <td><strong>Nombres y Apellidos</strong></td>
                    <td><strong>Puesto</strong></td>
                    <td><strong>Sección</strong></td>
                    <td><strong>Area</strong></td>
                    <td><strong>Motivo</strong></td>
                  <!--  <td>Departamento</td>-->
                    <td><strong>Descripcion</strong></td>
                    <td><strong>Proceso</strong></td>
                    <td><strong>Acciones</strong></td>
                    <td><strong>Documentos</strong></td>
                    <td><strong>Autorizar</strong></td>
                </tr>
                <? if ($s==0) {?>
                <tr><td colspan="12" align="center"><h3>No hay ningún DGP por autorizar...</h3></td></tr>
         <?}?>
                    <? for ($index = 0; $index < count($listra); $index++) { 
                        
                        ?>
                <tr>
                    <td><?echo $index+1?></td>
                <?
  require_once '../Modelo/Modelo_Imagen.php';
  $mod_f= new Modelo_Imagen();
          $idf=$mod_f->LIST_FOTO_TRABAJADOR($idtr);
                ?>
              
              <? if ($idf==null) {?>
              <td><img src="../../imagenes/avatar_default.jpg"  width="80"  height="80"></td>
              
              <?}else{?>
              <<td><img src="Foto.php?idf=<?echo $idf;?>"  width="80"  height="80"></td>
              <? 
              }?>
                        <td style="width: 230px;"><div style="position: relative; margin-top:23px; ">
                                <? echo $listra[$index]["1"] . ' ' . $listra[$index]["2"].' '. $listra[$index]["3"]; ?></div></td>
                                <td ><? echo $listra[$index][4]; ?></td>   
                                
                                <td ><? echo $listra[$index][18]; ?></td>      
                                <td ><? echo $listra[$index][19]; ?></td>  
                                
                                <td style="width: 300px;"><? echo $listra[$index][15]; ?></td>      
                         <!--     <td><? //echo $listra[$index][5]; ?></td>  -->     
                        <td style="width: 300px;"><? echo $listra[$index][10]; ?></td>
                        <td><a href="Detalle_Seguimiento_Dgp.jsp?iddgp=<? echo $listra[$index][7];?>">Ver Proceso</a></td>
                        <td><a href="Comentario/Reg_Comentario.jsp?iddgp=<? echo$listra[$index][7]; ?>&idp=<?echo  $listra[$index][16];?>">Comentar dgp</a></td> 
                        <td class="caji" ><a href="Documento/Reg_Documento.jsp?iddgp=<? echo $listra[$index][7];?>&idtr=<?echo $listra[$index][0];?>">Ver Documentos</a></td> 
               <? 
                require_once '../Modelo/ModeloDGP.php';
                             $mddgp=new ModeloDGP();
                             $num=$mddgp->VALIDAR_DGP_CONTR($iddgp, $idtr);
                    ?>
                          
                    <td><a href="../Trabajador/Detalle_Trabajador.jsp?idtr=<? echo $listra[$index][0];
                            ?>&IDDETALLE_REQ_PROCESO=<? echo $listra[$index][9]; 
                            ?>&iddetalle_dgp=<? echo $listra[$index][7]; 
                            ?>&puesto_id=<? echo $idpu; ?>&cod=<? echo $listra[$index][8]; 
                            ?>&nropaso=<? echo $listra[$index][6]; ?>&idpasos=<? 
                            echo $listra[$index][16]; ?>&autorizacion=1">
                                    <?  if ($_SESSION["IDROL"]==6) {
                                
                             if($num!=0) {
                                echo 'Registrar Firma';
                            }
                            if ($num==0) {
                                echo 'Hacer Contrato';    
                            }
                            
                             }else {     echo 'Autorizar';  }
                            ?></a></td>    
      
                </tr>
<? } ?>
            </table>
        </div>
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
