<%-- 
    Document   : demo
    Created on : 14-nov-2014, 9:31:58
    Author     : ALFA 3
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table width="100%" border="1" align="center">
            <tr bgcolor="#949494">
                <th>Header Name</th><th>Header Value(s)</th>
            </tr>
            <%
                Enumeration headerNames = request.getHeaderNames();
                while (headerNames.hasMoreElements()) {
                    String paramName = (String) headerNames.nextElement();
                    out.print("<tr><td>" + paramName + "</td>\n");
                    String paramValue = request.getHeader(paramName);
                    out.println("<td> " + paramValue + "</td></tr>\n");
                }
            %>
        </table>


        <%= getServletContext().getRealPath(".").substring(0, getServletContext().getRealPath(".").length() - 1)%>
        <h1>lista docentes</h1>
        <span id="cargador">Cargando...</span>
        <ul id="listaDoc" style="display:block;">
        </ul>

        <script type="text/javascript" src="js/JQuery/jQuery.js" ></script>
        <script>
            /*
             (function($){
             $(document).ready(function(){
             $('#cargador').show();
             var url='http://localhost/demo/data.php';
             
             $.getJSON(url,function(data){
             $('#cargador').hide();
             $('#listaDoc').show();
             $.each(data,function(i,campo){
             $('#listaDoc').append('<li><strong>'+campo.dni+'</strong> - '+campo.nombre+'</li>');
             });
             });
             });
             })(jQuery);
             */
        </script>
    </body>
</html>
