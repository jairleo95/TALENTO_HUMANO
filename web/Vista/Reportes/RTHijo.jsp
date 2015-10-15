<%-- 
    Document   : RTHijo
    Created on : 15/10/2015, 11:41:29 AM
    Author     : Andres
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reporte de Hijos de Trabajadores</title>
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,300,400,700">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-production.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-skins.min.css">
        <link rel="shortcut icon" href="../../img/favicon/favicon.ico" type="image/x-icon">
        <link rel="icon" href="../../img/favicon/favicon.ico" type="image/x-icon">
    </head>
    <body>
        <div class="row">
            <div class="page-header">
                <center><h1>Datos de Hijos</h1></center>
            </div>
        </div>
        <div class="well">
            <form class="smart-form">
                <div class="row">
                    <section class="col col-xs-12">
                        <div class="col col-xs-3">
                            <label class="label">Nombre</label>
                            <label class="input">
                                <input class="form-control" type="text" placeholder="Nombres">
                            </label>
                        </div>
                        <div class="col col-xs-2">
                            <label class="label">Apellido Paterno</label>
                            <label class="input">
                                <input class="form-control" type="text" placeholder="Paterno">
                            </label>
                        </div>
                        <div class="col col-xs-2">
                            <label class="label">Apellido Materno</label>
                            <label class="input">
                                <input class="form-control" type="text" placeholder="Materno">
                            </label>
                        </div>
                        <div class="col col-xs-2">
                            <label class="label">DNI</label>
                            <label class="input">
                                <input class="form-control" type="text" placeholder="DNI">
                            </label>
                        </div>
                        <div class="col col-xs-3">
                            <label class="label">Genero</label>
                            <label class="select">
                                <select>
                                    <option value="">[Seleccione]</option>
                                    <option value="F">Femenino</option>
                                    <option value="M">Masculino</option>
                                </select>
                                <i></i></label>
                        </div>
                    </section>
                </div>
                <hr>
                <div class="row">
                    <section class="col col-xs-12">
                        <div class="col col-xs-3">
                            <label class="label">Edad Especifica</label>
                            <label class="input">
                                <input class="form-control" type="text" placeholder="Edad">
                            </label>
                        </div>
                        <div class="col col-xs-3">
                            <label class="label">Desde</label>
                            <label class="input">
                                <input class="form-control" type="date" placeholder="Desde">
                            </label>
                        </div>
                        <div class="col col-xs-3">
                            <label class="label">Hasta</label>
                            <label class="input">
                                <input class="form-control" type="date" placeholder="Hasta">
                            </label>
                        </div>
                    </section>                    
                </div>
                <div style="float: right">
                    <a class="btn btn-primary btn-circle btn-lg"><i class="fa fa-search"></i></a>
                    <a class="btn btn-danger btn-circle btn-lg"><i class="fa fa-times"></i></a>
                </div>
            </form>
        </div>
        <br>
    </body>
</html>
