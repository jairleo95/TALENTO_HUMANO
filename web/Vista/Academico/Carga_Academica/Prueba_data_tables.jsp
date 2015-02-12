
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html><head>


        <meta http-equiv="content-type" content="text/html; charset=UTF-8">

        <title>Using DataTable with column filter plugin - Place filter in the external form</title>
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
          


            <h1>Live example</h1>

            <table cellspacing="0" cellpadding="0" border="0" class="display" ID="Table1">
                <thead>
                    <tr>
                        <th>Column</th>
                        <th>Filter</th>
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

                            <th>Rendering engine</th>
                            <th>Browser</th>
                            <th>Platform(s)</th>
                            <th>Engine version</th>
                            <th>CSS grade</th>
                        </tr>
                    </tfoot>
                    <tbody>
                        <tr class="odd_gradeX" id="2">
                            <td class="read_only">Trident</td>
                            <td>Internet Explorer 4.0</td>
                            <td>Win 95+</td>
                            <td class="center">4</td>

                            <td class="center">X</td>
                        </tr>
                        <tr class="even_gradeC" id="4">
                            <td>Trident</td>
                            <td>Internet Explorer 5.0</td>
                            <td>Win 95+</td>
                            <td class="center">5</td>

                            <td class="center">C</td>
                        </tr>
                        <tr class="odd_gradeA" id="5">
                            <td>Trident</td>
                            <td>Internet Explorer 5.5</td>
                            <td>Win 95+</td>
                            <td class="center">5.5</td>

                            <td class="center">A</td>
                        </tr>
                        <tr class="even_gradeA" id="1">
                            <td>Trident</td>
                            <td class="read_only">Internet Explorer 6</td>
                            <td>Win 98+</td>
                            <td class="center">6</td>

                            <td class="center">A</td>
                        </tr>
                        <tr class="odd_gradeA" id="5">
                            <td>Trident</td>
                            <td>Internet Explorer 7</td>
                            <td class="read_only">Win XP SP2+</td>
                            <td class="center">7</td>

                            <td class="center">A</td>
                        </tr>
                        <tr class="even_gradeA" id="1">
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
            <ul>

                <li><a href="default.html">Basic usage</a></li>
                <li><a href="customFilters.html">Custom filters</a></li>
                <li><a href="dateRange.html">Date ranges</a></li>
                <li><a href="numberRange.html">Number ranges</a></li>
                <li><a href="ajaxSource.html">Ajax source filtering</a></li>
                <li><a href="serverSide.html">Server-side filtering</a></li>
                <li><a href="regex.html">Regular expression filtering</a></li>
                <li><a href="external.html">Filtering via external form</a></li>
            </ul>

            <div id="footer" style="text-align:center;">
                <span style="font-size:10px;">
                    DataTables Column Filter Add-on &copy; Jovan Popovic 2011.<br>
                    DataTables designed and created by <a href="http://www.sprymedia.co.uk">Allan Jardine</a> &copy; 2007-2011<br>
                </span>
            </div>
        </div>
    </body>





</html>