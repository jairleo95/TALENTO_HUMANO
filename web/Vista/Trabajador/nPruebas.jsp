<%-- 
    Document   : nPruebas
    Created on : 28-jul-2014, 0:30:08
    Author     : Karencita
--%>

<%@page import="java.sql.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <script type="text/javascript" src="../../js/JQuery/jQuery.js"></script>
        <script>
            $(document).ready(
                    function() {
                        $("#date").change(
                                function() {
                                    $("#s").text($("#date").val());
                                }
                        );
                    }
            );
        </script>
        <title>JSP Page</title>
    </head>
    <body>
        <form action="../../dgp" method="GET">
            <input type="date" id="date" name="date">
            
            <input type="hidden"  name="idtr" value="TRB-000175">
            <input type="hidden"  name="idreq" value="REQ-0001">
            
            <input type="hidden"  name="iddep" value="DPT-0019">
            
            <input type="hidden"  name="opc" value="Reg_form">
            
            
            <input type="submit" value="Enviar"  name="Enviar">
            <%
                String d=  "2014-07-28";
             Date s = Date.valueOf(d);
            out.println(s);
            %>
            <p id="s"></p>
        </form>
    </body>
</html>
