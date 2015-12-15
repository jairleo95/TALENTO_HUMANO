
<%@page import="pe.edu.upeu.application.model.Direccion"%>
<%@page import="pe.edu.upeu.application.model.Usuario"%>
<%
    HttpSession sesion = request.getSession();
    String id_user = (String) sesion.getAttribute("IDUSER");
    if (id_user != null) {
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta name="descripcion" content>
        <meta name="author" content>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <title>Crear Formatos</title>

        <link rel="stylesheet" type="text/css" media="screen" href="../../../css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../../css/font-awesome.min.css">

        <!-- SmartAdmin Styles : Please note (smartadmin-production.css) was created using LESS variables -->
        <link rel="stylesheet" type="text/css" media="screen" href="../../../css/smartadmin-production.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../../css/smartadmin-skins.min.css">

        <!-- SmartAdmin RTL Support is under construction
                 This RTL CSS will be released in version 1.5
        <link rel="stylesheet" type="text/css" media="screen" href="css/smartadmin-rtl.min.css"> -->

        <!-- We recommend you use "your_style.css" to override SmartAdmin
             specific styles this will also ensure you retrain your customization with each SmartAdmin update.
        <link rel="stylesheet" type="text/css" media="screen" href="css/your_style.css"> -->

        <!-- Demo purpose only: goes with demo.js, you can delete this css when designing your own WebApp -->
        <link rel="stylesheet" type="text/css" media="screen" href="../../../css/demo.min.css">

        <!-- FAVICONS -->
        <link rel="shortcut icon" href="../../../img/favicon/favicon.ico" type="image/x-icon">
        <link rel="icon" href="../../../img/favicon/favicon.ico" type="image/x-icon">

        <!-- GOOGLE FONT -->
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,300,400,700">

        <!-- Specifying a Webpage Icon for Web Clip 
                 Ref: https://developer.apple.com/library/ios/documentation/AppleApplications/Reference/SafariWebContent/ConfiguringWebApplications/ConfiguringWebApplications.html -->
        <link rel="apple-touch-icon" href="../../../img/splash/sptouch-icon-iphone.png">
        <link rel="apple-touch-icon" sizes="76x76" href="../../../img/splash/touch-icon-ipad.png">
        <link rel="apple-touch-icon" sizes="120x120" href="../../../img/splash/touch-icon-iphone-retina.png">
        <link rel="apple-touch-icon" sizes="152x152" href="../../../img/splash/touch-icon-ipad-retina.png">
        <!-- iOS web-app metas : hides Safari UI Components and Changes Status Bar Appearance -->
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="apple-mobile-web-app-status-bar-style" content="black">

        <!-- Startup image for web apps -->
        <link rel="apple-touch-startup-image" href="../../../img/splash/ipad-landscape.png" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:landscape)">
        <link rel="apple-touch-startup-image" href="../../../img/splash/ipad-portrait.png" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:portrait)">
        <link rel="apple-touch-startup-image" href="../../../img/splash/iphone.png" media="screen and (max-device-width: 320px)">
        <style>
            .btnAgregar{
                -webkit-box-shadow: 2px 3px 6px 0px rgba(50, 50, 50, 0.5);
                -moz-box-shadow:    2px 3px 6px 0px rgba(50, 50, 50, 0.5);
                box-shadow:         2px 3px 6px 0px rgba(50, 50, 50, 0.5);
            }
            .btnGuardar{
                -webkit-box-shadow: 2px 3px 6px 0px rgba(50, 50, 50, 0.5);
                -moz-box-shadow:    2px 3px 6px 0px rgba(50, 50, 50, 0.5);
                box-shadow:         2px 3px 6px 0px rgba(50, 50, 50, 0.5);
            }
            .btnClose{
                -webkit-box-shadow: 2px 3px 6px 0px rgba(50, 50, 50, 0.5);
                -moz-box-shadow:    2px 3px 6px 0px rgba(50, 50, 50, 0.5);
                box-shadow:         2px 3px 6px 0px rgba(50, 50, 50, 0.5);
            }
        </style>

    </head>
    <body class="body  desktop-detected pace-done" style="cursor: auto;">
        <div id="main" style="margin-left: 0px;" >
            <div id="content" >
                <section id="widget-grid" class="">
                    <div class="row">
                    </div>
                    <div class="row">
                        <article class=" col-sm-12 col-md-12 col-lg-4">
                            <div class="jarviswidget" id="wid-id-4" data-widget-editbutton="false"
                                 data-widget-fullscreenbutton="false"
                                 data-widget-custombutton="false" 
                                 data-widget-deletebutton="false"
                                 data-widget-sortable="false">

                                <header>
                                    <ul class="nav nav-tabs pull-left in">

                                        <li class="active">

                                            <a data-toggle="tab" href="#hr1"> <i class="fa fa-lg fa-arrow-circle-o-down"></i> <span class="hidden-mobile hidden-tablet"> Plantillas </span> </a>

                                        </li>

                                        <li>
                                            <a data-toggle="tab" href="#hr2"> <i class="fa fa-lg fa-arrow-circle-o-up"></i> <span class="hidden-mobile hidden-tablet">Info <span class="label bg-color-blue txt-color-white"> Importante <i class="fa fa-exclamation"></i> </span> </span> </a>
                                        </li>

                                    </ul>
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

                                        <div class="tab-content">
                                            <div class="tab-pane active" id="hr1">

                                                <div class="tabbable tabs-below">
                                                    <div class="tab-content padding-10">
                                                        <div class="tab-pane fade in active" id="AA">
                                                            <form id="form_asignar" class="smart-form"  style="display:none;">
                                                                <header>
                                                                    <h3>Asignar Plantillas</h3>
                                                                </header>
                                                                <fieldset>
                                                                    <div class="row"> 
                                                                        <section class="col col-4" >
                                                                            <label class="select">Filial:
                                                                                <select  name="filial" class="fil_as form-control input-group-sm" required="" >
                                                                                    <option value="">[Filial]</option>
                                                                                    <option value="1">Filial Lima</option>
                                                                                    <option value="2">Filial Juliaca</option>
                                                                                    <option value="5">Filial Tarapoto</option>
                                                                                </select>   
                                                                            </label>
                                                                        </section>
                                                                        <section class="col col-4" >
                                                                            <label class="select">Dirección:
                                                                                <select name="direccion" class="dir_as form-control input-group-sm"  required="" >
                                                                                    <option value="">[Direccion]</option>
                                                                                </select>   
                                                                            </label>
                                                                        </section>
                                                                        <section class="col col-4"  >
                                                                            <label class="select">Departamento:
                                                                                <select name="dep" class="dep_as form-control input-group-sm"  required="" >
                                                                                    <option value="">[TODO]</option>
                                                                                </select>
                                                                            </label>
                                                                        </section>
                                                                    </div>
                                                                    <div class="row">
                                                                        <section class="col col-4" >
                                                                            <label class="select">Area:
                                                                                <select name="area" class="area_as" >
                                                                                    <option value="0">[TODO]</option>
                                                                                </select>
                                                                            </label>
                                                                        </section>
                                                                        <section class="col col-4"   >
                                                                            <label class="select">Sección:
                                                                                <select name="seccion" class="seccion_as"   >
                                                                                    <option value="0">[TODO]</option>
                                                                                </select>
                                                                            </label>
                                                                        </section>
                                                                        <section class="col col-4" >
                                                                            <label  class="select">Puesto:
                                                                                <select name="puesto" class="puesto_as" >
                                                                                    <option value="0">[TODO]</option>
                                                                                </select>
                                                                            </label>
                                                                        </section>
                                                                    </div>
                                                                </fieldset>
                                                            </form>
                                                            <form  class="smart-form form_cargar" novalidate="novalidate">
                                                                <header>
                                                                    <h3>Cargar Plantillas</h3>
                                                                </header>
                                                                <fieldset>
                                                                    <div class="row"> 
                                                                        <section class="col col-4" >
                                                                            <label class="select">Filial:
                                                                                <select class="fil select" id="fil" name="id_di" >
                                                                                    <option value="" >[Filial]</option>
                                                                                    <option value="1" >Filial Lima</option>
                                                                                    <option value="2" >Filial Juliaca</option>
                                                                                    <option value="5" >Filial Tarapoto</option>
                                                                                </select>   
                                                                            </label>
                                                                        </section>
                                                                        <section class="col col-4" >
                                                                            <label class="select">Dirección:
                                                                                <select class="dir select" id="dir" name="id_di" >
                                                                                    <option value="" >[Direccion]</option>
                                                                                </select>   
                                                                            </label>
                                                                        </section>

                                                                        <section class="col col-4">
                                                                            <label class="select" >Departamento:
                                                                                <select class="dep select" id="dep" name="id_dep" >
                                                                                    <option value="">[TODO]</option>
                                                                                </select>
                                                                            </label>
                                                                        </section>
                                                                    </div> 
                                                                    <div class="row">
                                                                        <section class="col col-4">
                                                                            <label class="select">Area:
                                                                                <select class="area form-control" id="area" name="id_are" >
                                                                                    <option value="">[TODO]</option>
                                                                                </select>
                                                                            </label>
                                                                        </section>

                                                                        <section class="col col-4">
                                                                            <label class="select">Sección:
                                                                                <select class="seccion form-control" id="seccion" name="id_sec" >
                                                                                    <option value="">[TODO]</option>
                                                                                </select>
                                                                            </label>
                                                                        </section>
                                                                        <section class="col col-4" >
                                                                            <label class="select">Puesto:
                                                                                <select class="puesto form-control" id="puesto" name="id_pu" >
                                                                                    <option value="">[TODO]</option>
                                                                                </select>
                                                                            </label>
                                                                        </section>
                                                                    </div>
                                                                </fieldset>
                                                                <button type="button" class="btn btn-default btn-circle btn-lg"><i class="glyphicon glyphicon-search btn_search"></i></button>
                                                                <button type="button" class="btn btn-default btn-circle btn-lg"><i class="glyphicon glyphicon-remove btn_cancel"></i></button>

                                                            </form>
                                                            <table style="display: none" class="table table-striped table-bordered table-hover dataTable no-footer tabla_plant" id="table_plantilla">
                                                                <thead>
                                                                    <tr>
                                                                        <th align="center" style="text-align:center;">Nro</th>
                                                                        <th align="center" style="text-align:center;">Nombre Plantilla</th>
                                                                        <th S style="text-align:center;">Acciones</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody class="tbody-plantilla">
                                                                </tbody>
                                                            </table>

                                                        </div>
                                                        <div class="tab-pane fade" id="BB">

                                                        </div>
                                                        <div class="tab-pane fade" id="CC">
                                                            <p>
                                                                Trust fund seitan letterpress, keytar raw denim keffiyeh etsy art party before they sold out master cleanse gluten-free squid scenester freegan cosby sweater. Fanny pack portland seitan DIY, art party locavore wolf cliche high life echo park Austin. Cred vinyl keffiyeh DIY salvia PBR, banh mi before they sold out farm-to-table.
                                                            </p>
                                                        </div>
                                                    </div>
                                                    <!--  <ul class="nav nav-tabs">
                                                         <li class="active">
                                                             <a data-toggle="tab" href="#AA">Listar</a>
                                                         </li>
                                                        <li>
                                                             <a data-toggle="tab" href="#BB">Tab 2</a>
                                                         </li>
                                                         <li>
                                                             <a data-toggle="tab" href="#CC">Tab 3</a>
                                                         </li>-->
                                                    </ul>
                                                </div>

                                            </div>
                                            <div class="tab-pane" id="hr2">

                                                <ul class="nav nav-tabs">
                                                    <li class="active">
                                                        <a href="#iss1" data-toggle="tab">Nomenclatura</a>
                                                    </li>

                                                    <!-- <li>
                                                         <a href="#iss2" data-toggle="tab">Item 2</a>
                                                     </li>
                                                     <li>
                                                         <a href="#iss3" data-toggle="tab">Item 3</a>
                                                     </li>-->
                                                </ul>
                                                <div class="tab-content padding-10">
                                                    <p class="alert alert-info">
                                                        <i class="fa fa-info"></i> Para que la plantilla pueda reconocer los datos que se van a cargar del Contrato, se debe poner algunas de estar abreviaciones incluyendo los <strong>corchetes</strong>, ejemplo: <strong>[cursos]</strong> </p>
                                                    <div class="tab-pane fade in active" id="iss1">

                                                        <table class="table table-bordered table-striped">
                                                            <thead>
                                                                <tr>
                                                                    <th><i class="fa  fa-align-left"> </i> Abreviación</th>
                                                                    <th><i class="fa fa-chain"> </i>  Significado</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <tr ><td><code>[nombre]</code></td><td>Nombre del trabajador</td></tr>
                                                                <tr><td><code>[app]</code></td><td>Apellido Paterno del trabajador</td></tr>
                                                                <tr><td><code>[apm]</code></td><td>Apellido Materno del trabajador</td></tr>
                                                                <tr><td><code>[dni]</code></td><td>Dni del trabajador</td></tr>
                                                                <tr><td><code>[dir]</code></td><td>direccion del trabajador</td></tr>
                                                                <tr><td><code>[prov]</code></td><td>Provincia actual</td></tr>
                                                                <tr><td><code>[dist]</code></td><td>Distrito en el que estan</td></tr>
                                                                <tr><td><code>[dep]</code></td><td>Departamento en donde se va a desenpeñar</td></tr>
                                                                <tr><td><code>[desde]</code></td><td>fecha de Inicio del contrato</td></tr>
                                                                <tr><td><code>[hasta]</code></td><td>Fecha de Fin del contrato</td></tr>
                                                                <tr><td><code>[puesto]</code></td><td>Puesto que va a desempeñar</td></tr>
                                                                <tr><td><code>[fe_suscripcion]</code></td><td>Fecha de suscripcion</td></tr>
                                                                <tr><td><code>[sueldo]</code></td><td>Sueldo del trabajador</td></tr>
                                                                <tr><td><code>[horas]</code></td><td>Horas de trabajo semanales</td></tr>
                                                                <tr><td><code>[cursos]</code></td><td>Cuesos que va enseñar (en el caso que sea docente)</td></tr>
                                                                <tr><td><code>[funciones_pr]</code></td><td>Funciones primarias que va a desempeñar en el puesto</td></tr>
                                                                <tr><td><code>[funciones_sec]</code></td><td>Funciones secundarias que va a desempeñar en el puesto</td></tr>
                                                                <tr><td><code>[moneda]</code></td><td>Tipo de moneda de pago</td></tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                    <!--<div class="tab-pane fade" id="iss2">
                                                        <p>
                                                            Food truck fixie locavore, accusamus mcsweeney's marfa nulla single-origin coffee squid. Exercitation +1 labore velit, blog sartorial PBR leggings next level wes anderson artisan four loko farm-to-table craft beer twee.
                                                        </p>
                                                    </div>
                                                    <div class="tab-pane fade" id="iss3">
                                                        <p>
                                                            Trust fund seitan letterpress, keytar raw denim keffiyeh etsy art party before they sold out master cleanse gluten-free squid scenester freegan cosby sweater. Fanny pack portland seitan DIY, art party locavore wolf cliche high life echo park Austin. Cred vinyl keffiyeh DIY salvia PBR, banh mi before they sold out farm-to-table.
                                                        </p>
                                                    </div>-->
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <!-- end widget content -->
                                </div>
                                <!-- end widget div -->
                            </div>
                        </article>
                        <article class="col-sm-12 col-md-12 col-lg-8">
                            <div class="jarviswidget jarviswidget-color-blue" id="wid-id-0"  
                                 data-widget-editbutton="false"  
                                 data-widget-fullscreenbutton="false"
                                 data-widget-deletebutton="false"
                                 data-widget-sortable="false" >
                                <header>
                                    <span class="widget-icon"> <i class="fa fa-pencil"></i> </span>
                                    <h2>Editar Platilla</h2>
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
                                        <form class="ckeditor_form form_editor" action="../../../formato_plantilla" method="post" style="width:100%;" align="center">
                                            <br>  <div class="txt_direccion"></div><br>
                                            <div class="row">
                                                <div class="col-lg-8">
                                                    <input type="text" required="" class="form-control nombre_pl" name="no_pl" maxlength="200" placeholder="Nombre de la Plantilla...">
                                                </div>
                                                <div class="col-lg-4"> 
                                                    <button type="button" value="Asignar"  onclick="leer();" rel="tooltip" data-placement="bottom" data-original-title="Asginar Plantilla" name="opc" class="btn btn-primary btn-circle btn-lg btn_asignar"><i class="glyphicon glyphicon-share-alt"></i></button>
                                                    <button type="button" style="display: none" class="btn btn-default btn-circle btn-lg btn_cancel_asignar"><i class="glyphicon glyphicon-remove"></i></button>
                                                </div>
                                            </div><!-- /.row -->
                                            <div class="status_plantilla">
                                            </div>
                                            <input  type="hidden" name="id" value="" class="id_pl"/>
                                            <input  type="hidden" name="id_pc" value="" class="id_pc"/>
                                            <input type="hidden" name="id_dep_asig" id="de_sig">
                                            <input type="hidden" name="id_are_asig" id="ar_sig">
                                            <input type="hidden" name="id_sec_asig" id="se_sig">
                                            <input type="hidden" name="id_di_asig" id="di_sig">
                                            <input type="hidden" name="id_pu_asig" id="pu_sig">
                                            <textarea cols="100" id="editor1" name="editor1" >
                                            </textarea>
                                            <div id="shortcut">
                                                <ul>
                                                    <li>
                                                        <a href="#inbox.html" class="jarvismetro-tile big-cubes bg-color-blue"> <span class="iconbox"> <i class="fa fa-envelope fa-4x"></i> <span>Mail <span class="label pull-right bg-color-darken">14</span></span> </span> </a>
                                                    </li>
                                                    <li>
                                                        <a href="#calendar.html" class="jarvismetro-tile big-cubes bg-color-orangeDark"> <span class="iconbox"> <i class="fa fa-calendar fa-4x"></i> <span>Calendar</span> </span> </a>
                                                    </li>
                                                    <li>
                                                        <a href="#gmap-xml.html" class="jarvismetro-tile big-cubes bg-color-purple"> <span class="iconbox"> <i class="fa fa-map-marker fa-4x"></i> <span>Maps</span> </span> </a>
                                                    </li>
                                                    <li>
                                                        <a href="#invoice.html" class="jarvismetro-tile big-cubes bg-color-blueDark"> <span class="iconbox"> <i class="fa fa-book fa-4x"></i> <span>Invoice <span class="label pull-right bg-color-darken">99</span></span> </span> </a>
                                                    </li>
                                                    <li>
                                                        <a href="#gallery.html" class="jarvismetro-tile big-cubes bg-color-greenLight"> <span class="iconbox"> <i class="fa fa-picture-o fa-4x"></i> <span>Gallery </span> </span> </a>
                                                    </li>
                                                    <li>
                                                        <a href="javascript:void(0);" class="jarvismetro-tile big-cubes selected bg-color-pinkDark"> <span class="iconbox"> <i class="fa fa-user fa-4x"></i> <span>My Profile </span> </span> </a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </form>

                                    </div>
                                    <!-- end widget content -->

                                </div>
                                <!-- end widget div -->

                            </div>
                            <!-- end widget -->

                        </article>
                        <!-- END COL -->
                    </div>
                </section>
            </div>

        </div>
    </div>
</body>
<script data-pace-options='{ "restartOnRequestAfter": true }' src="../../../js/plugin/pace/pace.min.js"></script>

<!-- Link to Google CDN's jQuery + jQueryUI; fall back to local -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
<script>
                                                        if (!window.jQuery) {
                                                            document.write('<script src="../../../js/libs/jquery-2.0.2.min.js"><\/script>');
                                                        }
</script>

<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
<script>
                                                        if (!window.jQuery.ui) {
                                                            document.write('<script src="../../../js/libs/jquery-ui-1.10.3.min.js"><\/script>');
                                                        }
</script>

<!-- IMPORTANT: APP CONFIG -->
<script src="../../../js/app.config.js"></script>

<!-- JS TOUCH : include this plugin for mobile drag / drop touch events-->
<script src="../../../js/plugin/jquery-touch/jquery.ui.touch-punch.min.js"></script> 

<!-- BOOTSTRAP JS -->
<script src="../../../js/bootstrap/bootstrap.min.js"></script>

<!-- CUSTOM NOTIFICATION -->
<script src="../../../js/notification/SmartNotification.min.js"></script>

<!-- JARVIS WIDGETS -->
<script src="../../../js/smartwidgets/jarvis.widget.min.js"></script>

<!-- EASY PIE CHARTS 
<script src="../../../js/plugin/easy-pie-chart/jquery.easy-pie-chart.min.js"></script>-->

<!-- SPARKLINES 
<script src="../../../js/plugin/sparkline/jquery.sparkline.min.js"></script>-->

<!-- JQUERY VALIDATE -->
<script src="../../../js/plugin/jquery-validate/jquery.validate.min.js"></script>

<!-- JQUERY MASKED INPUT 
<script src="../../../js/plugin/masked-input/jquery.maskedinput.min.js"></script>-->

<!-- JQUERY SELECT2 INPUT 
<script src="../../../js/plugin/select2/select2.min.js"></script>-->

<!-- JQUERY UI + Bootstrap Slider 
<script src="../../../js/plugin/bootstrap-slider/bootstrap-slider.min.js"></script>-->

<!-- browser msie issue fix -->
<script src="../../../js/plugin/msie-fix/jquery.mb.browser.min.js"></script>

<!-- FastClick: For mobile devices -->
<script src="../../../js/plugin/fastclick/fastclick.min.js"></script>

<!--[if IE 8]>

<h1>Your browser is out of date, please update your browser by going to www.microsoft.com/download</h1>

<![endif]-->

<!-- Demo purpose only -->
<script src="../../../js/demo.min.js"></script>

<!-- MAIN APP JS FILE -->
<script src="../../../js/app.min.js"></script>

<!-- ENHANCEMENT PLUGINS : NOT A REQUIREMENT -->
<!-- Voice command : plugin 
<script src="../../../js/speech/voicecommand.min.js"></script>-->

<!-- PAGE RELATED PLUGIN(S) -->
<script src="../../../js/plugin/ckeditor/ckeditor.js"></script>

<script>
// The instanceReady event is fired, when an instance of CKEditor has finished
// its initialization.
                                                        CKEDITOR.on('instanceReady', function (ev) {
                                                            // Show the editor name and description in the browser status bar.
                                                            document.getElementById('eMessage').innerHTML = 'Instance <code>' + ev.editor.name + '<\/code> loaded.';

                                                            // Show this sample buttons.
                                                            document.getElementById('eButtons').style.display = 'block';
                                                        });

                                                        function InsertHTML() {
                                                            // Get the editor instance that we want to interact with.
                                                            var editor = CKEDITOR.instances.editor1;
                                                            var value = document.getElementById('htmlArea').value;

                                                            // Check the active editing mode.
                                                            if (editor.mode == 'wysiwyg')
                                                            {
                                                                // Insert HTML code.
                                                                // http://docs.ckeditor.com/#!/api/CKEDITOR.editor-method-insertHtml
                                                                editor.insertHtml(value);
                                                            }
                                                            else
                                                                alert('You must be in WYSIWYG mode!');
                                                        }

                                                        function InsertText() {
                                                            // Get the editor instance that we want to interact with.
                                                            var editor = CKEDITOR.instances.editor1;
                                                            var value = document.getElementById('txtArea').value;

                                                            // Check the active editing mode.
                                                            if (editor.mode == 'wysiwyg')
                                                            {
                                                                // Insert as plain text.
                                                                // http://docs.ckeditor.com/#!/api/CKEDITOR.editor-method-insertText
                                                                editor.insertText(value);
                                                            }
                                                            else
                                                                alert('You must be in WYSIWYG mode!');
                                                        }

                                                        function SetContents() {
                                                            // Get the editor instance that we want to interact with.
                                                            var editor = CKEDITOR.instances.editor1;
                                                            var value = document.getElementById('htmlArea').value;

                                                            // Set editor contents (replace current contents).
                                                            // http://docs.ckeditor.com/#!/api/CKEDITOR.editor-method-setData
                                                            editor.setData(value);
                                                        }

                                                        function GetContents() {
                                                            // Get the editor instance that you want to interact with.
                                                            var editor = CKEDITOR.instances.editor1;

                                                            // Get editor contents
                                                            // http://docs.ckeditor.com/#!/api/CKEDITOR.editor-method-getData
                                                            alert(editor.getData());
                                                            //  alert(editor.getData())
                                                        }

                                                        function ExecuteCommand(commandName) {
                                                            // Get the editor instance that we want to interact with.
                                                            var editor = CKEDITOR.instances.editor1;

                                                            // Check the active editing mode.
                                                            if (editor.mode == 'wysiwyg')
                                                            {
                                                                // Execute the command.
                                                                // http://docs.ckeditor.com/#!/api/CKEDITOR.editor-method-execCommand
                                                                editor.execCommand(commandName);
                                                            }
                                                            else
                                                                alert('You must be in WYSIWYG mode!');
                                                        }

                                                        function CheckDirty() {
                                                            // Get the editor instance that we want to interact with.
                                                            var editor = CKEDITOR.instances.editor1;
                                                            // Checks whether the current editor contents present changes when compared
                                                            // to the contents loaded into the editor at startup
                                                            // http://docs.ckeditor.com/#!/api/CKEDITOR.editor-method-checkDirty
                                                            alert(editor.checkDirty());
                                                        }

                                                        function ResetDirty() {
                                                            // Get the editor instance that we want to interact with.
                                                            var editor = CKEDITOR.instances.editor1;
                                                            // Resets the "dirty state" of the editor (see CheckDirty())
                                                            // http://docs.ckeditor.com/#!/api/CKEDITOR.editor-method-resetDirty
                                                            editor.resetDirty();
                                                            alert('The "IsDirty" status has been reset');
                                                        }

                                                        function Focus() {
                                                            CKEDITOR.instances.editor1.focus();
                                                        }

                                                        function onFocus() {
                                                            document.getElementById('eMessage').innerHTML = '<b>' + this.name + ' is focused </b>';
                                                        }

                                                        function onBlur() {
                                                            document.getElementById('eMessage').innerHTML = this.name + ' lost focus';
                                                        }

                                                        function procesar_texto() {
                                                            var menu = {
                                                                "[nombre]": "Jair",
                                                                "[app]": "Santos",
                                                                "[apm]": "Gonzales",
                                                                "[sexo]": "Masculino",
                                                                "[dni]": "",
                                                                "[dir]": "",
                                                                "[prov]": "",
                                                                "[dist]": "",
                                                                "[dep]": "",
                                                                "[desde]": "",
                                                                "[hasta]": "",
                                                                "[puesto]": "",
                                                                "[fe_actual]": "",
                                                                "[sueldo]": "",
                                                                "[horas]": "",
                                                                "[cursos]": ""
                                                            };
                                                            var editor = CKEDITOR.instances.editor1;
                                                            var string_texto = "";
                                                            var texto = editor.getData();
                                                            var arr_text;
                                                            for (var key in menu) {
                                                                var val = menu[key];
                                                                arr_text = texto.split(key);
                                                                for (var g = 0; g < arr_text.length; g++) {
                                                                    string_texto = string_texto + arr_text[g] + (((g + 1) == arr_text.length) ? "" : " " + val + " ");
                                                                }
                                                                texto = string_texto;
                                                                string_texto = "";
                                                            }
                                                            editor.setData(texto);
                                                        }
                                                        function leer() {
                                                            var ap = $(".ckeditor_form");
                                                            $(".valor_editor").remove();
                                                            var editor = CKEDITOR.instances.editor1.getData();
                                                            ap.append("<input type='hidden' class='valor_editor' value='" + editor + "' name='valor'>");
                                                        }
                                                        function lis_dep(b) {
                                                            $.post("../../../Direccion_Puesto", "opc=Listar_direccion", function (objJson) {
                                                                b.empty();
                                                                if (objJson.rpta == -1) {
                                                                    alert(objJson.mensaje);
                                                                    return;
                                                                }
                                                                var list = objJson.lista;
                                                                b.append("<option value='' selected=''> [TODOS] </option>");
                                                                if (list.length !== 0) {
                                                                    for (var i = 0; i < list.length; i++) {
                                                                        b.append('<option value="' + list[i].id + '">' + list[i].nombre + '</option>');
                                                                    }
                                                                } else {
                                                                    b.append("<option value='' > [] </option>");
                                                                }
                                                            });
                                                        }
                                                        function  lis_dir_id(d, valor) {
                                                            $.post("../../../Direccion_Puesto", "opc=Listar_dir_dep&" + "id=" + valor.trim(), function (objJson) {
                                                                d.empty();
                                                                if (objJson.rpta == -1) {
                                                                    alert(objJson.mensaje);
                                                                    return;
                                                                }
                                                                var list = objJson.lista;
                                                                d.append("<option value='' selected=''> [TODOS] </option>");
                                                                if (list.length !== 0) {
                                                                    for (var i = 0; i < list.length; i++) {
                                                                        d.append('<option value="' + list[i].id + '">' + list[i].nombre + '</option>');
                                                                    }
                                                                } else {
                                                                    d.append("<option value='' > [] </option>");
                                                                }
                                                            });
                                                        }
                                                        function list_area_id(c, valor) {
                                                            $.post("../../../Direccion_Puesto", "opc=Listar_area&" + "id_dep=" + valor, function (objJson) {
                                                                c.empty();
                                                                if (objJson.rpta == -1) {
                                                                    alert(objJson.mensaje);
                                                                    return;
                                                                }
                                                                var list = objJson.lista;
                                                                c.append("<option value='' selected='' > [TODOS] </option>");
                                                                if (list.length !== 0) {
                                                                    for (var i = 0; i < list.length; i++) {
                                                                        c.append('<option value="' + list[i].id + '">' + list[i].nom + '</option>');
                                                                    }
                                                                } else {
                                                                    c.append("<option value='' > [no hay] </option>");
                                                                }
                                                            });
                                                        }
                                                        function list_sec_id(d, valor) {
                                                            $.post("../../../Direccion_Puesto", "opc=Listar_sec&" + "id_are=" + valor, function (objJson) {
                                                                d.empty();
                                                                if (objJson.rpta == -1) {
                                                                    alert(objJson.mensaje);
                                                                    return;
                                                                }
                                                                var list = objJson.lista;
                                                                d.append("<option value='' selected='' > [TODOS] </option>");
                                                                if (list.length !== 0) {
                                                                    for (var i = 0; i < list.length; i++) {
                                                                        d.append('<option value="' + list[i].id + '">' + list[i].nom + '</option>');
                                                                    }
                                                                } else {
                                                                    d.append("<option value='' > [no hay] </option>");
                                                                }
                                                            });
                                                        }

                                                        function mostrar_plantilla(valor) {
                                                            var editor = CKEDITOR.instances.editor1;
                                                            $.post("../../../formato_plantilla", "opc=Listar&id=" + valor, function (objJson) {
                                                                if (objJson.rpta == -1) {
                                                                    alert(objJson.mensaje);
                                                                    return;
                                                                }
                                                                var imprimir = objJson.imprimir;
                                                                editor.setData(imprimir);
                                                            });

                                                        }
                                                        function Listar_Plantilla() {
                                                            var d = $(".tbody-plantilla");
                                                            var texto = "";
                                                            $.post("../../../formato_plantilla", "opc=List_Plamtillas&" + "id_dir=" + $(".dir").val() + "&id_dep=" + $(".dep").val() + "&id_are=" + $(".area").val() + "&sec=" + $(".seccion").val() + "&id_pu=" + $(".puesto").val(), function (objJson) {
                                                                d.empty();
                                                                if (objJson.rpta == -1) {
                                                                    alert(objJson.mensaje);
                                                                    return;
                                                                }
                                                                var list = objJson.lista;
                                                                if (list.length > 0) {
                                                                    for (var i = 0; i < list.length; i++) {
                                                                        texto += '<tr style="height:5px" class="tr_li_plantilla" data-value="' + i + '">';
                                                                        texto += '<td align="center" style="width:.5%">' + (i + 1) + '</td>';
                                                                        texto += '<td ><i class="fa fa-file-text"></i> ' + list[i].nom_pl + '</td>';
                                                                        texto += '<input type="hidden" value="' + list[i].id + '" class="id_plantilla' + i + '" />';
                                                                        texto += '<input type="hidden" value="' + list[i].nom_ar + '" class="plantilla' + i + '" />';
                                                                        texto += '<input type="hidden" value="' + list[i].id_pp + '" class="idplpu' + i + '" />';
                                                                        texto += '<input type="hidden" value="' + list[i].nom_pl + '" class="nom_pl' + i + '" />';
                                                                        texto += '<input type="hidden" value="' + list[i].direccion + '" class="direccion' + i + '" />';
                                                                        if (list[i].es_pl === '1') {
                                                                            texto += '<td align="center" ><button style="width: 100px" type="button" value="' + i + '" class="btn btn-xs btn-danger btn-Desac_pl">Desactivar</button></td>';
                                                                        } else {
                                                                            texto += '<td align="center"><button style="width: 100px" type="button" value="' + i + '" class=" btn btn-xs btn-success btn-Activ_pl">Activar</button></td>';
                                                                        }
                                                                    }
                                                                    texto += '</tr>';
                                                                    d.append(texto);
                                                                    $(".tabla_plant").show('slow');
                                                                }
                                                                else {
                                                                    // d.append("<tr><td>NO HAY PLANTILLAS</td></tr>");
                                                                }
                                                                document.getElementById("table_plantilla").onselectstart = function () {
                                                                    return false;
                                                                }


                                                                $(".tr_li_plantilla").dblclick(function () {
                                                                    $(".tr_li_plantilla").removeClass("success");
                                                                    $(this).addClass("success");
                                                                    var valor = $(this).data('value');
                                                                    mostrar_plantilla($(".plantilla" + valor).val());
                                                                    $(".id_pl").val($(".plantilla" + valor).val());
                                                                    $(".id_pc").val($(".id_plantilla" + valor).val());
                                                                    $(".nombre_pl").val("");
                                                                    $(".nombre_pl").val($(".nom_pl" + valor).val());
                                                                    $(".txt_direccion").empty();
                                                                    $(".txt_direccion").append($(".direccion" + valor).val());
                                                                    $.smallBox({
                                                                        content: "<i class='fa fa-clock-o'></i> <i>La plantilla ha sido cargada con exito...</i>",
                                                                        color: "#296191",
                                                                        iconSmall: "fa fa-cloud bounce animated",
                                                                        timeout: 3000
                                                                    });
                                                                    var editor = CKEDITOR.instances.editor1;
                                                                    editor.focus();
                                                                })
                                                                $(".btn-Desac_pl").click(function () {
                                                                    var idpp = $(".idplpu" + $(this).val()).val();
                                                                    var opc = "Desactivar_pp";
                                                                    Desac_Plantilla(idpp, opc);
                                                                });
                                                                $(".btn-Activ_pl").click(function () {
                                                                    var idpp = $(".idplpu" + $(this).val()).val();
                                                                    var opc = "activar_pp";
                                                                    Activar_Plantilla(idpp, opc);
                                                                });
                                                            });
                                                        }
                                                        function Activar_Plantilla(id_pp, opc) {
                                                            $.post("../../../formato_plantilla", "opc=" + opc + "&id_pp=" + id_pp, function () {
                                                                Listar_Plantilla();
                                                            });
                                                        }
                                                        function Desac_Plantilla(id_pp, opc) {
                                                            $.post("../../../formato_plantilla", "opc=" + opc + "&id_pp=" + id_pp, function () {
                                                                Listar_Plantilla();
                                                            });
                                                        }
                                                        function  lis_sel(d, valor, opc) {
                                                            $.post("../../../Direccion_Puesto", "opc=" + opc + "&" + "id=" + valor, function (objJson) {
                                                                d.empty();
                                                                var list = objJson.lista;
                                                                d.append("<option value='0' selected=''> [TODOS] </option>");
                                                                if (list.length !== 0) {
                                                                    for (var i = 0; i < list.length; i++) {
                                                                        d.append('<option value="' + list[i].id + '">' + list[i].nombre + '</option>');
                                                                    }
                                                                } else {
                                                                    d.append("<option value='0' > [] </option>");
                                                                }
                                                            });
                                                        }
                                                        function list_dir_fil(c, fil) {
                                                            $.post("../../../Direccion_Puesto", "opc=Listar_direccion_filial&id_fil=" + fil.val(), function (objJson) {
                                                                c.empty();
                                                                if (objJson.rpta == -1) {
                                                                    alert(objJson.mensaje);
                                                                    return;
                                                                }
                                                                var list = objJson.lista;
                                                                c.append("<option value='' > [SELECCIONE] </option>");
                                                                if (list.length !== 0) {
                                                                    for (var i = 0; i < list.length; i++) {
                                                                        c.append('<option value="' + list[i].id + '">' + list[i].nombre + '</option>');
                                                                    }
                                                                } else {
                                                                    c.append("<option value='' > [] </option>");
                                                                }
                                                            });
                                                        }
                                                        function status_plantilla(status) {
                                                            var div_status_pl = $(".status_plantilla");
                                                            div_status_pl.empty();
                                                            if (status === '0') {
                                                                div_status_pl.append('<div class="alert alert-warning fade in"> <button class="close" data-dismiss="alert"> ×</button> <i class="fa-fw fa fa-refresh"></i> <strong></strong> Guardando...</div>');
                                                            } else if (status === '1') {
                                                                div_status_pl.append('<div class="alert alert-info fade in"><i class="fa-fw fa fa-info"></i><strong></strong> Todos los cambios guardados</div>');
                                                            } else if (status === '-1') {
                                                                div_status_pl.append('<div class="alert alert-danger fade in"> <i class="fa-fw fa fa-times"></i><strong></strong> Ocurrió un error al guardar</div>');
                                                            } else {
                                                                div_status_pl.append('<div class="alert alert-danger fade in"> <i class="fa-fw fa fa-times"></i><strong></strong> Ocurrió un error al guardar</div>');
                                                            }

                                                        }
</script>

<script type="text/javascript">
    $(document).ready(function () {
        pageSetUp();
        $.sound_path = "../../../sound/", $.sound_on = !0, jQuery(document).ready(function () {
            $("body").append("<div id='divSmallBoxes'></div>"), $("body").append("<div id='divMiniIcons'></div><div id='divbigBoxes'></div>");
        });
        $(".nombre_pl").keyup(function () {
            status_plantilla('0');
            if ($(".id_pl").val() != "" & $(this).val() != "") {
                $.ajax({
                    url: "../../../formato_plantilla", type: 'POST', data: "nom_pl=" + $(this).val() + "&id=" + $(".id_pc").val() + "&opc=UpdateNameFile", success: function (data, textStatus, jqXHR) {
                        Listar_Plantilla();
                        status_plantilla(data.rpta);
                    }
                });
            }
        });
        $(".btn_search").click(function () {
            Listar_Plantilla();
        });
        $(".btn_cancel").click(function () {
            $(".form_cargar")[0].reset();
            $("#form_asignar")[0].reset();
            $(".tabla_plant").hide();
        });
        $(".btn_cancel_asignar").click(function () {
            $(this).hide(200);
            $("#form_asignar").hide(200);
            $(".form_cargar").show();
            $(".tabla_plant").show();
        });
        $(".btn_asignar").click(function () {

            $(".btn_cancel_asignar").show(200);
            $(".form_cargar").hide();
            $(".tabla_plant").hide();
            $("#form_asignar").show(200);
            //  $(".form_editor").valid();
            if ($("#form_asignar").valid() & $(".form_editor").valid()) {
                var opc = "";
                if ($(".id_pc").val() == "") {
                    opc = "Crear_Plantilla";
                } else {
                    opc = "Asignar";
                }
                $.ajax({
                    url: "../../../formato_plantilla",
                    data: $(".form_editor").serialize() + "&opc=" + opc,
                    type: 'POST',
                    success: function (data, textStatus, jqXHR) {
                        if (opc == "Crear_Plantilla") {
                            if (data.rpta === "1") {
                                $(".form_editor")[0].reset();
                                $.smallBox({
                                    title: "¡Felicitaciones!",
                                    content: "<i class='fa fa-clock-o'></i> <i>El formato de plantilla contractual se ha subido con éxito...</i>",
                                    color: "#296191",
                                    iconSmall: "fa fa-cloud bounce animated",
                                    timeout: 7000
                                });
                            } else if (data.rpta === "-1") {
                                $.smallBox({
                                    title: "¡Alerta!",
                                    content: "<i class='fa fa-clock-o'></i> <i>Ha ocurrido un error al procesar su plantilla...</i>",
                                    color: "#C46A69",
                                    iconSmall: "fa fa-cloud bounce animated",
                                    timeout: 7000
                                });
                            }
                        } else {
                            if (data.rpta === "1") {
                                $(".form_editor")[0].reset();
                                $.smallBox({
                                    title: "¡Felicitaciones!",
                                    content: "<i class='fa fa-clock-o'></i> <i>El formato de plantilla contractual se ha subido con éxito...</i>",
                                    color: "#296191",
                                    iconSmall: "fa fa-cloud bounce animated",
                                    timeout: 7000
                                });
                            } else if (data.rpta === "-1") {
                                $.smallBox({
                                    title: "¡Alerta!",
                                    content: "<i class='fa fa-clock-o'></i> <i>Ha ocurrido un error al procesar su plantilla...</i>",
                                    color: "#C46A69",
                                    iconSmall: "fa fa-cloud bounce animated",
                                    timeout: 7000
                                });
                            }
                        }
                    }
                });
            }
        });
        var b = $(".dir");
        var c = $(".dir_as");
        $(".fil").change(function () {
            var c = $(".dir");
            list_dir_fil(c, $(this));
        });
        $(".fil_as").change(function () {
            var c = $(".dir_as");
            list_dir_fil(c, $(this));
        });
        $("#dir").change(function () {
            var d = $(".dep");
            var valor = $("#dir").val();
            lis_dir_id(d, valor);
            Listar_Plantilla();
        });
        $(".dep").change(function () {
            Listar_Plantilla();
            list_area_id($(".area"), $(this).val());
        });

        $(".area").change(function () {
            var d = $(".seccion");
            Listar_Plantilla();
            list_sec_id(d, $(this).val());
        });

        $(".seccion").change(function () {
            Listar_Plantilla();
            var e = $(".puesto");
            $.post("../../../Direccion_Puesto", "opc=Listar_pu_id&" + "id=" + $(this).val(), function (objJson) {
                e.empty();
                if (objJson.rpta == -1) {
                    alert(objJson.mensaje);
                    return;
                }
                var list = objJson.lista;
                e.append("<option value='' selected='' > [TODOS] </option>");
                if (list.length !== 0) {
                    for (var i = 0; i < list.length; i++) {
                        e.append('<option value="' + list[i].id + '">' + list[i].nombre + '</option>');
                    }
                } else {
                    e.empty();
                    e.append("<option value='' > [] </option>");
                }
            });
        });
        $(".puesto").change(function () {
            Listar_Plantilla();
        });
        $(".dir_as").change(function () {
            var d = $(".dep_as");
            var valor = $(".dir_as").val();
            var opc = "Listar_dir_dep";
            lis_sel(d, valor, opc);
            $("#di_sig").val(valor.trim());

        });
        $(".dep_as").change(function () {
            var d = $(".area_as");
            var valor = $(".dep_as").val();
            var opc = "Listar_area2";
            lis_sel(d, valor, opc);
            $("#de_sig").val(valor.trim());
        });
        $(".area_as").change(function () {
            var d = $(".seccion_as");
            var valor = $(".area_as").val();
            var opc = "Listar_sec2";
            lis_sel(d, valor, opc);
            $("#ar_sig").val(valor.trim());
        });
        $(".seccion_as").change(function () {
            var d = $(".puesto_as");
            var valor = $(".seccion_as").val();
            var opc = "Listar_pu_id";
            lis_sel(d, valor, opc);
            $("#se_sig").val(valor.trim());
        });
        $(".puesto_as").change(function () {
            $("#pu_sig").val($(".puesto_as").val().trim());

        })
        $("#form_asignar").validate({
            errorPlacement: function (error, element) {
                error.insertAfter(element.parent());
            }
        });
        CKEDITOR.replace('editor1',
                {
                    toolbar:
                            [['Source', '-', 'NewPage', 'Preview', '-', 'Templates'],
                                ['Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord', '-', 'Print', 'SpellChecker', 'Scayt'],
                                ['Undo', 'Redo', '-', 'Find', 'Replace', '-', 'SelectAll', 'RemoveFormat'],
                                ['Form', 'Checkbox', 'Radio', 'TextField', 'Textarea', 'Select', 'Button', 'ImageButton', 'HiddenField'],
                                '/',
                                ['Bold', 'Italic', 'Underline', 'Strike', '-', 'Subscript', 'Superscript'],
                                ['NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', 'Blockquote'],
                                ['JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock'],
                                ['Link', 'Unlink', 'Anchor'],
                                ['Image', 'Flash', 'Table', 'HorizontalRule', 'Smiley', 'SpecialChar', 'PageBreak'],
                                '/',
                                ['Styles', 'Format', 'Font', 'FontSize'],
                                ['TextColor', 'BGColor'],
                                ['Maximize', 'ShowBlocks', '-', 'About'],
                                ['Styles', 'Format'],
                                ['Bold', 'Italic', '-', 'NumberedList', 'BulletedList', '-', 'Link', '-', 'About']
                            ],
                    height: '1024px'
                });

        var editor = CKEDITOR.instances.editor1;
        editor.on('change', function () {
            leer();
            status_plantilla('0');
            $.ajax({
                url: "../../../formato_plantilla",
                data: $(".form_editor").serialize() + "&opc=Actualizar",
                type: 'POST',
                success: function (data, textStatus, jqXHR) {
                    setTimeout(function () {
                        status_plantilla(data.rpta);
                    }, 1000);

                }
            });
        });
    })

</script>
</html>

<%} else {
        out.print("<script> window.parent.location.href = '/TALENTO_HUMANO/';</script>");
    }
%>