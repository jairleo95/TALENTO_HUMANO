<%@page import="pe.edu.upeu.application.model.Regimen_Laboral"%>
<%@page import="pe.edu.upeu.application.model.Modalidad"%>
<%@page import="pe.edu.upeu.application.model.V_Det_DGP"%>
<%@page import="oracle.net.aso.p"%>
<%@page import="pe.edu.upeu.application.model.X_List_id_dgp"%>
<%@page import="pe.edu.upeu.application.model.Puesto"%>
<%@page import="pe.edu.upeu.application.model.DGP"%>
<%@page import="pe.edu.upeu.application.model.Anno"%>
<jsp:useBean id="List_Anno" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="List_Puesto" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="LIST_ID_DGP" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="ASIGNACION_F" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="List_anno_max" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="List_modalidad" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="list_reg_labo" scope="application" class="java.util.ArrayList"/>
<!DOCTYPE html >

<html>
    <head>
        <meta charset="windows-1252">
        <title>Registrar Contrato</title>
        <% HttpSession sesion = request.getSession(true);
            String iduser = (String) sesion.getAttribute("IDUSER");%>
        <link rel="stylesheet" type="text/css"  href="../../css/Css_Formulario/form.css">
    </head>
    <body>
    <center> 
        <label class="title">Información Contractual</label>
        <br>
        <br>

        <%
            for (int u = 0; u < LIST_ID_DGP.size(); u++) {
                V_Det_DGP d = new V_Det_DGP();
                d = (V_Det_DGP) LIST_ID_DGP.get(u);
        %>


        <%if (d.getId_dgp() == null) {
        %>

        <label>Todavia no se ha almacenado El DGP,¿desea contratar sin  antes elaborar un DGP?</label>  
        <br>
        <a href="Reg_Contrato.php?hac_cont=1&idtr=<? echo $idtr;?>">Hacer Contrato de Todas Maneras</a>

        <%} else {%>
        <form class="form" action="../../contrato" > 
            <table class="table">      
                <tr><td>Año :</td><td>
                        <select name="AÑO_ID" class="text-box" required="" >
                            <%  for (int i = 0; i < List_Anno.size(); i++) {
                                    Anno a = new Anno();
                                    for (int e = 0; e < List_anno_max.size(); e++) {
                                        Anno w = new Anno();
                                        w = (Anno) List_anno_max.get(e);
                                        a = (Anno) List_Anno.get(i);%>
                            <%if (a.getId_anno().trim() != w.getId_anno().trim() && a.getId_anno().equals("")) {%>
                            <option value="<%=a.getId_anno()%>" selected="selected"><%=a.getNo_anno()%></option>
                            <%} else {%>
                            <option value="<%=w.getId_anno()%>"><%=w.getNo_anno()%></option>
                            <%}
                                    }
                                }%>
                        </select></td></tr>
                <input type="hidden" name="IDDETALLE_DGP" value="<%=d.getId_dgp()%>" class="text-box"  >
                <tr><td>Desde:</td><td><input type="date" value="<%=d.getFe_desde()%>" name="FEC_DESDE" class="text-box"  required="" >Hasta:<input type="date" name="FEC_HASTA"  value="<%=d.getFe_hasta()%>" class="text-box" required=""  ></td></tr> 
                <tr><td>Puesto:</td><td>
                        <select name="PUESTO_ID" class="text-box"  required="" >
                            <%  for (int j = 0; j < List_Puesto.size(); j++) {%>
                            <%Puesto p = new Puesto();
                                p = (Puesto) List_Puesto.get(j);
                                if (d.getId_puesto().equals(p.getId_puesto())) {%>

                            <option value="<%=p.getId_puesto()%>" selected="selected"><%=p.getNo_puesto()%></option>
                            <%} else {%>
                            <option value="<%=p.getId_puesto()%>"><%=p.getNo_puesto()%></option>

                            <%}
                                }%>
                        </select>
                <tr><td>Centro de Costo:</td><td>
                        <select name="CENTRO_COSTO" class="text-box"  >
                            <option value="">[SELECCIONE]</option>
                        </select>     
                <tr><td>Condición:</td><td>
                        <select  name="CONDICION" class="text-box" required="" >
                            <option value="">[SELECCIONE]</option>
                            <option value="1">Contratado</option>
                            <option value="2">Contratado Independiente</option>
                            <option value="3">Enpleado</option>
                            <option value="4">Misionero</option>
                            <option value="5">MFL-Práctica Pre-Profesional</option>
                            <option value="6">MFL-Práctica Profesionales</option>
                            <option value="7">MFL-CLJ</option>
                            <option value="8">MFL-Contrato</option>
                        </select>


                <tr><td>Remuneración:</td><td><input type="text" name="SUELDO" value="<%=d.getCa_sueldo()%>" class="text-box"  required=""  >Reintegro:<input type="text" name="REINTEGRO"  value="0" class="text-box" ></td></tr>   
                <tr><td>Bono Alimentario:</td><td><input type="text"  value="<%=d.getCa_bono_alimentario()%>" name="BONO_ALIMENTO" class="text-box" ></td></tr>
                <tr><td>BEV:</td><td><input type="text"  value="<%=d.getDe_bev()%>" name="BEV" class="text-box" ></td></tr>
                <tr><td>Sueldo Total:</td><td><input type="text"  value="<%=d.getDe_bev() + d.getCa_bono_alimentario() + d.getCa_sueldo()%>" name="TOTAL_SUELDO" class="text-box" ></td></tr>

                <tr><td>Tipo Horas Pago:</td><td><input type="text" value="0" name="TIPO_HORA_PAGO" class="text-box" ></td></tr>



                <%int total = Integer.parseInt(request.getParameter("num")); %>


                <tr><td>Asignación Familiar:</td><td><input type="text" name="ASIG_FAMILIAR"  <% if (total == 0) {%> value="0" <%} else {%>value="75.0" <%}%> class="text-box" ></td></tr>  

                <tr><td>Régimen Laboral Mintra :</td><td>
                        <select name="REG_LAB_MINTRA" class="text-box">
                            <%for(int q =0;q<list_reg_labo.size();q++){
                                Regimen_Laboral re=new Regimen_Laboral();
                                re=(Regimen_Laboral)list_reg_labo.get(q);
                            %>
                            <option value="<%=re.getId_regimen_laboral()%>"><%=re.getDe_regimen_l()%></option>
                           <%}%>
                        </select>
                    </td></tr>
                <tr><td>Modalidad:</td><td>
                        <select name="MODALIDAD" class="text-box" id="select_mod">
                            <%for(int l =0;l<List_modalidad.size();l++){
                                Modalidad mo=new Modalidad();
                                mo=(Modalidad)List_modalidad.get(l);   
                            %>
                            <option value="<%=mo.getId_modalidad()%>"><%=mo.getDe_modalidad()%></option>
                            <%}%>
                        </select></td></tr>
                <tr><td>SUB-Modalidad:</td><td>
                        <select name="SUB_MODALIDAD" class="text-box" id="select-sub-modalidad">
                              <option value="">[SELECCIONE]</option>
                        </select></td></tr>
                <tr><td>Tipo de Contratación:</td><td>
                        <select name="TI_CONTRATACION" class="text-box" required="">
                            <option value="">[SELECCIONE]</option>
                            <option value="I">INICIO</option>
                            <option value="R">RENOVACION</option>
                        </select></td></tr>
                <tr><td>Codigo de Grupo de Ocupaciones:</td><td>
                        <select name="CO_GRUPO_OCU" class="text-box">
                            <option value="">[SELECCIONE]</option>
                        </select></td></tr>


                <tr><td>Fecha de Suscripcion:</td><td><input type="date" value="0" name="FECHA_SUSCRIPCION" class="text-box" required=""></td></tr>
                <tr><td>Tipo de Moneda:</td><td>
                        <select name="TIPO_MONEDA" class="text-box" required="" >
                            <option value="">[SELECCIONE]</option>
                            <option value="01">SOLES</option>
                            <option value="02">DOLARES</option>
                            <option value="03">EUROS</option>
                        </select></td></tr>
                <tr><td>Tipo de Remuneración Variable:</td><td>
                        <select name="REM_VARIABLE" class="text-box" required="">
                            <option value="">[SELECCIONE]</option>
                            <option value="1">DESTAJO</option>
                            <option value="2">COMISIONES</option>
                            <option value="3">NINGUNO</option>
                        </select></td></tr>
                <tr><td>Remuneración en especie:</td><td>
                        <select name="REM_ESPECIE" class="text-box" required="">
                            <option value="">[SELECCIONE]</option>
                            <option value="1">SI</option>
                            <option value="0">NO</option>
                        </select></td></tr>

                <tr><td>Horas:</td><td>Semanal:<input type="text" name="HORAS_SEMANA" value="48" class="text-box"  required="" >Mensual:<input type="text" name="NRO_HORAS_LAB" value="192" class="text-box"  required="" >Dias:<input type="text" name="DIAS" value="30" class="text-box" required=""  ></td></tr>      

                <tr><td>Tipo Trabajador:</td><td>
                        <select name="TIPO_TRABAJADOR" class="text-box" >
                            <option value=""></option>
                            <option value="1" selected>Empleado</option>
                            <option value="2">Obrero</option>
                        </select></td></tr>

                <tr><td>Régimen Laboral </td><td>
                        <select name="REGIMEN_LABORAL" class="text-box">
                            <option value=""></option>
                            <option value="1" selected>Privado</option>
                            <option value="2" selected>Público</option>
                        </select>
                    
                    
                    </td></tr>
                
                <tr><td>Discapacidad:</td><td>
                        <select name="DISCAPACIDAD" class="text-box">
                            <option value=""></option>
                            <option value="1" selected>No</option>
                            <option value="2">Si</option>
                        </select></td></tr>
                         <tr><td>Régimen Pensionario:</td><td>
                        <select name="REGIMEN_PENSIONARIO" class="text-box">
                            <option value=""></option>
                            <option value="1" selected>Privado</option>
                            <option value="2">SNP</option>
                        </select></td></tr>
                <tr><td>Tipo Contrato:</td><td>
                        <select name="TIPO_CONTRATO" class="text-box" required="" >
                            <option value="">---elegir---</option>
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
                        </select></td></tr>


                <tr><td>Tipo Convenio:</td><td>
                        <select name="TIPO_CONVENIO" class="text-box" required="">
                            <option value="">---elegir---</option>
                            <option value="1">CLJ</option>
                            <option value="2">PPP</option>
                            <option value="3">PP</option>
                        </select ></td></tr>

                <tr><td>Observación:</td><td>
                        <textarea name="OBSERVACION" class="text-box" cols="50" rows="6"></textarea>
                    </td></tr> 
               
                <tr><td>Situacion Actual:</td><td>
                        <select  name="ESTADO_CONTRATO" class="text-box">
                            <option value="">---elegir---</option>
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
                            <option value="">---elegir---</option>
                            <option value="1" selected >Lima</option>
                            <option value="2">Juliaca</option>
                            <option value="3">Tarapoto</option>
                        </select>
                      
                <tr><td>Fecha de Cese:</td><td><input type="date" name="FEC_CESE" class="text-box" ></td></tr>   
                  <tr><td>RUC UPEU:</td><td><input type="text"  value="20138122256" name="EMP_RUC" class="text-box" ></td></tr>
                  <tr><td>CODIGO SUCURSAL:</td><td><input type="text"  value="-1" name="SUCURSAL" class="text-box" ></td></tr>
                  <tr><td>MYPE:</td><td><input type="text"  value="N" name="MYPE" class="text-box" ></td></tr>

               

                <input type="hidden" name="ENTREGAR_DOC_REGLAMENTOS"  value="0" class="text-box" >
                <input type="hidden" name="REGISTRO_HUELLA"  value="0" class="text-box" > 
                <input type="hidden" name="REGISTRO_SISTEM_REMU" value="0" class="text-box" >
                <input type="hidden" name="ESTADO" value="1" class="text-box" > 
                <input type="hidden" value="<%=d.getId_trabajador()%>" name="IDDATOS_TRABAJADOR" class="text-box" >
                <input type="hidden" value="ARE-0022" name="AREA_ID" class="text-box" >
                <tr><td colspan="2"><input type="submit" name="opc"  class="submit" value="REGISTRAR CONTRATO"></td></tr>
            </table></form></center><br><br>
            <%}
                }%>
</body>
<script type="text/javascript" src="../../js/JQuery/jQuery.js"></script>
        <script type="text/javascript">
            $(document).ready(function() {
                var b = $("#select-sub-modalidad");
                
                $("#select_mod").change(
                function() {
                   // alert("?MODALIDAD="+$("#select_mod").val());
                   
                    $.post("../../ajax/Ajax_Reg_Contrato/Ajax_Reg_Contrato.jsp","MODALIDAD="+$("#select_mod").val(), function(objJson) {
                        
                        b.empty();
                        var list = objJson.lista;
                        for (var i = 0; i < list.length; i++) {
                            b.append('<option value="'+list[i].id_sub_modalidad+'">'+list[i].de_sub_mod+'</option>');
                            
                        }
                        });
                   
                   
                    });
                  

                
                
            });
        </script>
</html>
