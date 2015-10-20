<%@page import="pe.edu.upeu.application.model.Usuario"%>
<%
    HttpSession sesion = request.getSession();
    String id_user = (String) sesion.getAttribute("IDUSER");
    if (id_user != null) {
%>
<%@page import="pe.edu.upeu.application.model.X_List_Comen_DGP"%>
<jsp:useBean id="List_Comentario_DGP" class="java.util.ArrayList" scope="session"/>
<!DOCTYPE html >
<html>
    <head>
        <meta charset="windows-1252">
        <title>Comentarios DGP</title>
        <style>
            .Coment{
                padding:5px;
                border:solid 1px #6b00c5;
                border-radius:5px;
                background-color: #fcfcfc; 
                height: 200px;
                width: 300px;
                margin: 5px;
            }
            td{

                padding: 10px;
            }
            .tab{
                border-radius: 13px;
                background-color: white;
                text-align: center;
            }
            .Coment:focus{
                box-shadow:0 0 13px #6b00c5;
            }
            .Coment:hover{
                background-color: white;
            }
        </style>
    </head>

    <body>

    <center>

        <%

            for (int f = 0; f < List_Comentario_DGP.size(); f++) {

                X_List_Comen_DGP c = new X_List_Comen_DGP();
                c = (X_List_Comen_DGP) List_Comentario_DGP.get(f);
        %>
        <table border="1" class="tab" style="width: 800px;"> 
            <br>
            <tr><td>Usuario:</td><td><%=c.getNo_usuario()%></td><td rowspan="5" > <textarea class="Coment" readonly="" ><%=c.getCm_comentario()%></textarea> </td></tr>
            <tr><td>Puesto:</td><td><%=c.getNo_puesto()%></td></tr>
            <tr><td>Area:</td><td><%=c.getNo_area()%></td></tr>
            <tr><td >Departamento:</td><td><%=c.getNo_dep()%></td></tr>
            <tr><td>Fecha:</td><td><%=c.getFe_creacion()%></td></tr>

        </table>
        <%}%>

        <%if (List_Comentario_DGP.size() == 0) {
                out.println("<h1>No se ha registrado ningun comentario...</h1>");
            }%>


    </center>
</body>
</html>
<%} else {
        out.print("<script> window.parent.location.href = '/TALENTO_HUMANO/';</script>");
    }
%>
