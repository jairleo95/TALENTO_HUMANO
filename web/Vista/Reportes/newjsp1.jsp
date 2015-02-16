
<!doctype html>
<html>
    <head>
        <meta http-equiv="Content-type" content="text/html; charset=utf-8">
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <script src="../../js/JQuery/jQuery.js" type="text/javascript"></script>
         <script>
          
                $.post("../../detalle_carrera", "opc=institucion&ti=TIN-0001", function (objJson) {
                    var lista = objJson.lista;
                    var tb = $(".tbody_list");
                    tb.empty();
                    for (var i = 0; i < lista.length; i++) {
                        tb.append("<tr>");
                        tb.append("<td>" + lista[i].id + "</td>");
                        tb.append("<td>" + lista[i].id + "</td>");
                        tb.append("<td>" + lista[i].id + "</td>");
                        tb.append("<td>" + lista[i].id + "</td>");
                        tb.append("</tr>");
                    }
                });
           
        </script>
        <script type="text/javascript" src="tableExport.js"></script>
        <script type="text/javascript" src="jquery.base64.js"></script>
        <script type="text/javascript" src="html2canvas.js"></script>
        <script type="text/javascript" src="jspdf/libs/sprintf.js"></script>
        <script type="text/javascript" src="jspdf/jspdf.js"></script>
        <script type="text/javascript" src="jspdf/libs/base64.js"></script>

    </head>
    <body>

        <div class="box-body table-responsive" id='ptable'>
            <h3>Demo</h3>	
            <div class="btn-group">
                <button class="btn btn-warning btn-sm dropdown-toggle" data-toggle="dropdown"><i class="fa fa-bars"></i> Export Table Data</button>
                <ul class="dropdown-menu " role="menu">
                    <li><a href="#" onClick ="$('#customers').tableExport({type: 'json', escape: 'false'});"> <img src='icons/json.png' width='24px'> JSON</a></li>
                    <li><a href="#" onClick ="$('#customers').tableExport({type: 'json', escape: 'false', ignoreColumn: '[2,3]'});"> <img src='icons/json.png' width='24px'> JSON (ignoreColumn)</a></li>
                    <li><a href="#" onClick ="$('#customers').tableExport({type: 'json', escape: 'true'});"> <img src='icons/json.png' width='24px'> JSON (with Escape)</a></li>
                    <li class="divider"></li>
                    <li><a href="#" onClick ="$('#customers').tableExport({type: 'xml', escape: 'false'});"> <img src='icons/xml.png' width='24px'> XML</a></li>
                    <li><a href="#" onClick ="$('#customers').tableExport({type: 'sql'});"> <img src='icons/sql.png' width='24px'> SQL</a></li>
                    <li class="divider"></li>
                    <li><a href="#" onClick ="$('#customers').tableExport({type: 'csv', escape: 'false'});"> <img src='icons/csv.png' width='24px'> CSV</a></li>
                    <li><a href="#" onClick ="$('#customers').tableExport({type: 'txt', escape: 'false'});"> <img src='icons/txt.png' width='24px'> TXT</a></li>
                    <li class="divider"></li>				

                    <li><a href="#" onClick ="$('#customers').tableExport({type: 'excel', escape: 'false'});"> <img src='icons/xls.png' width='24px'> XLS</a></li>
                    <li><a href="#" onClick ="$('#customers').tableExport({type: 'doc', escape: 'false'});"> <img src='icons/word.png' width='24px'> Word</a></li>
                    <li><a href="#" onClick ="$('#customers').tableExport({type: 'powerpoint', escape: 'false'});"> <img src='icons/ppt.png' width='24px'> PowerPoint</a></li>
                    <li class="divider"></li>
                    <li><a href="#" onClick ="$('#customers').tableExport({type: 'png', escape: 'false'});"> <img src='icons/png.png' width='24px'> PNG</a></li>
                    <li><a href="#" onClick ="$('#customers').tableExport({type: 'pdf', escape: 'false'});"> <img src='icons/pdf.png' width='24px'> PDF</a></li>


                </ul>
            </div>								
            <table id="customers" class="table table-striped" >
                <thead>			
                    <tr class='warning'>
                        <th>Country</th>
                        <th>Population</th>
                        <th>Date</th>
                        <th>%ge</th>
                    </tr>
                </thead>
                <tbody class="tbody_list">
                   
                    
                </tbody>
            </table> 
            <div>

                <h3>Download</h3>
                <small class="label label-danger"><i class="fa fa-github"></i> GitHub</small>
                <small class="label label-info"><i class="fa fa-code-fork"></i> GitHub</small>
                <small class="label label-success"><i class="fa fa-cloud-download"></i> Zip File</small>

                <h3>Installation</h3>



                <small class="label label-danger"><i class="fa fa-clock-o"></i> jquery Plugin</small>
                <pre>
&lt;script type="text/javascript" src="tableExport.js">
&lt;script type="text/javascript" src="jquery.base64.js">
                </pre>

                <small class="label label-info"><i class="fa fa-clock-o"></i> PNG Export</small>
                <pre>
&lt;script type="text/javascript" src="html2canvas.js">
                </pre>

                <small class="label label-success"><i class="fa fa-clock-o"></i> PDF Export</small>
                <pre>
&lt;script type="text/javascript" src="jspdf/libs/sprintf.js">
&lt;script type="text/javascript" src="jspdf/jspdf.js">
&lt;script type="text/javascript" src="jspdf/libs/base64.js">
                </pre>

                <small class="label label-warning"><i class="fa fa-clock-o"></i> Usage</small>
                <pre>
onClick ="$('#tableID').tableExport({type:'pdf',escape:'false'});"
                </pre>

                <small class="label label-info"><i class="fa fa-clock-o"></i> Options</small>
                <pre>
separator: ','
ignoreColumn: [2,3],
tableName:'yourTableName'
type:'csv'
pdfFontSize:14
pdfLeftMargin:20
escape:'true'
htmlContent:'false'
consoleLog:'false' 
                </pre>

                <small class="label label-info"><i class="fa fa-clock-o"></i> Sample TABLE Format</small>
                <pre>
&lt;table id="customers" class="table table-striped" >
	&lt;thead>			
		&lt;tr class='warning'>
			&lt;th>Country&lt;/th>
			&lt;th>Population&lt;/th>
			&lt;th>Date&lt;/th>
			&lt;th>%ge&lt;/th>
		&lt;/tr>
	&lt;/thead>
	&lt;tbody>
		&lt;tr>
			&lt;td>Chinna&lt;/td>
			&lt;td>1,363,480,000&lt;/td>
			&lt;td>March 24, 2014&lt;/td>
			&lt;td>19.1&lt;/td>
		&lt;/tr>
		&lt;tr>
			&lt;td>India&lt;/td>
			&lt;td>1,241,900,000&lt;/td>
			&lt;td>March 24, 2014&lt;/td>
			&lt;td>17.4&lt;/td>
		&lt;/tr>
		&lt;tr>
			&lt;td>United States&lt;/td>
			&lt;td>317,746,000&lt;/td>
			&lt;td>March 24, 2014&lt;/td>
			&lt;td>4.44&lt;/td>
		&lt;/tr>
		&lt;tr>
			&lt;td>Indonesia&lt;/td>
			&lt;td>249,866,000&lt;/td>
			&lt;td>July 1, 2013&lt;/td>
			&lt;td>3.49&lt;/td>
		&lt;/tr>
		&lt;tr>
			&lt;td>Brazil&lt;/td>
			&lt;td>201,032,714&lt;/td>
			&lt;td>July 1, 2013&lt;/td>
			&lt;td>2.81&lt;/td>
		&lt;/tr>
	&lt;/tbody>
&lt;/table> 
                </pre>
            </div>
        </div><!-- /.box-body -->
       
    </body>
</html>