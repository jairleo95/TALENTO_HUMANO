<%
    HttpSession sesion = request.getSession();
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

            .submit{
                margin:10px;
                margin-left:0px;
                width: 100%;
                height:90%;
                color:white;
                background-color: #0575f4 ;

            }
            .tab-mant{
                margin:10px;   
            }   
            .lab-mant{
                color:#0575f4;  
                //font-size:34px; 
                // margin: 5px;
            }
            .body{
                background-color: #EEE;

            }

            td{
                text-align: left;
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
    <center><label  class="lab-mant">Cambiar Clave</label>
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
    </center>
</body>
</html>
<%@include file="List_Usuario.jsp" %>

<%} else {
        response.sendRedirect("/TALENTO_HUMANO/");
    }
%>