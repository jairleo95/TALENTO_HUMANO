<!DOCTYPE html >
<html>
    <head>
        <meta charset="windows-1252">
        <title>Usuarios - DGP</title>
        <link rel="stylesheet" href="../CSS/listas.css" type="text/css">
        <style>
                    
            
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
		              
                td:nth-of-type(1):before { content: "Nro Paso"; }
		td:nth-of-type(2):before { content: "Usuarios"; }
	        td:nth-of-type(3):before { content: "Nombres y Apellidos"; }
		td:nth-of-type(4):before { content: "Puesto"; }
		td:nth-of-type(5):before { content: "Departamento"; }
		td:nth-of-type(6):before { content: "Descripción"; }
	

	}   
        </style>
    </head>
    <body>
        <? 
        require_once '../Modelo/ModeloDGP.php';
        $iddgp=$_REQUEST["iddgp"];
        $mdgp=new ModeloDGP();
        $list_user_dgp=$mdgp->USER_DGP($iddgp);
       ?>
    <center>
        <?
        
        require_once '../Modelo/ModeloAutorizacion.php';
        $mda=  new ModeloAutorizacion();
        $v=$mda->VAL_AUT_DGP_M($iddgp);
        //echo $v;
        if ($v>0) { ?>
        <h1>El  DGP ha sido rechazado... corrija y dirijase a "Seguimiento de DGP y Habilite"</h1> 
        <?}else{?>
        <label>Usuarios que intervienen en la autorizacion del  DGP</label>
            <table>
                <tr>
                <thead>
                    <th class="cajita" style="width: 50px;">Nro. Paso</th>
                    <th class="cajita" style="width: 100px;">Usuarios</th>
                    <th class="cajita" style="width: 300px;"> Nombres y Apellidos</th>
                    <th class="cajita" style="width: 200px;"> Puesto</th>
                    <th class="cajita" style="width: 200px;">Departamento</th>
                    <th class="cajita" style="width: 300px;">Descripcion</th>
                </tr>
                </thead>
                <tbody>
                <?  for ($i = 0; $i < count($list_user_dgp); $i++) {?>
                <tr>
                    <td class="caji"><?  echo $list_user_dgp[$i]['NROPASO'];?></td>
                    <td class="caji"><?  echo $list_user_dgp[$i]['USUARIO'];?></td>
                    <td class="caji"><?  echo strtoupper($list_user_dgp[$i]['APELLIDO_P'].' '.$list_user_dgp[$i]['APELLIDO_M'].' '.$list_user_dgp[$i]['NOMBRES']);?></td>
                    <td class="caji"><?  echo $list_user_dgp[$i]['PUESTO'];?></td>
                    <td class="caji"><?  echo $list_user_dgp[$i]['DEPARTAMENTO'];?></td>
                    <td class="caji"><?  echo $list_user_dgp[$i]['DESCRIPCION'];?></td>
                </tr>
                <?}?>
                </tbody>
            </table>
        <?}?>
        
    </center>
    </body>
</html>
