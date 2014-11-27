
<%@page import="pe.edu.upeu.application.model.V_Var_Usuario"%>
<jsp:useBean id="List_Usuario_var" scope="application" class="java.util.ArrayList"/>
<!DOCTYPE html">
<html >
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Usuarios</title>

        <script src="../../js/Js_Sort/modernizr.custom.63321.js" type="text/javascript"></script>
        <link rel="stylesheet" href="../../css/Css_Sort/style.css" />
       <!-- <link rel="stylesheet" href="../../css/Css_Lista/listas.css" />
        <!--Css pannel contact-->
        <link href="../../css/Css_Sort/stylesContact.css" rel="stylesheet" type="text/css" />
        <!--End Css pannel contact-->
        <script type="text/javascript">
            function changeCSS(cssFile, cssLinkIndex) {

                var oldlink = document.getElementsByTagName("link").item(cssLinkIndex);

                var newlink = document.createElement("link")
                newlink.setAttribute("rel", "stylesheet");
                newlink.setAttribute("type", "text/css");
                newlink.setAttribute("href", cssFile);

                document.getElementsByTagName("head").item(0).replaceChild(newlink, oldlink);
            }

        </script>

        <script>
            function checkAGE()
            {
                if (!confirm
                        ("¿Estas seguro de eliminar este registro?"))
                    history.go(-1);
                return " "
            }

    //document.writeln(checkAGE())

        </script>
        <style type="text/css">
            #titulo >h1{
                text-align: center;
                color:#a6abad;
            }

            .container{
                // padding-bottom: 20px;
                //height: 650px;
            }
            a{
                color: #0095cd;
                text-decoration: none;
            }


        </style>
    </head>
    <body>
        <!--
    <div id="titulo">
        <h1>Usuarios</h1>
    </div>
        -->
        <hr>
    <center>
        <div class="container">

            <div id="tablewrapper">
                <div id="tableheader">
                    <div class="search">
                        <select id="columns" onchange="sorter.search('query')"></select>
                        <input type="text" id="query" onkeyup="sorter.search('query')" />
                    </div>
                    <span class="details">
                        <div>Registros de <span id="startrecord"></span>-<span id="endrecord"></span> de <span id="totalrecords"></span></div>
                        <div class="btn-reset"><a class="button blue" href="javascript:sorter.reset()">Restaurar</a></div>
                    </span>
                </div>
                <table cellpadding="0" cellspacing="0" border="0" id="table" class="tinytable">
                    <thead>
                        <tr>
                            <th class="nosort"><h3>ID</h3></th>
                <th class="cajita"><h3>Apellidos y Nombres</h3></th>
<th class="cajita"><h3>Rol</h3></th>
<th class="cajita"><h3>Puesto</h3></th>
<th class="cajita"><h3>Sección</h3></th>
<th class="cajita"><h3>Area</h3></th>
<th class="cajita"><h3>Departamento</h3></th>
<th class="cajita"><h3>Usuario</h3></th>
<th class="cajita"><h3>Clave</h3></th>
<th class="cajita"><h3>Estado</h3></th>
<th class="cajita" colspan="3" ><h3>Opcion</h3></th>


                    </tr>
                    </thead>
                    <tbody> 
                        <% for (int w = 0; w <List_Usuario_var.size(); w++) {
                            V_Var_Usuario u=new V_Var_Usuario();
                            u=(V_Var_Usuario)List_Usuario_var.get(w);
                        %>
                        <tr>
                            <td><%=w+1%></td>
                            <td class="name"><a href="../Trabajador/Detalle_Trabajador.jsp?idtr=<%=u.getId_trabajador()%>"><%=u.getAp_paterno()+"  "%><%=u.getAp_materno()+",  "%><%=u.getNo_trabajador()%></a></td>
                            <td><%=u.getNo_rol()%></td>
                            <td><%=u.getNo_puesto()%></td>
                            <td><%=u.getNo_seccion()%></td>
                            <td><%=u.getNo_area()%></td>
                            <td><%=u.getNo_dep()%></td>
                            <td><%=u.getNo_usuario()%></td>
                            <td><%=u.getPw_usuario()%></td>
                            <td><%=u.getEs_usuario()%></td>
                            <td><a href="../../Usuario?id_usu=<%=u.getId_usuario()%>&opc=Modificar_clave_1"><img src="../../imagenes/lapiz.png" alt="" width="25px" height="25px"/></a></td>
                            <td><a href="../../Usuario?id_usu=<%=u.getId_usuario()%>&opc=Quitar_acceso"><img src="../../imagenes/eliminar.png" alt="" width="25px" height="25px"/></a></td>
                            <td><a href="../../Usuario?id_usu=<%=u.getId_usuario()%>&opc=Eliminar_Usuario"><img src="../../imagenes/Desaprobado.png" alt="" width="25px" height="25px"/></a></td>
                        </tr>
                        <%}%>        
                    </tbody>


                    <!-- <script language="JavaScript" type="text/javascript">
         
         function checkAGE()
         {
         if (!confirm
         ("¿Estas seguro de eliminar este registro?"))
         history.go(-1);return " "}
         
         document.writeln(checkAGE())
             </script>-->


                </table>
                <div id="tablefooter">
                    <div id="tablenav">
                        <div>
                            <img src="../../imagenes/Img_Sort/first.png" width="16" height="16" alt="First Page" onclick="sorter.move(-1, true)" />
                            <img src="../../imagenes/Img_Sort/previous.png" width="16" height="16" alt="First Page" onclick="sorter.move(-1)" />
                            <img src="../../imagenes/Img_Sort/next.png" width="16" height="16" alt="First Page" onclick="sorter.move(1)" />
                            <img src="../../imagenes/Img_Sort/last.png" width="16" height="16" alt="Last Page" onclick="sorter.move(1, true)" />
                        </div>
                        <div>
                            <label>Página: </label>
                            <select  id="pagedropdown"></select>
                        </div>
                        <div class="btn-reset"><a class="button blue" href="javascript:sorter.showall()">Ver todo</a>
                        </div>
                    </div>
                    <div id="tablelocation">
                        <div>
                            <select onchange="sorter.size(this.value)">
                                <option value="5" selected="selected">5</option>
                                <option value="10" >10</option>
                                <!-- <option value="15">15</option>
                                <option value="50">50</option>
                                <option value="100">100</option>-->
                            </select>
                            <span class="txt-page">Entradas por página</span>
                        </div>

                        <div class="page txt-txt">Página <span id="currentpage"></span> de <span id="totalpages"></span></div>
                    </div>
                </div>
            </div>
        </div>
        </center>

        <script type="text/javascript" src="../../js/Js_Sort/script.js"></script>
        <script type="text/javascript">
                        var sorter = new TINY.table.sorter('sorter', 'table', {
                            headclass: 'head', // Header Class //
                            ascclass: 'asc', // Ascending Class //
                            descclass: 'desc', // Descending Class //
                            evenclass: 'evenrow', // Even Row Class //
                            oddclass: 'oddrow', // Odd Row Class //
                            evenselclass: 'evenselected', // Even Selected Column Class //
                            oddselclass: 'oddselected', // Odd Selected Column Class //
                            paginate: true, // Paginate? (true or false) //
                            size: 5, // Initial Page Size //
                            colddid: 'columns', // Columns Dropdown ID (optional) //
                            currentid: 'currentpage', // Current Page ID (optional) //
                            totalid: 'totalpages', // Current Page ID (optional) //
                            startingrecid: 'startrecord', // Starting Record ID (optional) //
                            endingrecid: 'endrecord', // Ending Record ID (optional) //
                            totalrecid: 'totalrecords', // Total Records ID (optional) //
                            hoverid: 'selectedrow', // Hover Row ID (optional) //
                            pageddid: 'pagedropdown', // Page Dropdown ID (optional) //
                            navid: 'tablenav', // Table Navigation ID (optional) //
                            sortcolumn: 1, // Index of Initial Column to Sort (optional) //
                            sortdir: 1, // Sort Direction (1 or -1) //
                            sum: [8], // Index of Columns to Sum (optional) //
                            //avg: [6, 7, 8, 9], // Index of Columns to Average (optional) //
                            columns: [{index: 7, format: '%', decimals: 1}, {index: 8, format: '$', decimals: 0}], // Sorted Column Settings (optional) //
                            init: true// Init Now? (true or false) //

                        });
        </script>


        <!--Script Open Pannel--->
        <script src="../../js/jquery.min.js"></script>
        <script src="../../js/Js_Sort/jquery.reveal.js" type="text/javascript"></script>


        <script type="text/javascript">
                              $(document).ready(function() {
                                  $('.button-email').click(function(e) { // Button which will activate our modal
                                      var title = $(this).attr('title');
                                      var title2 = $('.name').attr('title');
                                      document.getElementById("email").innerHTML = title.toString();
                                      $('#modal').reveal({// The item which will be opened with reveal
                                          animation: 'fade', // fade, fadeAndPop, none
                                          animationspeed: 600, // how fast animtions are
                                          closeonbackgroundclick: true, // if you click background will modal close?
                                          dismissmodalclass: 'close'    // the class of a button or element that will close an open modal
                                      });
                                      return false;
                                  });
                              });
        </script> 
        <!--End Script Open Pannel--->
    </body>
</html>

<?php
