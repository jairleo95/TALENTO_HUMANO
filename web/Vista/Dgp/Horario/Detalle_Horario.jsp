<%@page import="pe.edu.upeu.application.model.Usuario"%>
<%
    HttpSession sesion = request.getSession();
    String id_user = (String) sesion.getAttribute("IDUSER");
    if (id_user != null) {
        Usuario us = new Usuario();
%>
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

<html>
    <head>
      

        <meta charset="windows-1252">
        <title>Detalle Horiario</title>
        <link rel="stylesheet" href="../../../css1/bootstrap.min.css" >
        <script type="text/javascript" src="../../../js1/bootstrap.js" ></script>
        <script type="text/javascript" src=""></script>
            
            
       <style>
            #tab{
            font-family:verdana;
            margin: 35px;
            margin-left: 450px;
            margin-right: 450px;
            padding:10px;
            border-radius:10px;
            border:10px solid #BDCACF;    
            
            }
            
            .table{
                border: 3px solid black;
                width: 13%;
                position: relative;
                float: left;
                margin: 5px;
            }

        </style>
    </head>


    <body>
<div class="container">
        <center>
        <h2>Horario</h2>
        </center>
    <hr>
    <div >
        <%
            InterfaceListaDAO l = new ListaDAO();

            for (int i = 0; i < l.List_H().length; i++) {
                int g = 0;
                for (int s = 0; s < List_V_Horario.size(); s++) {
                    V_Horario h = new V_Horario();
                    h = (V_Horario) List_V_Horario.get(s);
                    if (h.getDia_horario().trim().equals(l.List_H()[i][0])) {
                        if (g == 0) {%>
                        
                        
                        <table class="table table-hover">
                
                            <tr><td colspan="2"  style="text-align: center;"><strong><% out.println(l.List_H()[i][1]);%></strong></td></tr>   

            <%}%>

            <tr>
             <td><%out.println(h.getHo_desde()); %> </td>
             <td><%out.println(h.getHo_hasta());%></td>
            </tr>
            <% g++; %>

            <%}%>
            <%}%>

             </table>


        <%}%>
</div>


        <%  if (request.getParameter("P2") != null) {
                    if (request.getParameter("P2").equals("1")) {%>

        <a href="../../../dgp?iddgp=<%=request.getParameter("iddgp")%>&idtr=<%=request.getParameter("idtr")%>&opc=rd">Continuar</a>

<%}}%>
</div>
    </body>
</html>
<%} else {
        response.sendRedirect("/TALENTO_HUMANO/");
    }
%>