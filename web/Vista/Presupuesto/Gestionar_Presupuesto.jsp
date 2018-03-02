<%-- 
    Document   : Gestionar_Presupuesto
    Created on : 27/10/2017, 12:02:50 PM
    Author     : Leandro Burgos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession sesion_1 = request.getSession();
    String id_user_1 = (String) sesion_1.getAttribute("IDUSER");
    if (id_user_1 != null) {
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Presupuesto</title>
        <meta name="description" content="">
        <meta name="author" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-production-plugins.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-production.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-skins.min.css">
        <link type="text/css" rel="stylesheet" href="../../css/Css_Reporte/Reportes.css">
        <link type="text/css" rel="stylesheet" href="../../css/Css_Formulario/form.css">
        <link rel="stylesheet" href="../../css/bootstrap.min.css">
        <link rel="icon" href="../../img/favicon/favicon.ico" type="image/x-icon">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/font-awesome.min.css">
        <link href="../../js/plugin/pfnotify/pnotify.custom.min.css" rel="stylesheet" type="text/css"/>
        <link href="../../css/datatable.css" rel="stylesheet" type="text/css"/>
        <style>            
            .panel-primary{
                border-color: #424242;
            }
            .bT{
                float: right;
            }
            .Help{
                cursor: pointer;
            }
        </style>
    </head>
    <body class="container-fluid">
        <div class="panel panel-primary col-lg-9">            
            <div class="panel-body">
                <form class="">
                    <!--<div class="row">
                        <button type="button" class="btn btn-danger bT"><i class="fa fa-refresh"></i></button>
                    </div>-->
                    <fieldset>
                        <legend class="">
                            Datos Generales de <strong>Presupuesto</strong>   <a class="Help" onclick="helpDG()"><i class="fa fa-question-circle"></i></a>
                        </legend>
                        <div>
                            <div class="row">
                                <div class="form-group col-md-3 col-xs-12" >
                                    <label class="">Dirección :</label>
                                    <select class="form-control select_direccion" >
                                        <option value="" selected disabled>[Seleccione]</option>
                                    </select>
                                </div>
                                <div class="form-group col-md-3 col-xs-12" >
                                    <label class="">Departamento :</label>
                                    <select class="form-control select_dep" >
                                        <option value="" selected disabled>[Seleccione]</option>
                                    </select>
                                </div>
                                <div class="form-group col-md-3 col-xs-12" >
                                    <label class="">Área :</label>
                                    <select class="form-control select_area" >
                                        <option value="" selected disabled>[Seleccione]</option>
                                    </select>
                                </div>
                                <div class="form-group col-md-3 col-xs-12" >
                                    <label class="">Centro de Costos (Opcional) :</label>
                                    <select class="form-control select_cc">
                                        <option value="" selected disabled>[Seleccione]</option>
                                    </select>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-md-3 col-xs-12" >
                                    <label class="">Temporada :</label>
                                    <select class="form-control select_temporada" >
                                        <option value="" selected disabled>[Seleccione]</option>
                                    </select>
                                </div>
                                <div class="form-group col-md-3 col-xs-12" >
                                    <label>Fecha Inicio:</label>
                                    <input type="date" name="fec_i" class="form-control" length="45"  id="fe_i" disabled>
                                </div>
                                <div class="form-group col-md-3 col-xs-12">
                                    <label>Fecha Fin</label>
                                    <input type="date" name="fec_i" class="form-control" length="45"  id="fe_f"  disabled>
                                </div>                            
                                <div class="" style="float: right;margin-top: 2%">
                                    <button class="btn btn-info" type="button" data-toggle="modal" data-target="#myModal" onclick="oModal()">Nueva Temporada</button>
                                </div>
                                <input type="hidden" id="itemp">
                            </div>
                            <!--<div>                                
                                <div class="col-md-3 col-md-offset-9">
                                    <button class="col-md-12 btn btn-success BG" type="button" style="margin-top: 9%">Activar</button>
                                </div>
                            </div>-->
                        </div>
                        <legend class="">
                            Asignación de trabajadores por <strong>requerimiento</strong>  <a class="Help" onclick="helpCL()"><i class="fa fa-question-circle"></i></a>
                        </legend>
                        <div class="row">
                            <div class="form-group col-md-6 col-xs-12" >
                                <label class="">Requerimiento :</label>
                                <select class="form-control select_req" >
                                    <option value="0" selected disabled>[Seleccione]</option>
                                    <option value="REQ-0001">Contrato Personal : Tiempo Completo</option>
                                    <option value="REQ-0002">Contrato Personal : Medio Tiempo (24 Horas Semanal)</option>
                                    <option value="REQ-0003">Contrato Personal : Tiempo Parcial</option>
                                    <option value="REQ-0005">Contrato Personal : Extranjero</option>
                                    <option value="REQ-0007">Practicas Preprofesionales (Tope 6hrs diarias / 30 hrs  semanales.)</option>
                                    <option value="REQ-0008">Practicas Profesionales</option>
                                    <option value="REQ-0009">Convenio Laboral Juvenil (Hasta 22 a?os, no matriculados)</option>
                                    <option value="REQ-0010">Locacion de Servicios</option>
                                    <option value="REQ-0011">No domiciliado (Expositores Extranjeros)</option>
                                    <option value="REQ-0018">Contrato Personal : Tiempo Parcial (Trabajador Docente)</option>
                                    <option value="REQ-0019">Contratacion Casos Especiales</option>
                                    <option value="REQ-0020">Contrato Personal : MFL - Medio Tiempo</option>
                                    <option value="REQ-0021">Contrato Personal : MFL - Tiempo Completo</option>
                                    <option value="REQ-0022">Empleado</option>
                                    <option value="REQ-0023">Misionero</option>
                                </select>
                            </div>
                            <div class="form-group col-md-3 col-xs-12">
                                <label>Número de Trabajadores:</label>
                                <div class="input-group ">
                                    <div class="input-group-addon"><i class="fa fa-group"></i></div>
                                    <div class="bNG">
                                        <input type="number" name="sueldo" id="ntraG" class="form-control"  placeholder="Número de trabajadores">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group col-md-3 col-xs-12" >
                                <button class="btn btn-primary BGE col-md-12" type="button" disabled style="margin-top: 7%">Guardar</button>
                            </div>
                        </div>                        
                    </fieldset>
                    <input type="hidden" id="ipuesto">

                    <input type="hidden" id="iDestino">

                    <input type="hidden" id="id_cc">

                    <input type="hidden" id="tipo_p">

                    <fieldset>
                        <legend class="">
                            Asignación de trabajadores por <strong>puesto</strong>  <a class="Help" onclick="helpTP()"><i class="fa fa-question-circle"></i></a>
                        </legend>
                        <div class="alertNT">

                        </div>
                        <div class="row">
                            <div class="form-group col-md-3 col-xs-12" >
                                <label class="text-success">Sección :</label>
                                <select class="form-control select_seccion">
                                    <option value="" selected disabled>[Seleccione]</option>
                                </select>
                            </div> 
                            <div class="form-group col-md-3 col-xs-12" >
                                <label class="text-success">Puesto :</label>
                                <select class="form-control select_puesto">
                                    <option value="" selected disabled>[Seleccione]</option>
                                </select>
                            </div>
                            <div class="form-group col-md-3 col-xs-12">
                                <label>Número de Trabajadores:</label>
                                <div class="input-group ">
                                    <div class="input-group-addon"><i class="fa fa-group"></i></div>
                                    <div class="bND">
                                        <input type="number" name="sueldo" id="ntraD" class="form-control"  placeholder="Número de trabajadores">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group col-md-3 col-xs-12">
                                <button class="btn btn-success col-md-12 BD" type="button" disabled style="margin-top: 7%;">Guardar</button>
                            </div>
                        </div>
                    </fieldset>

                    <fieldset>
                        <legend class="">
                            Asignación de sueldo mínimo y máximo por <strong>puesto</strong>  <a class="Help" onclick="helpSM()"><i class="fa fa-question-circle"></i></a>
                        </legend>
                    </fieldset>
                    <div class="row">
                        <div class="form-group col-md-6 col-xs-12" >
                            <h4 class="cPuestoT"></h4>                            
                        </div>                            
                    </div>
                    <div class="row">
                        <div class="form-group col-md-3 col-xs-12">
                            <label>Sueldo Mínimo</label>
                            <div class="input-group ">
                                <div class="input-group-addon">$</div>
                                <input type="text" name="sueldo" class="form-control SP" id="iSMin"  placeholder="Ingrese el Monto">
                                <div class="input-group-addon">.00</div>
                            </div>
                        </div>
                        <div class="form-group col-md-3 col-xs-12">
                            <label>Sueldo Máximo:</label>
                            <div class="input-group ">
                                <div class="input-group-addon">$</div>
                                <input type="text" name="sueldo" class="form-control SP" id="iSMax"  placeholder="Ingrese el Monto">
                                <div class="input-group-addon">.00</div>
                            </div>
                        </div> 
                        <div class="form-group col-md-3 col-xs-12">
                            <label>Bonificación Mínima:</label>
                            <div class="input-group ">
                                <div class="input-group-addon">$</div>
                                <input type="text" name="sueldo" class="form-control SP" id="iBMin"  placeholder="Ingrese el Monto">
                                <div class="input-group-addon">.00</div>
                            </div>
                        </div>
                        <div class="form-group col-md-3 col-xs-12">
                            <label>Bonificación Máxima:</label>
                            <div class="input-group ">
                                <div class="input-group-addon">$</div>
                                <input type="text" name="sueldo" class="form-control SP" id="iBMax"  placeholder="Ingrese el Monto">
                                <div class="input-group-addon">.00</div>
                            </div>
                        </div> 
                    </div>
                    <div class="row">
                        <div class="form-group col-md-3 col-xs-12">
                            <label>Bono Alimenticio Mínimo</label>
                            <div class="input-group ">
                                <div class="input-group-addon">$</div>
                                <input type="text" name="sueldo" class="form-control SP" id="iBAMin"  placeholder="Ingrese el Monto">
                                <div class="input-group-addon">.00</div>
                            </div>
                        </div>
                        <div class="form-group col-md-3 col-xs-12">
                            <label>Bono Alimenticio Máximo:</label>
                            <div class="input-group ">
                                <div class="input-group-addon">$</div>
                                <input type="text" name="sueldo" class="form-control SP" id="iBAMax"  placeholder="Ingrese el Monto">
                                <div class="input-group-addon">.00</div>
                            </div>
                        </div>
                        <div class="col-md-3 col-xs-12 col-md-offset-3" style="margin-top: 2%">
                            <button class="btn btn-warning col-md-12 BM" type="button" disabled>Guardar Cambios</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <div class="panel panel-primary col-lg-3">
            <div class="well row"><h4>Detalle</h4>En esta sección se irá mostrando todo lo que usted haya registrado hasta el momento del presupuesto seleccionado en la parte superior:
                <br>
                <div id="detcontent">
                </div>

            </div>
        </div>
        <input id="iDestinoM" type="hidden">
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="myModalLabel">Nueva Temporada</h4>
                    </div>
                    <div class="modal-body">
                        <div class="row conB">
                            <!--<div class="form-group col-md-4 col-xs-12" >
                                <label class="">Dirección :</label>
                                <select class="form-control select_direccion_M" >
                                    <option value="" selected disabled>[Seleccione]</option>
                                </select>
                            </div>
                            <div class="form-group col-md-4 col-xs-12" >
                                <label class="">Departamento :</label>
                                <select class="form-control select_dep_M" >
                                    <option value="" selected disabled>[Seleccione]</option>
                                </select>
                            </div>
                            <div class="form-group col-md-4 col-xs-12" >
                                <label class="">Área :</label>
                                <select class="form-control select_area_M" >
                                    <option value="" selected disabled>[Seleccione]</option>
                                </select>
                            </div>-->
                        </div>
                        <div class="row">
                            <div class="form-group col-md-6 col-xs-12">
                                <label>Temporada</label>
                                <div class="input-group ">
                                    <input type="text" class="form-control" id="n_n_t" placeholder="Nombre de la Temporada">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-md-6 col-xs-12" >
                                <label>Fecha Inicio:</label>
                                <input type="date" class="form-control" length="45"  id="fe_i_n">
                            </div>
                            <div class="form-group col-md-6 col-xs-12">
                                <label>Fecha Fin</label>
                                <input type="date" class="form-control" length="45"  id="fe_f_n" >
                            </div>  
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                        <button type="button" class="btn btn-primary bbst" onclick="saveNewTemp()">Guardar</button>
                    </div>
                </div>
            </div>
        </div>



        <script type="text/javascript" src="../../js/jquery-2.2.3.min.js"></script>        
        <script src="../../ajax/ajax.google.min.js"></script> 
        <script src="../../js/bootstrap/bootstrap.min.js" type="text/javascript"></script>
        <script src="../../js/plugin/pfnotify/pnotify.custom.min.js" type="text/javascript"></script>
        <script src="../../js/plugin/datatables/datatable.js" type="text/javascript"></script>
        <!-- CUSTOM NOTIFICATION -->
        <script src="../../js/notification/SmartNotification.min.js"></script>
        <script src="CorePresupuesto.js" type="text/javascript"></script>
        <script src="utilPresupuesto.js" type="text/javascript"></script>


    </body>

</html>
<%} else {
        out.print("<script> window.parent.location.href = '/TALENTO_HUMANO/</script>");
    }
%>
