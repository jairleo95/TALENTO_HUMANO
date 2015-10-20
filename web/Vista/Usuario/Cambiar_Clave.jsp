<%    HttpSession sesion = request.getSession();
    String id_user = (String) sesion.getAttribute("IDUSER");
    if (id_user != null) {
%>

<%@page import="pe.edu.upeu.application.model.Usuario"%>
<jsp:useBean id="List_ID_User" scope="session" class="java.util.ArrayList"/>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <meta charset="windows-1252">
        <title></title>
        <script type="text/javascript" src="../../js/JQuery/jQuery.js" ></script>
        <style type="text/css">
            .contenedor{
                margin-left: 1%;
                width: 98%;
            }
        </style>
        <script>
            $(document).ready(function() {
                pageSetUp();
                var $validator = $("#wizard-2").validate({
                    rules: {
                        email: {
                            required: true,
                            email: "Your email address must be in the format of name@domain.com"
                        },
                        passwordNew1: {
                            required: true


                        },
                        passwordNew2: {
                            required: true,
                            equalTo: ".confirmPWD"

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
                    highlight: function(element) {
                        $(element).closest('.form-group').removeClass('state-success').addClass('state-error');
                    },
                    unhighlight: function(element) {
                        $(element).closest('.form-group').removeClass('state-error').addClass('state-success');
                    },
                    errorElement: 'span',
                    errorClass: 'help-block',
                    errorPlacement: function(error, element) {
                        if (element.parent('.input-group').length) {
                            error.insertAfter(element.parent());
                        } else {
                            error.insertAfter(element);
                        }
                    }
                });
                $(".cambiarC").click(function(e) {
                    $.SmartMessageBox({
                        title: "Cambiar Clave!",
                        content: "¿Esta seguro de cambiar la clave de este usuario? ",
                        buttons: '[No][Si]'
                    }, function(ButtonPressed) {
                        if (ButtonPressed === "Si") {

                            $("#wizard-2").submit();
                        }
                        if (ButtonPressed === "No") {
                            return false;
                        }

                    });
                    e.preventDefault();
                });
            });

        </script>
    </head>
    <body>
        <div class="row">
            <center>
                <h1>Mantenimiento a Usuarios de  Personal</h1>
                <hr>
            </center>
            <div class="contenedor">
                <article class="col-sm-12">
                    <div id="wid-id-0" class="jarviswidget" role="widget">
                        <div>
                            <div class="jarviswidget-editbox">
                            </div>
                            <div class="widget-body no-padding ">
                                <form class="smart-form" id="wizard-2" novalidate="novalidate" method="post" action="../../Usuario?opc=Modificar_clave_2">
                                    <%for (int i = 0; i < List_ID_User.size(); i++) {
                                            Usuario u = new Usuario();
                                            u = (Usuario) List_ID_User.get(i);
                                    %>
                                    <fieldset>
                                        <h2>Cambiar Clave</h2>
                                    </fieldset>
                                    <fieldset>
                                        <section class="col col-3 ">
                                            <label class="label">Usuario:</label>
                                            <label class="input state-disabled">
                                                <input type="text"  disabled="" value="<%=u.getNo_usuario().trim()%>">
                                            </label>
                                        </section>
                                        <section class="col col-3">
                                            <label class="label">Clave Antigua:</label>
                                            <label class="input state-disabled">
                                                <input type="text" disabled="" name="pw_an" value="<%=u.getPw_usuario().trim()%>">
                                            </label>
                                        </section>
                                        <section class="col col-3 clNueva form-group">
                                            <label class="label">Clave Nueva:</label>
                                            <label class="input nueva1 input-group">
                                                <input class="form-control input-group-sm confirmPWD "type="password" name="passwordNew1" id="cl_nueva " required="">
                                            </label>
                                        </section>
                                        <section class="col col-3 clRepetida form-group">
                                            <label class="label">Repita la Clave Nueva:</label>
                                            <label class="input nueva2 input-group">
                                                <input class="form-control input-group-sm" type="password" name="passwordNew2" id="cl_repetido" required="">
                                            </label>
                                        </section>
                                    </fieldset>
                                    <footer>
                                        <input type="hidden" name="No_Usuario" value="<%=u.getNo_usuario().trim()%>">
                                        <input type="hidden" name="iduser" value="<%=u.getId_usuario()%>">
                                        <input type="submit" class="btn btn-primary btn-sm cambiarC" value="Cambiar Clave" >
                                        <input  class="btn btn-default btn-sm" onclick="window.history.back();" value="Atras">
                                    </footer>
                                    <%}%>
                                </form>
                            </div>
                        </div>
                    </div>
                </article>
            </div>
        </div>
    </body>
</html>
<%@include file="List_Usuario.jsp" %>

<%} else {
        out.print("<script> window.parent.location.href = '/TALENTO_HUMANO/';</script>");
    }
%>