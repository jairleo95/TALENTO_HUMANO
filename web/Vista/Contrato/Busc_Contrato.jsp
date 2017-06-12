
<%@page import="pe.edu.upeu.application.model.Direccion"%>
<%
    HttpSession sesion = request.getSession();
    String id_user = (String) sesion.getAttribute("IDUSER");
    if (id_user != null) {

%>
<%@page import="pe.edu.upeu.application.model.Usuario"%>
<%@page import="pe.edu.upeu.application.model.Requerimiento"%>
<%@page import="pe.edu.upeu.application.model.Area"%>
<jsp:useBean id="Listar_Direccion" scope="session" class="java.util.ArrayList"/>
<jsp:useBean class="java.util.ArrayList" scope="session"  id="Listar_Requerimiento"/>
<jsp:useBean class="java.util.ArrayList" scope="session"  id="List_Area_ID"/>
<%    HttpSession sesion_1 = request.getSession(true);
    String id_user_1 = (String) sesion_1.getAttribute("IDUSER");
    String id_dep = (String) sesion.getAttribute("DEPARTAMENTO_ID");
    if (id_user_1 != "") {
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">

        <!-- SmartAdmin Styles : Please note (smartadmin-production.css) was created using LESS variables -->
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-production-plugins.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-production.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-skins.min.css">
        <link type="text/css" rel="stylesheet" href="../../css/Css_Reporte/Reportes.css">
        <link type="text/css" rel="stylesheet" href="../../css/Css_Formulario/form.css">
        <link rel="stylesheet" href="../../css/bootstrap.min.css">
        <title>Contratos</title>
    </head>
    <body class="slideInDown fast animated"> 

        <form class="form-inline validarform" id="frm_filtro2" method="post" action="../../Imprimir" name="formulario" onclick="return marcado();" >
            <center><h1 class="text-danger" >Contratos</h1></center>
            <center>
                <div id="contenido">                
                    <div class="col-md-12" style="padding:0 2%;box-sizing: border-box;">
                        <div class="col-md-4">
                            <ol class="breadcrumb" style="background: #01579b ;border-radius: 15px;color: white;font-family: arial;opacity: 0.8;">
                                <li><i class="glyphicon glyphicon-calendar"></i>   Buscar por Fechas</li>
                            </ol>
                            <div class="form-group" >
                                <label>Fecha de Contratacion</label><br>
                                <input type="date"  class="form-control" name="del"  length="45" style="width: 250px" id="del"/>
                            </div>
                            <div class="form-group" >
                                <label>Al</label><br>
                                <input type="date"  class="form-control" name="al" size="45" maxlength="100" style="width: 250px" id="al" />
                                <input type="hidden" name="iddep" value="<%%>">
                                <input type="hidden" class="is_d_ses" value="<%=id_dep%>">
                            </div>
                            <div class="form-group">
                                <label>Fecha Inicio:</label><br>
                                <input type="date" name="fec_i" class="form-control" length="45" style="width: 250px" id="fe_i">
                            </div>
                            <div class="form-group">
                                <label>Fecha Fin :</label><br>
                                <input type="date" name="fec_f" class="form-control" size="45" maxlength="100" style="width: 250px" id="fe_fin">
                            </div>
                            <div class="form-group">
                                <label>Fecha Suscripcion :</label><br>
                                <input type="date" name="fec_f" class="form-control" size="45" maxlength="100" style="width: 250px" id="fe_sus">
                            </div>
                        </div>
                        <div class="col-md-4">
                            <ol class="breadcrumb" style="background: #01579b ;border-radius: 15px;color: white;font-family: arial;opacity: 0.8;">
                                <li><i class="glyphicon glyphicon-briefcase"></i>   Datos de empleo</li>
                            </ol>
                            <%if (id_dep.equals("DPT-0019")) {%>
                            <div class="form-group">  
                                <label>Direccion :</label><br>
                                <select name="direccion" class="form-control selecdireccion" style="width: 250px" id="select_direccion">
                                    <option value="" selected disabled>[Seleccione]</option>
                                    <%for (int i = 0; i < Listar_Direccion.size(); i++) {
                                            Direccion a = new Direccion();
                                            a = (Direccion) Listar_Direccion.get(i);
                                    %>
                                    <option value="<%=a.getId_direccion()%>"><%=a.getNo_direccion()%></option>
                                    <% } %>
                                </select>
                            </div>
                            <div class="form-group" >
                                <label>Departamento :</label><br>
                                <select name="departamento" class="form-control selectdep" id="select_dep" style="width: 250px"> 
                                    <option value="" selected disabled>[Seleccione]</option>
                                </select>
                            </div>
                            <%}%>
                            <%if (!id_dep.trim().equals("DPT-0019")) {%>
                            <div class="form-group">
                                <label>Area :</label><br>
                                <select name="area" class="form-control selectarea" id="select_area" style="width: 250px"> 
                                    <option value="" selected disabled>[Seleccione]</option>
                                    <%for (int i = 0; i < List_Area_ID.size(); i++) {
                                            Area ar = new Area();
                                            ar = (Area) List_Area_ID.get(i);
                                    %>
                                    <option value="<%=ar.getId_area()%>"><%=ar.getNo_area()%></option>
                                    <%}%>
                                </select>
                            </div><%} else {%>
                            <div class="form-group">
                                <label>Area :</label><br>
                                <select name="area" class="form-control selectarea" id="select_area" style="width: 250px"> 
                                    <option value="" selected disabled>[Seleccione]</option>
                                </select>
                            </div><%}%>
                            <div class="form-group" >
                                <label>Seccion :</label><br>
                                <select name="seccion" class="form-control selectsec" id="select_sec" style="width: 250px"> 
                                    <option value="" selected disabled>[Seleccione]</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Puesto :</label><br>
                                <select name="puesto" class="form-control selectpu" id="select_pu" style="width: 250px"> 
                                    <option value="" selected disabled>[Seleccione]</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <ol class="breadcrumb" style="background: #01579b ;border-radius: 15px;color: white;font-family: arial;opacity: 0.8;">
                                <li><i class="glyphicon glyphicon-user"></i>   Datos del Trabajador</li>
                            </ol>
                            <div class="form-group">
                                <label>Persona :</label><br>
                                <div class="input-group">
                                    <div class="input-group-addon"><i class="glyphicon glyphicon-user"></i></div>
                                    <input type="text"  class="form-control" name="nom_ape"   id="ap" placeholder="Nombre y/o los Apellidos">
                                </div>
                            </div>
                            <div class="form-group">
                                <label>Sueldo :</label><br>
                                <div class="input-group">
                                    <div class="input-group-addon">$</div>
                                    <input type="number" name="sueldo" class="form-control" maxlength="10" id="sueldo" value="" placeholder="Ingrese el sueldo">
                                    <div class="input-group-addon">.00</div>
                                </div>
                            </div>
                            <script>
                                function toDouble() {
                                    var a = parseFloat($("#sueldo").val());
                                    alert(a);
                                }
                            </script>
                        </div>
                        <br/>
                        <div class="col-md-12" style="padding: 1% 0;box-sizing: border-box;">
                            <div class="form-group">                            
                                <button type="button" class="btn btn-primary" id="btnbuscar"><i class="glyphicon glyphicon-search"></i>  Buscar</button>
                            </div>
                            <div class="form-group">  
                                <a href="javascript:;"  id="btncancel" class="btn btn-danger" ><i class="glyphicon glyphicon-remove"></i>   Cancelar</a>
                            </div>
                        </div>   
                    </div> 
                    <div class="col-md-12 advice hidden">
                        <div class="alert alert-danger alert-dismissible" role="alert" style="width: 50%;">
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <i class="glyphicon glyphicon-exclamation-sign"></i>   No se encontraron datos en la búsqueda
                        </div>
                    </div>
                    <div class="col-md-12">
                        <center><div class="container conTable" style="width: 95%;">
                            </div></center>
                    </div>
                    <div id="wait" style="display:none;width:69px;height:89px;position:absolute;top:50%;left:50%;padding:2px;" align="center"><img src='../../img/por-favor-espere.gif' width="100" height="100" /><br>Loading..</div>
                </div>
            </center>
        </form>
        <script type="text/javascript" src="../../js/JQuery/jQuery.js"></script>
        <script src="../../ajax/ajax.google.min.js"></script>                 
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
                                    $.post("../../Direccion_Puesto", "opc=" + opc.trim() + "&id=" + id.trim(), function (objJson) {
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

                                    $.post("../../impresion_masiva?opc=filtrar" + "&desde=" + del + "&al=" + al + "&nom_ape=" + nombre + "&direccion=" + dir + "&departamento=" + dep + "&area=" + area + "&seccion=" + sec + "&puesto=" + puesto + "&fec_i=" + fe_i + "&fec_f=" + fe_fi + "&sueldo=" + ca_sueldo + "&fe_sus=" + fe_sus, function (objJson) {
                                        var list = objJson.lista;
                                        if (objJson.rpta == -1) {
                                            return;
                                        }
                                        var nuro = 1;
                                        if (list.length > 0) {
                                            $(".advice").attr("class", "col-md-12 advice hidden");
                                            var b = "";
                                            for (var i = 0; i < list.length; i++) {
                                                nuro = nuro + i;
                                                b += "<tr>";
                                                b += "<td style='font-family:arial;'>" + nuro + "</td>";
                                                b += "<td style='font-family:arial;'>" + list[i].nombre.toUpperCase();
                                                +"</td>";
                                                b += "<td style='font-family:arial;'>" + list[i].fe_de + "</td>";
                                                if (list[i].fe_ha != null) {
                                                    b += "<td style='font-family:arial;'>" + list[i].fe_ha + "</td>";
                                                } else {
                                                    b += "<td style='font-family:arial;'>indefinido</td>";
                                                }
                                                b += "<td style='font-family:arial;'>" + list[i].no_ar + "</td>";
                                                b += "<td style='font-family:arial;'>" + list[i].no_se + "</td>";
                                                b += "<td style='font-family:arial;'>" + list[i].no_pu + "</td>";
                                                b += "<td style='font-family:arial;'>" + list[i].ca_su + '</td>';
                                                b += "<td style='font-family:arial;'>" + list[i].fe_su + "</td>";
                                                b += '<td style="font-family:arial;"><a class="btn btn-success" href="../../contrato?opc=Detalle_Contractual&idtr=' + list[i].id_tr + '"><i class="glyphicon glyphicon-info-sign"></i>   Ver detalle</a> </td>';
                                                if (list[i].id_pl != null) {
                                                    b += '<td style="font-family:arial;"><center><input type="checkbox" class="cprint" id="imp" name="Imprimir" value="' + list[i].id_co + '/' + list[i].id_pl + '"></center></td>';
                                                } else {
                                                    b += '<td style="font-family:arial;"><center>No tiene</center></td>';
                                                }
                                                b += "</tr>";
                                                nuro = 1;
                                            }
                                            var table = createTable();
                                            $(".conTable").empty();
                                            $(".conTable").append(table);
                                            $(".tbodys").empty();
                                            $(".tbodys").append(b);
                                            if (list.length !== 0) {
                                                $("#asa").show();
                                            }
                                            /*$("#btns").click(
                                             function () {
                                             $("#gg :checkbox").attr('checked', true);
                                             $('#imp').is(':checked');
                                             alerta(checkboxValues.push($("#imp").val()));
                                             });*/
                                            /*$("#btns2").click(
                                             function () {
                                             var checkboxValues = new Array();
                                             //recorremos todos los checkbox seleccionados con .each
                                             $('input[name="orderBox[]"]:checked').each(function () {
                                             //$(this).val() es el valor del checkbox correspondiente
                                             checkboxValues.push($(this).val());
                                             alert(checkboxValues.push($(this).val()));
                                             });
                                             });*/
                                        } else {
                                            //mensaje cuando no hay datos
                                            $(".conTable").empty();
                                            $(".advice").attr("class", "col-md-12 advice");
                                        }
                                        $("#wait").css("display", "none");
                                    }
                                    );
                                }
                                function marcado() {
                                    if (document.form.termin.checked) {
                                        document.form.submit();
                                    } else {
                                        alert("Debes aceptar los términos y condiciones");
                                        document.form.termin.focus();
                                        return false;
                                    }

                                }
                                $(document).ready(function () {
                                    /* $.ajax({
                                     data:$("#frm_filtro2").serialize(),
                                     type:"POST",
                                     dataType:"json",
                                     url:"../../Ajax/Ajax_Dgp/Ajax_Dgp_Aut.jsp"
                                     
                                     }
                                     var b=$('#tbodys');
                                     });
                                     */
                                    $("#select_direccion").change(function () {
                                        var opc = 'Listar_dir_dep';
                                        var id = $("#select_direccion").val();
                                        listar_opciones(opc, id);
                                    });
                                    $("#select_dep").change(function () {
                                        var opc = 'Listar_area2';
                                        var id = $("#select_dep").val();
                                        listar_opciones(opc, id);
                                    });
                                    $("#select_area").change(function () {
                                        var opc = 'Listar_sec2';
                                        var id = $("#select_area").val();
                                        listar_opciones(opc, id);
                                    });
                                    $("#select_sec").change(function () {
                                        var opc = 'Listar_pu_id';
                                        var id = $("#select_sec").val();
                                        listar_opciones(opc, id);
                                    });
                                    $("#seleccionar_pl").hide();
                                    $("#asa").hide();
                                    $("#btnbuscar").click(
                                            function () {
                                                var del = $("#del").val();
                                                var al = $("#al").val();
                                                var nombre = $("#ap").val();
                                                var dir;
                                                var dep;
                                                var deps = $(".is_d_ses").val();
                                                if (deps.trim() == 'DPT-0019') {
                                                    dir = $("#select_direccion").val();
                                                    dep = $("#select_dep").val();
                                                } else {
                                                    dir = '';
                                                    dep = '';
                                                }
                                                var area = $("#select_area").val();
                                                var sec = $("#select_sec").val();
                                                var pu = $("#select_pu").val();
                                                var fe_i = $("#fe_i").val();
                                                var fe_f = $("#fe_fin").val();
                                                var sueldo = $("#sueldo").val();
                                                var fe_sus = $("#fe_sus").val();
                                                $("#wait").css("display", "block");
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
                                            function () {
                                                $(".conTable").empty();
                                                /*document.formulario.reset();
                                                 html = '<tr><td colspan="8" align="center">Haga la busqueda por algunos de los filtros...</td></tr>'
                                                 $(".tbodys").html(html);*/
                                            }

                                    );
                                    $(".validarform").submit(function () {
                                        var check = $("input[type='checkbox']:checked").length;
                                        var radio = $("input[type='radio']:checked").length;
                                        var select = $("select option:selected").val();
                                        if (check == "") {
                                                alert("seleccione un contrato");
                                                return false;
                                        }
                                    });
                                });
                                function createTable() {
                                    var t = '<table id="data"  class="table table-striped table-hover table-responsive">';
                                    t += '<thead class="tab_cabe" style="box-shadow: 0 0 20px 0 black;">';
                                    t += '<tr class="tr" >';
                                    t += '<th style="width:3%;"><center><h6>N°  </h6></center></th>';
                                    t += '<th><center><h6 title="NOM_APE"><i class="glyphicon glyphicon-user"></i>   Nombres y Apellidos</h6></center></th>';
                                    t += '<th><center><h6 title="FEC_DESDE"><i class="glyphicon glyphicon-calendar"></i>   Fecha Desde</h6></center></th>';
                                    t += '<th><center><h6 title="FEC_HASTA"><i class="glyphicon glyphicon-calendar"></i>   Fecha Hasta</h6></center></th>';
                                    t += '<th><center><h6 title="AREA"><i class="glyphicon glyphicon-record"></i>   Area</h6></center></th>';
                                    t += '<th><center><h6 title="SECCION"><i class="glyphicon glyphicon-adjust"></i>   Sección</h6></center></th>';
                                    t += '<th><center><h6 title="PUESTO"><i class="glyphicon glyphicon-briefcase"></i>   Puesto</h6></center></th>';
                                    t += '<th><center><h6 title="SUELDO"><i class="glyphicon glyphicon-usd"></i>   Sueldo</h6></center></th>';
                                    t += '<th><center><h6 title="FECHA_CREACION"><i class="glyphicon glyphicon-calendar"></i>   Fecha de Contratación</h6></center></th>';
                                    t += '<th><center><h6 ><i class="glyphicon glyphicon-info-sign"></i>   Opcion</h6></center></th>';
                                    t += '<th style="width:7%;"><button type="button" class="btn btn-warning" id="btns" onclick="select_all()"><i class="glyphicon glyphicon-check"></i></button>';
                                    t += '<button type="submit" name="opc" class="btn btn-info" id="asa" value="Imprimir" style="margin-left: 1%;"><i class="glyphicon glyphicon-print"></i></button></th>';
                                    t += '</tr>';
                                    t += '</thead>';
                                    t += '<tbody class="tbodys" id="gg" style="box-shadow: 0 0 10px 0 black;">';
                                    t += '</tbody>';
                                    t += '</table>';
                                    return t;
                                }
                                function select_all() {
                                    $(".cprint").attr('checked', true);
                                }



        </script>
    </body>
</html>

<%        }%>
<%} else {
        out.print("<script> window.parent.location.href = '/TALENTO_HUMANO/';</script>");
    }


%>
