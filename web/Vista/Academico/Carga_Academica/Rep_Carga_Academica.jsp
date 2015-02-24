
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html><head>


        <meta http-equiv="content-type" content="text/html; charset=UTF-8">

        <title>Tablas con Filtros</title>

        

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