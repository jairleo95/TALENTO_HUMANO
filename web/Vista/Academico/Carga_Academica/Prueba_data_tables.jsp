
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
            $(document).ready(function () {
                $('#example').dataTable().columnFilter({aoColumns: [
                                {type: "select", sSelector: "#renderingEngineFilter"},
                                {sSelector: "#browserFilter"},
                                {type: "date-range", sSelector: "#platformsFilter"},
                                {type: "number-range", sSelector: "#engineVersionFilter"},
                                {type: "select", values: ["A", "B", "C"], sSelector: "#cssGradeFilter"}
                            ]}
                        );

            });
        </script>
        <script type="text/javascript">

            var _gaq = _gaq || [];
            _gaq.push(['_setAccount', 'UA-17838786-4']);
            _gaq.push(['_trackPageview']);

            (function () {
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

        <div id="container">
          

            <table cellspacing="0" cellpadding="0" border="0" class="display" ID="Table1">
                <thead>
                    <tr>
                        <th>Columna</th>
                        <th>Filtro</th>
                    </tr>
                </thead>
                <tbody>
                    <tr id="filter_global">
                        <td align="center">Rendering engine</td>
                        <td align="center" id="renderingEngineFilter"></td>
                    </tr>
                    <tr id="filter_col1">
                        <td align="center">Browser</td>
                        <td align="center" id="browserFilter"></td>
                    </tr>
                    <tr id="filter_col2">
                        <td align="center">Platform(s)</td>
                        <td align="center" id="platformsFilter"></td>
                    </tr>
                    <tr id="filter_col3">
                        <td align="center">Engine version</td>
                        <td align="center" id="engineVersionFilter"></td>
                    </tr>
                    <tr id="filter_col4">
                        <td align="center">CSS grade</td>
                        <td align="center" id="cssGradeFilter"></td>
                    </tr>
                </tbody>
            </table>


            <div id="demo">

                <table cellpadding="0" cellspacing="0" border="0" class="display" id="example">
                    <thead>
                        <tr>
                            <th>Rendering engine</th>
                            <th>Browser</th>
                            <th>Platform(s)</th>
                            <th>Engine version</th>
                            <th>CSS grade</th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                        </tr>
                    </tfoot>
                    <tbody>
                        <tr class="" id="2">
                            <td class="read_only">Trident</td>
                            <td>Internet Explorer 4.0</td>
                            <td>Win 95+</td>
                            <td class="center">4</td>

                            <td class="center">X</td>
                        </tr>
                        <tr class="" id="4">
                            <td>Trident</td>
                            <td>Internet Explorer 5.0</td>
                            <td>Win 95+</td>
                            <td class="center">5</td>

                            <td class="center">C</td>
                        </tr>
                        <tr class="" id="5">
                            <td>Trident</td>
                            <td>Internet Explorer 5.5</td>
                            <td>Win 95+</td>
                            <td class="center">5.5</td>

                            <td class="center">A</td>
                        </tr>
                        <tr class="" id="1">
                            <td>Trident</td>
                            <td class="read_only">Internet Explorer 6</td>
                            <td>Win 98+</td>
                            <td class="center">6</td>

                            <td class="center">A</td>
                        </tr>
                        <tr class="" id="5">
                            <td>Trident</td>
                            <td>Internet Explorer 7</td>
                            <td class="read_only">Win XP SP2+</td>
                            <td class="center">7</td>

                            <td class="center">A</td>
                        </tr>
                        <tr class="" id="1">
                            <td>Trident</td>
                            <td>AOL browser (AOL desktop)</td>
                            <td>Win XP</td>
                            <td class="center">6</td>

                            <td class="center read_only">A</td>
                        </tr>
                        <tr class="odd_gradeA" id="5">
                            <td>Gecko (UTF-8: $�?)</td>
                            <td>Firefox 1.0</td>
                            <td>Win 98+ / OSX.2+</td>
                            <td class="center">1.7</td>

                            <td class="center">A</td>
                        </tr>
                        <tr class="even_gradeA" id="1">
                            <td>Gecko</td>
                            <td>Firefox 1.5</td>
                            <td>Win 98+ / OSX.2+</td>
                            <td class="center">1.8</td>

                            <td class="center">A</td>
                        </tr>
                        <tr class="odd_gradeA" id="5">
                            <td>Gecko</td>
                            <td>Firefox 2.0</td>
                            <td>Win 98+ / OSX.2+</td>
                            <td class="center">1.8</td>

                            <td class="center">A</td>
                        </tr>
                        <tr class="even_gradeA" id="1">
                            <td>Gecko</td>
                            <td>Firefox 3.0</td>
                            <td>Win 2k+ / OSX.3+</td>
                            <td class="center">1.9</td>

                            <td class="center">A</td>
                        </tr>
                        <tr class="odd_gradeA" id="5">
                            <td>Gecko</td>
                            <td>Camino 1.0</td>
                            <td>OSX.2+</td>
                            <td class="center">1.8</td>

                            <td class="center">A</td>
                        </tr>
                        <tr class="even_gradeA" id="1">
                            <td>Gecko</td>
                            <td>Camino 1.5</td>
                            <td>OSX.3+</td>
                            <td class="center">1.8</td>

                            <td class="center">A</td>
                        </tr>
                        <tr class="odd_gradeA" id="5">
                            <td>Gecko</td>
                            <td>Netscape 7.2</td>
                            <td>Win 95+ / Mac OS 8.6-9.2</td>
                            <td class="center">1.7</td>

                            <td class="center">A</td>
                        </tr>
                        <tr class="even_gradeA" id="1">
                            <td>Gecko</td>
                            <td>Netscape Browser 8</td>
                            <td>Win 98SE+</td>
                            <td class="center">1.7</td>

                            <td class="center">A</td>
                        </tr>
                        <tr class="odd_gradeA" id="5">
                            <td>Gecko</td>
                            <td>Netscape Navigator 9</td>
                            <td>Win 98+ / OSX.2+</td>
                            <td class="center">1.8</td>

                            <td class="center">A</td>
                        </tr>
                        <tr class="even_gradeA" id="1">
                            <td>Gecko</td>
                            <td>Mozilla 1.0</td>
                            <td>Win 95+ / OSX.1+</td>
                            <td class="center">1</td>

                            <td class="center">A</td>
                        </tr>
                        <tr class="odd_gradeA" id="5">
                            <td>Gecko</td>
                            <td>Mozilla 1.1</td>
                            <td>Win 95+ / OSX.1+</td>
                            <td class="center">1.1</td>

                            <td class="center">A</td>
                        </tr>
                        <tr class="even_gradeA" id="1">
                            <td>Gecko</td>
                            <td>Mozilla 1.2</td>
                            <td>Win 95+ / OSX.1+</td>
                            <td class="center">1.2</td>

                            <td class="center">A</td>
                        </tr>
                        <tr class="odd_gradeA" id="5">
                            <td>Gecko</td>
                            <td>Mozilla 1.3</td>
                            <td>Win 95+ / OSX.1+</td>
                            <td class="center">1.3</td>

                            <td class="center">A</td>
                        </tr>
                        <tr class="even_gradeA" id="1">
                            <td>Gecko</td>
                            <td>Mozilla 1.4</td>
                            <td>Win 95+ / OSX.1+</td>
                            <td class="center">1.4</td>

                            <td class="center">A</td>
                        </tr>
                        <tr class="odd_gradeA" id="5">
                            <td>Gecko</td>
                            <td>Mozilla 1.5</td>
                            <td>Win 95+ / OSX.1+</td>
                            <td class="center">1.5</td>

                            <td class="center">A</td>
                        </tr>
                        <tr class="even_gradeA" id="1">
                            <td>Gecko</td>
                            <td>Mozilla 1.6</td>
                            <td>Win 95+ / OSX.1+</td>
                            <td class="center">1.6</td>

                            <td class="center">A</td>
                        </tr>
                        <tr class="odd_gradeA" id="5">
                            <td>Gecko</td>
                            <td>Mozilla 1.7</td>
                            <td>Win 98+ / OSX.1+</td>
                            <td class="center">1.7</td>

                            <td class="center">A</td>
                        </tr>
                        <tr class="even_gradeA" id="1">
                            <td>Gecko</td>
                            <td>Mozilla 1.8</td>
                            <td>Win 98+ / OSX.1+</td>
                            <td class="center">1.8</td>

                            <td class="center">A</td>
                        </tr>
                        <tr class="odd_gradeA" id="5">
                            <td>Gecko</td>
                            <td>Seamonkey 1.1</td>
                            <td>Win 98+ / OSX.2+</td>
                            <td class="center">1.8</td>

                            <td class="center">A</td>
                        </tr>
                        <tr class="even_gradeA" id="1">
                            <td>Gecko</td>
                            <td>Epiphany 2.20</td>
                            <td>Gnome</td>
                            <td class="center">1.8</td>

                            <td class="center">A</td>
                        </tr>
                        <tr class="odd_gradeA" id="5">
                            <td>Webkit</td>
                            <td>Safari 1.2</td>
                            <td>OSX.3</td>
                            <td class="center">125.5</td>

                            <td class="center">A</td>
                        </tr>
                        <tr class="even_gradeA" id="1">
                            <td>Webkit</td>
                            <td>Safari 1.3</td>
                            <td>OSX.3</td>
                            <td class="center">312.8</td>

                            <td class="center">A</td>
                        </tr>
                        <tr class="odd_gradeA" id="5">
                            <td>Webkit</td>
                            <td>Safari 2.0</td>
                            <td>OSX.4+</td>
                            <td class="center">419.3</td>

                            <td class="center">A</td>
                        </tr>
                        <tr class="even_gradeA" id="1">
                            <td>Webkit</td>
                            <td>Safari 3.0</td>
                            <td>OSX.4+</td>
                            <td class="center">522.1</td>

                            <td class="center">A</td>
                        </tr>
                        <tr class="odd_gradeA" id="5">
                            <td>Webkit</td>
                            <td>OmniWeb 5.5</td>
                            <td>OSX.4+</td>
                            <td class="center">420</td>

                            <td class="center">A</td>
                        </tr>
                        <tr class="even_gradeA" id="1">
                            <td>Webkit</td>
                            <td>iPod Touch / iPhone</td>
                            <td>iPod</td>
                            <td class="center">420.1</td>

                            <td class="center">A</td>
                        </tr>
                        <tr class="odd_gradeA" id="5">
                            <td>Webkit</td>
                            <td>S60</td>
                            <td>S60</td>
                            <td class="center">413</td>

                            <td class="center">A</td>
                        </tr>
                        <tr class="even_gradeA" id="1">
                            <td>Presto</td>
                            <td>Opera 7.0</td>
                            <td>Win 95+ / OSX.1+</td>
                            <td class="center">-</td>

                            <td class="center">A</td>
                        </tr>
                        <tr class="odd_gradeA" id="5">
                            <td>Presto</td>
                            <td>Opera 7.5</td>
                            <td>Win 95+ / OSX.2+</td>
                            <td class="center">-</td>

                            <td class="center">A</td>
                        </tr>
                        <tr class="even_gradeA" id="1">
                            <td>Presto</td>
                            <td>Opera 8.0</td>
                            <td>Win 95+ / OSX.2+</td>
                            <td class="center">-</td>

                            <td class="center">A</td>
                        </tr>
                        <tr class="odd_gradeA" id="5">
                            <td>Presto</td>
                            <td>Opera 8.5</td>
                            <td>Win 95+ / OSX.2+</td>
                            <td class="center">-</td>

                            <td class="center">A</td>
                        </tr>
                        <tr class="even_gradeA" id="1">
                            <td>Presto</td>
                            <td>Opera 9.0</td>
                            <td>Win 95+ / OSX.3+</td>
                            <td class="center">-</td>

                            <td class="center">A</td>
                        </tr>
                        <tr class="odd_gradeA" id="5">
                            <td>Presto</td>
                            <td>Opera 9.2</td>
                            <td>Win 88+ / OSX.3+</td>
                            <td class="center">-</td>

                            <td class="center">A</td>
                        </tr>
                        <tr class="even_gradeA" id="1">
                            <td>Presto</td>
                            <td>Opera 9.5</td>
                            <td>Win 88+ / OSX.3+</td>
                            <td class="center">-</td>

                            <td class="center">A</td>
                        </tr>
                        <tr class="odd_gradeA" id="5">
                            <td>Presto</td>
                            <td>Opera for Wii</td>
                            <td>Wii</td>
                            <td class="center">-</td>

                            <td class="center">A</td>
                        </tr>
                        <tr class="even_gradeA" id="1">
                            <td>Presto</td>
                            <td>Nokia N800</td>
                            <td>N800</td>
                            <td class="center">-</td>

                            <td class="center">A</td>
                        </tr>
                        <tr class="odd_gradeA" id="5">
                            <td>Presto</td>
                            <td>Nintendo DS browser</td>
                            <td>Nintendo DS</td>
                            <td class="center">8.5</td>

                            <td class="center">C/A<sup>1</sup></td>
                        </tr>
                        <tr class="even_gradeC" id="4">
                            <td>KHTML</td>
                            <td>Konqureror 3.1</td>
                            <td>KDE 3.1</td>

                            <td class="center">3.1</td>
                            <td class="center">C</td>
                        </tr>
                        <tr class="odd_gradeA" id="5">
                            <td>KHTML</td>
                            <td>Konqureror 3.3</td>
                            <td>KDE 3.3</td>

                            <td class="center">3.3</td>
                            <td class="center">A</td>
                        </tr>
                        <tr class="even_gradeA" id="1">
                            <td>KHTML</td>
                            <td>Konqureror 3.5</td>
                            <td>KDE 3.5</td>

                            <td class="center">3.5</td>
                            <td class="center">A</td>
                        </tr>
                        <tr class="odd_gradeX" id="2">
                            <td>Tasman</td>
                            <td>Internet Explorer 4.5</td>
                            <td>Mac OS 8-9</td>

                            <td class="center">-</td>
                            <td class="center">X</td>
                        </tr>
                        <tr class="even_gradeC" id="4">
                            <td>Tasman</td>
                            <td>Internet Explorer 5.1</td>
                            <td>Mac OS 7.6-9</td>

                            <td class="center">1</td>
                            <td class="center">C</td>
                        </tr>
                        <tr class="odd_gradeC" id="3">
                            <td>Tasman</td>
                            <td>Internet Explorer 5.2</td>
                            <td>Mac OS 8-X</td>

                            <td class="center">1</td>
                            <td class="center">C</td>
                        </tr>
                        <tr class="even_gradeA" id="1">
                            <td>Misc</td>
                            <td>NetFront 3.1</td>
                            <td>Embedded devices</td>

                            <td class="center">-</td>
                            <td class="center">C</td>
                        </tr>
                        <tr class="odd_gradeA" id="5">
                            <td>Misc</td>
                            <td>NetFront 3.4</td>
                            <td>Embedded devices</td>

                            <td class="center">-</td>
                            <td class="center">A</td>
                        </tr>
                        <tr class="even_gradeX" id="11">
                            <td>Misc</td>
                            <td>Dillo 0.8</td>
                            <td>Embedded devices</td>

                            <td class="center">-</td>
                            <td class="center">X</td>
                        </tr>
                        <tr class="odd_gradeX" id="2">
                            <td>Misc</td>
                            <td>Links</td>
                            <td>Text only</td>

                            <td class="center">-</td>
                            <td class="center">X</td>
                        </tr>
                        <tr class="even_gradeX" id="11">
                            <td>Misc</td>
                            <td>Lynx</td>
                            <td>Text only</td>

                            <td class="center">-</td>
                            <td class="center">X</td>
                        </tr>
                        <tr class="odd_gradeC" id="3">
                            <td>Misc</td>
                            <td>IE Mobile</td>
                            <td>Windows Mobile 6</td>

                            <td class="center">-</td>
                            <td class="center">C</td>
                        </tr>
                        <tr class="even_gradeC" id="4">
                            <td>Misc</td>
                            <td>PSP browser</td>
                            <td>PSP</td>

                            <td class="center">-</td>
                            <td class="center">C</td>
                        </tr>
                        <tr class="odd_gradeU" id="10">
                            <td>Other browsers</td>
                            <td>All others</td>
                            <td>-</td>

                            <td class="center">-</td>
                            <td class="center">U</td>
                        </tr>
                    </tbody>
                </table>

            </div>
            <!--<div class="spacer" style="border: 3px solid black;"></div>-->
           
        </div>
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
            <label>Situaci�n Educativa :</label><select>
                <option></option>
            </select>
            <br>
            <label>Profesi�n Docente :</label><select>
                <option></option>
            </select>
            <br>
            <label>Condici�n :</label><select>
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