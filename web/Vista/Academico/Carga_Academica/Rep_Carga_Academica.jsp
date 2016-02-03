
<%@page import="pe.edu.upeu.application.model.Carga_Academica"%>
<%@page import="pe.edu.upeu.application.dao.Carga_AcademicaDAO"%>
<%@page import="pe.edu.upeu.application.dao_imp.InterfaceCarga_AcademicaDAO"%>
<jsp:useBean id="ListCarAca" scope="session" class="java.util.ArrayList"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Carga Académica</title>

        <meta name="description" content="">
        <meta name="author" content="">

        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <!-- Basic Styles -->
        <link rel="stylesheet" type="text/css" media="screen" href="../../../css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../../css/font-awesome.min.css">
        <!-- SmartAdmin Styles : Please note (smartadmin-production.css) was created using LESS variables -->
        <link rel="stylesheet" type="text/css" media="screen" href="../../../css/smartadmin-production.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../../css/smartadmin-skins.min.css">

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



    </head>

    <body id="" >
        <!-- RIBBON -->
        <div id="main" role="main" style="margin: 0px;">


            <div id="content">
                <section id="widget-grid" class="">
                    <div class="row">

                        <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

                            <div class="jarviswidget jarviswidget-color-darken" id="wid-id-0" data-widget-editbutton="false">
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
                                    <span class="widget-icon"> <i class="fa fa-table"></i> </span>
                                    <h2>Standard Data Tables </h2>

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

                                        <table  id="example" class="table table-striped table-bordered table-hover" width="100%">
                                            <thead>
                                                <tr>
                                                    <th>Tipo Documento</th>
                                                    <th>N° Documento</th>
                                                    <th>Apellidos y Nombres</th>
                                                    <th>Facultad</th>
                                                    <th>Escuela</th>
                                                    <th>Situación Educativa</th>
                                                    <th>Profesión Docente</th>
                                                    <th>Condición</th>
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
                                                    <th></th>
                                                    <th></th>
                                                    <th></th>
                                                </tr>
                                            </tfoot>
                                            <tbody>
                                                <%
                                                    for (int i = 0; i < ListCarAca.size(); i++) {
                                                        Carga_Academica ca = new Carga_Academica();
                                                        ca = (Carga_Academica) ListCarAca.get(i);
                                                %>
                                                <tr >
                                                    <td><%=ca.getEs_tipo_doc()%></td>
                                                    <td><%=ca.getNu_doc()%></td>
                                                    <td><%=ca.getAp_paterno() + " " + ca.getAp_materno() + " " + ca.getNo_trabajador()%></td>
                                                    <td><%=ca.getNo_facultad()%></td>
                                                    <td><%=ca.getNo_eap()%></td>
                                                    <td><%=ca.getNo_s_educativa()%></td>
                                                    <td><%=ca.getProfesion_docente()%></td>
                                                    <td><%=ca.getDe_condicion()%></td>
                                                    <td><%=ca.getDe_carga()%></td>
                                                    <td><%=ca.getFe_desde()%></td>
                                                    <td><%=ca.getFe_hasta()%></td>
                                                    <td><a href="../../../carga_academica?opc=Completar_Datos&nro_doc=<%=ca.getNu_doc()%>&ap_p=<%=ca.getAp_paterno()%>&ap_m=<%=ca.getAp_materno()%>&no_tr=<%=ca.getNo_trabajador()%>&ti_doc=<%=ca.getEs_tipo_doc()%>&eap=<%=ca.getNo_eap()%>&facultad=<%=ca.getNo_facultad()%>" class="btn btn-primary" >Completar Datos</a></td>
                                                </tr>
                                                <%}%>
                                            </tbody>
                                        </table>
                                    </div>
                                    <!-- end widget content -->

                                </div>
                                <!-- end widget div -->

                            </div>
                        </article>
                    </div>
                </section>
            </div>
        </div>

        <h1 align="center" style="font-weight: bold;">CARGA ACADÉMICA</h1>
    <center>
        <label>Semestre :</label><select class="semestre">
            <option value="">[seleccione]</option>
            <option value="2015-1">2015-1</option>
            <option value="2015-0">2015-0</option>
            <option value="2014-2">2014-2</option>
            <option value="2014-1">2014-1</option>
            <option value="2014-0">2014-0</option>
        </select>
    </center>
    <!--body id="dt_example"-->
    <!--DATATABLE FILTRO DEMO-->




    <!--<div class="spacer" style="border: 3px solid black;"></div>-->


    <!--CARGA ACADEMICA-->
    <center>
        <h1>Carga Académica</h1>
        <table border="1">
            <thead>
                <tr>
                    <th>Tipo Doc</th>
                    <th>Num. Doc</th>
                    <th>Apellidos Y Nombres</th>
                    <th>Escuela</th>
                    <th>Facultad</th>
                    <th>Ciclo</th>
                    <th>Fecha Inicio</th>
                    <th>Fecha Cese</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody class="tbody-carga">
            </tbody>
        </table>

    </center>


</body>
<!-- PACE LOADER - turn this on if you want ajax loading to show (caution: uses lots of memory on iDevices)-->
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
<script src="../../../js/DataTables-1.10.4/media/js/jquery.dataTables.js" type="text/javascript"></script>
<script src="../../../js/DataTables-1.10.4/media/js/jquery-ui.js" type="text/javascript"></script>
<script src="../../../js/DataTables-1.10.4/media/js/jquery.dataTables.columnFilter.js" type="text/javascript"></script>

<script>
    (function ($) {
        $(document).ready(function () {
            $('#example').dataTable().columnFilter({
                aoColumns: [
                    {type: "select", sSelector: "#stipodoc"},
                    //{type: "select", values: ["N/A"], sSelector: "#sarose"},
                    {sSelector: "#bndoc"},
                    {sSelector: "#bapenom"},
                    {type: "select", sSelector: "#sfacultad"},
                    {type: "select", sSelector: "#sescuela"},
                    {type: "select", sSelector: "#ssitedu"},
                    {type: "select", sSelector: "#sprofdoc"},
                    {type: "select", sSelector: "#scondi"},
                    //---- OTROS TIPOS DE FILTROS -----
                    /*{type: "select", sSelector: "#renderingEngineFilter"},
                     {sSelector: "#browserFilter"},
                     {type: "date-range", sSelector: "#platformsFilter"},
                     {type: "number-range", sSelector: "#engineVersionFilter"},
                     {type: "select", values: ["1", "2", "C"], sSelector: "#cssGradeFilter1"}*/
                ]}
            );



            var url = 'http://192.168.13.52/demo/data.php';

            $(".semestre").change(function () {

                $('.tbody-carga').empty();
                $('.tbody-carga').append("<tr><td colspan='9' >Cargando... </td></tr>");
                $.post(url, "semestre=" + $(".semestre").val(), function (data) {
                    $('.tbody-carga').empty();
                    $.each(data, function (i, campo) {

                        //$.post("../../../dgp",function(){alert()});
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
