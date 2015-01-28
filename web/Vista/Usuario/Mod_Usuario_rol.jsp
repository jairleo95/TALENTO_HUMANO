<%
    HttpSession sesion = request.getSession();
    String id_user = (String) sesion.getAttribute("IDUSER");
    if (id_user != null) {
        Usuario us = new Usuario();
%>
<%@page import="pe.edu.upeu.application.model.V_Var_Usuario"%>
<%@page import="pe.edu.upeu.application.model.Rol"%>
<jsp:useBean id="List_Usuario_var_id" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="List_Rol" scope="application" class="java.util.ArrayList"/>
<!DOCTYPE html>
<html>
    <head>
        <style type="text/css">

        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Mantenimiento de Usuarios</title>
        <link rel="stylesheet" href="../CSS/estilos.css" />

        <link rel="stylesheet" href="../CSS/chosen.css">
        <script src="../js3/abc.js"></script>
        <script src="../js3/organictabs.jquery.js"></script>
        <style type="text/css">

            .submit{
                margin:10px;
                margin-left:0px;
                width: 100%;
                height:90%;
                color:white;
                background-color: #0575f4 ;

            }
            .tab-mant{
                margin:10px;   
            }   
            .lab-mant{
                color:#0575f4;  
                //font-size:34px; 
                // margin: 5px;
            }
            .body{
                background-color: #EEE;

            }

            td{
                text-align: left;
            }
        </style>

    </head>
    <body class="body">
    <center>
        <label class="lab-mant"> <h1>Mantenimiento Usuarios de  Personal</h1></label>

        <center>
            <form class="form" action="../../Usuario" method="post"> 
                <%for(int i =0;i<List_Usuario_var_id.size();i++){
                        V_Var_Usuario v=new V_Var_Usuario();
                        v=(V_Var_Usuario)List_Usuario_var_id.get(i);
                    %>
                <table class="table"> 
                    <tr><td>Empleado:</td><td><%=v.getNo_trabajador()+" "+v.getAp_paterno()+" "+v.getAp_materno()%></td></tr>  
                    <tr><td>Rol:</td><td>
                            <select name="IDROLES" class="text-box chosen-select">
                                <option value=""></option>
                                <%for (int u = 0; u < List_Rol.size(); u++) {
                                        Rol r = new Rol();
                                        r = (Rol) List_Rol.get(u);
                                        if(v.getId_rol().trim().equals(r.getId_rol())){
                                %>
                                <option value="<%=r.getId_rol()%>" selected=""><%=r.getNo_rol()%></option>
                                <%}else{%>
                                <option value="<%=r.getId_rol()%>"><%=r.getNo_rol()%></option>
                                <%}%>
                                <%}%>
                            </select>
                            
                        </td></tr>  
                    <tr><td>Usuario:</td><td><input type="text" required="" name="USUARIO" class="text-box" value="<%=v.getNo_usuario().trim()%>"></td></tr>  
                    <tr><td colspan="2"><input type="hidden" name="opc"  class="submit" value="Mod_Usuario_con_2"><input type="hidden" name="ID_USUARIO"  class="submit" value="<%=v.getId_usuario()%> "><input type="submit" class="submit" value="MODIFICAR ROL USUARIO"></td></tr>
                    <%}%>
                </table>
            </form>
        </center><br><br>
    </center>
</body>
<script src="../js2/prism.jss" type="text/javascript" charset="utf-8"></script>
<script src="../js2/chosen.jquery.js" type="text/javascript"></script>
<script src="../JS/prism.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
    var config = {
        '.chosen-select': {},
        '.chosen-select-deselect': {allow_single_deselect: true},
        '.chosen-select-no-single': {disable_search_threshold: 10},
        '.chosen-select-no-results': {no_results_text: 'Oops, nothing found!'},
        '.chosen-select-width': {width: "95%"}
    }
    for (var selector in config) {
        $(selector).chosen(config[selector]);
    }
</script>



</html>
<%@include file="List_Usuario.jsp" %>
<%} else {
        response.sendRedirect("/TALENTO_HUMANO/");
    }
%>
