 
<div class="row">
    <div class="col-md-12">
        <div class="well">
            <div class="row">
                <div class="col-md-8">
                    <h1>
                        <span class="semi-bold">Reporte</span> <i class="ultra-light">Carga Académica</i> (Docentes)
                        <sup class="badge bg-color-red bounceIn animated">v 2.0</sup> <br>
                        <small class="text-danger slideInRight fast animated"><strong>Inicio de contratación</strong></small></h1>
                </div>
                <div class="col-md-4">
                    <br>
                    <button type="button" style="display: none" class="btn btn-danger btn-lg btn-circle pull-right btnStopSyncUpAcargaAcademica"  ><i class="fa fa-remove"></i></button>
                    <button type="button" class="btn btn-primary btn-lg btn-circle pull-right btnInitUpdateCAData" disabled="disabled" rel="tooltip" data-placement="top" data-original-title="Iniciar Actualizacion de Carga académica"  >
                        <i class="fa fa-refresh fa-lg"></i></button>
                    <button type="button" class="btn btn-primary btn-lg btn-circle pull-right btnUpdateCAData"><i class="fa fa-download"></i></button>
                </div>  
            </div>
        </div>
    </div>
</div>
<section id="widget-grid">
    <div class="row">
        <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <div class="jarviswidget" id="wid-id-0" data-widget-togglebutton="false" data-widget-editbutton="false" data-widget-fullscreenbutton="false" data-widget-colorbutton="false" 
                 data-widget-deletebutton="false">
                <header>
                    <span class="widget-icon"> <i class="glyphicon glyphicon-user txt-color-darken"></i> </span>
                    <h2>Carga Académica</h2>
                    <ul class="nav nav-tabs pull-right in" id="myTab"> 
                        <li class="active">
                            <a data-toggle="tab" href="#s1"><i class="fa fa-user"></i> <span class="hidden-mobile hidden-tablet">Usuarios RRHH</span></a>
                        </li>
                        <li>
                            <a data-toggle="tab" href="#s2"><i class="fa fa-users"></i> <span class="hidden-mobile hidden-tablet">Usuarios Académico</span></a>
                        </li>
                    </ul>
                </header>
                <div class="no-padding">
                    <div class="widget-body">
                        <table   class="table table-striped table-bordered table-hover datatableCargaAcademica" width="100%">
                            <thead>
                                <tr>
                                    <th class="hasinput" colspan="10"  rowspan="1"></th>  
                                    <th class='hasinput' >
                                        <input type="text" class='form-control input-sm dateDesdeM' />
                                    </th>
                                    <th class='hasinput' >
                                        <input type="text" class='form-control input-sm dateHastaM' />
                                    </th>
                                </tr>
                                <tr>
                                    <th></th>
                                    <th>Tipo Doc.</th>
                                    <th>N° Documento</th>
                                    <th style="width: 16%">Apellidos y Nombres</th>
                                    <th>Facultad</th>
                                    <th>Escuela</th>
                                    <th>Situación Educativa</th>
                                    <th>Profesión Docente</th>
                                    <th>Condición</th>
                                    <th>Ciclo</th>
                                    <th>Inicio</th>
                                    <th>Cese</th>
                                </tr>
                            </thead>
                        </table>
                    </div>
                </div>
            </div>
        </article>
    </div>
</section>
<!-------------- Modal  ----------->
<div class="modal fade modalAcademicDetails" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
    <div class="modal-dialog modal-lg"   >
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close-form close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <i class="fa fa-user fa-2x"></i>
                <label class="modalTitle font-lg" id="myModalLabel"></label>
            </div>
            <div class="modal-body">
                <div class="areaModal">
                </div>
            </div>
        </div>
    </div>
</div>
<!-- PAGE RELATED PLUGIN(S) -->
<script type="text/javascript">
    pageSetUp();
    var pagefunction = function () {
        console.log("::enter to pagefunction");
        initCAGlobalEvents();
        initFormPlugins();
        // initDatatableEvents();
        initDatatableCargaAcademica();
        console.log("::finish to pagefunction");
    };
    var pagedestroy = function () {
        console.log("enter to pagedestroy");
        $.fn.dataTable.Api($('.datatableCargaAcademica')).destroy();
        console.log("finish to pagedestroy");
    };
    loadScript("js/plugin/jquery-form/jquery-form.min.js", function () {
        loadScript("js/plugin/datatables/jquery.dataTables.min.js", function () {
            loadScript("js/plugin/datatables/dataTables.colVis.min.js", function () {
                loadScript("js/plugin/datatables/dataTables.tableTools.min.js", function () {
                    loadScript("js/plugin/datatables/dataTables.bootstrap.min.js", function () {
                        loadScript("js/plugin/datatable-responsive/datatables.responsive.min.js", function () {
                            loadScript("js/Js_Formulario/Js_Form.js", function () {
                                loadScript("js/businessLogic/Academico/cargaAcademica.js", pagefunction);
                            });
                        });
                    });
                });
            });
        });
    });
</script>