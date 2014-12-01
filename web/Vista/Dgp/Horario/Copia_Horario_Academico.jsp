<head>

    <title>Carga Academica</title>
    <link href="academico.css" rel="STYLESHEET" type="text/css">
    <script type="text/javascript" src="../../../js/JQuery/jQuery.js" ></script>

</head>

<body >
    <div id="myDiv"></div>



    <table width="100%" cellspacing="0" cellpadding="0" >

        <tr>
            <td colspan="3" class="head">

                102-Facultad de Ingeniería y Arquitectura - 10202-Ingeniería de Sistemas</b>

            </td>
        </tr>
    </table>



    <table cellpadding="0" cellspacing="1" border="0" width="100%">
        <tr>

            <td width="100%" valign="top">

                <!-- inicio de estructura -->

                <table cellpaddinng="1" cellspacing="0" align="center">
                    <tr>
                    <form name="datos">
                        <td colspan="3" align="center" valign="top">
                            <strong>CURSOS MATRICULADOS</strong> -
                            Carga Academica
                            <select name="f_carga_id" onChange="document.datos.submit()">

                                <option	value="2014-2" selected  >2014-2</option>

                                <option	value="2014-1"   >2014-1</option>

                                <option	value="2013-2"   >2013-2</option>

                                <option	value="2013-1"   >2013-1</option>

                                <option	value="2012-2"   >2012-2</option>

                                <option	value="2012-1"   >2012-1</option>

                            </select>
                        </td>
                    </form>
        </tr>

        <tr>
            <td valign="TOP">

                <table width="100%" cellpadding="0" cellspacing="1" valign="TOP" >

                    <tr align='CENTER'>
                        <th  >#</th>
                        <th  >Cursos</th>

                    </tr>
                    <tbody class="tbody-cursos">

                    </tbody>
                </table>
            </td>

        <script type="text/javascript">
            $(document).ready(function () {

                var url = 'http://localhost/demo/data.php';
                var arr = [];
                var fila = 1;
                var columna = 0;
                var g = 0;

                $.post(url, "", function (data) {

                    $.each(data, function (f, campo) {
                        if (campo.dni == '42001721') {

                            $('.tbody-cursos').append('<tr><td >' + (g + 1) + '.</td><td><b>' + campo.nombrecurso + '</b></td><td ><li> ' + campo.nombre + '</li><li>Ing.Sist. Ciclo:6</li></td></tr>');

                            arr[g] = campo.horario.toString();
                            g++;
                        }


                    });
                    for (var j = 0; j < arr.length; j++) {
                        var myArray = arr[j].split('');

                        for (var i = 0; i < myArray.length; i++) {
                            columna++;
                            if (myArray[i] == "1") {
                                $(".fila-" + fila + " .columna-" + columna).css("background", "blue");
                            }
                            if (columna == 7) {
                                columna = 0;
                                fila++;
                            }
                        }
                        fila = 1;
                        columna = 0;
                    }

                });


                //arr[0] = '0100100010010001001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000';
                //arr[1] = '0000000000000000000100000010000001000000100000000000000000000000000000000000000000000000000000000000000000000000';

                /*  for (var j = 0; j < arr.length; j++) {
                 var myArray = arr[j].split('');
                 
                 for (var i = 0; i < myArray.length; i++) {
                 columna++;
                 if (myArray[i] == "1") {
                 $(".fila-" + fila + " .columna-" + columna).css("background", "blue");
                 }
                 if (columna == 7) {
                 columna = 0;
                 fila++;
                 }
                 }
                 fila = 1;
                 columna = 0;
                 }*/


            });

        </script>
        <td valign="TOP">
            <table cellpadding="0" cellspacing="1" valign="TOP" align='CENTER' class="tabla-horario">
                <tr>
                    <th colspan="9">Carga Acad&eacute;mica</th>
                </tr>
                <tr align='CENTER'>
                    <th colspan=2>Periodo</th>
                    <th>D</th>
                    <th>L</th>
                    <th>M</th>
                    <th>M</th>
                    <th>J</th>
                    <th>V</th>
                    <th>S</th>
                </tr>
                <tr>
                    <td colspan="9" align="CENTER" style="font-weight: bold;">
                        Horario de Ma&ntilde;ana
                    </td>
                </tr>

                <tr class="fila-1">
                    <td ><b>1.</b></td><td>7:30 - 8:20</td> 
                    <td class="columna-1" ></td>
                    <td class="columna-2" ></td>
                    <td class="columna-3" ></td>
                    <td class="columna-4" ></td>
                    <td class="columna-5" ></td>
                    <td class="columna-6" ></td>
                    <td class="columna-7" ></td>
                </tr>
                <tr class="fila-2">
                    <td ><b>2.</b></td><td>8:25 - 9:15</td>
                    <td class="columna-1" ></td>
                    <td class="columna-2" ></td>
                    <td class="columna-3" ></td>
                    <td class="columna-4" ></td>
                    <td class="columna-5" ></td>
                    <td class="columna-6" ></td>
                    <td class="columna-7" ></td>
                </tr>
                <tr class="fila-3">
                    <td ><b>3.</b></td>
                    <td>9:20 - 10:10</td>
                    <td class="columna-1" ></td>
                    <td class="columna-2" ></td>
                    <td class="columna-3" ></td>
                    <td class="columna-4" ></td>
                    <td class="columna-5" ></td>
                    <td class="columna-6" ></td>
                    <td class="columna-7" ></td>
                </tr>
                <tr class="fila-4">
                    <td><b>4.</b></td>
                    <td >10:20 - 11:10</td>
                    <td class="columna-1" ></td>
                    <td class="columna-2" ></td>
                    <td class="columna-3" ></td>
                    <td class="columna-4" ></td>
                    <td class="columna-5" ></td>
                    <td class="columna-6" ></td>
                    <td class="columna-7" ></td>
                </tr>

                <tr class="fila-5">
                    <td ><b>5.</b></td><td >11:15 - 12:05</td>
                    <td class="columna-1" ></td>
                    <td class="columna-2" ></td>
                    <td class="columna-3" ></td>
                    <td class="columna-4" ></td>
                    <td class="columna-5" ></td>
                    <td class="columna-6" ></td>
                    <td class="columna-7" ></td>
                </tr>

                <tr class="fila-6">
                    <td ><b>6.</b></td><td>12:10 - 1:00</td>
                    <td class="columna-1" ></td>
                    <td class="columna-2" ></td>
                    <td class="columna-3" ></td>
                    <td class="columna-4" ></td>
                    <td class="columna-5" ></td>
                    <td class="columna-6" ></td>
                    <td class="columna-7" ></td>
                </tr>
                <tr>
                    <td colspan="9" align="CENTER" style="font-weight: bold;">Horario de Tarde</td>
                </tr>

                <tr class="fila-7">
                    <td ><b>1.</b></td><td >1:10 - 2:00</td>
                    <td class="columna-1" ></td>
                    <td class="columna-2" ></td>
                    <td class="columna-3" ></td>
                    <td class="columna-4" ></td>
                    <td class="columna-5" ></td>
                    <td class="columna-6" ></td>
                    <td class="columna-7" ></td>
                </tr>

                <tr class="fila-8">
                    <td ><b>2.</b></td><td >2:05 - 2:55</td>
                    <td class="columna-1" ></td>
                    <td class="columna-2" ></td>
                    <td class="columna-3" ></td>
                    <td class="columna-4" ></td>
                    <td class="columna-5" ></td>
                    <td class="columna-6" ></td>
                    <td class="columna-7" ></td>
                </tr>
                <tr class="fila-9">
                    <td ><b>3.</b></td><td >3:00 - 3:50</td>
                    <td class="columna-1" ></td>
                    <td class="columna-2" ></td>
                    <td class="columna-3" ></td>
                    <td class="columna-4" ></td>
                    <td class="columna-5" ></td>
                    <td class="columna-6" ></td>
                    <td class="columna-7" ></td>
                </tr>
                <tr class="fila-10">
                    <td ><b>4.</b></td>
                    <td >4:00 - 4:50</td>
                    <td class="columna-1" ></td>
                    <td class="columna-2" ></td>
                    <td class="columna-3" ></td>
                    <td class="columna-4" ></td>
                    <td class="columna-5" ></td>
                    <td class="columna-6" ></td>
                    <td class="columna-7" ></td>
                </tr>
                <tr class="fila-11">
                    <td ><b>5.</b></td><td>4:55 - 5:45</td>
                    <td class="columna-1" ></td>
                    <td class="columna-2" ></td>
                    <td class="columna-3" ></td>
                    <td class="columna-4" ></td>
                    <td class="columna-5" ></td>
                    <td class="columna-6" ></td>
                    <td class="columna-7" ></td>
                </tr>
                <tr class="fila-12">
                    <td ><b>6.</b></td><td >5:50 - 6:40</td>
                    <td class="columna-1" ></td>
                    <td class="columna-2" ></td>
                    <td class="columna-3" ></td>
                    <td class="columna-4" ></td>
                    <td class="columna-5" ></td>
                    <td class="columna-6" ></td>
                    <td class="columna-7" ></td>
                </tr>
                <tr>
                    <td colspan="9" align="CENTER" style="font-weight: bold;">Horario de Noche</td>
                </tr>
                <tr class="fila-13">
                    <td ><b>1.</b></td>
                    <td >6:45 - 7:35</td>
                    <td class="columna-1" ></td>
                    <td class="columna-2" ></td>
                    <td class="columna-3" ></td>
                    <td class="columna-4" ></td>
                    <td class="columna-5" ></td>
                    <td class="columna-6" ></td>
                    <td class="columna-7" ></td>
                </tr>
                <tr class="fila-14">
                    <td><b>2.</b></td>
                    <td >7:40 - 8:30</td>
                    <td class="columna-1" ></td>
                    <td class="columna-2" ></td>
                    <td class="columna-3" ></td>
                    <td class="columna-4" ></td>
                    <td class="columna-5" ></td>
                    <td class="columna-6" ></td>
                    <td class="columna-7" ></td>
                </tr>
                <tr class="fila-15">
                    <td ><b>3.</b></td>
                    <td >8:35 - 9:25</td>
                    <td class="columna-1" ></td>
                    <td class="columna-2" ></td>
                    <td class="columna-3" ></td>
                    <td class="columna-4" ></td>
                    <td class="columna-5" ></td>
                    <td class="columna-6" ></td>
                    <td class="columna-7" ></td>
                </tr>

                <tr class="fila-16">
                    <td ><b>4.</b></td>
                    <td >9:30 - 10:20</td>
                    <td class="columna-1" ></td>
                    <td class="columna-2" ></td>
                    <td class="columna-3" ></td>
                    <td class="columna-4" ></td>
                    <td class="columna-5" ></td>
                    <td class="columna-6" ></td>
                    <td class="columna-7" ></td>

                </tr>

            </table>
        <td valign="TOP">

            </tr>



    </table>

</td>
</tr>
</table>

<!-- fin de estructura -->


</body>

<html>
