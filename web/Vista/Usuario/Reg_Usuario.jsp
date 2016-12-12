<%    HttpSession sesion = request.getSession();
    String id_user = (String) sesion.getAttribute("IDUSER");
    if (id_user != null) {
%>
<%@page import="pe.edu.upeu.application.model.V_List_Empleado"%>
<%@page import="pe.edu.upeu.application.model.Rol"%>
<jsp:useBean id="Listar_Emp" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="List_Rol" scope="session" class="java.util.ArrayList"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <link href="../../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="../../css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        
            <link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-production-plugins.min.css">
        <link href="../../css/smartadmin-production.min.css" rel="stylesheet" type="text/css"/>
        <link href="../../css/smartadmin-skins.min.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,300,400,700">
        <title>Mantenimiento de Usuarios</title>
        <style type="text/css">
            .contenedor{
                margin-left: 1%;
                width: 98%;
            }

        </style>

    </head>
    <body class="body">
        <div class="row">
            <center>
                <h1>Mantenimiento a Usuarios de  Personal</h1>
                <a href="ListaUsuario.jsp">New</a>
                <hr>
            </center>
                <div class="contenedor">
                    <article class="col-sm-12">
                        <div id="wid-id-0" class="jarviswidget" role="widget">
                            <div>
                                <div class="jarviswidget-editbox">
                                </div>
                                <div class="widget-body no-padding ">
                                    <form class="smart-form" action="../../Usuario">
                                        <fieldset>
                                            <h2>Registro de Usuarios </h2>
                                        </fieldset>
                                        <fieldset>
                                            <section class="col col-3">
                                                <label class="label">Empleado:</label>
                                                <label class="select">
                                                    <select class="form-control" name="IDEMPLEADO">
                                                        <option value="">[Seleccione]</option>
                                                        <%for (int i = 0; i < Listar_Emp.size(); i++) {
                                                                V_List_Empleado ve = new V_List_Empleado();
                                                                ve = (V_List_Empleado) Listar_Emp.get(i);
                                                        %>
                                                        <option value="<%=ve.getId_empleado()%>"><%=ve.getNo_trabajador()%><%="     "%><%=ve.getAp_paterno()%><%="    "%><%=ve.getAp_materno()%></option>
                                                        <%}%>
                                                    </select>
                                                    <i></i> </label>
                                            </section>
                                            <section class="col col-3">
                                                <label class="label">Rol:</label>
                                                <label class="select">
                                                    <select class="form-control" name="IDROLES" >
                                                        <option value="">[Seleccione]</option>
                                                        <%for (int i = 0; i < List_Rol.size(); i++) {
                                                                Rol r = new Rol();
                                                                r = (Rol) List_Rol.get(i);
                                                        %>
                                                        <option value="<%=r.getId_rol()%>"><%=r.getNo_rol()%></option>
                                                        <%}%>
                                                    </select>
                                                    <i></i> </label>
                                            </section>
                                            <section class="col col-3">
                                                <label class="label">Usuario:</label>
                                                <label class="input">
                                                    <input type="text" required="" name="USUARIO"  >
                                                    <i></i> </label>                                
                                            </section>
                                            <section class="col col-3">
                                                <label class="label">Clave:</label>
                                                <label class="input">
                                                    <input type="password"  required="" name="CLAVE" > 
                                                    <i></i> </label>
                                            </section>
                                        </fieldset>
                                        <footer>
                                            <input type="submit" name="opc" class="btn btn-primary btn-sm" value="Registrar Usuario">
                                            <input type="reset" class="btn btn-default btn-sm" value="Limpiar">
                                        </footer>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </article>
                </div>
        </div>
    </body>
    <!--<script src="../js2/prism.jss" type="text/javascript" charset="utf-8"></script>
    <script src="../js2/chosen.jquery.js" type="text/javascript"></script>
    <script src="../JS/prism.js" type="text/javascript" charset="utf-8"></script>
    <script src="../../js/prism.js" type="text/javascript"></script>
    <script src="../../js/chosen.jquery.js" type="text/javascript"></script>
    <script src="../../js/prism.js" type="text/javascript"></script>-->
    <script type="text/javascript">
        /*var config = {
         '.chosen-select': {},
         '.chosen-select-deselect': {allow_single_deselect: true},
         '.chosen-select-no-single': {disable_search_threshold: 10},
         '.chosen-select-no-results': {no_results_text: 'Oops, nothing found!'},
         '.chosen-select-width': {width: "95%"}
         }
         for (var selector in config) {
         $(selector).chosen(config[selector]);
         }*/
    </script>

</html>
<%@include file="List_Usuario.jsp" %>
<%} else {
        out.print("<script> window.parent.location.href = '/TALENTO_HUMANO/';</script>");
    }
%>