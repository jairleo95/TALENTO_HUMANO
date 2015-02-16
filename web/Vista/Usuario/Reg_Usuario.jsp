<%    HttpSession sesion = request.getSession();
    String id_user = (String) sesion.getAttribute("IDUSER");
    if (id_user != null) {
%>
<%@page import="pe.edu.upeu.application.model.V_List_Empleado"%>
<%@page import="pe.edu.upeu.application.model.Rol"%>
<jsp:useBean id="Listar_Emp" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="List_Rol" scope="application" class="java.util.ArrayList"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <link rel="stylesheet" type="text/css" media="screen" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="css/smartadmin-production.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="css/smartadmin-skins.min.css">
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,300,400,700">
        <title>Mantenimiento de Usuarios</title>
        <!--<link rel="stylesheet" href="../CSS/estilos.css" />

        <link rel="stylesheet" href="../CSS/chosen.css">
        <script src="../js3/abc.js"></script>
        <script src="../js3/organictabs.jquery.js"></script>-->
        <style type="text/css">
            /*
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
                        } */
        </style>

    </head>
    <body class="body">
        <h1>Mantenimiento a Usuarios de  Personal</h1>
        <form class="smart-form" action="../../Usuario">
            <div class="row">
                <section class="col col-4">
                    <label class="label">Empleado:</label>
                    <label class="select">
                        <select name="IDEMPLEADO">
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
            </div>
            <div class="row">
                <section class="col col-4">
                    <label class="label">Rol:</label>
                    <label class="select">
                        <select name="IDROLES" >
                            <option value=""></option>
                            <%for (int i = 0; i < List_Rol.size(); i++) {
                                    Rol r = new Rol();
                                    r = (Rol) List_Rol.get(i);
                            %>
                            <option value="<%=r.getId_rol()%>"><%=r.getNo_rol()%></option>
                            <%}%>
                        </select>
                    </label>
                </section>
            </div>
            <div class="row">
                <section class="col col-2">
                    <label class="label">Usuario:</label>
                    <label class="input">
                        <input type="text" required="" name="USUARIO"  >
                    </label>                                
                </section>
                <section class="col col-2">
                    <label class="label">Clave:</label>
                    <label class="input">
                       <input type="password"  required="" name="CLAVE" > 
                    </label>
                </section>
                <input type="submit" name="opc"  class="submit" value="Registrar Usuario">
            </div>
            
               
            
        </form>
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
    <script src="../../js/app.config.js"></script>

    <!-- JS TOUCH : include this plugin for mobile drag / drop touch events-->
    <script src="../../js/plugin/jquery-touch/jquery.ui.touch-punch.min.js"></script> 

    <!-- BOOTSTRAP JS -->
    <script src="../../js/bootstrap/bootstrap.min.js"></script>

    <!-- CUSTOM NOTIFICATION -->
    <script src="../../js/notification/SmartNotification.min.js"></script>

    <!-- JARVIS WIDGETS -->
    <script src="../../js/smartwidgets/jarvis.widget.min.js"></script>

    <!-- EASY PIE CHARTS -->
    <script src="../../js/plugin/easy-pie-chart/jquery.easy-pie-chart.min.js"></script>

    <!-- SPARKLINES -->
    <script src="../../js/plugin/sparkline/jquery.sparkline.min.js"></script>

    <!-- JQUERY VALIDATE -->
    <script src="../../js/plugin/jquery-validate/jquery.validate.min.js"></script>

    <!-- JQUERY MASKED INPUT -->
    <script src="../../js/plugin/masked-input/jquery.maskedinput.min.js"></script>

    <!-- JQUERY SELECT2 INPUT -->
    <script src="../../js/plugin/select2/select2.min.js"></script>

    <!-- JQUERY UI + Bootstrap Slider -->
    <script src="../../js/plugin/bootstrap-slider/bootstrap-slider.min.js"></script>

    <!-- browser msie issue fix -->
    <script src="../../js/plugin/msie-fix/jquery.mb.browser.min.js"></script>

    <!-- FastClick: For mobile devices -->
    <script src="../../js/plugin/fastclick/fastclick.min.js"></script>



</html>
<%--<%@include file="List_Usuario.jsp" %>--%>
<%} else {
        response.sendRedirect("/TALENTO_HUMANO/");
    }
%>