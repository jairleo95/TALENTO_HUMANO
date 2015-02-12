<%@page import="pe.edu.upeu.application.model.Ub_Distrito"%>
<%@page import="pe.edu.upeu.application.model.Ub_Provincia"%>
<%@page import="pe.edu.upeu.application.model.V_Ficha_Trab_Num_C"%>
<%@page import="pe.edu.upeu.application.dao.ListaDAO"%>
<%@page import="pe.edu.upeu.application.dao_imp.InterfaceListaDAO"%>
<%@page import="pe.edu.upeu.application.model.V_Var_Usuario"%>
<%@page import="pe.edu.upeu.application.model.V_Usuario"%>
<%@page import="pe.edu.upeu.application.model.Via"%>
<%@page import="pe.edu.upeu.application.model.Zona"%>
<%@page import="pe.edu.upeu.application.model.Ub_Departamento"%>
<%@page import="pe.edu.upeu.application.model.V_Ubigeo"%>
<%@page import="pe.edu.upeu.application.model.Nacionalidad"%>
<%
    HttpSession sesion = request.getSession(true);
    String iddep = (String) sesion.getAttribute("DEPARTAMENTO_ID");
    String iduser = (String) sesion.getAttribute("IDUSER");

%>
<jsp:useBean id="Lista_Usuarios" scope="application" class="java.util.ArrayList" />
<jsp:useBean id="List_Nacionalidad" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="List_Departamento" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="Listar_zona" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="Listar_via" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="ListaridTrabajador" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="List_Provincia" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="List_Distrito" scope="application" class="java.util.ArrayList"/>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/Css_Bootstrap/bootstrap-responsive">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/font-awesome.min.css">


        <title>JSP Page</title>
        <style type="text/css">
            *{
                margin: 0 auto;
            }
            #caja{
                width: 900px;
            }
        </style>


    </head>
    <body>
        <% for (int o = 0; o < Lista_Usuarios.size(); o++) {
                V_Usuario vu = new V_Usuario();
                vu = (V_Usuario) Lista_Usuarios.get(o);%>

        <div id="caja">
            <h3>-Modificar Perfil Usuario</h3>
            <hr>

            <form class="form" name="formName" action="../../Usuario"  method="post">
                <div class="row">
                    <div class="col-sm-3">
                        <div class="form-group">
                            <label for="exampleInputEmail1">Usuario:</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-map-marker fa-lg fa-fw"></i></span>
                                <input type="text" class="form-control input-group-sm" value="<%=vu.getNo_usuario()%>"  required autofocus="" name="NOMBRE_USUARIO" id="DOM_A_D2" maxlength="15">

                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="form-group">
                            <label for="exampleInputEmail1">Clave Actual:</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-map-marker fa-lg fa-fw"></i></span>
                                <input id="epasswordActual" type="password" class="form-control input-group-sm" value="<%=vu.getPw_usuario().trim()%>" required autofocus="" placeholder="clave actual"  name="passwordActual" maxlength="24">
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="form-group">
                            <label for="exampleInputEmail1">Clave nueva:</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-map-marker fa-lg fa-fw"></i></span>
                                <input id="epasswordNew1" type="password" class="form-control input-group-sm"  required autofocus="" placeholder=" clave nueva"  name="passwordNew1"  maxlength="24">
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="form-group">
                            <label for="exampleInputEmail1">Confirme la clave Nueva:</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-map-marker fa-lg fa-fw"></i></span>
                                <input type="password" class="form-control input-group-sm" required autofocus="" placeholder="confirmar clave " name="passwordNew2" id="DOM_A_D2" maxlength="24">
                            </div>
                        </div>
                    </div>


                    <div class="col-sm-3">
                        <div class="form-group">
                            <label for="exampleInputEmail1">telefono:</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-map-marker fa-lg fa-fw"></i></span>
                                <input class="form-control input-group-sm"    placeholder="" type="text" name="TEL_USUARIO" id="DOM_A_D2" data-mask="(99) 999-999" maxlength="8" value="<%=vu.getTe_trabajador().trim()%> ">

                            </div>
                        </div>
                    </div>

                    <div class="col-sm-3">
                        <div class="form-group">
                            <label for="exampleInputEmail1">Celular:</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-map-marker fa-lg fa-fw"></i></span>
                                <input class="form-control input-group-sm"    placeholder="" type="text" name="CEL_USUARIO" id="DOM_A_D2" data-mask="(99) 999-9999" maxlength="9" value="<%=vu.getCl_tra().trim()%> ">

                            </div>
                        </div>
                    </div>

                    <div class="col-sm-5">
                        <div class="form-group">
                            <label for="exampleInputEmail1">correo:</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-map-marker fa-lg fa-fw"></i></span>
                                <input class="form-control input-group-sm"    placeholder="" type="text" name="CORREO_USAURIO" id="DOM_A_REFAA" maxlength="30" value="<%=vu.getDi_correo_personal().trim()%> " >

                            </div>
                        </div>
                    </div> 
                </div> 


                <script type="text/javascript">
                    $(document).ready(
                            function () {
                                var tip = $("#pro_dir_l");
                                tip.empty();
                                var rg = $("#dep_dir_l").val();
                                var data = "id_dep=" + rg + "&opc=dep_nac";
                                tip.append('<option value="">Cargando...</option>').val('');
                                $.post("../../ubigeo", data, function (objJson) {
                                    tip.empty();
                                    if (objJson.rpta == -1) {
                                        alert(objJson.mensaje);
                                        return;
                                    }
                                    var lista = objJson.lista;
                                    if (lista.length > 0) {
                                        tip.append("<option value=''>[Seleccione]</option>");
                                    } else {
                                        tip.append("<option value=''>[]</option>");
                                    }
                                    for (var i = 0; i < lista.length; i++) {
                                        var item = "<option value='" + lista[i].id + "'>" + lista[i].descripcion + "</option>";
                                        tip.append(item);
                                    }
                                });
                                var ti = $("#DOM_LEG_DISTRITO");
                                ti.empty();
                                var rg = $("#pro_dir_l").val();
                                var data = "id_dist=" + rg + "&opc=pro_nac";
                                ti.append('<option value="">Cargando...</option>').val('');
                                $.post("../../ubigeo", data, function (objJson) {
                                    ti.empty();
                                    if (objJson.rpta == -1) {
                                        alert(objJson.mensaje);
                                        return;
                                    }
                                    var lista = objJson.lista;
                                    if (lista.length > 0) {
                                        ti.append("<option value=''>[Seleccione]</option>");
                                    } else {
                                        ti.append("<option value=''>[]</option>");
                                    }
                                    for (var i = 0; i < lista.length; i++) {
                                        var item = "<option value='" + lista[i].id + "'>" + lista[i].descripcion + "</option>";
                                        ti.append(item);
                                    }
                                });

                                $(".doc, .doc_c").attr("maxlength", "8");
                                $(".doc, .doc_c").attr("minlength", "8");
                                $(".doc, .doc_c").val("");

                                $("#nac").change(
                                        function () {
                                            if ($("#nac").val() != "NAC-0193") {
                                                $("#dist").hide();
                                                $("#dist_nac").val("DST-001832");


                                            }
                                            if ($("#nac").val() == "NAC-0193") {

                                                $("#dist").show();
                                            }
                                        }
                                );






                            }
                    );
                </script> <br>

                <h3>-Domicilio Actual del usuario</h3>
                <label>Direccion :</label>
                <div class="row">

                    <div class="col-sm-3">

                        <div class="form-group">

                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-map-marker fa-lg fa-fw"></i></span>
                                <select name="DIR_DOM_A_D1_ID" id="DOM_A_D1" class="form-control input-group-sm"  required="">
                                    <option value="">[Seleccione Via]</option>
                                    <%for (int i = 0; i < Listar_via.size(); i++) {
                                            Via zo = new Via();
                                            zo = (Via) Listar_via.get(i);%> 
                                    <% if (zo.getId_via().trim().equals(vu.getLi_di_dom_a_d1().trim())) {%>
                                    <option value="<%=zo.getId_via()%>" selected=""><%=zo.getDe_via()%></option>
                                    <%} else {%>

                                    <option value="<%=zo.getId_via()%>"><%=zo.getDe_via()%></option>
                                    <%}%>
                                    <%}%>
                                </select>

                            </div>

                        </div>
                    </div>


                    <div class="col-sm-3">
                        <div class="form-group">

                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-map-marker fa-lg fa-fw"></i></span>
                                <input class="form-control input-group-sm" required autofocus="" value="<%=vu.getDi_dom_a_d2().trim()%>"   placeholder="---" type="text" name="DIR_DOM_A_D2" id="DOM_A_D2" maxlength="100">

                            </div>
                        </div>
                    </div>
                    <script>
                        $(document).ready(
                                function () {
                                    $("#DOM_A_D3").change(
                                            function () {
                                                if ($("#DOM_A_D3").val() == "3") {
                                                    $("#DOM_A_D4").val("Sin Numero");
                                                } else {

                                                    $("#DOM_A_D4").val("");
                                                }

                                            }
                                    );
                                    $("#DOM_LEG_D3").change(
                                            function () {
                                                if ($("#DOM_LEG_D3").val() == "3") {
                                                    $("#DOM_LEG_D4").val("Sin Numero");
                                                } else {

                                                    $("#DOM_LEG_D4").val("");
                                                }

                                            }
                                    );
                                    $("#reli").change(
                                            function () {
                                                if ($("#reli").val() == "1") {
                                                    $("#igle").attr("required", "required")
                                                } else {

                                                    $("#igle").removeAttr("required");
                                                }

                                            }
                                    );

                                });

                    </script>
                    <div class="col-sm-3">

                        <div class="form-group">

                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-map-marker fa-lg fa-fw"></i></span>
                                <select name="DIR_DOM_A_D3_ID" id="DOM_A_D3" class="form-control input-group-sm"  required="">
                                    <option value="">[Seleccione]</option>
                                    <%if (vu.getLi_di_dom_a_d3().trim().equals("1")) {%>
                                    <option value="1" selected="">Numero</option>
                                    <option value="2">Lote</option>
                                    <option value="3">S/N</option>
                                    <option value="4">Km</option>
                                    <option value="5">Block</option>
                                    <option value="6">Etapa</option>
                                    <option value="7">Departamento</option>
                                    <option value="8">Interior</option>
                                    <%}
                                        if (vu.getLi_di_dom_a_d3().trim().equals("2")) {%>
                                    <option value="1">Número</option>
                                    <option value="2" selected="">Lote</option>
                                    <option value="3">S/N</option>
                                    <option value="4">Km</option>
                                    <option value="5">Block</option>
                                    <option value="6">Etapa</option>
                                    <option value="7">Departamento</option>
                                    <option value="8">Interior</option>
                                    <%}
                                        if (vu.getLi_di_dom_a_d3().trim().equals("3")) {%>
                                    <option value="1">Número</option>
                                    <option value="2" >Lote</option>
                                    <option value="3" selected="">S/N</option>
                                    <option value="4">Km</option>
                                    <option value="5">Block</option>
                                    <option value="6">Etapa</option>
                                    <option value="7">Departamento</option>
                                    <option value="8">Interior</option>
                                    <%}
                                        if (vu.getLi_di_dom_a_d3().trim().endsWith("4")) {%>
                                    <option value="1">Número</option>
                                    <option value="2">Lote</option>
                                    <option value="3">S/N</option>
                                    <option value="4" selected="">Km</option>
                                    <option value="5">Block</option>
                                    <option value="6">Etapa</option>
                                    <option value="7">Departamento</option>
                                    <option value="8">Interior</option>
                                    <%}
                                        if (vu.getLi_di_dom_a_d3().trim().endsWith("5")) {%>
                                    <option value="1">Número</option>
                                    <option value="2">Lote</option>
                                    <option value="3">S/N</option>
                                    <option value="4" >Km</option>
                                    <option value="5" selected="">Block</option>
                                    <option value="6">Etapa</option>
                                    <option value="7">Departamento</option>
                                    <option value="8">Interior</option>
                                    <%}
                                        if (vu.getLi_di_dom_a_d3().trim().endsWith("6")) {%>
                                    <option value="1">Número</option>
                                    <option value="2">Lote</option>
                                    <option value="3">S/N</option>
                                    <option value="4">Km</option>
                                    <option value="5">Block</option>
                                    <option value="6" selected="">Etapa</option>
                                    <option value="7">Departamento</option>
                                    <option value="8">Interior</option>
                                    <%}
                                        if (vu.getLi_di_dom_a_d3().trim().endsWith("7")) {%>
                                    <option value="1">Número</option>
                                    <option value="2">Lote</option>
                                    <option value="3">S/N</option>
                                    <option value="4">Km</option>
                                    <option value="5">Block</option>
                                    <option value="6">Etapa</option>
                                    <option value="7" selected="">Departamento</option>
                                    <option value="8">Interior</option>
                                    <%}
                                        if (vu.getLi_di_dom_a_d3().trim().endsWith("8")) {%>
                                    <option value="1">Número</option>
                                    <option value="2">Lote</option>
                                    <option value="3">S/N</option>
                                    <option value="4">Km</option>
                                    <option value="5">Block</option>
                                    <option value="6">Etapa</option>
                                    <option value="7">Departamento</option>
                                    <option value="8" selected="">Interior</option>
                                    <%}%>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="form-group">

                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-map-marker fa-lg fa-fw"></i></span>
                                <input class="form-control input-group-sm"  required autofocus="" value="<%=vu.getDi_dom_a_d4().trim()%>"  placeholder="---" type="text" name="DIR_DOM_A_D4" id="DOM_A_D4" maxlength="50">

                            </div>
                        </div>
                    </div>

                </div>
                <div class="row">
                    <div class="col-sm-4">

                        <div class="form-group">

                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-map-marker fa-lg fa-fw"></i></span>
                                <select name="DIR_DOM_A_D5_ID" id="DOM_A_D5" class="form-control input-group-sm" required="">

                                    <option value="">[Seleccione Zona]</option>
                                    <%for (int i = 0; i < Listar_zona.size(); i++) {
                                            Zona zo = new Zona();
                                            zo = (Zona) Listar_zona.get(i);%> 
                                    <% if (zo.getId_zona().trim().equals(vu.getLi_di_dom_a_d1().trim())) {%>
                                    <option value="<%=zo.getId_zona()%>" selected=""><%=zo.getDe_zona()%></option>
                                    <%} else {%>

                                    <option value="<%=zo.getId_zona()%>" ><%=zo.getDe_zona()%></option>
                                    <%}%>
                                    <%}%>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="form-group">

                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-map-marker fa-lg fa-fw"></i></span>
                                <input class="form-control input-group-sm"  required autofocus="" value="<%=vu.getDi_dom_a_d6().trim()%>"  placeholder="---" type="text" name="DIR_DOM_A_D6" id="DOM_A_D6" maxlength="50">

                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="form-group">

                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-map-marker fa-lg fa-fw"></i></span>
                                <input class="form-control input-group-sm"  required autofocus="" value="<%=vu.getDi_dom_a_ref().trim()%>"   placeholder="Referencia" type="text" name="DIR_DOM_A_REF" id="DOM_A_REF" maxlength="50">
                            </div>
                        </div>
                    </div>

                </div>

                <div class="row">
                    <div class="col-sm-3">

                        <div class="form-group">

                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-map-marker fa-lg fa-fw"></i></span>

                                <select  id="dep_dir_a" class="form-control input-group-sm"  required="" name="ID_DEPARTAMENTO">
                                    <option value="" selected="selected">[Departamento]</option>
                                    <%for (int d = 0; d < List_Departamento.size(); d++) {
                                            Ub_Departamento dep = new Ub_Departamento();
                                            dep = (Ub_Departamento) List_Departamento.get(d);
                                            if (dep.getId_departamento().trim().equals(vu.getId_departamento_ub().trim())) {
                                    %>
                                    <option value="<%=dep.getId_departamento()%>" selected=""><%=dep.getNo_departamento()%></option>
                                    <%} else {%>
                                    <option value="<%=dep.getId_departamento()%>" ><%=dep.getNo_departamento()%></option>
                                    <%}
                                        }%>

                                </select>

                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3">

                        <div class="form-group">

                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-map-marker fa-lg fa-fw"></i></span>
                                <select  id="pro_dir_a" class="form-control input-group-sm"  required="" name="ID_PROVINCIA">
                                    <option value="" selected="">[Provincia]</option>
                                    <%for (int j = 0; j < List_Provincia.size(); j++) {
                                            Ub_Provincia pro = new Ub_Provincia();
                                            pro = (Ub_Provincia) List_Provincia.get(j);
                                            if (pro.getId_provincia().trim().equals(vu.getId_provincia_ub().trim())) {%>
                                    <option value="<%=pro.getId_provincia()%>" selected=""><%=pro.getNo_provincia()%></option>
                                    <%} else {%>
                                    <option value="<%=pro.getId_provincia()%>" ><%=pro.getNo_provincia()%></option>
                                    <%}
                                        }%>


                                </select>


                            </div>
                        </div>
                    </div>

                    <div class="col-sm-3">

                        <div class="form-group">

                            <div class="input-group">

                                <span class="input-group-addon"><i class="fa fa-map-marker fa-lg fa-fw"></i></span>
                                <select name="DIR_DOM_A_DISTRITO_ID"  id="DOM_A_DISTRITO" class="form-control input-group-sm"   required="" >
                                    <option value="">[Distrito]</option>
                                    <%for (int q = 0; q < List_Distrito.size(); q++) {
                                            V_Ubigeo ub_d = new V_Ubigeo();
                                            ub_d = (V_Ubigeo) List_Distrito.get(q);
                                            if (ub_d.getId_distrito().trim().equals(vu.getId_distrito_ub().trim())) {
                                    %>

                                    <option value="<%=ub_d.getId_distrito()%>" selected=""><%=ub_d.getNo_distrito()%></option>
                                    <%} else {%>
                                    <option value="<%=ub_d.getId_distrito()%>" ><%=ub_d.getNo_distrito()%></option>
                                    <%}
                                        }%>
                                </select>
                            </div>
                        </div>
                    </div>
                    <!--<button onclick="duplicar();
                            return false;"  class="btn btn-primary" id="btn-duplicar">Duplicar</button>-->

                </div><br>
                <input type="text" value="<%=vu.getId_trabajador().trim()%>" name="ID_TR"/>
                <input type="text" value="<%=vu.getId_usuario().trim()%>" name="idus" />
                <input type="hidden" value="opc" name="editar_Perfil" />
                <input type="Submit" name="opc" class="btn btn-primary" id="idus" value="Modificar" >
                <input type="Submit" name="Nuevo" class="btn btn-primary" value="Nuevo" >

                <h2>...</h2>
                <%}%>


            </form>

        </div>


        <!-- Link to Google CDN's jQuery + jQueryUI; fall back to local -->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
        <script>
                        if (!window.jQuery) {
                            document.write('<script src="../../js/libs/jquery-2.0.2.min.js"><\/script>');
                        }
        </script>

        <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
        <script>
                        if (!window.jQuery.ui) {
                            document.write('<script src="../../js/libs/jquery-ui-1.10.3.min.js"><\/script>');
                        }
        </script>
        <script type="text/javascript">

            // DO NOT REMOVE : GLOBAL FUNCTIONS!

            $(document).ready(function () {
                alert()
                pageSetUp();




                var $validator = $("#wizard-1").validate({
                    rules: {
                        email: {
                            required: true,
                            email: "Your email address must be in the format of name@domain.com"
                        }


                    },
                    messages: {
                        fname: "Please specify your First name",
                        lname: "Please specify your Last name",
                        email: {
                            required: "We need your email address to contact you",
                            email: "Your email address must be in the format of name@domain.com"
                        }
                    },
                    highlight: function (element) {
                        $(element).closest('.form-group').removeClass('has-success').addClass('has-error');
                    },
                    unhighlight: function (element) {
                        $(element).closest('.form-group').removeClass('has-error').addClass('has-success');
                    },
                    errorElement: 'span',
                    errorClass: 'help-block',
                    errorPlacement: function (error, element) {
                        if (element.parent('.input-group').length) {
                            error.insertAfter(element.parent());
                        } else {
                            error.insertAfter(element);
                        }
                    }
                });


                $('#bootstrap-wizard-1').bootstrapWizard({
                    'tabClass': 'form-wizard',
                    'onNext': function (tab, navigation, index) {
                        var $valid = $("#wizard-1").valid();
                        if (!$valid) {
                            $validator.focusInvalid();
                            return false;
                        } else {
                            $('#bootstrap-wizard-1').find('.form-wizard').children('li').eq(index - 1).addClass(
                                    'complete');
                            $('#bootstrap-wizard-1').find('.form-wizard').children('li').eq(index - 1).find('.step')
                                    .html('<i class="fa fa-check"></i>');
                        }
                    }
                });


                // fuelux wizard
                var wizard = $('.wizard').wizard();

                wizard.on('finished', function (e, data) {
                    //$("#fuelux-wizard").submit();
                    //console.log("submitted!");
                    $.smallBox({
                        title: "Congratulations! Your form was submitted",
                        content: "<i class='fa fa-clock-o'></i> <i>1 seconds ago...</i>",
                        color: "#5F895F",
                        iconSmall: "fa fa-check bounce animated",
                        timeout: 4000
                    });

                });


            })

        </script>



        <script type="text/javascript">
            var _gaq = _gaq || [];
            _gaq.push(['_setAccount', 'UA-XXXXXXXX-X']);
            _gaq.push(['_trackPageview']);

            (function () {
                var ga = document.createElement('script');
                ga.type = 'text/javascript';
                ga.async = true;
                ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
                var s = document.getElementsByTagName('script')[0];
                s.parentNode.insertBefore(ga, s);
            })();

        </script>

        <!--Solo numeros -->



        <!--Select dinamicos-->
        <script type="text/javascript">
            /*Ubigeo*/
            $("#dep_nac").change(function () {
                var ti = $("#pro_nac");
                ti.empty();
                var rg = $("#dep_nac").val();
                var data = "id_dep=" + rg + "&opc=dep_nac";
                ti.append('<option value="">Cargando...</option>').val('');
                $.post("../../ubigeo", data, function (objJson) {
                    ti.empty();
                    if (objJson.rpta == -1) {
                        alert(objJson.mensaje);
                        return;
                    }
                    var lista = objJson.lista;
                    if (lista.length > 0) {
                        ti.append("<option value=''>[Seleccione]</option>");
                    } else {
                        ti.append("<option value=''>[]</option>");
                    }
                    for (var i = 0; i < lista.length; i++) {
                        var item = "<option value='" + lista[i].id + "'>" + lista[i].descripcion + "</option>";
                        ti.append(item);
                    }
                });
            });
            $("#pro_nac").change(function () {
                var ti = $("#dist_nac");
                ti.empty();
                var rg = $("#pro_nac").val();
                var data = "id_dist=" + rg + "&opc=pro_nac";
                ti.append('<option value="">Cargando...</option>').val('');
                $.post("../../ubigeo", data, function (objJson) {
                    ti.empty();
                    if (objJson.rpta == -1) {
                        alert(objJson.mensaje);
                        return;
                    }
                    var lista = objJson.lista;
                    if (lista.length > 0) {
                        ti.append("<option value=''>[Seleccione]</option>");
                    } else {
                        ti.append("<option value=''>[]</option>");
                    }
                    for (var i = 0; i < lista.length; i++) {
                        var item = "<option value='" + lista[i].id + "'>" + lista[i].descripcion + "</option>";
                        ti.append(item);
                    }
                });
            });
            $("#dep_dir_a").change(function () {
                var ti = $("#pro_dir_a");
                ti.empty();
                var rg = $("#dep_dir_a").val();
                var data = "id_dep=" + rg + "&opc=dep_nac";
                ti.append('<option value="">Cargando...</option>').val('');
                $.post("../../ubigeo", data, function (objJson) {
                    ti.empty();
                    if (objJson.rpta == -1) {
                        alert(objJson.mensaje);
                        return;
                    }
                    var lista = objJson.lista;
                    if (lista.length > 0) {
                        ti.append("<option value=''>[Seleccione]</option>");
                        for (var i = 0; i < lista.length; i++) {
                            var item = "<option value='" + lista[i].id + "'>" + lista[i].descripcion + "</option>";
                            ti.append(item);
                        }
                    } else {
                        ti.append("<option value=''>[]</option>");
                    }

                });
            });
            $("#pro_dir_a").change(function () {
                var ti = $("#DOM_A_DISTRITO");
                ti.empty();
                var rg = $("#pro_dir_a").val();
                var data = "id_dist=" + rg + "&opc=pro_nac";
                ti.append('<option value="">Cargando...</option>').val('');
                $.post("../../ubigeo", data, function (objJson) {
                    ti.empty();
                    if (objJson.rpta == -1) {
                        alert(objJson.mensaje);
                        return;
                    }
                    var lista = objJson.lista;
                    if (lista.length > 0) {
                        ti.append("<option value=''>[Seleccione]</option>");
                    } else {
                        ti.append("<option value=''>[]</option>");
                    }
                    for (var i = 0; i < lista.length; i++) {
                        var item = "<option value='" + lista[i].id + "'>" + lista[i].descripcion + "</option>";
                        ti.append(item);
                    }
                });
            });
            $("#dep_dir_l").change(function () {
                var ti = $("#pro_dir_l");
                ti.empty();
                var rg = $("#dep_dir_l").val();
                var data = "id_dep=" + rg + "&opc=dep_nac";
                ti.append('<option value="">Cargando...</option>').val('');
                $.post("../../ubigeo", data, function (objJson) {
                    ti.empty();
                    if (objJson.rpta == -1) {
                        alert(objJson.mensaje);
                        return;
                    }
                    var lista = objJson.lista;
                    if (lista.length > 0) {
                        ti.append("<option value=''>[Seleccione]</option>");
                    } else {
                        ti.append("<option value=''>[]</option>");
                    }
                    for (var i = 0; i < lista.length; i++) {
                        var item = "<option value='" + lista[i].id + "'>" + lista[i].descripcion + "</option>";
                        ti.append(item);
                    }
                });
            });
            $("#pro_dir_l").change(function () {
                var ti = $("#DOM_LEG_DISTRITO");
                ti.empty();
                var rg = $("#pro_dir_l").val();
                var data = "id_dist=" + rg + "&opc=pro_nac";
                ti.append('<option value="">Cargando...</option>').val('');
                $.post("../../ubigeo", data, function (objJson) {
                    ti.empty();
                    if (objJson.rpta == -1) {
                        alert(objJson.mensaje);
                        return;
                    }
                    var lista = objJson.lista;
                    if (lista.length > 0) {
                        ti.append("<option value=''>[Seleccione]</option>");
                    } else {
                        ti.append("<option value=''>[]</option>");
                    }
                    for (var i = 0; i < lista.length; i++) {
                        var item = "<option value='" + lista[i].id + "'>" + lista[i].descripcion + "</option>";
                        ti.append(item);
                    }
                });
            });

        </script>

    </body>
</html>
