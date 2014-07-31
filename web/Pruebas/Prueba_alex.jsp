
<%@page import="pe.edu.upeu.application.factory.fecha"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.ParseException"%>
<%@page import="java.util.Formatter"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <script type="text/javascript" src="../js/JQuery/jQuery.js"></script>
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



            <input type="submit" value="Enviar"  name="Enviar">
            <%
              
                
                
                String fec = "2014-07-28";
                fecha f =  new fecha();
                out.println(f.convertFecha(fec));

            %>
            <p id="s"></p>
        </form>
    </body>
</html>
