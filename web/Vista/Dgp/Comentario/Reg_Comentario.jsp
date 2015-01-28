<%
    HttpSession sesion_1 = request.getSession();
    String id_user_1 = (String) sesion_1.getAttribute("IDUSER");
    if (id_user_1 != null) {
        Usuario us = new Usuario();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="windows-1252">
        <title>Comentarios</title>
    </head>
    <body>
    <center>
        <br>
        <br>
        <br>
        <!--<label class="title">agregar comentarios</label>
        -->
        <form class="form" action="../../../comentario" method="post"> 
            <table class="table">   
                <input type="hidden" name="IDDETALLE_DGP" value="<%=request.getParameter("iddgp")%>" class="text-box" > 
                <input type="hidden" name="IDAUTORIZACION"  value="<%%>" class="text-box" > 
                <input type="hidden" name="IDPASOS" value="<%%>" class="text-box" > 
                <tr><td>Comentario:</td><td><textarea name="COMENTARIO" required="" rows="8" cols="60" class="text-box" ></textarea></td></tr>         
                <tr><td><input type="submit" name="opc"  class="submit" value="COMENTAR"></td></tr>
            </table></form></center><br><br>
</body>
</html>
<%@include file="List_Coment.jsp" %>
<%} else {
        response.sendRedirect("/TALENTO_HUMANO/");
    }
%>