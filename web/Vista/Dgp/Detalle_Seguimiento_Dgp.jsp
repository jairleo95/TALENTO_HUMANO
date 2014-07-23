<? session_start();
?>
<!DOCTYPE html >
<html>
    <head>
        <meta charset="windows-1252">
        <title>Autorizaciones DGP</title>
        <link href="../CSS/listas.css" rel="stylesheet"> 
        <link type="text/css" rel="stylesheet" href="../CSS/Reportes.css">
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
		              
            
                td:nth-of-type(1):before { content: "Paso"; }
		td:nth-of-type(2):before { content: "Estado"; }
	        td:nth-of-type(3):before { content: "Encargado"; }
		td:nth-of-type(4):before { content: "Cargo Encargado"; }
		td:nth-of-type(5):before { content: "Area"; }
		td:nth-of-type(6):before { content: "Departamento"; }
		td:nth-of-type(7):before { content: "Detalle"; }
	
              

	}   
        </style>

    </head>
    <body>
    <center>
        <br>

        <br>

        <div class="spacing">
            <center><h1 class="spacing">HISTORIAL DE AUTORIZACIONES POR  TRABAJADOR</h1></center>
        </div>

        <?
        require_once '../Modelo/ModeloAutorizacion.php';
        require_once '../Modelo/ModeloRequerimiento.php';
        $mr = new ModeloRequerimiento();
        $ma = new ModeloAutorizacion();

        $iddgp = $_REQUEST["iddgp"];
        $iddreq = $mr->VALIDAR_REQ_DGP($iddgp);

        $list = $ma->ListarDetalleAutorizacion($iddgp, $iddreq);
        ?>


        <table class="table">
            <tr><td ><strong>Nombre:</strong></td><td><label><? echo $list[0][43] . ' ' . $list[0][44] . ' ' . $list[0][45]; ?> </label></td></tr>
            <tr><td ><strong>Sueldo:</strong></td><td><label><? echo $list[0][20]; ?> </label></td></tr>
            <tr><td ><strong>Puesto:</strong></td><td><label><? echo $list[0][131]; ?> </label></td></tr>
            <tr><td ><strong>Tipo Proceso:</strong></td><td><label><? echo $list[0][8]; ?> </label></td></tr>
        </table>
        
      
        <table >
           
            <thead>
            <tr>
                <th class="cajita">Paso</th>
                <th class="cajita">Estado</th>
                <th class="cajita">Encargado</th>
                <th class="cajita">Cargo Encargado</th>
                <th class="cajita">Area</th>
                <th class="cajita">Departamento</th>
                <th class="cajita">Detalle</th>
            </tr>
            </thead>
            <tbody>
            <? for ($i = 0; $i < count($list); $i++) { ?>
                <tr >
                    <td class="caji"><? echo $list[$i][6]; ?></td>
                    <td class="caji" ><? if ($list[$i][15] == 1) { ?>
                            <img src="../Imagenes/Aprobado.png" width="40" height="40">
                        <? }
                        if ($list[$i][15] == 2) {
                            ?>
                            <img src="../Imagenes/Fire-Toy-icon-link.png" width="40" height="40">
                        <? } ?></td>
                    <td class="caji" style="width:300px;"><? echo $list[$i][120] . ' ' . $list[$i][121] . ' ' . $list[$i][119]; ?></td> 
                    <td class="caji" style="width: 200px;"><? echo $list[$i][109]; ?></td> 
                    <td class="caji"><? echo $list[$i][111]; ?></td> 
                    <td class="caji" style="width: 200px;"><? echo $list[$i][113]; ?></td> 
                    <td class="caji" style="width: 300px;"><? echo $list[$i][5]; ?></td> 
                  
                </tr> 
                  <?  if ($list[$i][15]==2 & $_SESSION["IDROL"]==2) { ?>
        <div class="alerta">
            <h1>Alerta! debe Corregir el Dgp... se ha Rechazado el Dgp</h1>
            <a href="../Control/ControlAutorizacion.php?opc=HDGP&ida=<? echo $list[$i][13]; ?>">Habilitar DGP</a></div>
        <?}?>
            <? } ?>
            </tbody>
        </table>
    </center>
</body>
</html>
