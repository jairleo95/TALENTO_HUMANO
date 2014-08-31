<%@page import="pe.edu.upeu.application.model.V_List_Empleado"%>
<%/*
ini_set('default_charset', 'utf8'); 
?>
<?php header('Content-type: text/html; charset=iso-8859-1'); ?>
<? 
session_start();
if (isset($_SESSION['IDUSER'])) {
$iddep=$_SESSION["IDDEPARTAMENTO"];                 

require_once '../Modelo/modelopersonal.php';
require_once '../Modelo/Modelo_Imagen.php';
$modelo= new modelopersonal();
$listra=$modelo->LIST_EMPLEADO($_SESSION["DEPARTAMENTO_ID"]);    
$mod_f= new Modelo_Imagen();
$idf=$mod_f->LIST_FOTO_TRABAJADOR($listra[$index][1]);*/
%>
<jsp:useBean id="List_Empleado" scope="application" class="java.util.ArrayList"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Empleados</title>
    
	<script src="../../js/Js_Sort/modernizr.custom.63321.js" type="text/javascript"></script>
            <link rel="stylesheet" href="../../css/Css_Sort/style.css" />
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
<div id="titulo">
    <h1>Lista de Empleados</h1>
</div>
<hr>
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
                    <th><h3>Nombres y Apellidos</h3></th>
                    <th><h3>Área</h3></th>
                    <th><h3>Sección</h3></th>
                    <th><h3>Puesto</h3></th>
                    <th><h3>Fecha Inicio</h3></th>
                    <th><h3>Fecha Fin</h3></th>
                    <th><h3>Sueldo</h3></th>
                </tr>
            </thead>
            <tbody>
                <% for (int i = 0; i < List_Empleado.size(); i++) {
             V_List_Empleado e = new V_List_Empleado();
             e =(V_List_Empleado)List_Empleado.get(i);
             %>
                <tr>
                    <td><%out.print(i+1);%></td>
                    <td class="name"><a href="../../trabajador?idtr=<%=e.getId_trabajador()%>&opc=list"><%=e.getNo_trabajador().toUpperCase()+" "+e.getAp_paterno().toUpperCase()+" "+e.getAp_materno().toUpperCase()%></a></td>
                    <td><%=e.getNo_area() %></td>
                    <td><%=e.getNo_seccion()%></td>
                    <td><%=e.getNo_puesto()%></td>
                    <td><%=e.getFe_desde()%></td>
                    <td><%=e.getFe_hasta()%></td>
                    <td><%=e.getCa_sueldo()%></td>
                   
                </tr>
                <%}%>        
            </tbody>
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


	  <script type="text/javascript" src="../../js/Js_Sort/script.js"></script>
	<script type="text/javascript">
	var sorter = new TINY.table.sorter('sorter','table',{
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
	    columns: [{ index: 7, format: '%', decimals: 1 }, { index: 8, format: '$', decimals: 0}], // Sorted Column Settings (optional) //
	    init: true// Init Now? (true or false) //

	});
  </script>
  

       <script src="../../js/JQuery/jQuery.js"></script>
                <script src="../../js/Js_Sort/jquery.reveal.js" type="text/javascript"></script>

  <script type="text/javascript">
      $(document).ready(function () {
          $('.button-email').click(function (e) { // Button which will activate our modal
              var title = $(this).attr('title');
              var title2 = $('.name').attr('title');
              document.getElementById("email").innerHTML = title.toString();
              $('#modal').reveal({ // The item which will be opened with reveal
                  animation: 'fade',                   // fade, fadeAndPop, none
                  animationspeed: 600,                       // how fast animtions are
                  closeonbackgroundclick: true,              // if you click background will modal close?
                  dismissmodalclass: 'close'    // the class of a button or element that will close an open modal
              });
              return false;
          });
      });
	</script> 
    <!--End Script Open Pannel--->
</body>
</html>

