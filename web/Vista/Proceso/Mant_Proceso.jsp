<%@page import="pe.edu.upeu.application.properties.globalProperties"%>
<%@page import="pe.edu.upeu.application.model.Usuario"%>
<%
    HttpSession sesion_1 = request.getSession();
    String id_user_1 = (String) sesion_1.getAttribute("IDUSER");
    if (id_user_1 != null) {
%>
<%-- 
    Document   : Prueba_Nestable_List
    Created on : 07-ene-2015, 15:23:08
    Author     : ALFA 3
--%>


<!DOCTYPE html>
<html lang="en-us">
    <head>
        <meta charset="utf-8">
        <!--<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">-->

        <title> Mantenimiento de Proceso </title>
        <meta name="description" content="">
        <meta name="author" content="">

        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

        <!-- Basic Styles -->
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/font-awesome.min.css">

        <!-- SmartAdmin Styles : Please note (smartadmin-production.css) was created using LESS variables -->
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-production-plugins.min.css">
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

    </head>
    <body class="">
        <!-- possible classes: minified, fixed-ribbon, fixed-header, fixed-width-->

        <!-- HEADER -->
        <header>

        </header>
        <!-- END HEADER -->

        <!-- Left panel : Navigation area -->
        <!-- Note: This width of the aside area can be adjusted through LESS variables -->

        <!-- END NAVIGATION -->

        <!-- MAIN PANEL -->
        <div id="main" role="main" style="margin: 0px;">

            <!-- MAIN CONTENT -->
            <div id="content" >
                <!-- widget grid -->
                <section id="widget-grid" class="">

                    <!-- row -->
                    <div class="row">

                        <select name="proceso"  id="select-proceso" class="form-control selectProceso">
                            <option value="">[Seleccione]</option>
                        </select>
                        <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <div class="jarviswidget jarviswidget-color-darken" id="wid-id-0" data-widget-editbutton="false">
                                <header>
                                    <span class="widget-icon"> <i class="fa fa-table"></i> </span>
                                    <h2>Pasos Habilitados</h2>
                                </header>
                                <div>
                                    <div class="jarviswidget-editbox">
                                    </div>
                                    <div class="widget-body">
                                        <form class="smart-form form-paso">
                                            <div class="row">
                                                <section class="col col-md-2">
                                                    <label class="input">
                                                        <input name="num" required=""  maxlength="3" class="num_paso input-sm" style="width: 100%"   placeholder="Número">
                                                    </label>
                                                </section>
                                                <section class="col col-md-2">
                                                    <label class="input">
                                                        <input type="text" name="cod" class="co_paso input-sm"  maxlength="4" placeholder="Código" />
                                                    </label>
                                                </section>

                                                <section class="col col-md-6">
                                                    <label class="input">
                                                        <input type="text"  name="desc" class="desc_paso input-sm"  placeholder="Descripción" maxlength="200"/>
                                                    </label>
                                                </section>
                                                <section class="col col-md-2" >
                                                    <button class="btn btn-primary btn-registrar btn-circle pull-left" type="submit" id="btn-registrar" name="Enviar" value="Registrar Paso" >
                                                        <i class="fa fa-plus"></i></button>
                                                    <button class="btn btn-danger btn_cancel_edit btn-circle pull-right" type="button" style="display:none "  ><i class="fa fa-remove"></i></button>
                                                    <button type="button" class="btn btn-default btn-circle Generar pull-right" data-action="collapse-all">
                                                        <i class="fa fa-refresh"></i>
                                                    </button>
                                                </section>
                                            </div>
                                            <input type="hidden" name="id" class="id_p" value=""/>
                                            <input type="hidden" name="opc" class="opc" value="Registrar"/>
                                        </form>
                                        <div class="col col-xs-12 col-md-6">
                                            <div class="dd" id="nestable"  >
                                                <ol class="dd-list" >
                                                </ol>
                                            </div>
                                            <div class="TaskValues" ></div>
                                        </div>
                                        <div class="col col-xs-12 col-md-6">
                                            <form action="" method="post" class="smart-form form_puesto" novalidate="">
                                                <fieldset>
                                                    <div class="row">
                                                        <section class="col col-4">
                                                            <label>Dirección</label>
                                                            <label class="select">
                                                                <select class=" input-sm sl_dir" required="" ></select> 
                                                                <i></i></label>      
                                                        </section>
                                                        <section class="col col-4">
                                                            <label>Departamento:</label>
                                                            <label class="select">
                                                                <select class="input-sm sl_dep" required=""></select> 
                                                                <i></i></label>                                                    
                                                        </section>
                                                        <section class="col col-4">
                                                            <label>Area:</label>
                                                            <label class="select">
                                                                <select class="input-sm sl_area" required=""></select>  
                                                                <i></i></label>
                                                        </section>
                                                    </div>
                                                    <div class="row">
                                                        <section class="col col-4">
                                                            <label>Sección:</label>
                                                            <label class="select">
                                                                <select class="input-sm sl_sec" required=""></select> 
                                                                <i></i></label>
                                                        </section>

                                                        <section class="col col-4">
                                                            <label>Puesto:</label>
                                                            <label class="select">
                                                                <select name="id_pu" class="input-sm sl_puesto" required=""></select>
                                                                <i></i></label>

                                                        </section>                                          
                                                        <input type="hidden" value="" name="idpasos" class="id_pasos"  />
                                                        <input type="hidden" value="" name="nun" class="num_p"  />
                                                        <section class="col col-2" >
                                                            <label>Tipo</label>
                                                            <label class="select">
                                                                <select class="input-sm co_puesto" name="co_pasos">
                                                                    <option value=""></option>
                                                                    <option value="SECR">Secretaria de Area</option>
                                                                    <option value="JEFE">Jefe de Area</option>
                                                                </select> 
                                                                <i></i></label>
                                                        </section>
                                                        <section class="col col-2">
                                                            <div style="margin-top: 5px;" >
                                                                <button type="button" class="btn btn-primary btn-agregar-p btn-circle btn-lg pull-right" style="margin: auto;">
                                                                    <i class="fa fa-plus"></i> 
                                                                </button> 
                                                            </div>                                                            
                                                        </section>
                                                    </div>
                                                </fieldset>
                                            </form>
                                            <div class="custom-scroll table-responsive" style="height:320px; overflow-y: scroll;">
                                                <table class="table table-striped table-bordered table-hover" style="width: 98%;margin: auto; ">
                                                    <thead>
                                                        <tr>
                                                            <th data-class="expand">Puesto</th>
                                                            <th data-hide="phone,tablet">Area</th>
                                                            <th data-hide="phone,tablet">Departamento</th>
                                                            <th data-hide="phone,tablet">Dirección</th>
                                                            <th colspan="2">Acciones</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody class="tbody-puesto">
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </article>
                        
                        <article class="col-sm-12 col-md-12 col-lg-12" >

                            <!-- Widget ID (each widget will need unique ID)-->
                            <div class="jarviswidget" id="wid-id-1" data-widget-editbutton="false" data-widget-custombutton="false">
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
                                    <span class="widget-icon"> <i class="fa fa-edit"></i> </span>
                                    <h2>Requerimiento - Proceso</h2>				
                                </header>

                                <!-- widget div-->
                                <div>

                                    <!-- widget edit box -->
                                    <div class="jarviswidget-editbox">
                                        <!-- This area used as dropdown edit box -->

                                    </div>
                                    <!-- end widget edit box -->

                                    <!-- widget content -->
                                    <div class="widget-body no-padding">

                                        <form  class="smart-form formReqProceso" novalidate="novalidate">
                                            <fieldset>
                                                <div class="row">
                                                    <section class="col col-2">
                                                        <select name="ti_planilla" class="form-control input-sm ti_planilla" required="" >
                                                            <option value="" >[ Tipo de Planilla]</option>
                                                        </select>
                                                    </section>
                                                    <section class="col col-2">
                                                        <select name="requerimiento" class="form-control input-sm req" required="" >
                                                            <option value="" >[Requerimiento]</option>
                                                        </select>

                                                    </section>
                                                    <section class="col col-3">
                                                        <select name="direccion" class="form-control  input-sm direccion" required="" >
                                                            <option value="" >[Dirección]</option>
                                                        </select>
                                                    </section>
                                                    <section class="col col-2">
                                                        <select name="departamento" class="form-control input-sm departamento"  >
                                                            <option value="" >[Departamento]</option>
                                                        </select>
                                                    </section>
                                                    <section class="col col-2">
                                                        <select name="area" class="form-control input-sm area"  >
                                                            <option value="" >[Area]</option>
                                                        </select>
                                                    </section>
                                                     <section class="col col-1">
                                                        <button type="button" class="btn btn-danger btn-circle btn-cancelar">
                                                            <i class="fa fa-remove" ></i>
                                                        </button>
                                                        <button type="submit" class="btn btn-primary btn-circle">
                                                            <i class="fa fa-plus" ></i>
                                                        </button>
                                                    </section>
                                                </div>
                                               
                                              
                                            </fieldset>

                                        </form>
                                        <table 
                                            class="table table-striped table-bordered table-hover dtReqProceso"
                                            width="100%">
                                            <thead>
                                                <tr>
                                                    <th data-hide="phone">Nro</th>
                                                    <th>Tipo de Planilla</th>
                                                    <th>Requerimiento</th>
                                                    <th data-class="expand">Proceso</th>
                                                    <th data-hide="phone">Dirección</th>
                                                    <th data-hide="phone">Departamento</th>
                                                    <th data-hide="phone">Area</th>
                                                    <th>Estado</th>
                                                    <th data-hide="phone,tablet" style="width: 5%">Acciones</th>
                                                </tr>
                                            </thead>
                                            <tbody>

                                            </tbody>
                                        </table>
                                    </div>
                                    <!-- end widget content -->

                                </div>
                                <!-- end widget div -->

                            </div>
                            <!-- end widget -->
                        </article>
                    </div>
                    <!-- end row -->
                </section>
                <!-- end widget grid -->

            </div>
            <!-- END MAIN CONTENT -->

        </div>
        <!-- END MAIN PANEL -->



        <!-- SHORTCUT AREA : With large tiles (activated via clicking user name tag)
        Note: These tiles are completely responsive,
        you can add as many as you like
        -->

        <!-- END SHORTCUT AREA -->

        <!--================================================== -->

        <!-- PACE LOADER - turn this on if you want ajax loading to show (caution: uses lots of memory on iDevices)
        <script data-pace-options='{ "restartOnRequestAfter": true }' src="js/plugin/pace/pace.min.js"></script>-->

        <!-- Link to Google CDN's jQuery + jQueryUI; fall back to local -->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
        <script>
            if (!window.jQuery) {
                document.write('<script src="js/libs/jquery-2.0.2.min.js"><\/script>');
            }
        </script>

        <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
        <script>
            if (!window.jQuery.ui) {
                document.write('<script src="js/libs/jquery-ui-1.10.3.min.js"><\/script>');
            }
        </script>

        <!-- IMPORTANT: APP CONFIG -->
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

        <!--[if IE 8]>

        <h1>Your browser is out of date, please update your browser by going to www.microsoft.com/download</h1>

        <![endif]-->

        <!-- Demo purpose only
        <script src="../../js/demo.min.js"></script> -->

        <!-- MAIN APP JS FILE -->
        <script src="../../js/app.min.js"></script>

        <!-- ENHANCEMENT PLUGINS : NOT A REQUIREMENT -->
        <!-- Voice command : plugin
        <script src="../../js/speech/voicecommand.min.js"></script> -->

        <!-- PAGE RELATED PLUGIN(S) -->
        <script src="../../js/Js_Formulario/Js_Form.js" type="text/javascript"></script>
        <script src="../../js/plugin/jquery-nestable/jquery.nestable.min.js"></script>
        <script src="../../js/plugin/datatables/jquery.dataTables.min.js"></script>
        <script src="../../js/plugin/datatables/dataTables.colVis.min.js"></script>
        <script src="../../js/plugin/datatables/dataTables.tableTools.min.js"></script>
        <script src="../../js/plugin/datatables/dataTables.bootstrap.min.js"></script>
        <script src="../../js/plugin/datatable-responsive/datatables.responsive.min.js"></script>
        
        <script src="../../js/businessLogic/Proceso/Proceso.js?v=<%=globalProperties.VERSION_JS%>" type="text/javascript"></script>
        <script src="../../js/businessLogic/Proceso/ReqProceso.js?v=<%=globalProperties.VERSION_JS%>" type="text/javascript"></script>
        <script src="../../js/businessLogic/Proceso/Proceso.js?v=<%=globalProperties.VERSION_JS%>" type="text/javascript"></script>
        <script src="../../js/businessLogic/Proceso/Task.js?v=<%=globalProperties.VERSION_JS%>" type="text/javascript"></script>
        <script src="../../js/businessLogic/Proceso/TaskXJob.js?v=<%=globalProperties.VERSION_JS%>" type="text/javascript"></script>
        <script src="../../js/businessLogic/Proceso/ConfigureProcess.js?v=<%=globalProperties.VERSION_JS%>" type="text/javascript"></script>
    </body>

</html>
<%} else {
        out.print("<script> window.parent.location.href = '/TALENTO_HUMANO/';</script>");
    }
%>