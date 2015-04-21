<%-- 
    Document   : Reporte_Datos_Padre_Madre
    Created on : 16/04/2015, 11:53:49 AM
    Author     : Alexander
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>REPORTES DATOS GENERALES</title>

        <link rel="stylesheet" type="text/css" media="screen" href="../../css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/font-awesome.min.css">

        <!-- SmartAdmin Styles : Please note (smartadmin-production.css) was created using LESS variables -->
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-production.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-skins.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/demo.min.css">

        <!-- #FAVICONS -->
        <link rel="shortcut icon" href="../../img/favicon/favicon.ico" type="image/x-icon">
        <link rel="icon" href="../../img/favicon/favicon.ico" type="image/x-icon">

        <!-- #GOOGLE FONT -->
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,300,400,700">
    </head>
    <body>

        <div id="main" role="main" style="margin: 0px;">
            <div id="content" >
                <section id="widget-grid" class="">
                    <div class="row">

                        <div class="well">
                            <form class="smart-form">

                                <h1 class="text-center">REPORTES GENERALES <small>/ Padre-Madre</small></h1><br>
                                <h1 class="text-left font-md semi-bold">Filtros:</h1><br>
                                <div class="row">
                                    <section class="col col-sm-3">
                                        <label>Hasta:</label>
                                        <label class="input"> <i class="icon-append fa fa-calendar"></i>
                                            <input type="text"  placeholder="Seleccionar Fecha" class="datepicker" id="dtp2" data-dateformat='dd/mm/yy'>
                                        </label>
                                    </section>
                                    <section class="col col-sm-4">
                                        <label>Usuario:</label>
                                        <label class="input">
                                            <input type="text" name="usuario" placeholder="Nombre de Usuario">
                                        </label>
                                    </section>
                                    <section class="col col-sm-2">
                                        <center><a class="btn btn-primary btn-circle btn-xl"><i class="glyphicon glyphicon-search"></i></a></center>
                                    </section>
                                </div>
                            </form>


                        </div>

                    </div>
                    <div class="row">
                        <div class="well">
                            <div class="table-responsive">
                                <table class="tabla_t table table-bordered table-hover table-striped">
                                    <thead>
                                        <tr>
                                            <th class="text-center semi-bold">Nro</th>
                                            <th class="text-center semi-bold">Codigo APS</th>
                                            <th class="text-center semi-bold">Departamento</th>
                                            <th class="text-center semi-bold">Sección</th>
                                            <th class="text-center semi-bold">Puesto</th>
                                            <th class="text-center semi-bold">Tipo Documento</th>
                                            <th class="text-center semi-bold">Número Documento</th>
                                            <th class="text-center semi-bold">Apellido Materno</th>
                                            <th class="text-center semi-bold">Apellido Paterno</th>
                                            <th class="text-center semi-bold">Nombres</th>
                                            <th class="text-center semi-bold">Fecha de Cese</th>
                                            <th class="text-center semi-bold">Nombre y Apellido Hijos(as)</th>
                                            <th class="text-center semi-bold">Fecha de Nacimiento</th>
                                            <th class="text-center semi-bold">Edad</th>
                                            <th class="text-center semi-bold">Genero</th>
                                            
                                        </tr>
                                    </thead>
                                    <tbody class="tbodys">

                                    </tbody>
                                </table>
                            </div>


                        </div>

                    </div>
                </section>
            </div>
        </div>
    </body>

</html>