<%-- 
    Document   : Prueba_JSON
    Created on : 07-ago-2014, 10:47:35
    Author     : Alfa.sistemas
--%>

<%@page import="org.json.simple.JSONArray"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        
        JSONArray list = new JSONArray();
String jsonText = null;
for (int j = 0; j < 4; j++) {
list.add("Jair");
list.add("Alex");
list.add("Suca");
//jsonText = list.toString();
}
out.print(list);
        %>
    </body>
</html>
