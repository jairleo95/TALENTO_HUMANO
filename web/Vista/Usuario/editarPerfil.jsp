<%@page import="pe.edu.upeu.application.model.Usuario"%>
<%
    HttpSession sesion_1 = request.getSession();
    String id_user_1 = (String) sesion_1.getAttribute("IDUSER");
    if (id_user_1 != null) {
        Usuario us = new Usuario();
%>
<%@page import="pe.edu.upeu.application.model.V_Var_Usuario"%>
<%@page import="pe.edu.upeu.application.model.V_Usuario"%>
<jsp:useBean id="Lista_Usuarios" scope="application" class="java.util.ArrayList" />

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
            <link href="../../css/Css_Bootstrap/bootstrap.css" rel="stylesheet" />

    </head>
    <body>
         <% 
             V_Usuario  vu=  new V_Usuario();
           vu=(V_Usuario)Lista_Usuarios.get(0);
                                            %>
                                            <form class="bg-danger"action="linea" method="POST" >
            
            usuario : <input class="input-small" placeholder="Email" type="text" name="nombre" value="<%=vu.getNo_usuario()%> ">
          
            password : <input type="text" name="pasword" value="<%=vu.getPw_usuario()%> "><br> <br>
            
            telefono : <input type="text" name="filtro"value="<%=vu.getCl_tra()%> "><br> <br>
            
            Direccion : <input type="text" name="filtro"value="<%=vu.getId_direccion()%> "><br> <br>
            
            correo : <input type="text" name="filtro"value=" <%=vu.getDi_correo_personal()%> "><br><br>
            
            foto : <input type="text" name="filtro"value="<%=vu.getDi_correo_personal()%> "><br><br>
            
            
            
            religion : <input type="text" name="filtro"value="<%=vu.getLi_religion()%> "><br><br>
            
            
 
            <input type="Submit" name="nuevo" class="btn btn-primary" value="Nuevo" >
                   <input type="Submit" name="guardar" class="btn btn-primary" value="Guardar" id="idguardar">
                   <input type="Submit" name="buscar" class="btn btn-primary" value="Buscar" >
 
        </form>
           <!-- <form action="Chequeo" method="post">
                <center>
                <span class="style6">Usuario:</span>
                <input type="text" name="usuario" size=20></center><br>
                <center>
                <span class="style6">Contraseña:</span>
                <input type="Password" name="clave" size=20></center><br>
                
                
                <center><input type="submit" value="enviar"></center><br>
              </form>-->
    </body>
</html>

<%} else {
        response.sendRedirect("/TALENTO_HUMANO/");
    }
%>