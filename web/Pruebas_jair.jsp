<%-- 
    Document   : Pruebas_jair
    Created on : 22/07/2014, 05:15:39 PM
    Author     : Admin
--%>


<%@page import="pe.edu.upeu.application.model.V_Privilegio"%>
<%@page import="pe.edu.upeu.application.dao.RolDAO"%>
<%@page import="pe.edu.upeu.application.dao_imp.InterfaceRolDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
      InterfaceRolDAO r =  new RolDAO();
      
      for(int i = 0; i <r.listarURL("ROL-0002").size();i++){
      V_Privilegio  p =  new V_Privilegio();
      p =  (V_Privilegio)r.listarURL("ROL-0002").get(i);
          out.println(p.getNo_link());
      }
      
      
        %>
    </body>
</html>
