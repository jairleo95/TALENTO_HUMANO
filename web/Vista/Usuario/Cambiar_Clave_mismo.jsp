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
        <script>
            function validar(){
                if(document.form.cl_antigua.value!==document.form.cl_bd.value){
                   alert('La clave de actual no coincide');
                } else{
                    if(document.form.cl_nueva.value !==document.form.cl_repetido.value){
                            alert('La claves nuevas no coinciden');
                     }
                }
            }
        </script>
    </head>
    <body>
        <center>
            <form action="../Control/ControlUsuario.php">
            <table>

                <input type="hidden" name="iduser" value="">
                <tr><td>Usuario</td><td><input type="password" name="cl"></td></tr>
                <tr><td>Clave Antigua:</td><td><input type="password" name="pw_an" id="cl_antigua"><input type="hidden" id="cl_bd" value=""></td></tr>
                <tr><td>Clave  Nueva:</td><td><input type="password" name="cl_nu" id="cl_nueva"></td></tr>
                <tr><td>Repita la Clave  Nueva:</td><td><input type="password" name="cl_nu_re" id="cl_repetido"></td></tr>
                <input type="hidden" value="opc" name="">
                <tr><td><input type="submit" name="Cambiar" value="Cambiar" onclick="validar()"></td></tr>
            </table>
            </form>
        </center>
    </body>
</html>
