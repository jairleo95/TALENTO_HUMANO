<%@page import="pe.edu.upeu.application.model.Usuario"%>
<%
    HttpSession sesion_1 = request.getSession();
    String id_user_1 = (String) sesion_1.getAttribute("IDUSER");
    if (id_user_1 != null) {
%>
<%-- 
    Document   : Reg_Formato_Horario
    Created on : 13/01/2015, 10:24:45 AM
    Author     : Alex
--%>
<%@page import="pe.edu.upeu.application.dao_imp.InterfaceFormato_HorarioDAO"%>
<%@page import="pe.edu.upeu.application.dao.Formato_HorarioDAO"%>
<%@page import="pe.edu.upeu.application.model.Formato_Horario"%>
<jsp:useBean id="LISTAR_FORMATO_HORARIO" scope="session" class="java.util.ArrayList" />
<!DOCTYPE html>
<html>
    <head>
        <meta charset="windows-1252">
        <title> FORMATO-HOARIO</title>
        <style>
            table{
                /* display:block;*/
                position: static;
                float: left;
                border-style: solid;
                border-width: 5px;
                margin: 2px;
            }
            .input-desp{ 
                margin-top: 5%;
                width:100%;
                /*   //height: 200px;*/
                position: static;
                float: left;
                border-color: #F2F2F2;
                border-style: solid;
                border-width: 5px;
            }
            .tab-horario{
                margin: 0;
                position: static;
                float: left;
                /*  //  float: start;*/
            }
            input{
                position: static;
                float: left;
                width: 40px;
            }
            .submit{
                position: static;
                float: left;
                margin-top: 5%;
                width:200px; 

            }
            label{
                color: F2F2F2;
            }

            * { font-family:Arial; }
            h2 { padding:0 0 5px 5px; }
            h2 a { color: #224f99; }
            a { color:#999; text-decoration: none; }
            a:hover { color:#802727; }
            p { padding:0 0 5px 0; }
            input { padding:5px; border:1px solid #999; border-radius:4px; -moz-border-radius:4px; -web-kit-border-radius:4px; -khtml-border-radius:4px; }
            body{
                /*     //  height: 500px;*/
            }

        </style>

        <%
            String noFor = request.getParameter("nofor");
        %>

    </head>
    <body>

        <b><label><%=noFor%></label></b>
        <br> 
        <br> 
        <br> 
    <center>
        <form class="form" action="../../formato_horario" method="POST"> 


            <input type="hidden" name="NOMRBE"  value="<%=noFor%>"  >

            <div class="input-desp">
                <% InterfaceFormato_HorarioDAO l = new Formato_HorarioDAO();

                    for (int i = 0; i < l.List_D().length; i++) {
                        int g = 0;
                        for (int j = 0; j < LISTAR_FORMATO_HORARIO.size(); j++) {
                            Formato_Horario fh = new Formato_Horario();
                            fh = (Formato_Horario) LISTAR_FORMATO_HORARIO.get(j);  %>                                 

                <%     if (fh.getNo_dia().trim().equals(l.List_D()[i][0])) {
                        if (g == 0) {
                %>
                <table > 

                    <tr><td align="center" colspan="2"><%=l.List_D()[i][1]%></td></tr>

                    <% }
                        if (fh.getNo_turno().trim().equals("T" + (g + 1) + "")) {%>
                    <tr >
                        <td>T<%=g + 1%>:</td>
                        <td><b><input type="text"  disabled="" value="<%=fh.getHo_desde()%>"></b></td>      
                        <td><b><input type="text"  disabled="" value="<%=fh.getHo_hasta()%>"></b></td>
                    </tr>         
                    <%          }%>
                    <% g++;
                        }%>
                    <%  }%>
                </table>
                <%}%>

            </div>
        </form>
    </center>
</body>
</html>

<%} else {
        out.print("<script> window.parent.location.href = '/TALENTO_HUMANO/';</script>");
    }
%>