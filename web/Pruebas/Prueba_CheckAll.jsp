

<%@page import="java.sql.CallableStatement"%>
<%@page import="pe.edu.upeu.application.factory.Conexion"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>JSP Page</title>
    </head>
    <body>
        <table>
            <tr>
                <td bgcolor="black" >Nombre</td>
                <td bgcolor="#000000">Apellido</td>
                <td bgcolor="#000000">
                    <input type="checkbox" name="all" id="all"
                           onclick="checkAll();" />
                </td>
            </tr>
            <tr>
                <td>Jim</td>
                <td>Penaloza</td>
                <td><input name="id01" type="checkbox" id="id01" /></td>
            </tr>
            <tr>
                <td>Jose Luis </td>
                <td>Prado</td>
                <td><input name="id02" type="checkbox" id="id02" /></td>
            </tr>
            <tr>
                <td>Joseph</td>
                <td>Mondragon</td>
                <td><input name="id03" type="checkbox" id="id03" /></td>
            </tr>
        </table>

        <script>
            function checkAll() {
                var nodoCheck = document.getElementsByTagName("input");
                var varCheck = document.getElementById("all").checked;
                for (i = 0; i < nodoCheck.length; i++) {
                    if (nodoCheck[i].type == "checkbox" && nodoCheck[i].name != "all" && nodoCheck[i].disabled == false) {
                        nodoCheck[i].checked = varCheck;
                    }
                }
            }
        </script>
    </body>
</html>
