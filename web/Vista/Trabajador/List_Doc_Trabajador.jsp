<?
error_reporting(E_ALL ^ E_STRICT);
error_reporting(0);
?>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Documentos</title>
        <link rel="stylesheet" href="../../css/Css_Lista/listas.css" />
          <style type="text/css">
            
            
            @media 
	only screen and (max-width: 760px),
	(min-device-width: 768px) and (max-device-width: 1024px)  {
	
		/* Force table to not be like tables anymore */
		table, thead, tbody, th, td, tr { 
			display: block; 
		}
		
		/* Hide table headers (but not display: none;, for accessibility) */
		thead tr { 
			position: absolute;
			top: -9999px;
			left: -9999px;
		}
		
		tr { border: 1px solid #ccc; }
		
		td { 
			/* Behave  like a "row" */
			border: none;
			border-bottom: 1px solid #eee; 
			position: relative;
			padding-left: 50%; 
		}
		
		td:before { 
			/* Now like a table header */
			position: absolute;
			/* Top/left values mimic padding */
			top: 6px;
			left: 6px;
			width: 45%; 
			padding-right: 10px; 
			white-space: nowrap;
		}
		              
                td:nth-of-type(1):before { content: "Nro"; }
		td:nth-of-type(2):before { content: "Nombre"; }
	        td:nth-of-type(3):before { content: "Documento"; }
		td:nth-of-type(4):before { content: "Descripcion"; }
		td:nth-of-type(5):before { content: "Requerimiento"; }
	
		//td:nth-of-type(10):before { content: "Arbitrary Data"; }

	}      
        </style>
        
    </head>
    <body>
    <center>
        <? require_once '../Modelo/ModeloDocumento.php'; ?>
        <table>
            <thead>
            <tr>
                <th class="cajita">Nro</th>
                <th class="cajita">Nombre</th>
                <th class="cajita">Documento</th>              
                <th class="cajita">Descripcion</th>              
                <th class="cajita">Requerimiento</th>
            </tr>  
              <thead>
              <tbody>
            <?
            $idtr=$_REQUEST["idtr"];
            $modelo = new ModeloDocumento();
            $listar = $modelo->LIST_ID_DOC_TRAB($idtr);
            ?>
<?  if (count($listar)==0) {?>
            <td colspan="5" style="text-align: center"><h2>No se ha registrado ningun documento a este empleado...</h2></td>
<?}?>
            <? for ($i = 0; $i < count($listar); $i++) { ?>
                <tr>
                    <td class="caji"><? echo $i+1 ?></td>
                    <td class="caji" ><? echo $listar[$i][15]; ?></td>
                    <td class="caji" ><a href="Ver_Doc.php?iddoc=<?echo $listar[$i][0];?>"><? echo $listar[$i][11];?></a></td>
                    <td class="caji"><? echo $listar[$i][9]; ?></td>
                    <td class="caji" ><? echo $listar[$i][43];?></td>
                   
                     </tr>
            <? } ?>
                     </tbody>
        </table>
    </center>
</body>
</html>
