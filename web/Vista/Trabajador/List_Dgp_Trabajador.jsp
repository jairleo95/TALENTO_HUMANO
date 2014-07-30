<!DOCTYPE html >

<html>
    <head>
        <meta charset="windows-1252">
        <title>Autorizaciones DGP</title>
        
        <link href="../../css/Css_Lista/listas.css" rel="stylesheet">    
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
		td:nth-of-type(2):before { content: "Fecha Desde"; }
	        td:nth-of-type(3):before { content: "Fecha HAsta"; }
		td:nth-of-type(4):before { content: "Motivo"; }
		td:nth-of-type(5):before { content: "Puesto Trabajador"; }
		td:nth-of-type(6):before { content: "Sección"; }
		td:nth-of-type(7):before { content: "Area"; }
		td:nth-of-type(8):before { content: "Estado"; }
		td:nth-of-type(9):before { content: "Documentos"; }
		//td:nth-of-type(10):before { content: "Arbitrary Data"; }

	}      
        </style>
    </head>
    <body>
        <center>
            <!--<label>DGP Elaborados del Trabajador</label>-->
        <?
        require_once '../Modelo/ModeloDGP.php';
        $md=new ModeloDGP();
        $idtr=$_REQUEST["idtr"];
        $list=$md->LIST_ID_TRAB_DGP($idtr);
        
        ?>
            <div id="page-wrap">
            <table>
            <thead> 
                <tr>
                <th class="cajita">Nro</th>
                <th class="cajita">Fecha Desde</th>
                <th class="cajita">Fecha Hasta</th>
                <th class="cajita">Motivo</th>
                <th class="cajita">Puesto Trabajador</th>
              
                <th class="cajita">Sección</th>
                <th class="cajita">Area</th>
                <th class="cajita">Estado</th>
                <th class="cajita">Documentos</th>
                <th class="cajita">Detalle</th>
             </tr>
            </thead>
            <?  if (count($list)==0) {?>
            <td colspan="9" style="text-align: center"><h2>El Trabajador  no Tiene ningun DGP elaborado...</h2></td>
                <?}?>
            
             <tbody> 
                <?  for ($i = 0; $i < count($list); $i++) { ?>
             <tr>
                 <td class="caji" ><? echo $i+1;?></td>
                <td class="caji"><?echo $list[$i][1];?></td>
                <td class="caji" ><?echo $list[$i][2];?></td>
                <td class="caji" ><?echo $list[$i][26];?></td>
                <td class="caji"><?echo $list[$i][36];?></td>
                <td class="caji"><?echo $list[$i][34];?></td> 
                
                <td class="caji" ><?echo $list[$i][32];?></td> 
                
                <td class="caji">
                   <?
        if ($list[$i][18]==0 | $list[$i][18]==null) {?>
        <a href="../Dgp/Detalle_Seguimiento_Dgp.jsp?iddgp=<? echo $list[$i][0]; ?>">En Proceso</a>
       <? }?>
        <?if ($list[$i][18]==1) {?>
            <a href="../Dgp/Detalle_Seguimiento_Dgp.jsp?iddgp=<? echo $list[$i][0]; ?>">Ver Proceso Terminado</a>
       <? }?>
         </td> 
         <td class="caji" ><a href="../Dgp/Documento/Reg_Documento.jsp?iddgp=<? echo $list[$i][0];?>&idtr=<?echo $idtr;?>">Ver Documentos</a></td> 
               
         
         <td class="caji" ><a href="../Dgp/Detalle_Dgp.jsp?iddgp=<?echo $list[$i][0];?>&idtr=<?echo $idtr;?>">Ver Detalle</a></td>
    <?}?>
             </tr> 
               </tbody>
        </table>
                </div>
            </center>
        </body>
</html>
