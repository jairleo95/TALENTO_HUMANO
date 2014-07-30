<%@page import="pe.edu.upeu.application.model.Anno"%>
<jsp:useBean id="List_Anno" scope="application" class="java.util.ArrayList"/>
<!DOCTYPE html >

<html>
    <head>
        <meta charset="windows-1252">
        <title>Registrar Contrato</title>
        
        <link rel="stylesheet" type="text/css"  href="../../css/Css_Formulario/form.css">
    </head>
    <body>
<center> 
    <label class="title">Información Contractual</label>
            <br>
            <br>
           <%  /*if ($hac_cont==null&&$iddgp==null) { */%>
          
            <label>Todavia no se ha almacenado El DGP,¿desea contratar sin  antes elaborar un DGP?</label>  
           <br>
           <a href="Reg_Contrato.php?hac_cont=1&idtr=<? echo $idtr;?>">Hacer Contrato de Todas Maneras</a>
         
           <?}else{?>
            <form class="form" action="../contrato"> 
                <table class="table">      
                <tr><td>Año :</td><td>
                        <select name="AÑO_ID" class="text-box" required="" >
                        <%  for (int i = 0;i<List_Anno.size();i++){ 
                            Anno a =  new  Anno();
                            a= (Anno)List_Anno.get(i);
                        %>
                        <option value="<%=a.getId_anno()%>"><%=a.getNo_anno()%></option>
                        <%}%>
                 </select></td></tr>
                 
                 <input type="hidden" name="IDDETALLE_DGP" value="<?echo $iddgp;?>" class="text-box"  >
                 <tr><td>Desde:</td><td><input type="date" value="<? echo $list_dgp[0][1];?>" name="FEC_DESDE" class="text-box"  required="" >Hasta:<input type="date" name="FEC_HASTA"  value="<? echo $list_dgp[0][2];?>" class="text-box" required=""  ></td></tr> 
                 <!--   
                <tr><td>Dirección:</td><td>
                        <select name="DIRECCION_ID" class="text-box">
                            <? /* for ($u = 0; $u < count($list_rh_dir); $u++) {?>
                            
                            <option value="<?echo $list_rh_dir[$u][0];?>" selected="selected"><?echo $list_rh_dir[$u][1];?></option>
                            <?  if ($list_dgp[0][0]==$list_rh_dir[$u][0]) {?>
                            <?}else{?>
                            <option value="<?echo $list_rh_dir[$u][0];?>"><?echo $list_rh_dir[$u][1];?></option>
                            <?}}?>
                        </select>
                    <tr><td>Departamento:</td><td>
                        <select name="DEPARTAMENTO_ID" class="text-box" >
                          <?  for ($s = 0; $s < count($list_rh_dep); $s++) {?>
                            <option value="<? echo $list_rh_dep[$s][0];?>"><?echo $list_rh_dep[$s][1];?></option>
                        <?}?>
                        </select>
                          
                    <tr><td>Area:</td><td>
                        <select  name="AREA_N_ID" class="text-box">
                            <?  for ($t = 0; $t < count($lis_area); $t++) {?>
                            <option value="<?echo $lis_area[$t][0];?>"><?  echo $lis_area[$t][1];?></option>  
                            <?}?>
                        </select>   
                    <tr><td>Sección:</td><td>
                        <select name="SECCION_ID" class="text-box">
                            <?  for ($r = 0; $r < count($list_rh_sec); $r++) {?>
                            <option value="<?echo $list_rh_sec[$r][0];?>"><?echo $list_rh_sec[$r][1];?></option>
                            <?}*/?>
                        </select>
                        -->
                    <tr><td>Puesto:</td><td>
                        <select name="PUESTO_ID" class="text-box"  required="" >
                            <?  for ($j = 0; $j < count($list_rh_pu); $j++) {?>
                            <?  if ($list_dgp[0][6]==$list_rh_pu[$j][0]) {?>
                            
                            <option value="<?echo $list_rh_pu[$j][0];?>" selected="selected"><?echo $list_rh_pu[$j][1];?></option>
                            <?}else{?>
                            <option value="<?echo $list_rh_pu[$j][0];?>"><?echo $list_rh_pu[$j][1];?></option>
                            <?}}?>
                        </select>
                    <tr><td>¿Es Jefe?:</td><td>
                        <select name="JEFE" class="text-box" required="" >
                            <option value=""></option>
                            <option value="1">No es Jefe</option>
                            <option value="2">Jefe de Sección</option>
                            <option value="3">Jefe de Area</option>
                            <option value="4">Jefe de Departamento</option>
                            <option value="5">Jefe de Dirección</option>
                        </select>     
                                                            
                 <!--   <tr><td>Funcion:</td><td><input type="text" name="FUNC_ID" class="text-box" ></td></tr>      -->
                    <tr><td>Condición:</td><td>
                        <select  name="CONDICION" class="text-box" required="" >
                            <option value="1"></option>
                            <option value="2">Contratado</option>
                            <option value="3">Contratado Independiente</option>
                            <option value="4">Enpleado</option>
                            <option value="5">Misionero</option>
                            <option value="6">MFL-Práctica Pre-Profesional</option>
                            <option value="7">MFL-Práctica Profesionales</option>
                            <option value="8">MFL-CLJ</option>
                            <option value="9">MFL-Contrato</option>
                        </select>
                                              
                   
                        
                    <tr><td>Sueldo:</td><td><input type="text" name="SUELDO" value="<? echo $list_dgp[0][3];?>" class="text-box"  required=""  >Reintegro:<input type="text" name="REINTEGRO"  value="0" class="text-box" ></td></tr>    
                    <tr><td>Tipo Horas Pago:</td><td><input type="text" value="0" name="TIPO_HORA_PAGO" class="text-box" ></td></tr>
                    <tr><td>Bono Alimentario:</td><td><input type="text"  value="<? echo $list_dgp[0][25];?>" name="BONO_ALIMENTO" class="text-box" ></td></tr>
                   <? require_once '../Modelo/ModeloDatos_hijos_trabajador.php';
                   $mdh= new ModeloDatos_hijos_trabajador();
                   $n=$mdh->ASIGNACION_F($idtr);
                   ?>
                <tr><td>Asignación Familiar:</td><td><input type="text" name="ASIG_FAMILIAR"  <?  if ($n==0) {?> value="0" <?}else{?>value="75" <?}?> class="text-box" ></td></tr>  

                    <tr><td>Horas:</td><td>Semanal:<input type="text" name="HORAS_SEMANA" value="48" class="text-box"  required="" >Mensual:<input type="text" name="NRO_HORAS_LAB" value="192" class="text-box"  required="" >Dias:<input type="text" name="DIAS" value="30" class="text-box" required=""  ></td></tr>      

                    <tr><td>Tipo Trabajador:</td><td>
                        <select name="TIPO_TRABAJADOR" class="text-box" >
                               <option value=""></option>
                               <option value="1" selected>Empleado</option>
                               <option value="2">Obrero</option>
                        </select>
                    <tr><td>Régimen Laboral:</td><td>
                        <select name="REGIMEN_LABORAL" class="text-box">
                            <option value=""></option>
                            <option value="1" selected>Privado</option>
                        </select>

                   <!-- <tr><td>Vacaciones:</td><td>Desde:<input type="text" name="VAC_FECHA_INI" class="text-box" >Hasta:<input type="text" name="VAC_FECHA_FIN" class="text-box" ></td></tr>  
                   --> 
                   <tr><td>Discapacidad:</td><td>
                        <select name="DISCAPACIDAD" class="text-box">
                            <option value=""></option>
                            <option value="1" selected>No</option>
                            <option value="2">Si</option>
                        </select>
                    <tr><td>Tipo Contrato:</td><td>
                        <select name="TIPO_CONTRATO" class="text-box" required="" >
                            <option value=""></option>
                            <option value="1">Necesidad de Mercado</option>
                            <option value="2">Incremento de Actividad</option>
                            <option value="3">Servicio Especifico</option>
                            <option value="4">Inicio de Actividad</option>
                            <option value="5">Tiempo Parcial</option>
                            <option value="6">Indeterminado</option>
                            <option value="7">Extranjero</option>
                            <option value="8">Suplencia</option>
                            <option value="9">Contrato Civil</option>
                            <option value="10">De Temporada</option>
                            <option value="11">Locacion de Servicios</option>
                            <option value="12">No Domiciliados</option>
                        </select>
                        
                                
                    <tr><td>Tipo Convenio:</td><td>
                        <select name="TIPO_CONVENIO" class="text-box">
                            <option value=""></option>
                            <option value="1">CLJ</option>
                            <option value="2">PPP</option>
                            <option value="3">PP</option>
                        </select >
                    <!--<tr><td>¿Firmo Contrato?</td><td>
                        <select name="FIRMO_CONTRATO" class="text-box">
                            <option value=""></option>
                            <option value="1">Si</option>
                            <option value="2">No</option>
                        </select>-->
                   <!-- <tr><td>Numero Contrato:</td><td><input type="text" name="NUMERO_CONTRATO" class="text-box" ></td></tr> -->
                    <tr><td>Observación:</td><td>
                        <textarea name="OBSERVACION" class="text-box" cols="50" rows="6"></textarea>
                    </td></tr> 
                    <tr><td>Régimen Pensionario:</td><td>
                        <select name="REGIMEN_PENSIONARIO" class="text-box">
                            <option value=""></option>
                            <option value="1" selected>Privado</option>
                            <option value="2">SNP</option>
                        </select></td></tr>
                    <tr><td>Situacion Actual:</td><td>
                        <select  name="ESTADO_CONTRATO" class="text-box">
                            <option value=""></option>
                            <option value="1" selected>Activo</option>
                            <option value="2">Término de Contrato</option>
                            <option value="3">Renuncia Voluntaria</option>
                            <option value="4">Traslado a otra Filial/Institucion</option>
                            <option value="5">No Inicio Relación Laboral</option>
                            <option value="6">Cambio de Modalidad Contractual</option>
                            <option value="7">Abandono de Trabajo</option>
                        </select>
                
                        
                    </td></tr> 
                    <tr><td>Filial donde Trabaja:</td><td>
                        <select name="FILIAL" class="text-box"  > 
                            <option value=""></option>
                            <option value="1" selected >Lima</option>
                            <option value="2">Juliaca</option>
                            <option value="3">Tarapoto</option>
                        </select>
                        <? if ($iddgp !=null) {?>
                    <tr><td>Fecha de Cese:</td><td><input type="date" name="FEC_CESE" class="text-box" ></td></tr>   
                        <?}?>
                    <!-- <tr><td>Nro documento:</td><td><input type="text" name="NRO_DOCUMENTO" class="text-box" ></td></tr> 
                    <tr><td>Pares:</td><td><input type="text" name="PARES" class="text-box" ></td></tr> 
                    <tr><td>Apoyo:</td><td><input type="text" name="APOYO" class="text-box" ></td></tr> -->

                    <input type="hidden" name="ENTREGAR_DOC_REGLAMENTOS"  value="0" class="text-box" >
                    <input type="hidden" name="REGISTRO_HUELLA"  value="0" class="text-box" > 
                    <input type="hidden" name="REGISTRO_SISTEM_REMU" value="0" class="text-box" >

                    <input type="hidden" name="ESTADO" value="1" class="text-box" > 

                    <input type="hidden" value="<? echo $_SESSION["IDUSER"];?>" name="USER_CREACION" class="text-box" >
                    <input type="hidden" value="" name="FECHA_CREACION" class="text-box" >
                    <input type="hidden" value="" name="USER_MODIF" class="text-box" >
                    <input type="hidden" value="" name="FECHA_MODIF" class="text-box" >
                    <input type="hidden" value="" name="USUARIO_IP" class="text-box" >
                           
                    <input type="hidden" value="<?echo $idtr;?>" name="IDDATOS_TRABAJADOR" class="text-box" >
                    <input type="hidden" name="AREA_ID" class="text-box" >
                    <tr><td colspan="2"><input type="submit" name="opc"  class="submit" value="REGISTRAR CONTRATO"></td></tr>
                </table></form></center><br><br>
           <?}?>
    </body>
</html>
