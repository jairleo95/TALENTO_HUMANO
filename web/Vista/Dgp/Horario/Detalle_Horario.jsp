<%@page import="pe.edu.upeu.application.model.V_Horario"%>
<%@page import="pe.edu.upeu.application.model.Detalle_Horario"%>
<%@page import="java.util.List"%>
<%@page import="pe.edu.upeu.application.dao.HorarioDAO"%>
<%@page import="pe.edu.upeu.application.dao_imp.InterfaceHorarioDAO"%>
<%@page import="pe.edu.upeu.application.dao_imp.InterfaceListaDAO"%>
<%@page import="pe.edu.upeu.application.dao.ListaDAO"%>
<%@page import="pe.edu.upeu.application.web.controller.CHorario"%>
<jsp:useBean id="List_V_Horario" scope="application" class="java.util.ArrayList"/>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <meta charset="windows-1252">
        <title>Detalle Horiario</title>
        <style>
            table{
                // display:block;
                position: static;
                float: left;
                border-style: solid;
                border-width: 5px;
                margin: 2%;

            }
            body{
                height: 300px;
            }

        </style>
    </head>


    <body>
        <h2>Horario</h2>

        <%
            InterfaceListaDAO l = new ListaDAO();
            
            for (int i = 0; i < l.List_H().length; i++) {
                int g=0;
                for(int s = 0;s<List_V_Horario.size();s++){
                V_Horario h= new V_Horario();
                h=(V_Horario)List_V_Horario.get(s);
                if(h.getDia_horario().trim().equals(l.List_H()[i][0])){
                    if(g==0){%>
                    <table border="1">
                   <tr><td colspan="2"><% out.println(l.List_H()[i][1]);%></td></tr>   
                                                
                    <%}%>
                    
                    <tr><td><%out.println(h.getHo_hasta()); %> </td><td><%out.println(h.getDia_horario());%></td></tr>
                    <% g++; %>
            
               <%}%>
                
                
                <%}%>
                
            </table>
                
            <%}%>


       
            <%  if (request.getParameter("P2").equals("1")) { %>
             <a href="Vista/Dgp/Detalle_Dgp.jsp?iddgp">Continuar</a>
             <%}%>
 
             
    </body>
</html>
