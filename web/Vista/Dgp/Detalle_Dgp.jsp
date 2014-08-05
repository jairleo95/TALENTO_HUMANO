
<%@page import="pe.edu.upeu.application.model.X_List_id_dgp"%>
<%@page import="java.util.List"%>
<%@page import="pe.edu.upeu.application.dao.DgpDAO"%>
<%@page import="pe.edu.upeu.application.dao_imp.InterfaceDgpDAO"%>
<jsp:useBean id="LIST_ID_DGP" scope="application" class="java.util.ArrayList"/>
<?    session_start();

?>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <link href="../../css/Css_Bootstrap/bootstrap.css" rel="stylesheet">
        <link href="../../css/Css_Bootstrap/bootstrap-theme.min.css" rel="stylesheet">
        <title>Detalle DGP</title>
        
        <style type="text/css">
            body{
                background-color: #D2E0E6;
            }
            
            .tab_det{
                margin-top: 0px;
               // margin-left: 5%;
               // font-family: cursive;
               //font-size:18px;
            }
            .td-det{ 
            font-weight:bold ;
            text-align: right;
            }
            
        </style>
    </head>
    <body><center>
        
       <%         
        /*require_once '../Modelo/ModeloDGP.php';
        $mtr=new ModeloDGP();
        $iddgp=$_REQUEST["iddgp"];
        $idtr=$_REQUEST["idtr"];
        $list=$mtr->LIST_ID_DGP($iddgp);
           
           
            V_Ficha_Trab_Num_C trb = new V_Ficha_Trab_Num_C();
                                        trb = (V_Ficha_Trab_Num_C) ListaridTrabajador.get(index);*/
        
        InterfaceDgpDAO Idgp = new DgpDAO();
        String iddgp = request.getParameter("ID_DGP");
        String idtr = request.getParameter("ID_TRABAJADOR");
        X_List_id_dgp dgp = new X_List_id_dgp();
        dgp = (X_List_id_dgp) LIST_ID_DGP.get(iddgp);
        
                %>
       
        <form>
        <table class="tab_det">
            
             <? for ($index = 0; $index < count($list); $index++) {?>
            
            <label style="color: red; //font-family: cursive;"><h2><?  echo $list[$index][24];?></h2></label>
         
            
            <tr><td class="td-det">Fecha Desde:</td><td><?  echo $list[$index][1];?></td></tr>
             <tr ><td class="td-det">Fecha Hasta:</td><td><?  echo $list[$index][2];?></td></tr>
            
             <tr><td class="td-det">Sueldo : S/.</td><td><?echo $list[$index][3];?></td></tr>
             <tr><td class="td-det">Bono Alimentario : S/.</td><td><?echo $list[$index][25];?></td></tr>
             <tr style="color: red;"><td class="td-det" >Sueldo Total : S/.</td><td><?echo $list[$index][25]+$list[$index][3];?></td></tr>
           
            <!-- <tr><td class="td-det">Dias de Trabajo:</td><td><?//echo $list[$index][4];?></td></tr>
             <tr><td class="td-det">Horario:</td><td><?//echo $list[$index][5];?></td></tr>
            -->
             <tr><td class="td-det">Puesto:</td><td><?
            require_once '../Modelo/ModeloRH_Puesto.php';
            $md=new ModelorRH_Puesto();
            $list_pu=$md->LISTA_RH_PUESTO();
            for ($f = 0; $f < count($list_pu); $f++) {
                if ($list[$index][6]==$list_pu[$f][0]) {
                    echo $list_pu[$f][1];
                }
            }
            ?></td></tr>
             <tr><td class="td-det">Horario:</td><td><a href="Horario/Detalle_Horario.jsp?iddgp=<?echo $iddgp; ?>">Ver Horario</a></td></tr>
             
             </tr>
             <tr><td class="td-det">BEV: </td><td><?echo $list[$index][26];?></td></tr>
             <tr><td class="td-det">Centro de Costos: </td><td><?echo $list[$index][27];?></td></tr>
             <tr><td class="td-det">Antecedentes Policiales: </td><td><?echo $list[$index][28];?></td></tr>
             <tr><td class="td-det">Certificado de Salud: </td><td><?echo $list[$index][29];?></td></tr>
             
             <!--<tr><td class="td-det">Ruc:</td><td><?echo $list[$index][9];?></td></tr>
             <tr><td class="td-det">Lugar de Servicio:</td><td><?echo $list[$index][10];?></td></tr>
             <tr><td class="td-det">Periodo de Pago:</td><td><?echo $list[$index][12];?></td></tr>
             <tr><td class="td-det">Horario de Capacitación:</td><td><?echo $list[$index][15];?></td></tr>
             <tr><td class="td-det">Horario de Refrigerio:</td><td><?echo $list[$index][16];?></td></tr>
             <tr><td class="td-det">Dias Capacitación:</td><td><?echo $list[$index][17];?></td></tr>
             <tr><td class="td-det">Subvención:</td><td><?echo $list[$index][14];?></td></tr>
             ->
             

             <!--<tr><td colspan="2"></td><td><input class="btn btn-success" style="width: 100px" type="submit" value="Editar"></td>
-->               
 <?  
                             require_once '../Modelo/ModeloDGP.php';
                             $mddgp=new ModeloDGP();
                             $num=$mddgp->VALIDAR_DGP_CONTR($iddgp, $idtr);
                             //echo $list[$index][18];
                if ($num==0 & $list[$index][18]==0 & $_SESSION["IDROL"]==6 ) {?>
                 <td><a href="Reg_Contrato.php?iddgp=<?echo $iddgp;?>&idtr=<?echo $list[$index][8];?>">Hacer Contrato</a></td></tr>
               <?} if ( $list[$index][18]==1 & $num==0 & $_SESSION["IDROL"]!=6 ) {?>
                 <td><a href="">Ver Contrato</a></td></tr>
           <? }?>
            <? require_once '../Modelo/modelousuario.php';
             $mdu= new modelousuario();?>
             <tr style="color: red;"><? if ($list[$index][21]!=null){?>
                 <td class="td-det">Modificado por:</td>
                 <td><? 
               $list_u=$mdu->LIST_ID_USER($list[$index][21]);
             for ($f = 0; $f < count($list_u); $f++) {
                 echo $list_u[$f][4];
             }?>
                 </td>
                 <?}?>
             <? if ($list[$index][19]!=null ) {?>
             <td class="td-det">Creado por:</td><td><? 
             $list_us=$mdu->LIST_ID_USER($list[$index][19]);
             for ($k = 0; $k < count($list_us); $k++) {
                 echo $list_us[$k][4];
             }
             ?></td>
                 <?}?>
             </tr>
              <? }?>
             
            <?  if ($_REQUEST["opc"]=="rd") {?>
             <tr><td><h3>Registrar documentos</h3>
                     <a href="Documento/Reg_Documento.jsp?iddgp=<?echo $iddgp; ?>&idtr=<?echo $idtr;?>">Siguiente</a></td></tr>
                <?}?>
        </table>
            </form>
        </center>
    </body>
</html>
