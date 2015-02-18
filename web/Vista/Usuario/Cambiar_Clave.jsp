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


            function validar() {
                var p1 = $("#cl_nueva").val();
                var p2 = $("#cl_repetido").val();
                var espacios = false;
                var cont = 0;

                while (!espacios && (cont < p1.length)) {
                    if (p1.charAt(cont) == " ")
                        espacios = true;
                    cont++;
                }
                if (espacios) {
                    alert("La contraseña no puede contener espacios en blanco");
                    $("#cl_nueva").val("");
                    $("#cl_repetido").val("");
                    return false;
                }
                if (p1 !== p2) {
                    alert('La claves nuevas no coincide');
                    $("#cl_nueva").val("");
                    $("#cl_repetido").val("");
                    return false;
                } else {
                    return;
                }
            }


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
                                <form class="smart-form" action="../../Usuario">
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
                                                <input type="text" name="No_Usuario" value="<%=u.getNo_usuario().trim() %>">
                                            </label>
                                        </section>
                                        <section class="col col-3">
                                            <label class="label">Clave Antigua:</label>
                                            <label class="input">
                                                <input type="text" name="pw_an" value="<%=u.getPw_usuario().trim() %>">
                                            </label>
                                        </section>
                                        <section class="col col-3">
                                            <label class="label">Clave Nueva:</label>
                                            <label class="input">
                                                <input type="password" name="cl_nu" id="cl_nueva" required="">
                                            </label>                                
                                        </section>
                                        <section class="col col-3">
                                            <label class="label">Repita la Clave Nueva:</label>
                                            <label class="input">
                                                <input type="password" name="cl_nu_re" id="cl_repetido" required="">
                                            </label>                                
                                        </section>
                                    </fieldset>
                                    <footer>
                                        <input type="hidden" name="opc" value="Modificar_clave_2">
                                        <input type="hidden" name="iduser" value="<%=u.getId_usuario()%>">
                                        <input type="submit" class="btn btn-primary btn-sm" value="Cambiar Clave" >
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


 <%--   <center><label  class="lab-mant">Cambiar Clave</label>
        <form action="../../Usuario" method="post" onsubmit="return validar();">
            <table>
                <%for (int i = 0; i < List_ID_User.size(); i++) {
                        Usuario u = new Usuario();
                        u = (Usuario) List_ID_User.get(i);
                %>
                <input type="hidden" name="iduser" value="<%=u.getId_usuario()%>">
                <tr><td>Usuario</td><td><input type="text" name="No_Usuario" value="<%=u.getNo_usuario()%>"></td></tr>
                <tr><td>Clave Antigua:</td><td><input type="TEXT" name="pw_an" value="<%=u.getPw_usuario()%>"></td></tr>
                <tr><td>Clave  Nueva:</td><td><input type="password" name="cl_nu" id="cl_nueva" required=""></td></tr>
                <tr><td>Repita la Clave  Nueva:</td><td><input type="password" name="cl_nu_re" id="cl_repetido" required=""></td></tr>
                <input type="hidden" name="opc" value="Modificar_clave_2">
                <tr><td colspan="2"><input type="submit"  value="Cambiar Clave" ></td></tr>
            </table>
            <%}%>
        </form>
    </center>--%>
</body>
</html>
<%@include file="List_Usuario.jsp" %>

<%} else {
        response.sendRedirect("/TALENTO_HUMANO/");
    }
%>