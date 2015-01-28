<%
    HttpSession sesion = request.getSession();
    String id_user= (String) sesion.getAttribute("IDUSER");
    if (id_user != null) {
        Usuario us = new Usuario();
%>
<%@page import="pe.edu.upeu.application.model.V_List_Empleado"%>
<%@page import="pe.edu.upeu.application.model.Rol"%>
<jsp:useBean id="Listar_Emp" scope="application" class="java.util.ArrayList"/>
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
            <form class="form" action="../../Usuario"> 
                <table class="table">      
                    <tr><td>Empleado:</td><td>
                            <select name="IDEMPLEADO" class="text-box chosen-select">
                                <option value=""></option>
                                
                                <%for (int i = 0; i < Listar_Emp.size(); i++) {
                                        V_List_Empleado ve = new V_List_Empleado();
                                        ve = (V_List_Empleado) Listar_Emp.get(i);
                                %>
                                <option value="<%=ve.getId_empleado()%>"><%=ve.getNo_trabajador()%><%="     "%><%=ve.getAp_paterno()%><%="    "%><%=ve.getAp_materno()%></option>
                                <%}%>
                            </select>
                            
                        </td></tr>  
                    <tr><td>Rol:</td><td>
                            <select name="IDROLES" class="text-box chosen-select">
                                <option value=""></option>
                                <%for (int i = 0; i < List_Rol.size(); i++) {
                                        Rol r = new Rol();
                                        r = (Rol) List_Rol.get(i);
                                %>
                                <option value="<%=r.getId_rol()%>"><%=r.getNo_rol()%></option>
                                <%}%>
                            </select>
                            
                        </td></tr>  
                    <tr><td>Usuario:</td><td><input type="text" required="" name="USUARIO" class="text-box" ></td></tr> 
                    <tr><td>Clave:</td><td><input type="password"  required="" name="CLAVE" class="text-box" ></td></tr>   
                    <tr><td><input type="submit" name="opc"  class="submit" value="Registrar Usuario"></td></tr>
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