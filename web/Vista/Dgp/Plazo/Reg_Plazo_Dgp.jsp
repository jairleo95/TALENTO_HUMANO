<%@page import="pe.edu.upeu.application.properties.globalProperties"%>
<%@page import="pe.edu.upeu.application.model.Usuario"%>
<%
    HttpSession sesion = request.getSession();
    String id_user = (String) sesion.getAttribute("IDUSER");
    if (id_user != null) {
%>
<%-- 
Document   : Reg_Plazo_Dgp
Created on : 08-nov-2014, 15:58:07
Author     : JAIR
--%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar Plazo</title>
        <link rel="stylesheet" type="text/css" media="screen" href="../../../css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../../css/font-awesome.min.css">
        <!-- SmartAdmin Styles : Please note (smartadmin-production.css) was created using LESS variables -->

        <link rel="stylesheet" type="text/css" media="screen" href="../../../css/smartadmin-production-plugins.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../../css/smartadmin-production.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../../css/smartadmin-skins.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../../css/demo.min.css">
        <!-- #FAVICONS -->
        <link rel="shortcut icon" href="../../../img/favicon/favicon.ico" type="image/x-icon">
        <link rel="icon" href="../../../img/favicon/favicon.ico" type="image/x-icon">
        <!-- #GOOGLE FONT -->
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,300,400,700">
        <link href="../../../css/businessLogic/Plazo/regPlazo.css" rel="stylesheet" type="text/css"/>
    </head>
    <body> 
        <div id="main" role="main" style="margin: 0px;">
            <div id="content" >
                <section id="widget-grid" class="">
                    <div class="row">
                        <div class="well">
                            <center><h1>Plazos de Requerimientos</h1></center>
                            <div class="row ">

                                <section class="col col-sm-12"> 
                                    <button type="button"  id="btn-registrar" class="btn btn-default btn-circle btn-lg btn-registrar" style="float:right;display:none" rel="tooltip" data-placement="top" data-original-title="Guardar"><i class="glyphicon glyphicon-floppy-disk"></i> 
                                    </button>
                                    <button type="button"   class="btn btn-primary btn-circle btn-lg btnAgregar" style="float:right;display:none"  rel="tooltip"  data-placement="top" data-original-title="Agregar" ><i class="glyphicon glyphicon-plus"></i> 
                                    </button>
                                    <button type="button"   class="btn btn-danger btn-circle btn-lg btnClose" style="float:right;display:none"  rel="tooltip" data-placement="top" data-original-title="Cancelar"  ><i class="glyphicon glyphicon-remove"></i> 
                                    </button>
                                </section>
                            </div>
                            <form    id="form-plazo" class="form_plazo smart-form"style="display:none" >
                                <div class="row">
                                    <section class="col col-4">
                                        <label><strong>Tipo de plazo :</strong></label>
                                        <label class="select"> <i class="icon-append fa fa-calendar"></i>
                                            <select name="tipo" required="" class="tipo" required="">
                                                <option value='2' selected="">Ingreso a planilla</option>
                                                <option value='1'>Inicio de Contrato</option>
                                            </select>
                                        </label>
                                    </section>
                                    <section class="col col-4">
                                        <label><strong>Nombre de plazo :</strong></label>
                                        <label class="input"> <i class="icon-prepend fa fa-user"></i>
                                            <input type="text" name="nombre_plazo" required="" class="nombre_plazo" />
                                        </label>
                                    </section>
                                    <section class="col col-4 tr_tolerancia" style="display: none; ">
                                        <label><strong>Dias de tolerancia (Ingreso a planilla):</strong></label>
                                        <label class="input"> <i class="icon-prepend fa fa-user"></i>
                                            <input type="number" name="tolerancia" min="1"  required=""  value="0" class="tolerancia" />
                                        </label>
                                    </section>
                                    <section class="col col-4 tr_dep_tolerancia">
                                        <label><strong>Departamento tolerancia (Ingreso a planilla):</strong></label>
                                        <label class="input"> <i class="icon-prepend fa fa-user"></i>
                                            <input type="text" name="dep_tolerancia" required="" value="DPT-0019" class="dep_tolerancia" />
                                        </label>
                                    </section>

                                </div>
                                <section>
                                    <label class="textarea"> 										
                                        <textarea rows="3" name="descripcion" placeholder="Descripción" required="" class="descripcion" ></textarea> 
                                    </label>
                                </section>
                                <div class="row ">
                                    <section class="col col-3">
                                        <label><strong>Tipo planilla :</strong></label>
                                        <label class="select"> <i class="icon-append fa fa-calendar"></i>
                                            <select name="planilla" required="" class="planilla" >
                                                <option value="0">[Todos]</option>
                                            </select>
                                        </label>
                                    </section>
                                    <section class="col col-3">
                                        <label><strong>Requerimiento :</strong></label>
                                        <label class="select"> <i class=""></i>
                                            <select name="id_req" required="" class="req" required="">
                                                <option value="0">[Todos]</option>
                                            </select>
                                        </label>
                                    </section>
                                    <section class="col col-3">
                                        <label><strong>Desde :</strong></label>
                                        <label class="input"> <i class=""></i>
                                            <input type="text" name="desde" placeholder="Request activation on" s required=""  readonly="" class="desde datepicker" data-dateformat='yy-mm-dd'>
                                        </label>
                                    </section>
                                    <section class="col col-3">
                                        <label><strong>Hasta :</strong></label>
                                        <label class="input"> <i class=""></i>
                                            <input type="text" name="hasta" placeholder="Request activation on"  required="" readonly="" class="hasta datepicker" data-dateformat='yy-mm-dd'>
                                        </label>
                                    </section>
                                </div>
                                <div class="row">
                                    <section class="col col-4">
                                        <label class="select" id="titu">
                                            Dirección :<select name="direccion" class="direccion"  >
                                                <option value="" >[SELECCIONE]</option>
                                            </select>
                                        </label>
                                    </section>
                                    <section class="col col-4">
                                        <label class="select" id="titu">
                                            Departamento :<select name="departamento" class="departamento"  >
                                                <option value="" >[SELECCIONE]</option>

                                            </select>
                                        </label>
                                    </section>
                                    <section class="col col-4">
                                        <label class="select" id="titu">
                                            Area :<select name="area" class="area" >
                                                <option value="" >[SELECCIONE]</option>
                                            </select>
                                        </label>
                                    </section>
                                </div>
                            </form>
                        </div>
                    </div>
                </section>

                <div class="row">
                    <div class="well">
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover table-striped">
                                <thead>
                                    <tr >
                                        <td class="text-center semi-bold">Nro</td>
                                        <td class="text-center semi-bold">Tipo Plazo</td>
                                        <td class="text-center semi-bold">Nombre Plazo</td>
                                        <td class="text-center semi-bold">Descripción</td>
                                        <td class="text-center semi-bold">Desde</td>
                                        <td class="text-center semi-bold">Hasta</td>
                                        <td class="text-center semi-bold">Tipo de Planilla</td>
                                        <td class="text-center semi-bold">Requerimiento</td>
                                        <td class="text-center semi-bold">Dep. Tolerancia</td>
                                        <td class="text-center semi-bold" >Dias de tolerancia</td>
                                        <td class="text-center semi-bold">Departamento</td>
                                        <td class="text-center semi-bold">Area</td>
                                        <td class="text-center semi-bold" >Estado</td>
                                        <td class="text-center semi-bold" style="width:8%">Editar</td>
                                    </tr>
                                </thead>
                                <tbody  class="tbodys" >
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div> 
            </div>
        </div>

    </body>
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

    <!-- SPARKLINES -->
    <script src="../../../js/plugin/sparkline/jquery.sparkline.min.js"></script>

    <!-- JQUERY VALIDATE -->
    <script src="../../../js/plugin/jquery-validate/jquery.validate.min.js"></script>

    <!-- JQUERY MASKED INPUT 
    <script src="../../../js/plugin/masked-input/jquery.maskedinput.min.js"></script>-->

    <!-- JQUERY SELECT2 INPUT -->
    <script src="../../../js/plugin/select2/select2.min.js"></script>

    <!-- JQUERY UI + Bootstrap Slider -->
    <script src="../../../js/plugin/bootstrap-slider/bootstrap-slider.min.js"></script>

    <!-- browser msie issue fix -->
    <script src="../../../js/plugin/msie-fix/jquery.mb.browser.min.js"></script>

    <!-- FastClick: For mobile devices -->
    <script src="../../../js/plugin/fastclick/fastclick.min.js"></script>


    <!--<script src="../../../js/demo.min.js"></script>-->

    <!-- MAIN APP JS FILE -->
    <script src="../../../js/app.min.js"></script>

    <!-- ENHANCEMENT PLUGINS : NOT A REQUIREMENT -->
    <!-- Voice command : plugin 
    <script src="../../../js/speech/voicecommand.min.js"></script>-->

    <script src="../../../js/Js_Formulario/Js_Form.js" type="text/javascript"></script>
    <!--Business Logic-->
    <script src="../../../js/businessLogic/Plazo/regPlazo.js?v=<%=globalProperties.VERSION_JS%>" type="text/javascript"></script>
</html>
<%} else {
        out.print("<script> window.parent.location.href = '/TALENTO_HUMANO/';</script>");
    }
%>