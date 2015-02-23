<%    HttpSession sesion = request.getSession();
    String id_user = (String) sesion.getAttribute("IDUSER");
    if (id_user != null) {
%>

<%@page import="pe.edu.upeu.application.model.Usuario"%>
<jsp:useBean id="List_ID_User" scope="application" class="java.util.ArrayList"/>
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
               /* var x,y=false;
                $('.cambiarC').click(function(){
                    if(validar()==true){
                        $.post("../../Usuario","opc=Modificar_clave_2&iduser="+$('.iduser').val()+"&No_Usuario="+$('.No_Usuario').val()+"&cl_nu_re="+$('#cl_repetido').val() ,function(){
                            
                        });
                    }else{
                        $('#cl_nueva').val("");
                        $('#cl_repetido').val("");
                    }
                });
                function validar(){
                    if(x==true &&y==true){
                        return true;
                    }else{
                        return false;
                    }
                };
                $('#cl_nueva').change(function() {
                    $('.nueva1').addClass('state-success');
                    $('.msgn').empty();
                    x=true;
                });
                $('#cl_repetido').change(function() {
                    if ($('#cl_nueva').val() != "") {
                        if ($(this).val() == $('#cl_nueva').val()) {
                            $('.nueva2').addClass('state-success');
                            $('.msgr').empty();
                            y=true;
                        } else {
                            $('.nueva2').removeClass('state-success');
                            $('.nueva2').addClass('state-error');
                            $('.msgr').text('Las contraseñas no coinciden !');
                            y=false;
                        }

                    } else {
                        $('.nueva1').removeClass('state-success');
                        $('.nueva1').addClass('state-error');
                        $('.msgn').text('Escribir nueva contraseña !');
                        x=false;
                    }
                });*/
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
                                <form class="smart-form">
                                    <%for (int i = 0; i < List_ID_User.size(); i++) {
                                            Usuario u = new Usuario();
                                            u = (Usuario) List_ID_User.get(i);
                                    %>
                                    <fieldset>
                                        <h2>Cambiar Clave</h2>
                                    </fieldset>
                                    <fieldset>
                                        <section class="col col-3">
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
                                        <section class="col col-3 clNueva">
                                            <label class="label">Clave Nueva:</label>
                                            <label class="input nueva1">
                                                <input type="password" name="cl_nu" id="cl_nueva" required="">
                                            </label>
                                            <div class="msgn note note-error"></div>
                                        </section>
                                        <section class="col col-3 clRepetida">
                                            <label class="label">Repita la Clave Nueva:</label>
                                            <label class="input nueva2">
                                                <input type="password" name="cl_nu_re" id="cl_repetido" required="">
                                            </label>
                                            <div class="msgr note note-error"></div>
                                        </section>
                                    </fieldset>
                                    <footer>
                                        <input type="hidden" class="No_Usuario" value="<%=u.getNo_usuario().trim()%>">
                                        <input type="hidden" class="iduser" value="<%=u.getId_usuario()%>">
                                        <input  class="btn btn-primary btn-sm cambiarC" value="Cambiar Clave" >
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
        response.sendRedirect("/TALENTO_HUMANO/");
    }
%>