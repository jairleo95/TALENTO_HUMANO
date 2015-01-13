
<%-- 
    Document   : Pruebas_SELECT
    Created on : 18-ago-2014, 10:37:25
    Author     : Alfa.sistemas
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%><%@ page language="java"%> 

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1><%! 
   private void writeMenu(javax.servlet.jsp.JspWriter out, int startValue, 
  int endValue, int selectedValue){ 
  try{ 
  // esta línea es opcional... 
   out.println("<option value=\"-1\" selected> Selecciona una opcion</option>"); 
  // comienzo el ciclo con el rango de valores dado. 
  for (int i=startValue; i<(endValue+1); i++){ 
  // si el valor actual corresponde al valor del ciclo, 
  //lo hago aparecer como seleccionado 
   if (i == selectedValue){ 
    out.println("<option value=\""+i+"\" selected>"+i+"</option>"); 
   } 
   else{ 
    out.println("<option value=\""+i+"\">"+i+"</option>"); 
   } 
   } 
  }catch(java.io.IOException e1){ 
   System.out.println(e1); 
   } 
} 
%> 
<% 
java.util.GregorianCalendar cal = new java.util.GregorianCalendar(); 
    int day = cal.get(cal.DAY_OF_MONTH); 
    int month = (cal.get(cal.MONTH)) + 1; 
    int year = cal.get(cal.YEAR); 
%>
<table> 
   <h1>construcción dinámica de menús de selección</h1> 
    <tr> 
     <td>Dia: 
     <select> 
      <% writeMenu(out,1,31,day); %> 
     </select> 
     </td> 

     <td>Mes: 
     <select> 
      <% writeMenu(out,1,12,month); %> 
     </select> 

     </td> 

     <td>Año: 
     <select> 
      <% writeMenu(out,2000,2010,year); %> 
     </select> 

     </td> 

     </tr> 
   </table> 
      <%
      /*public void writeCountryMenu(Connection connection, javax.servlet.jsp.JspWriter out, int currentValue){ 
   try{ 
     String sqlString = " SELECT id,Name from T_Countries order by orderview "; 
     Statement stmt = connection.createStatement(); 
     ResultSet rs = stmt.executeQuery(sqlString); 
     while (rs.next()){ 
       String selected = ""; 
      int countryId = rs.getInt("id"); 
      if (countryId==currentValue) 
       selected = "SELECTED"; 
      out.print("<option value=\""+countryId+"\" "+selected+">"+rs.getString("Name")+"</option>"); 
     } 
     rs.close(); 
   stmt.close(); 
   }catch(Exception e){ 
     System.out.println(e); 
   } 
  }*/
      %>
    </body>
</html>