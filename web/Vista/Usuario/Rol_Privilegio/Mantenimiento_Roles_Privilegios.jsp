<%@page import="pe.edu.upeu.application.model.Usuario"%>
<%
    HttpSession sesion_1 = request.getSession();
    String id_user_1 = (String) sesion_1.getAttribute("IDUSER");
    if (id_user_1 != null) {
%>
<%@page import="pe.edu.upeu.application.model.Auto_Mostrar"%>
<%@page import="pe.edu.upeu.application.model.V_Ficha_Trab_Num_C"%>
<%@page import="pe.edu.upeu.application.model.Trabajador"%>
<jsp:useBean id="ListaridTrabajador" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="List_Auto_mostrar" scope="session" class="java.util.ArrayList"/>

<!DOCTYPE html>

<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <script type="text/javascript" src="../../js/JQuery/jQuery.js"></script>
        <script type="text/javascript" src="../../js/JQuery/jquery.autoheight.js"></script>
        <title>Mantenimiento de Roles y Privilegios</title>
        <script type="text/javascript" src="../../js/Js_Alerta/alertify.js"></script>
        <link rel="stylesheet" href="../../css/Css_Alerta/alertify.core.css" />
        <link rel="stylesheet" href="../../css/Css_Alerta/alertify.default.css" />
        <script type="text/javascript"  src="../../js/Js_Alerta/Alertas.js"></script>

        <link rel="stylesheet" type="text/css" href="../../css/Css_Menu_Desplegable/default.css" />
        <link rel="stylesheet" type="text/css" href="../../css/Css_Menu_Desplegable/component.css" />
        <script src="../../js/modernizr.custom.js"></script>

        <!-- Estilos plantilla-->
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/font-awesome.min.css">


        <!-- SmartAdmin Styles : Please note (smartadmin-production.css) was created using LESS variables -->
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-production.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-skins.min.css">

        <!-- SmartAdmin RTL Support is under construction
                 This RTL CSS will be released in version 1.5
        <link rel="stylesheet" type="text/css" media="screen" href="css/smartadmin-rtl.min.css"> -->

        <!-- We recommend you use "your_style.css" to override SmartAdmin
             specific styles this will also ensure you retrain your customization with each SmartAdmin update.
        <link rel="stylesheet" type="text/css" media="screen" href="css/your_style.css"> -->

        <!-- Demo purpose only: goes with demo.js, you can delete this css when designing your own WebApp -->
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/demo.min.css">

        <!-- FAVICONS -->
        <link rel="shortcut icon" href="../../img/favicon/favicon.ico" type="image/x-icon">
        <link rel="icon" href="../../img/favicon/favicon.ico" type="image/x-icon">

        <!-- GOOGLE FONT -->
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,300,400,700">

        <!-- Specifying a Webpage Icon for Web Clip 
                 Ref: https://developer.apple.com/library/ios/documentation/AppleApplications/Reference/SafariWebContent/ConfiguringWebApplications/ConfiguringWebApplications.html -->
        <link rel="apple-touch-icon" href="../../img/splash/sptouch-icon-iphone.png">
        <link rel="apple-touch-icon" sizes="76x76" href="../../img/splash/touch-icon-ipad.png">
        <link rel="apple-touch-icon" sizes="120x120" href="../../img/splash/touch-icon-iphone-retina.png">
        <link rel="apple-touch-icon" sizes="152x152" href="../../img/splash/touch-icon-ipad-retina.png">

        <!-- iOS web-app metas : hides Safari UI Components and Changes Status Bar Appearance -->
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="apple-mobile-web-app-status-bar-style" content="black">

        <!-- Startup image for web apps -->
        <link rel="apple-touch-startup-image" href="../../img/splash/ipad-landscape.png" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:landscape)">
        <link rel="apple-touch-startup-image" href="../../img/splash/ipad-portrait.png" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:portrait)">
        <link rel="apple-touch-startup-image" href="../../img/splash/iphone.png" media="screen and (max-device-width: 320px)">




        <style type="text/css">
            body{

                margin-left: auto;
                margin-right: auto  ;
                width: 95%;
             /*   // margin: 0;*/
            }
            .titulo{


                background-color: #474747;
                padding: 0.5%;

                font-family: arial;
                font-size: 130%;
                text-align: center;
                color: white;

            }
            .autoHeight{
                border-style:none;            
            }

            .td{
                font-weight: bold;
                text-align: center;
            }
            .td1{
                text-align: center;
            }
            .td2{
                width: 8%;
            }
            .info-det{
                 
                width: 25%;
            }

            .table-det{
                width: 100%;
            }
            .submit{
           /*     //position: relative;*/

                background-color: #0575f4;
                color: white;
                width: 100%;

            }
            .submit:hover{
                background-color: #643771;
            }

            table, th, td {
                
                padding: 4px;
            }
            img{
               position: absolute;
                
            }


        </style>
        <script type="text/javascript">
            $(document).ready(
                    function() {
                        $(".item-m").click(
                                function() {
                                    $("#titulo-c").text($(this).text());
                                }
                        );
                    }
            );

        </script>
    </head>

    <%if (request.getParameter("a") != null) {
            if (request.getParameter("a").equals("t")) {
    %>

    <body onload="alerta_dt_ingresados()">

        <%
            }
        } else {
        %>
    <body>
        <%}%>
        <%

            V_Ficha_Trab_Num_C t = new V_Ficha_Trab_Num_C();
            t = (V_Ficha_Trab_Num_C) ListaridTrabajador.get(0);

            String idtr = t.getId_trabajador().trim();
            String aut = request.getParameter("aut");
            HttpSession sesion = request.getSession(true);
            String idp = (String) sesion.getAttribute("p");
            String iddgp = request.getParameter("dgp");
            String cod = request.getParameter("c");
            String iddrp = request.getParameter("drp");
            String id_pasos = request.getParameter("pas");
            String nropaso = request.getParameter("np");
//if ($_REQUEST["CR"]=1){ %>
        <script type="text/javascript">
            // alerta_dt_ingresados();
        </script>

        <!--Begin Detalle Trabajador-->
        <div   class="titulo" style=" width:100%;">Detalle del Trabajador</div> 
        <div  class="jarviswidget well" id="wid-id-3" data-widget-colorbutton="false" data-widget-editbutton="false" data-widget-togglebutton="false" data-widget-deletebutton="false" data-widget-fullscreenbutton="false" data-widget-custombutton="false" data-widget-sortable="false">
            <table  style="background-color: white " class="table-det" cellpadding="0">


                <%

                    if (t.getNo_ar_foto() == null) {
                %>
                <tr><td class="td2" ><img style="border: 3px solid grey ; position:absolute; left:0.5%; top: 6% " src="../../imagenes/avatar_default.jpg"  width="100"  height="100"></td>
                    <td><a href="../Usuario/Subir_Foto.jsp?idtr=<%=idtr%>">Subir imagen</a></td>
                <%
            } else {%>
            <tr><td class="td2"><img style="border: 3px solid grey ; position:absolute; left:0.5%; top: 6% " src="../Usuario/Fotos/<%=t.getAr_foto()%>"  width="100"  height="100"></td>
                        <%}%>
                    <td>
                        <div >
                            <table   class="info-det" >
                                <%
                                    for (int index = 0; index < ListaridTrabajador.size(); index++) {
                                        V_Ficha_Trab_Num_C trb = new V_Ficha_Trab_Num_C();
                                        trb = (V_Ficha_Trab_Num_C) ListaridTrabajador.get(index);

                                %>

                                <tr><td class="td">Nombre :</td><td class="td1"><%=trb.getNo_trabajador().toUpperCase()%></td></tr>
                                <tr><td class="td">Apellido Paterno :</td><td class="td1"><%=trb.getAp_paterno().toUpperCase()%></td></tr>
                                <tr><td class="td">Apellido Materno :</td><td class="td1"><%=trb.getAp_materno().toUpperCase()%></td></tr>
                                <tr><td class="td">Fecha de Nacimiento :</td><td class="td1"><%=trb.getFe_nac()%></td></tr>

                            </table>
                        </div>
                    </td>
                </tr>
            </table>
        </div>

        <!--End Detalle Trabajador-->

        <!-- Begin TABS-->
        <div class="jarviswidget well" id="wid-id-3" data-widget-colorbutton="false" data-widget-editbutton="false" data-widget-togglebutton="false" data-widget-deletebutton="false" data-widget-fullscreenbutton="false" data-widget-custombutton="false" data-widget-sortable="false">
            <!-- widget options:
            usage: <div class="jarviswidget" id="wid-id-0" data-widget-editbutton="false">

            data-widget-colorbutton="false"
            data-widget-editbutton="false"
            data-widget-togglebutton="false"
            data-widget-deletebutton="false"
            data-widget-fullscreenbutton="false"
            data-widget-custombutton="false"
            data-widget-collapsed="true"
            data-widget-sortable="false"

            -->
            <header>
                <span class="widget-icon"> <i class="fa fa-comments"></i> </span>
                <h2>Default Tabs with border </h2>

            </header>

            <!-- widget div-->
            <div>

                <!-- widget edit box -->
                <div class="jarviswidget-editbox">
                    <!-- This area used as dropdown edit box -->

                </div>
                <!-- end widget edit box -->

                <!-- widget content -->
                <div class="widget-body">


                    <hr class="simple">
                    <ul id="myTab1" class="nav nav-tabs bordered">
                        <li >
                            <a href="#s1" data-toggle="tab"><i class="fa fa-male fa-gear"></i> Información General </a>
                        </li>
                        <li>
                            <a href="#s2" data-toggle="tab"><i class="fa fa-graduation-cap fa-gear"></i> Aspecto Académico</a>
                        </li>
                        <li >
                            <a href="#s3" data-toggle="tab"><i class="fa fa-home fa-gear"></i> Aspecto Social </a>
                        </li>
                        <li >
                            <a href="#s4" data-toggle="tab"><i class="fa fa-group fa-gear"></i> Familiares </a>
                        </li>
                        <li >
                            <a href="#s5" data-toggle="tab"><i class="fa fa-file-o fa-gear"></i> Requerimientos </a>
                        </li>
                        <li >
                            <a href="#s6" data-toggle="tab"><i class="fa fa-file fa-gear"></i> Documentación </a>
                        </li>
                        <li >
                            <a href="#s7" data-toggle="tab"><i class="fa fa-file-text fa-gear"></i> Información Contractual </a>
                        </li>
                    </ul>

                    <div id="myTabContent1" class="tab-content padding-10">
                        <div class="tab-pane fade in active" id="s1">
                            <iframe name="contenido" id="contenido"  class="autoHeight" src="../../../Privilegios?opc=Listar" width="100%" height="100%" ></iframe>
                        </div>
                        <div class="tab-pane fade" id="s2">                           
                            <iframe name="contenido" id="contenido"  class="autoHeight" src="Reg_Privilegio.jsp" width="100%" height="100%" ></iframe>                           
                        </div>
                        <div class="tab-pane fade" id="s3">                            
                            <iframe name="contenido" id="contenido"  class="autoHeight" src="Otorgar_Privilegio.jsp" width="100%" height="100%" ></iframe>                           
                        </div>
                        <div class="tab-pane fade" id="s4">                            
                            <iframe name="contenido" id="contenido"  class="autoHeight" src="Reg_Rol_Privilegio.jsp" width="100%" height="100%" ></iframe>
                        </div>
                        <div class="tab-pane fade" id="s5">                            
                            <iframe name="contenido" id="contenido"  class="autoHeight" src="Reg_roles.jsp" width="100%" height="100%" ></iframe>
                        </div>
                        <div class="tab-pane fade" id="s6">                            
                            <iframe name="contenido" id="contenido"  class="autoHeight" src="../../trabajador?idtr=<%=idtr%>&opc=Documento_Trabajador" width="100%" height="100%" ></iframe>
                        </div>
                        <div class="tab-pane fade" id="s7">                            
                            <iframe name="contenido" id="contenido"  class="autoHeight" src="../../contrato?idtr=<%=idtr%>&opc=Detalle_Contractual" width="100%" height="100%" ></iframe>
                        </div>
                    </div>

                </div>
                <!-- end widget content -->

            </div>
            <!-- end widget div -->

        </div>        
        <!-- end TABS-->



        <div >
            <%

                if (aut != null) {
                    if (aut.equals("1")) {


            %>
            <center>
                <form class="form" action="../../autorizacion" method="post" > 
                    <table > 

                        <input type="hidden" name="IDDETALLE_DGP"  value="<%=iddgp%>"  >           
                        <input type="hidden" name="NROPASO" value="<%=nropaso%>"  >                
                        <input type="hidden" name="COD" value="<%=cod%>"  >               
                        <input type="hidden" name="PUESTO_ID" value="<%=idp%>" >  
                        <input type="hidden" name="IDDETALLE_REQ_PROCESO" value="<%=iddrp%>"  >  
                        <input type="hidden" name="IDPASOS" value="<%=id_pasos%>"   >
                        <tr><td><input type="submit" name="opc"  class="submit" value="Aceptar"/></td></tr>
                    </table>
                </form>
                <form action="../../autorizacion" method="post">
                    <table>



                        <input type="hidden" name="IDDETALLE_DGP"  value="<%=iddgp%>"  >           
                        <input type="hidden" name="NROPASO" value="<%=nropaso%>"  >                
                        <input type="hidden" name="COD" value="<%=cod%>"  >               
                        <input type="hidden" name="PUESTO_ID" value="<%=idp%>" >  
                        <input type="hidden" name="IDDETALLE_REQ_PROCESO" value="<%=iddrp%>"  >  
                        <input type="hidden" name="IDPASOS" value="<%=id_pasos%>" 
                               <tr><td><input type="submit" name="opc"  class="submit" value="Rechazar"/></td></tr>
                    </table>
                </form>   
            </center>
            <%}
                }%>
        </div>
    <script type="text/javascript" src="../../js/JQuery/jQuery.js" ></script>
<script src="../../js/app.config.js"></script>
<script src="../../js/bootstrap/bootstrap.min.js"></script>
<script src="../../js/demo.min.js"></script>

<script src="../../js/app.min.js"></script>
<script type="text/javascript">

                        // DO NOT REMOVE : GLOBAL FUNCTIONS!

                        $(document).ready(function () {

                            pageSetUp();


                        })

</script>
        <%}%>
    </body>
</html>
<%} else {
        out.print("<script> window.parent.location.href = '/TALENTO_HUMANO/';</script>");
    }
%>