<%@page import="pe.edu.upeu.application.properties.globalProperties"%>
<%@page import="pe.edu.upeu.application.util.DateFormat"%>
<%@page import="pe.edu.upeu.application.model.Usuario"%>
<%
    HttpSession sesion_1 = request.getSession();
    String id_user_1 = (String) sesion_1.getAttribute("IDUSER");
    if (id_user_1 != null) {
%>
<link rel="stylesheet" media="screen" href="css/chosen.css"  type="text/css" > 
<!-- widget grid -->
<section id="widget-grid" class="">
    <!-- row -->
    <div class="row">
        <!-- NEW WIDGET START -->
        <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <div class="jarviswidget jarviswidget-color-magenta" id="wid-id-3"    data-widget-togglebutton="false" data-widget-editbutton="false" data-widget-fullscreenbutton="false" data-widget-colorbutton="false" 
                 data-widget-deletebutton="false" >
                <header>
                    <span class="widget-icon"> <i class="fa fa-user"></i> </span>
                    <h2>Reporte de Empleados</h2>

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

                        <table id="datatable_tabletools" class="datatableEmployees table table-striped table-bordered table-hover" width="100%">
                            <thead>
                                <tr>
                                    <th data-hide="phone">ID</th>
                                    <th data-class="expand">Nombres y Apellidos</th>
                                    <th>Direccion</th>
                                    <th>Departamento</th>
                                    <th>Área</th>
                                    <th data-hide="phone">Sección</th>
                                    <th data-hide="phone,tablet">Puesto</th>
                                    <th data-hide="phone,tablet">Fecha Inicio</th>
                                    <th data-hide="phone,tablet">Fecha Fin</th>
                                    <th data-hide="phone,tablet">Sueldo</th>
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


        </article>
        <!-- WIDGET END -->

    </div>

    <!-- end row -->

    <!-- end row -->
</section>
<!-- end widget grid -->
<!-- PAGE RELATED PLUGIN(S) -->
<script type="text/javascript">
    pageSetUp();
    var pagefunction = function () {
        console.log("::enter to pagefunction");
        initEmployeesReport();
        console.log("::finish to pagefunction");
    };
    var pagedestroy = function () {
        console.log("enter to pagedestroy");
        $.fn.dataTable.Api($('.datatableEmployees')).destroy();
        console.log("finish to pagedestroy");
    };
    loadScript("js/plugin/jquery-form/jquery-form.min.js", function () {
        loadScript("js/plugin/datatables/jquery.dataTables.min.js", function () {
            loadScript("js/plugin/datatables/dataTables.colVis.min.js", function () {
                loadScript("js/plugin/datatables/dataTables.tableTools.min.js", function () {
                    loadScript("js/plugin/datatables/dataTables.bootstrap.min.js", function () {
                        loadScript("js/plugin/datatable-responsive/datatables.responsive.min.js", function () {
                            loadScript('js/chosen.jquery.js', function () {
                                loadScript("js/jsGlobalFunctions/jsForm.js", function () {
                                    loadScript("js/businessLogic/Empleado/filtroEmpleado.js", pagefunction);
                                });
                            });
                        });
                    });
                });
            });
        });
    });
</script>
<%} else {
        out.print("<script> window.parent.location.href = '/TALENTO_HUMANO/';</script>");
    }
%>
