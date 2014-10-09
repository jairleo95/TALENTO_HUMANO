
<%@page import="pe.edu.upeu.application.model.V_Ficha_Trab_Num_C"%>
<%@page import="pe.edu.upeu.application.model.Requerimiento"%>
<%@page import="pe.edu.upeu.application.model.V_Puesto_Direccion"%>
<%@page import="pe.edu.upeu.application.model.Puesto"%>
<%@page import="pe.edu.upeu.application.model.Trabajador"%>
<jsp:useBean id="Listar_Trabajador_id" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="List_Puesto" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="List_Det_Puesto" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="Listar_Requerimiento" scope="application" class="java.util.ArrayList"/>

<!DOCTYPE html >
<html>
    <head>
        <meta charset="windows-1252">
        <title></title>
        <link rel="stylesheet" href="../../css/Css_Formulario/form.css"  type="text/css" > 
        <script language="javascript" type="text/javascript" src="../../js/JQuery/jQuery.js"></script>


        <link rel="stylesheet" href="../../css/Css_DGP/chosen.css">
        <script src="../../js/Js_DGP/abc.js"></script>
        <script src="../../js/Js_DGP/organictabs.jquery.js"></script>

        <SCRIPT LANGUAGE="JavaScript">
            function checkIt(evt) {
                evt = (evt) ? evt : window.event
                var charCode = (evt.which) ? evt.which : evt.keyCode
                if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                    status = "This field accepts numbers only."
                    return false
                }
                status = ""
                return true
            }
        </SCRIPT>


        <script language="javascript" type="text/javascript">
            $(document).ready(function () {
                $(".contenido").hide();

                /*TEMPORAL*/
                //Planilla
                //if ($("#combito").val()=="REQ-0001" | $("#combito").val() == "REQ-0002" | $("#combito").val() == "REQ-0003" | $(this).val() == "REQ-0004" | $(this).val() == "REQ-0005" | $(this).val() == "REQ-0006") {
                if (true) {
                    $(".contenido").hide();
                    $("#div_1").show();
                }
                //Fuera PLanilla
                if ($("#combito").val() == 7 | $(this).val() == 8 | $(this).val() == 9) {
                    $(".contenido").hide();
                    $("#div_2").show();
                }
                //Otros
                if ($("#combito").val() == 10 | $(this).val() == 11 | $(this).val() == 12) {
                    $(".contenido").hide();
                    $("#div_3").show();
                }

            });


        </script>


        <style>

            .td{
                font-weight: bold;
            }
        </style>





    </head>
    <body>    

    <center>
        <label class="title"><%%></label>


        <form class="form" action="../../dgp" method="post" > 
            <div>
                <table class="table"  >       


                    <%
                        /*Temporal*/
                        String idreq = request.getParameter("idreq");

                        for (int i = 0; i < Listar_Trabajador_id.size(); i++) {
                            V_Ficha_Trab_Num_C tr = new V_Ficha_Trab_Num_C();
                            tr = (V_Ficha_Trab_Num_C) Listar_Trabajador_id.get(i);
                    %>
                    <tr><td>Trabajador:</td><td><%=tr.getAp_paterno() + " " + tr.getAp_materno() + " " + tr.getNo_trabajador()%>
                            <input type="hidden" value="<%=tr.getId_trabajador()%>" name="IDDATOS_TRABAJADOR" class="text-box" ></td></tr>   
                            <% }
                                if (Listar_Trabajador_id.size() == 0) { %>   

                    <%}%>

                    <tr><td class="td">Puesto | Seccion | Area:</td><td>
                            <select name="IDPUESTO"  required="" >
                                <option value=""></option>

                                <%
                                    for (int j = 0; j < List_Puesto.size(); j++) {
                                        V_Puesto_Direccion p = new V_Puesto_Direccion();
                                        p = (V_Puesto_Direccion) List_Puesto.get(j);
                                %>

                                <option value="<%=p.getId_puesto()%>"><% out.println(p.getNo_puesto() + " | " + p.getNo_seccion() + " | " + p.getNo_area());%></option> <%} %>

                            </select></td></tr>   
                    <tr style="display: "><td class="td">Requermiento:</td><td>
                            <select name="IDREQUERIMIENTO"    disabled="" onchange="mostrar()" class="text-box"   > 
                                <option value=""></option>

                                <%
                                    for (int index = 0; index < Listar_Requerimiento.size(); index++) {
                                        Requerimiento r = new Requerimiento();
                                        r = (Requerimiento) Listar_Requerimiento.get(index);
                                        if (idreq.equals(r.getId_requerimiento())) {
                                %>
                                <option value="<%=r.getId_requerimiento()%>" selected="" ><%=r.getNo_req()%></option>

                                <%} else {%>
                                <option value="<%=r.getId_requerimiento()%>"><%=r.getNo_req()%></option>                      
                                <%                          }
                                    }%>
                            </select> 
                        </td></tr>   
                    <script>
                        $(document).ready(
                                function () {
                                    $("#sueldo").keyup(
                                            function () {
                                              var   x = parseFloat($("#sueldo").val());
                                               var  y =parseFloat($("#bono_al").val());
                                                var z =parseFloat($("#bev").val());
                                                var v=x+y+z;
                                                $("#suel_total").text(v);
                                            }
                                    );
                                    $("#bono_al").keyup(
                                            function () {
                                           var   x = parseFloat($("#sueldo").val());
                                               var  y =parseFloat($("#bono_al").val());
                                                var z =parseFloat($("#bev").val());
                                                var v=x+y+z;
                                                $("#suel_total").text(v);
                                            }
                                    );
                                    $("#bev").keyup(
                                            function () {
                                           var   x = parseFloat($("#sueldo").val());
                                               var  y =parseFloat($("#bono_al").val());
                                                var z =parseFloat($("#bev").val());
                                                var v=x+y+z;
                                                $("#suel_total").text(v);
                                            }
                                    );

                                }
                        );
                    </script>
                    <input type="hidden" name="IDREQUERIMIENTO"  id="combito"  value="<%=idreq%>" >
                    <tr><td class="td">Fecha de Inicio:</td><td><input type="date" name="FEC_DESDE" min="<%%>" required="" id="datepicker" class="text-box" ></td></tr>     

                    <tr><td class="td">Fecha de Cese:</td><td><input type="date" required="" min="<%%>" name="FEC_HASTA" class="text-box" ></td></tr>   
                    <tr><td class="td">Sueldo:</td><td><input type="text"  name="SUELDO" required="" value="0.0"  id="sueldo" class="text-box" ></td></tr>       
                    <tr><td class="td">Bono de Alimentos :</td><td><input  type="text"  required="" value="0.0" name="BONO_ALIMENTARIO"  id="bono_al"class="text-box" ></td></tr>       

                </table>
            </div>
            <div id="div_1" class="contenido" style="display:none ">
                <table class="table">
                    <tr><td class="td">BEV:</td><td><input type="text" name="BEV" class="text-box" value="0.0" id="bev" ></td></tr>    
                    <tr><td class="td">Sueldo Total:</td><td><div id="suel_total">0.0</div></td></tr>    
                    <tr><td class="td">Centro de Costos:</td><td>
                            <select name="CENTRO_COSTOS">
                                <option value="0">----</option>
                            </select>
                        </td></tr>    
                    <tr><td class="td">Antecedentes Policiales:</td><td><select name="ANTECEDENTES_POLICIALES" >
                                            <option value="1" selected="">No</option>
                                            <option value="2">Si</option>
                            </select></td></tr>     
                    <tr><td class="td">Certificado de Salud:</td><td><input type="text" name="CERTIFICADO_SALUD" class="text-box"  ></td></tr>   

                </table>
            </div>   

            <div id="div_2" class="contenido" style="display: none">
                <table  class="table">
                    <tr><td class="td">Subvencion:</td><td><input type="text" name="SUBVENCION" class="text-box" ></td></tr>   
                    <tr><td class="td">Horario de Capacitacion:</td><td><input type="text" name="HORARIO_CAPACITACION" class="text-box" ></td></tr>   
                    <tr><td class="td">Horario de Refrigerio:</td><td><input type="text" name="HORARIO_REFRIGERIO" class="text-box" ></td></tr>  
                    <tr><td class="td">Dias de Capacitacion:</td><td><input type="text" name="DIAS_CAPACITACION" class="text-box" ></td></tr>  


                </table>
            </div  >

            <div id="div_3" class="contenido" style="display:none ">
                <table class="table">
                    <tr><td class="td">Ruc:</td><td><input type="text" name="RUC" class="text-box" ></td></tr>    
                    <tr><td class="td">Lugar de Servicio:</td><td><input type="text" name="LUGAR_SERVICIO" class="text-box" ></td></tr>   
                    <tr><td class="td">Descripcion de Servicio:</td><td><input type="text" name="DESCRIPCION_SERVICIO" class="text-box" ></td></tr> 
                    <tr><td class="td">Monto del Honorario:</td><td><input type="text" name="MONTO_HONORARIO" class="text-box" ></td></tr>   
                    <tr><td class="td">Periodo Pago:</td><td><input type="text" name="PERIODO_PAGO" class="text-box" ></td></tr>    
                    <tr><td class="td">Domicilio Fiscal:</td><td><input type="text" name="DOMICILIO_FISCAL" class="text-box" ></td></tr>    
                </table>
            </div>


            <table><tr><td><input type="submit" name="opc"  class="submit" value="Registrar"></td></tr>
            </table>
        </form>
    </center>
    <br><br>



</body>

<script src="../../js/Js_DGP/prism.js" type="text/javascript" charset="utf-8"></script>
<script src="../../js/Js_DGP/chosen.jquery.js" type="text/javascript"></script>
<script src="../JS/prism.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
                        var config = {
                            '.chosen-select': {},
                            '.chosen-select-deselect': {allow_single_deselect: true},
                            '.chosen-select-no-single': {disable_search_threshold: 10},
                            '.chosen-select-no-results': {no_results_text: 'Oops, nothing found!'},
                            '.chosen-select-width': {width: "95%"}
                        }
                        for (var selector in config) {
                            $(selector).chosen(config[selector]);
                        }
</script>




</html>
