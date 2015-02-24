
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html><head>


        <meta http-equiv="content-type" content="text/html; charset=UTF-8">

        <title>Tablas con Filtros</title>

        <!-- Basic Styles -->
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
        <link rel="apple-touch-icon" href="img/splash/sptouch-icon-iphone.png">
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

        <script type="text/javascript" src="../../../js/JQuery/jQuery.js" ></script>
        <style type="text/css" title="currentStyle">
            @import "../../../js/DataTables-1.10.4/media/css/demo_page.css";
            @import "../../../js/DataTables-1.10.4/media/css/demo_table.css";
            @import "../../../js/DataTables-1.10.4/media/css/themes/base/jquery-ui.css";
            @import "../../../js/DataTables-1.10.4/media/css/themes/smoothness/jquery-ui-1.7.2.custom.css";
        </style>

        <script src="../../../js/DataTables-1.10.4/media/js/jquery-1.4.4.min.js" type="text/javascript"></script>
        <script src="../../../js/DataTables-1.10.4/media/js/jquery.dataTables.js" type="text/javascript"></script>

        <script src="../../../js/DataTables-1.10.4/media/js/jquery-ui.js" type="text/javascript"></script>

        <script src="../../../js/DataTables-1.10.4/media/js/jquery.dataTables.columnFilter.js" type="text/javascript"></script>

        <script type="text/javascript" charset="utf-8">
            $(document).ready(function() {
                $('#example').dataTable().columnFilter({aoColumns: [
                        {type: "select", values: ["2015-1", "2015-0", "2014-2", "2014-1", "2014-0"], sSelector: "#ssemestre"},
                        {type: "select", values: ["N/A"], sSelector: "#sarose"},
                        {type: "select", values: ["N/A"], sSelector: "#sfacultad"},
                        {type: "select", values: ["N/A"], sSelector: "#scarrera"},
                        {type: "select", values: ["N/A"], sSelector: "#ssitedu"},
                        {type: "select", values: ["N/A"], sSelector: "#sprofdoc"},
                        {type: "select", values: ["N/A"], sSelector: "#scondi"},
                        //---- OTROS TIPOS DE FILTROS -----
                        /*{type: "select", sSelector: "#renderingEngineFilter"},
                         {sSelector: "#browserFilter"},
                         {type: "date-range", sSelector: "#platformsFilter"},
                         {type: "number-range", sSelector: "#engineVersionFilter"},
                         {type: "select", values: ["1", "2", "C"], sSelector: "#cssGradeFilter1"}*/
                    ]}
                );

            });
        </script>
        <script type="text/javascript">

            var _gaq = _gaq || [];
            _gaq.push(['_setAccount', 'UA-17838786-4']);
            _gaq.push(['_trackPageview']);

            (function() {
                var ga = document.createElement('script');
                ga.type = 'text/javascript';
                ga.async = true;
                ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
                var s = document.getElementsByTagName('script')[0];
                s.parentNode.insertBefore(ga, s);
            })();

        </script>
    </head>



    <h1 align="center" style="font-weight: bold;">CARGA ACADÉMICA</h1>
    <body id="dt_example">

        <!--DATATABLE FILTRO DEMO-->
        <div id="container">


            <table cellspacing="0" cellpadding="0" border="0" class="display" ID="Table1">
                <thead>
                    <tr>
                        <th colspan="2">FILTRO</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <th></th>
                        <th></th>
                    </tr>
                </tfoot>
                <tbody>
                    <tr id="filter_global">
                        <td align="center">Semestre:</td>
                        <td align="center" id="ssemestre"></td>
                    </tr>
                    <tr id="filter_col4">
                        <td align="center">Area o Sede.</td>
                        <td align="center" id="sarose"></td>
                    </tr>
                    <tr id="filter_col4">
                        <td align="center">Facultad:</td>
                        <td align="center" id="sfacultad"></td>
                    </tr>
                    <tr id="filter_col4">
                        <td align="center">Carrera</td>
                        <td align="center" id="scarrera"></td>
                    </tr>
                    <tr id="filter_col4">
                        <td align="center">Situación Educativa:</td>
                        <td align="center" id="ssitedu"></td>
                    </tr>
                    <tr id="filter_col4">
                        <td align="center">Profesión Docente:</td>
                        <td align="center" id="sprofdoc"></td>
                    </tr>
                    <tr id="filter_col4">
                        <td align="center">Condición</td>
                        <td align="center" id="scondi"></td>
                    </tr>

                </tbody>

            </table>


            <div id="demo">

                <table cellpadding="0" cellspacing="0" border="0" class="display" id="example">
                    <thead>
                        <tr>
                            <th>Tipo de Documento</th>
                            <th>N° Documento</th>
                            <th>Apellidos y Nombres</th>
                            <th>Escuela</th>
                            <th>Facultad</th>
                            <th>Ciclo</th>
                            <th>Fecha Inicio</th>
                            <th>Fecha Cese</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                        </tr>
                    </tfoot>
                    <tbody>
                        <tr class="odd_gradeX" id="2">
                            <td class="read_only">DNI</td>
                            <td>76845433</td>
                            <td>Galarza Roncal David</td>
                            <td class="center">Ing.Sistemas</td>
                            <td class="center">FIA</td>
                            <td class="center">1</td>
                            <td class="center">12/03/2015</td>
                            <td class="center">12/06/2015</td>
                            <td class="center">A</td>
                        </tr>
                        <tr class="even_gradeC" id="4">
                            <td class="read_only">DNI</td>
                            <td>76225423</td>
                            <td>Chambi Rojas Ronald</td>
                            <td class="center">Comunicaciones</td>
                            <td class="center">FACIHED</td>
                            <td class="center">2</td>
                            <td class="center">12/06/2015</td>
                            <td class="center">12/10/2015</td>
                            <td class="center">B</td>
                        </tr>


                    </tbody>
                </table>

            </div>
            <!--<div class="spacer" style="border: 3px solid black;"></div>-->

        </div>
        <!--CARGA ACADEMICA-->
    <center>
        <h1>CARGA ACADEMICA</h1>
        <form action="">
            <label>Semestre :</label><select class="semestre">
                <option value="">[SELECCIONE]</option>
                <option value="2015-1">2015-1</option>
                <option value="2015-0">2015-0</option>
                <option value="2014-2">2014-2</option>
                <option value="2014-1">2014-1</option>
                <option value="2014-0">2014-0</option>
            </select>
            <br>
            <label>Area o Sede :</label><select>
                <option></option>
            </select>
            <br>

            <label>Facultad :</label><select>
                <option></option>
            </select>
            <br>
            <label>Carrera :</label><select>
                <option></option>
            </select>
            <br>
            <label>Situación Educativa :</label><select>
                <option></option>
            </select>
            <br>
            <label>Profesión Docente :</label><select>
                <option></option>
            </select>
            <br>
            <label>Condición :</label><select>
                <option></option>
            </select>
            <br>
            <!--<label>Funciones :</label><select>
                <option></option>
            </select>
            <br>-->

        </form>
        <button type="button" class="listar">
            Listar
        </button>
        <table border="1">
            <thead>
                <tr>
                    <th>Tipo Doc</th>
                    <th>Num. Doc</th>
                    <th>APELLIDOS Y NOMBRES</th>
                    <th>ESCUELA</th>
                    <th>FACULTAD</th>
                    <th>CICLO</th>
                    <th>FECHA INICIO</th>
                    <th>FECHA CESE</th>
                    <th>ACCIONES</th>
                </tr>

            </thead>
            <tbody class="tbody-carga">


            </tbody>
        </table>
    </center>
    <!--================================================== -->

		<!-- PACE LOADER - turn this on if you want ajax loading to show (caution: uses lots of memory on iDevices)-->
		<script data-pace-options='{ "restartOnRequestAfter": true }' src="../../../js/plugin/pace/pace.min.js"></script>

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
		<script src="js/app.config.js"></script>

		<!-- JS TOUCH : include this plugin for mobile drag / drop touch events-->
		<script src="js/plugin/jquery-touch/jquery.ui.touch-punch.min.js"></script> 

		<!-- BOOTSTRAP JS -->
		<script src="js/bootstrap/bootstrap.min.js"></script>

		<!-- CUSTOM NOTIFICATION -->
		<script src="js/notification/SmartNotification.min.js"></script>

		<!-- JARVIS WIDGETS -->
		<script src="js/smartwidgets/jarvis.widget.min.js"></script>

		<!-- EASY PIE CHARTS -->
		<script src="js/plugin/easy-pie-chart/jquery.easy-pie-chart.min.js"></script>

		<!-- SPARKLINES -->
		<script src="js/plugin/sparkline/jquery.sparkline.min.js"></script>

		<!-- JQUERY VALIDATE -->
		<script src="js/plugin/jquery-validate/jquery.validate.min.js"></script>

		<!-- JQUERY MASKED INPUT -->
		<script src="js/plugin/masked-input/jquery.maskedinput.min.js"></script>

		<!-- JQUERY SELECT2 INPUT -->
		<script src="js/plugin/select2/select2.min.js"></script>

		<!-- JQUERY UI + Bootstrap Slider -->
		<script src="js/plugin/bootstrap-slider/bootstrap-slider.min.js"></script>

		<!-- browser msie issue fix -->
		<script src="js/plugin/msie-fix/jquery.mb.browser.min.js"></script>

		<!-- FastClick: For mobile devices -->
		<script src="js/plugin/fastclick/fastclick.min.js"></script>

		<!--[if IE 8]>

		<h1>Your browser is out of date, please update your browser by going to www.microsoft.com/download</h1>

		<![endif]-->

		<!-- Demo purpose only -->
		<script src="js/demo.min.js"></script>

		<!-- MAIN APP JS FILE -->
		<script src="js/app.min.js"></script>

		<!-- ENHANCEMENT PLUGINS : NOT A REQUIREMENT -->
		<!-- Voice command : plugin -->
		<script src="js/speech/voicecommand.min.js"></script>

		<!-- PAGE RELATED PLUGIN(S) -->


		<script type="text/javascript">
		// DO NOT REMOVE : GLOBAL FUNCTIONS!
		$(document).ready(function() {
			pageSetUp();
		})

		</script>

		<!-- Your GOOGLE ANALYTICS CODE Below -->
		<script type="text/javascript">
		var _gaq = _gaq || [];
		_gaq.push(['_setAccount', 'UA-XXXXXXXX-X']);
		_gaq.push(['_trackPageview']);
		
		(function() {
			var ga = document.createElement('script');
			ga.type = 'text/javascript';
			ga.async = true;
			ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
			var s = document.getElementsByTagName('script')[0];
			s.parentNode.insertBefore(ga, s);
		})();

		</script>
</body>
<script>

    (function($) {
        $(document).ready(function() {

            var url = 'http://localhost/demo/data.php';

            $(".semestre").change(function() {

                $('.tbody-carga').empty();
                $('.tbody-carga').append("<tr><td colspan='9' >Cargando... </td></tr>");
                $.post(url, "semestre=" + $(".semestre").val(), function(data) {
                    $('.tbody-carga').empty();
                    $.each(data, function(i, campo) {
                        $('.tbody-carga').append('<tr>');
                        $('.tbody-carga').append('<td>' + campo.tipodocumento + '</td>');
                        $('.tbody-carga').append('<td>' + campo.numerodocumento + '</td>');
                        $('.tbody-carga').append('<td>' + campo.apepat + ' ' + campo.apemat + ' ' + campo.nombre + '</td>');
                        $('.tbody-carga').append('<td>' + campo.eap + '</td>');
                        $('.tbody-carga').append('<td>' + campo.facultad + '</td>');
                        $('.tbody-carga').append('<td>' + campo.carga + '</td>');
                        $('.tbody-carga').append('<td></td>');
                        $('.tbody-carga').append('<td></td>');
                        $('.tbody-carga').append('<td><a href="../../../carga_academica?opc=Completar_Datos&nro_doc=' + campo.numerodocumento + '&ap_p=' + campo.apepat + '&ap_m=' + campo.apemat + '&no_tr=' + campo.nombre + '&ti_doc=' + campo.tipodocumento + '&hl=' + campo.hlab + '">Completar datos</a><a href="Horario_Academico.jsp?dni=' + campo.numerodocumento + '&semestre=' + $(".semestre").val() + '">Ver Cursos</a></td>');
                        $('.tbody-carga').append('</tr>');
                    });
                });
            });



        });
    })(jQuery);

</script>




</html>