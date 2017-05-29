<%@page import="pe.edu.upeu.application.model.Usuario"%>
<%
    HttpSession sesion_1 = request.getSession();
    String id_user_1 = (String) sesion_1.getAttribute("IDUSER");
    if (id_user_1 != null) {
%>
<%@page import="pe.edu.upeu.application.model.Requerimiento"%>
<%@page import="pe.edu.upeu.application.model.Area"%>
<jsp:useBean id="List_Area" scope="session" class="java.util.ArrayList"/>
<jsp:useBean class="java.util.ArrayList" scope="session"  id="Listar_Requerimiento"/>
<%
    HttpSession sesion = request.getSession(true);
    String id_user = (String) sesion.getAttribute("IDUSER");
    String id_dep = (String) sesion.getAttribute("ID_DEPARTAMENTO");
    if (id_user != "") {
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">

        <script type="text/javascript" src="../../js/JQuery/jQuery.js"></script>
        <link type="text/css" rel="stylesheet" href="../../css/Css_Reporte/Reportes.css">
        <link type="text/css" rel="stylesheet" href="../../css/Css_Formulario/form.css">
        <link rel="stylesheet" href="../../css/bootstrap.min.css">
        <title>Contratos</title>
    </head>
    <body>  
        <form class="form-inline" id="frm_filtro2" method="post" action="" name="formulario">
            <div class="spacing">
                <center><h1 class="spacing" style="font-weight: bold;">CONTRATOS</h1></center> 
            </div>
            <center>
                <br>
                <div id="contenido">

                    <div   >
                        <!--style="padding-left: 30px"-->

                        <div class="row">
                            <div class="form-group" >
                                <label>Fecha de Contratacion</label><br>
                                <input type="date"  class="form-control" name="del"  length="45" style="width: 250px" />
                            </div>
                            <div class="form-group" >
                                <label>Al</label><br>
                                <input type="date"  class="form-control" name="al" size="45" maxlength="100" style="width: 250px" />
                                <input type="hidden" name="iddep" value="<%%>">
                            </div>
                        </div>
                        <div class="row">

                            <div class="form-group">
                                <label>Nombres y Apellidos :</label><br>
                                <input type="text"  class="form-control" name="nom_ape"  style="width: 250px"   />
                            </div>
                            <div class="form-group">  
                                <label>Area :</label><br>
                                <select name="area" class="form-control" style="width: 250px" >
                                    <option value="0">[Seleccione]</option>
                                    <%for (int i = 0; i < List_Area.size(); i++) {
                                            Area a = new Area();
                                            a = (Area) List_Area.get(i);
                                    %>
                                    <option value="<%=a.getId_area()%>"><%=a.getNo_area()%></option>
                                    <% } %>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group" >
                                <label>Puesto :</label><br>
                                <input type="text" name="puesto" class="form-control" style="width: 250px" />
                            </div>

                            <div class="form-group">
                                <label>Sueldo :</label><br>
                                <input type="text" name="sueldo" class="form-control" style="width: 250px" maxlength="10"/>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label>Fecha Inicio:</label><br>
                                <input type="date" name="fec_i" class="form-control" length="45" style="width: 250px">
                            </div>
                            <div class="form-group">
                                <label>Fecha Fin :</label><br>
                                <input type="date" name="fec_f" class="form-control" size="45" maxlength="100" style="width: 250px">
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label>Sección :</label><br>
                                <input type="text" name="seccion" class="form-control" style="width: 250px">
                            </div>
                        </div>
                        <hr/>

                        <div class="row">
                            <div class="form-group">                            
                                <button type="button" class="btn btn-primary" id="btnbuscar">Buscar</button>
                            </div>
                            <div class="form-group">  
                                <a href="javascript:;"  id="btncancel" class="btn btn-primary" >Cancelar</a>

                            </div>
                        </div>       


                    </div> 

                    <br>
                    <br>



                    <div class="container">
                        <table     id="data" class="table">
                            <thead class="tab_cabe">
                                <tr class="tr" >
                                    <td style="width: 230px;"><span title="NOM_APE">Nombres y Apellidos</span></td>
                                    <td ><span title="FEC_DESDE">Fecha Desde</span></td>
                                    <td ><span title="FEC_HASTA">Fecha Hasta</span></td>
                                    <td ><span title="AREA">Area</span></td>
                                    <td ><span title="SECCION">Sección</span></td>
                                    <td ><span title="PUESTO">Puesto</span></td>
                                    <td ><span title="SUELDO">Sueldo</span></td>
                                    <td ><span title="FECHA_CREACION">Fecha de Contratación</span></td>
                                    <td ><span >Opcion</span></td>
                                    <td ><span >Imprimir</span></td>
                                    <td><button type="button" class="btn btn-primary" id="btns"> Seleccionar todo</button><button type="button" class="btn btn-primary" id="btns2"> Seleccionar </button><input type="submit" class="btn btn-primary" id="asa" value="Imprimir"></td>


                                </tr>
                            </thead>
                            <tbody class="tbodys" id="gg">

                            </tbody>
                        </table>

                    </div>

                </div>
            </center>
        </form>

    </body>
    <script>
        $(document).ready(function () {
            var b = $(".tbodys");
            /* $.ajax({
             data:$("#frm_filtro2").serialize(),
             type:"POST",
             dataType:"json",
             url:"../../Ajax/Ajax_Dgp/Ajax_Dgp_Aut.jsp"
             
             }
             
             });
             */
            $("#asa").hide();

            $("#btnbuscar").click(
                    function () {
                        $.post("../../ajax/Ajax_Contrato/Ajax_Contrato.jsp", $("#frm_filtro2").serialize(), function (objJson) {
                            b.empty();
                            var list = objJson.lista;
                            for (var i = 0; i < list.length; i++) {
                                b.append("<tr>");
                                b.append("<td><p>" + list[i].nom_ape + "</p></td>");
                                b.append("<td>" + list[i].fe_desde + "</td>");
                                b.append("<td>" + list[i].fe_hasta + "</td>");
                                b.append("<td><p>" + list[i].no_area + "</p></td>");
                                b.append("<td><p>" + list[i].no_seccion + "</p></td>");
                                b.append("<td><p>" + list[i].no_puesto + "</p></td>");
                                b.append("<td>" + list[i].ca_sueldo + '</td>');
                                b.append("<td>" + list[i].fecha_contratacion + "</td>");
                                b.append('<td><a class="btn-warming" href="../../contrato?opc=Detalle_Contractual&idtr=' + list[i].id_trabajador + '">Ver detalle</a> </td>');
                                b.append('<td><input type="checkbox" id="imp" name="Imprimir" value="' + list[i].id_contrato + '"></td>');
                                b.append("</tr>");


                            }
                            if (list.length !== 0) {
                                $("#asa").show();
                            }
                            $("#btns").click(
                                    function () {

                                        $("#gg :checkbox").attr('checked', true);
                                        $('#imp').is(':checked');
                                        alerta(checkboxValues.push($("#imp").val()));
                                    });
                            $("#btns2").click(
                                    function () {
                                        var checkboxValues = new Array();
//recorremos todos los checkbox seleccionados con .each
                                        $('input[name="orderBox[]"]:checked').each(function () {
                                            //$(this).val() es el valor del checkbox correspondiente
                                            checkboxValues.push($(this).val());
                                            alert(checkboxValues.push($(this).val()));
                                        });

                                    });


                        }
                        );
                    }
            );
            /* $("#btnbuscar").click(
             function() {
             
             $.post("../../ajax/Ajax_Contrato/Ajax_Contrato.jsp", $("#frm_filtro2").serialize(), function(objJson) {
             alert( );
             }
             );
             
             }
             );*/
            $("#btncancel").click(
                    function () {
                        document.formulario.reset();
                        b.empty();
                        html = '<tr><td colspan="8" align="center">Haga la busqueda por algunos de los filtros...</td></tr>'
                        $(".tbodys").html(html);
                    }
            );

        }
        );


    </script>

</html>
<%        }%>
<%} else {
        out.print("<script> window.parent.location.href = '/TALENTO_HUMANO/';</script>");
    }
%>