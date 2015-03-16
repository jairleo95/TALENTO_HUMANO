
<%@page import="pe.edu.upeu.application.model.Direccion"%>
<%
    HttpSession sesion = request.getSession();
    String id_user = (String) sesion.getAttribute("IDUSER");
    if (id_user != null) {

%>
<%@page import="pe.edu.upeu.application.model.Usuario"%>
<%@page import="pe.edu.upeu.application.model.Requerimiento"%>
<%@page import="pe.edu.upeu.application.model.Area"%>
<jsp:useBean id="Listar_Direccion" scope="application" class="java.util.ArrayList"/>
<jsp:useBean class="java.util.ArrayList" scope="application"  id="Listar_Requerimiento"/>
<%    HttpSession sesion_1 = request.getSession(true);
    String id_user_1 = (String) sesion_1.getAttribute("IDUSER");
    String id_dep = (String) sesion.getAttribute("ID_DEPARTAMENTO");
    if (id_user_1 != "") {
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
        <form class="form-inline validarform" id="frm_filtro2" method="post" action="../../Imprimir" name="formulario" onclick="return marcado();">
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
                                <input type="date"  class="form-control" name="del"  length="45" style="width: 250px" id="del"/>
                            </div>
                            <div class="form-group" >
                                <label>Al</label><br>
                                <input type="date"  class="form-control" name="al" size="45" maxlength="100" style="width: 250px" id="al" />
                                <input type="hidden" name="iddep" value="<%%>">
                            </div>
                        </div>
                        <div class="row">

                            <div class="form-group">
                                <label>Nombres y Apellidos :</label><br>
                                <input type="text"  class="form-control" name="nom_ape"  style="width: 250px"   id="ap"/>
                            </div>
                            <div class="form-group">  
                                <label>Direccion :</label><br>
                                <select name="direccion" class="form-control selecdireccion" style="width: 250px" id="select_direccion">
                                    <option value="">[Seleccione]</option>
                                    <%for (int i = 0; i < Listar_Direccion.size(); i++) {
                                            Direccion a = new Direccion();
                                            a = (Direccion) Listar_Direccion.get(i);
                                    %>
                                    <option value="<%=a.getId_direccion()%>"><%=a.getNo_direccion()%></option>
                                    <% } %>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group" >
                                <label>Departamento :</label><br>
                                <select name="departamento" class="form-control selectdep" id="select_dep" style="width: 250px"> 
                                    <option value="">[Seleccione]</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <label>Area :</label><br>
                                <select name="area" class="form-control selectarea" id="select_area" style="width: 250px"> 
                                    <option value="">[Seleccione]</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group" >
                                <label>Seccion :</label><br>
                                <select name="seccion" class="form-control selectsec" id="select_sec" style="width: 250px"> 
                                    <option value="">[Seleccione]</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <label>Puesto :</label><br>
                                <select name="puesto" class="form-control selectpu" id="select_pu" style="width: 250px"> 
                                    <option value="">[Seleccione]</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label>Fecha Inicio:</label><br>
                                <input type="date" name="fec_i" class="form-control" length="45" style="width: 250px" id="fe_i">
                            </div>
                            <div class="form-group">
                                <label>Fecha Fin :</label><br>
                                <input type="date" name="fec_f" class="form-control" size="45" maxlength="100" style="width: 250px" id="fe_fin">
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label>Sueldo :</label><br>
                                <input type="text" name="sueldo" class="form-control" style="width: 250px" maxlength="10" id="sueldo" value=""/>
                            </div>
                            <div class="form-group">
                                <label>Fecha Suscripcion :</label><br>
                                <input type="date" name="fec_f" class="form-control" size="45" maxlength="100" style="width: 250px" id="fe_sus">
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
                                    <td>Nro</td>
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
                                    <td id="seleccionar_pl"><span >seleccionar</span></td>
                                    <td><button type="button" class="btn btn-primary" id="btns"> Seleccionar todo</button><input type="submit"name="opc" class="btn btn-primary" id="asa" value="Imprimir"></td>


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
        function listar_opciones(opc, id) {
            if (opc == 'Listar_dir_dep') {
                var a = $(".selectdep");
                $(".selectarea").empty();
                $(".selectarea").append("<option value=''>[Seleccione]</option>");
                $(".selectsec").empty();
                $(".selectsec").append("<option value=''>[Seleccione]</option>");
                $(".selectpu").empty();
                $(".selectpu").append("<option value=''>[Seleccione]</option>");
            }
            if (opc == 'Listar_area2') {
                var a = $(".selectarea");
                $(".selectsec").empty();
                $(".selectsec").append("<option value=''>[Seleccione]</option>");
                $(".selectpu").empty();
                $(".selectpu").append("<option value=''>[Seleccione]</option>");
            }
            if (opc == 'Listar_sec2') {
                var a = $(".selectsec");
                $(".selectpu").empty();
                $(".selectpu").append("<option value=''>[Seleccione]</option>");
            }
            if (opc == 'Listar_pu_id') {
                var a = $(".selectpu");
            }
            $.post("../../Direccion_Puesto", "opc=" + opc.trim() + "&id=" + id.trim(), function(objJson) {
                var list = objJson.lista;
                a.empty();
                a.append("<option value=''>[Seleccione]</option>");
                for (var i = 0; i < list.length; i++) {
                    a.append("<option value='" + list[i].id + "'>" + list[i].nombre + "</option>");
                }
                $(".tbodys").append();
            });

        }
        function buscar(del, al, nombre, dir, dep, area, sec, puesto, fe_i, fe_fi, ca_sueldo, fe_sus) {
            var b = $(".tbodys");
            $.post("../../impresion_masiva?opc=filtrar" + "&desde=" + del + "&al=" + al + "&nom_ape=" + nombre + "&direccion=" + dir + "&departamento=" + dep + "&area=" + area + "&seccion=" + sec + "&puesto=" + puesto + "&fec_i=" + fe_i + "&fec_f=" + fe_fi + "&sueldo=" + ca_sueldo + "&fe_sus=" + fe_sus, function(objJson) {
                b.empty();
                //alert($("#select_pu").val());
                var list = objJson.lista;
                if (objJson.rpta == -1) {
                    alert(objJson.mensaje);
                    return;
                }
                var nuro = 1;
                if (list.length > 0) {
                    for (var i = 0; i < list.length; i++) {
                        nuro = nuro + i;
                        b.append("<tr>");
                        b.append("<td>" + nuro + "</td>");
                        b.append("<td><p>" + list[i].nombre + "</p></td>");
                        b.append("<td>" + list[i].fe_de + "</td>");
                        if (list[i].fe_ha != null) {
                            b.append("<td>" + list[i].fe_ha + "</td>");
                        } else {
                            b.append("<td>indefinido</td>");
                        }
                        // b.append("<td>" + list[i].fe_ha + "</td>");
                        b.append("<td><p>" + list[i].no_ar + "</p></td>");
                        b.append("<td><p>" + list[i].no_se + "</p></td>");
                        b.append("<td><p>" + list[i].no_pu + "</p></td>");
                        b.append("<td>" + list[i].ca_su + '</td>');
                        b.append("<td>" + list[i].fe_su + "</td>");
                        b.append('<td><a class="btn-warming" href="../../contrato?opc=Detalle_Contractual&idtr=' + list[i].id_tr + '">Ver detalle</a> </td>');
                        //b.append('<td id="sel' + i + '"></td>');
                        if (list[i].id_pl != null) {
                            b.append('<td><input type="checkbox" id="imp" name="Imprimir" value="' + list[i].id_co + '/' + list[i].id_pl + '"></td>');
                        } else {
                            b.append('<td>NO TIENE</td>');
                        }
                        b.append("</tr>");
                        nuro = 1;
                    }
                    if (list.length !== 0) {
                        $("#asa").show();
                    }
                    $("#btns").click(
                            function() {
                                $("#gg :checkbox").attr('checked', true);
                                $('#imp').is(':checked');
                                alerta(checkboxValues.push($("#imp").val()));
                            });
                    $("#btns2").click(
                            function() {
                                var checkboxValues = new Array();
//recorremos todos los checkbox seleccionados con .each
                                $('input[name="orderBox[]"]:checked').each(function() {
                                    //$(this).val() es el valor del checkbox correspondiente
                                    checkboxValues.push($(this).val());
                                    alert(checkboxValues.push($(this).val()));
                                });
                            });
                } else {
                    b.append("<tr><TD colspan='12' style='text-align:center;'> NO SE HA ENCONTRADO DATOS DE LA BUSQUEDA</TD></tr>")
                }

            }
            );
        }
        function marcado() {
            if (document.form.termin.checked) {
                document.form.submit();
            }
            else {
                alert("Debes aceptar los términos y condiciones");
                document.form.termin.focus();
                return false;
            }

        }
        $(document).ready(function() {

            /* $.ajax({
             data:$("#frm_filtro2").serialize(),
             type:"POST",
             dataType:"json",
             url:"../../Ajax/Ajax_Dgp/Ajax_Dgp_Aut.jsp"
             
             }
             var b=$('#tbodys');
             });
             */
            var b = $('#tbodys');
            $("#select_direccion").change(function() {
                var opc = 'Listar_dir_dep';
                var id = $("#select_direccion").val();
                listar_opciones(opc, id);
            });
            $("#select_dep").change(function() {
                var opc = 'Listar_area2';
                var id = $("#select_dep").val();
                listar_opciones(opc, id);
            });
            $("#select_area").change(function() {
                var opc = 'Listar_sec2';
                var id = $("#select_area").val();
                listar_opciones(opc, id);
            });
            $("#select_sec").change(function() {
                var opc = 'Listar_pu_id';
                var id = $("#select_sec").val();
                listar_opciones(opc, id);
            });
            $("#seleccionar_pl").hide();
            $("#asa").hide();
            $("#btnbuscar").click(
                    function() {
                        var del = $("#del").val();
                        var al = $("#al").val();
                        var nombre = $("#ap").val();
                        var dir = $("#select_direccion").val();
                        var dep = $("#select_dep").val();
                        var area = $("#select_area").val();
                        var sec = $("#select_sec").val();
                        var pu = $("#select_pu").val();
                        var fe_i = $("#fe_i").val();
                        var fe_f = $("#fe_fin").val();
                        var sueldo = $("#sueldo").val();
                        var fe_sus = $("#fe_sus").val();

                        //alert(del + al + nombre + dir + dep + area + sec + pu + fe_i + fe_f + sueldo)
                        buscar(del, al, nombre, dir, dep, area, sec, pu, fe_i, fe_f, sueldo, fe_sus);
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
                    function() {
                        document.formulario.reset();
                        b.empty();
                        html = '<tr><td colspan="8" align="center">Haga la busqueda por algunos de los filtros...</td></tr>'
                        $(".tbodys").html(html);
                    }
            );
            $(".validarform").submit(function() {
                var check = $("input[type='checkbox']:checked").length;
                var radio = $("input[type='radio']:checked").length;
                var select = $("select option:selected").val();
                if (check == "") {
                        alert("seleccione un contrato");
                        return false;
                }
            });

        });
    </script>

</html>

<%        }%>
<%} else {
        response.sendRedirect("/TALENTO_HUMANO/");
    }


%>