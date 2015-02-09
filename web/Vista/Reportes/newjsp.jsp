<%@page import="pe.edu.upeu.application.model.Datos_Generales"%>
<jsp:useBean id="Reporte_Datos_Generales" scope="application" class="java.util.ArrayList"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>


        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" type="image/ico" href="http://www.sprymedia.co.uk/media/images/favicon.ico">

        <title>Using DataTable with column filter plugin - Place filter in the external form</title>
        <style type="text/css" title="currentStyle">
            @import "../../js/DataTables-1.10.4/media/css/demo_page.css";
            @import "../../js/DataTables-1.10.4/media/css/demo_table.css";
            @import "../../js/DataTables-1.10.4/media/css/jquery-ui.css";
            @import "../../js/DataTables-1.10.4/media/css/jquery-ui-1.7.2.custom.css";
        </style>

        <script src="../../js/DataTables-1.10.4/media/js/jquery-1.4.4.min.js" type="text/javascript"></script>
        <script src="../../js/DataTables-1.10.4/media/js/jquery.dataTables.js" type="text/javascript"></script>

        <script src="../../js/DataTables-1.10.4/media/js/jquery-ui.js" type="text/javascript"></script>

        <script src="../../js/DataTables-1.10.4/media/js/jquery.dataTables.columnFilter.js" type="text/javascript"></script>

        <script type="text/javascript" charset="utf-8">
            $(document).ready(function() {
                $('#example').dataTable()
                        .columnFilter({aoColumns: [
                                {type: "select", values: ["A", "B", "C"], sSelector: "#co_aps"},
                                {type: "select", values: ["A", "B", "C"], sSelector: "#Departamento"},
                                {type: "select", values: ["A", "B", "C"], sSelector: "#Area"},
                                {type: "select", values: ["A", "B", "C"], sSelector: "#Seccion"},
                                {type: "select", values: ["A", "B", "C"], sSelector: "#Puesto"},
                                {type: "select", values: ["Masculino", "Femenino"], sSelector: "#Paterno"},
                                {type: "select", values: ["A", "B", "C"], sSelector: "#Materno"},
                                {type: "select", values: ["A", "B", "C"], sSelector: "#Nombres"},
                                {type: "select", values: ["A", "B", "C"], sSelector: "#Nombres_com"},
                                {type: "select", values: ["Mascuino", "Femenino"], sSelector: "#Sexo"},
                                {type: "select", values: ["A", "B", "C"], sSelector: "#fecha_nac"},
                                {type: "select", values: ["A", "B", "C"], sSelector: "#Nacionalidad"},
                                {type: "select", values: ["A", "B", "C"], sSelector: "#Estado_c"},
                                {type: "select", values: ["A", "B", "C"], sSelector: "#Grupo_san"},
                                {type: "select", values: ["A", "B", "C"], sSelector: "#Factor_rh"},
                                {type: "select", values: ["A", "B", "C"], sSelector: "#Sistema_p"},
                                {type: "select", values: ["A", "B", "C"], sSelector: "#NO_AFP"},
                                {type: "select", values: ["A", "B", "C"], sSelector: "#Situacion_EDUC"},
                                {type: "select", values: ["A", "B", "C"], sSelector: "#ESTUDIO_en"},
                                {type: "select", values: ["A", "B", "C"], sSelector: "#Regimen_s_e"},
                                {type: "select", values: ["A", "B", "C"], sSelector: "#Tipo_ins"},
                                {type: "select", values: ["A", "B", "C"], sSelector: "#Institucion_e"},
                                {type: "select", values: ["A", "B", "C"], sSelector: "#Carrera"},
                                {type: "select", values: ["A", "B", "C"], sSelector: "#Año_egre"},
                                {type: "select", values: ["A", "B", "C"], sSelector: "#Tipo_h_p"},
                                {type: "select", values: ["A", "B", "C"], sSelector: "#Domicilio_ac"},
                                {type: "select", values: ["A", "B", "C"], sSelector: "#Distrito"},
                                {type: "select", values: ["A", "B", "C"], sSelector: "#Provincia"},
                                {type: "select", values: ["A", "B", "C"], sSelector: "#Departamento_u"},
                                {type: "select", values: ["A", "B", "C"], sSelector: "#Religion_u"},
                                {type: "select", values: ["A", "B", "C"], sSelector: "#Iglesia"},
                                {type: "select", values: ["A", "B", "C"], sSelector: "#Cargo"},
                                {type: "select", values: ["A", "B", "C"], sSelector: "#Autoridad"}

                            ]}
                        );
                $(document).ready(function() {
                    $('#example').dataTable({
                        "dom": 'T<"clear">lfrtip',
                        "tableTools": {
                            "sSwfPath": "../../js/DataTables-1.10.4/media/js/copy_csv_xls_pdf.swf"
                        }
                    });
                });

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




    <body id="dt_example">

        <H1 align="center">FILTRAR DATOS</H1>
        <table cellspacing="0" cellpadding="0" border="0" class="display" ID="Table1">
            <tbody>
                <tr id="filter_global" class="a"><td align="center">Codigo Aps</td><td align="center" id="co_aps"></td></tr>
                <tr id="filter_col1"><td align="center">Departamento</td><td align="center" id="Departamento"></td></tr>
                <tr id="filter_col2"><td align="center">Area</td><td align="center" id="Area"></td></tr>
                <tr id="filter_col3"><td align="center">Seccion</td><td align="center" id="Seccion"></td></tr>
                <tr id="filter_col4"><td align="center">Puesto</td><td align="center" id="Puesto"></td></tr>
                <tr id="filter_col1"><td align="center">Sexo</td><td align="center" id="Sexo"></td></tr>
                <tr id="filter_col1" class="ap"><td align="center">Ape. Paterno</td><td align="center" id="Paterno"></td></tr>
                <tr id="filter_global" class="apm"><td align="center">Ape. Materno</td><td align="center" id="Materno"></td></tr></tr>
                <tr id="filter_global" class="nom"><td align="center">Nombres</td><td align="center" id="Nombres"></td></tr>
                <tr id="filter_global" class="nc"><td align="center">Nombres y Apellidos</td><td align="center" id="Nombres_com"></td></tr>
                <tr id="filter_col2" class="fnac"><td align="center">fecha de Nac.</td><td align="center" id="fecha_nac"></td></tr>
                <tr id="filter_col3"><td align="center">Nacionalidad</td><td align="center" id="Nacionalidad"></td></tr>
                <tr id="filter_col4"><td align="center">Estado civil</td><td align="center" id="Estado_c"></td></tr>
                <tr id="filter_col1" class="gs"><td align="center">Grupo Sanguineo</td><td align="center" id="Grupo_san"></td></tr>
                <tr id="filter_global" class="fr"><td align="center">Factor RH</td><td align="center" id="Factor_rh"></td></tr>
                <tr id="filter_global"><td align="center">Sistema Pencionario</td><td align="center" id="Sistema_p"></td></tr>
                <tr id="filter_global" class="naf"><td align="center">NOMBRE AFP</td><td align="center" id="NO_AFP"></td></tr>
                <tr id="filter_col1" ><td align="center">Situacion educativa</td><td align="center" id="Situacion_EDUC"></td></tr>
                <tr id="filter_col2" class="eins"><td align="center">ESTUDIO EN INST</td><td align="center" id="ESTUDIO_en"></td></tr>
                <tr id="filter_col3" class="rse"><td align="center">Regimen Situacion Educativa</td><td align="center" id="Regimen_s_e"></td></tr>
                <tr id="filter_col4" class="ti"><td align="center">Tipo Intitucion</td><td align="center" id="Tipo_ins"></td></tr>
                <tr id="filter_col1" class="ie"><td align="center">Institucion Educativa</td><td align="center" id="Institucion_e"></td></tr>
                <tr id="filter_global" ><td align="center">Carrera</td><td align="center" id="Carrera"></td></tr></tr>
                <tr id="filter_global" class="an"><td align="center">Año de Egreso</td><td align="center" id="Año_egre"></td></tr>
                <tr id="filter_global" class="tih"><td align="center">Tipo Hora Pago</td><td align="center" id="Tipo_h_p"></td></tr>
                <tr id="filter_col1" class="doa"><td align="center">Domicilio Actual</td><td align="center" id="Domicilio_ac"></td></tr>
                <tr id="filter_col2" class="dis"><td align="center">Distrito</td><td align="center" id="Distrito"></td></tr>
                <tr id="filter_col3" class="pro"><td align="center">Provincia</td><td align="center" id="Provincia"></td></tr>
                <tr id="filter_col4" class="dep"><td align="center">Departamento Ubic</td><td align="center" id="Departamento_u"></td></tr>
                <tr id="filter_col1" ><td align="center">Religion</td><td align="center" id="Religion_u"></td></tr>
                <tr id="filter_global" class="igl"><td align="center">Iglesia</td><td align="center" id="Iglesia"></td></tr>
                <tr id="filter_global" class="car"><td align="center">Cargo</td><td align="center" id="Cargo"></td></tr>
                <tr id="filter_global" class="aut"><td align="center">Autoridad</td><td align="center" id="Autoridad"></td></tr>
            </tbody>
        </table>


        <div id="demo">

            <table cellpadding="0" cellspacing="0" border="0" class="display" id="example">
                <thead>
                    <tr>
                        <th>Codigo Aps</th>
                        <th>Departamento</th>
                        <th>Area</th>
                        <th>Seccion</th>
                        <th>Puesto</th>
                        <th>Sexo</th>
                        <th>Ape. Paterno</th>
                        <th>Ape. Materno</th>
                        <th>Nombres</th>
                        <th>Nombres y Apellidos</th>
                        <th>fecha de Nac.</th>
                        <th>Nacionalidad</th>
                        <th>Estado civil</th>
                        <th>Grupo Sanguineo</th>
                        <th>Factor RH</th>
                        <th>Sistema Pencionario</th>
                        <th>NO_AFP</th>
                        <th>Situacion educativa</th>
                        <th>ESTUDIO EN INST</th>
                        <th>Regimen Situacion Educativa</th>
                        <th>Tipo Intitucion</th>
                        <th>Institucion Educativa</th>
                        <th>Carrera</th>
                        <th>Año de Egreso</th>
                        <th>Tipo Hora Pago</th>
                        <th>Domicilio Actual</th>
                        <th>Distrito</th>
                        <th>Provincia</th>
                        <th>Departamento Ubic</th>
                        <th>Religion</th>
                        <th>Iglesia</th>
                        <th>Cargo</th>
                        <th>Autoridad</th>
                        <th>FE_CREACION</th>
                        <th id="ca_dir2">direccion</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <th>Codigo Aps</th>
                        <th>Departamento</th>
                        <th>Area</th>
                        <th>Seccion</th>
                        <th>Puesto</th>
                        <th>Sexo</th>
                        <th>Ape. Paterno</th>
                        <th>Ape. Materno</th>
                        <th>Nombres</th>
                        <th>Nombres y Apellidos</th>
                        <th>fecha de Nac.</th>
                        <th>Nacionalidad</th>
                        <th>Estado civil</th>
                        <th>Grupo Sanguineo</th>
                        <th>Factor RH</th>
                        <th>Sistema Pencionario</th>
                        <th>NO_AFP</th>
                        <th>Situacion educativa</th>
                        <th>ESTUDIO EN INST</th>
                        <th>Regimen Situacion Educativa</th>
                        <th>Tipo Intitucion</th>
                        <th>Institucion Educativa</th>
                        <th>Carrera</th>
                        <th>Año de Egreso</th>
                        <th>Tipo Hora Pago</th>
                        <th>Domicilio Actual</th>
                        <th>Distrito</th>
                        <th>Provincia</th>
                        <th>Departamento Ubic</th>
                        <th>Religion</th>
                        <th>Iglesia</th>
                        <th>Cargo</th>
                        <th>Autoridad</th>
                        <th>FE_CREACION</th>
                        <th id="ca_dir">direccion</th>
                    </tr>
                <script>
                    $(document).ready(function() {
                        $(".a").hide();
                        $(".ap").hide();
                        $(".apm").hide();
                        $(".nom").hide();
                        $(".nc").hide();
                        $(".fnac").hide();
                        $(".gs").hide();
                        $(".fr").hide();
                        $(".naf").hide();
                        $(".eins").hide();
                        $(".rse").hide();
                        $(".ti").hide();
                        $(".ie").hide();
                        $(".an").hide();
                        $(".tih").hide();
                        $(".doa").hide();
                        $(".dis").hide();
                        $(".pro").hide();
                        $(".dep").hide();
                        $(".igl").hide();
                        $(".car").hide();
                        $(".aut").hide();
                    });
                </script>
                </tfoot>
                <tbody>
                    <%for (int i = 0; i < Reporte_Datos_Generales.size(); i++) {
                            Datos_Generales d = new Datos_Generales();
                            d = (Datos_Generales) Reporte_Datos_Generales.get(i);%>
                    <tr class="odd_gradeX" >
                        <td class="read_only"><%=d.getCo_aps()%></td>
                        <td><%=d.getNo_dep()%></td>
                        <td><%=d.getNo_area()%></td>
                        <td class="center"><%=d.getNo_seccion()%></td>
                        <td class="center"><%=d.getNo_puesto()%></td>
                        <td class="center"><%if (d.getEs_sexo() != null) {
                                if (d.getEs_sexo().equals("M")) {
                                    out.print("Masculino");
                                }
                                if (d.getEs_sexo().equals("F")) {
                                    out.print("Femenino");
                                }
                            }
                            %></td>
                        <td class="center"><%=d.getAp_paterno()%></td>
                        <td class="center"><%=d.getAp_materno()%></td>
                        <td class="center"><%=d.getNo_trabajador()%></td>
                        <td class="center"><%=d.getNo_completo()%></td>
                        <td class="center"><%=d.getFe_nac()%></td>
                        <td class="center"><%=d.getNo_nacionalidad()%></td>
                        <td class="center"><%=d.getEs_civil()%></td>
                        <td class="center"><%=d.getLi_grupo_sanguineo()%></td>
                        <td class="center"><%=d.getEs_factor_rh()%></td>
                        <td class="center"><%=d.getCo_sistema_pensionario()%></td>
                        <td class="center"><%=d.getId_no_afp()%></td>
                        <td class="center"><%=d.getNo_s_educativa()%></td>
                        <td class="center"><%=d.getEs_inst_educ_peru()%></td>
                        <td class="center"><%=d.getLi_reg_inst_educativa()%></td>
                        <td class="center"><%=d.getNo_tipo_institucion()%></td>
                        <td class="center"><%=d.getNo_universidad()%></td>
                        <td class="center"><%=d.getNo_carrera()%></td>
                        <td class="center"><%=d.getDe_anno_egreso()%></td>
                        <td class="center"><%=d.getCa_tipo_hora_pago_refeerencial()%></td>
                        <td class="center"><%=d.getLi_di_dom_a_d1()%></td>
                        <td class="center"><%=d.getNo_distrito()%></td>
                        <td class="center"><%=d.getNo_provincia()%></td>
                        <td class="center"><%=d.getNo_departamento()%></td>
                        <td class="center"><%=d.getLi_religion()%></td>
                        <td class="center"><%=d.getNo_iglesia()%></td>
                        <td class="center"><%=d.getDe_cargo()%></td>
                        <td class="center"><%=d.getLi_autoridad()%></td>
                        <td class="center"><%=d.getFe_creacion_contrato()%></td>
                        <td id="co_dir" class="center"><%=d.getNo_direccion()%></td>
                    </tr>
                    <%}%>
                </tbody>
            </table

        </div>
        <div class="spacer"></div>



        <h1>Initialization code</h1>
        <p>First you will need to define placeholder elements where filter elements will be placed.</p>

        <pre class="brush: xml;">
	&lt;p id=&quot;renderingEngineFilter&quot;&gt;&lt;/p&gt;
	&lt;p id=&quot;browserFilter&quot;&gt;&lt;/p&gt;
	&lt;p id=&quot;platformsFilter&quot;&gt;&lt;/p&gt;
	&lt;p id=&quot;engineVersionFilter&quot;&gt;&lt;/p&gt;
	&lt;p id=&quot;cssGradeFilter&quot;&gt;&lt;/p&gt;
        </pre>
        <p>Then, for each column you should put selector that defines where in the page will be placed filtering element.
            An example where selectors are added as JQuery id selectors is shown in the script below:</p>
        <pre class="brush: js;">
	$('#example').dataTable()
			.columnFilter({aoColumns:[
				{ sSelector: "#renderingEngineFilter", type:"select"  },
				{ sSelector: "#browserFilter" },
				{ sSelector: "#platformsFilter" },
				{ sSelector: "#engineVersionFilter", type:"number-range" },
				{ sSelector: "#cssGradeFilter", type:"select", values : ["A", "B", "C"] }
				]}
			);
        </pre>




        <h1>Other examples</h1>

        <div id="footer" style="text-align:center;">
            <span style="font-size:10px;">
                DataTables Column Filter Add-on &copy; Jovan Popovic 2011.<br>
                DataTables designed and created by <a href="http://www.sprymedia.co.uk">Allan Jardine</a> &copy; 2007-2011<br>
            </span>
        </div>
    </div>
</body>





</html>