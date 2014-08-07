<?php 
require_once '../../confi/Conexion.php';
if($_GET['action'] == 'listar')
{
	// valores recibidos por POST
	$vnm_1   = $_POST['usuario'];
	$vpuesto   = $_POST['puesto'];
	$vpais = $_POST['dep'];
	$vdel  = ($_POST['del'] != '' ) ? explode("-",$_POST['del']) : '';
	$val   = ($_POST['al']  != '' ) ? explode("-",$_POST['al']) : '';
        
	$sql = "select idusuario,fecha_creacion , puesto , usuario   ,departamento   from det_usuario where departamento_id is not null and fecha_creacion is not null ";	
	
        $vnm=  strtoupper($vnm_1);
        $vpuesto=  strtoupper($vpuesto);
	// Vericamos si hay algun filtro
	$sql .= ($vnm != '')      ? " AND upper(usuario) LIKE '%$vnm%'" : "";
	$sql .= ($vpuesto!= '')      ? " AND upper(puesto) LIKE '%$vpuesto%'" : "";
	$sql .= ($vpais > 0)      ? " AND  departamento_id  = '".$vpais."'" : "";
        $sql .= ($vdel && $val)   ? " AND fecha_creacion BETWEEN '$vdel[2]/$vdel[1]/$vdel[0]' AND '$val[2]/$val[1]/ $val[0]' " : "";
        
	//$sql .= ($vdel && $val)   ? " AND fecha_creacion BETWEEN '$vdel[2]/$vdel[0]/$vdel[1]' AND '$val[2]/$val[0]/$val[1]' " : "";
	//$sql .= ($vdel && $val)   ? " AND fecha_creacion BETWEEN '$vdel' AND '$val' " : "";
	
	// Ordenar por
	$vorder = $_POST['orderby'];
	
	if($vorder != ''){
		$sql .= " ORDER BY ".$vorder;
	}
	
	//$query = mysql_query($sql);
        $query=  oci_parse(Conexion::conex(), $sql);
        oci_execute($query);
        //echo $query;
	$datos = array();
	
	while($row = oci_fetch_array($query))
	{
		$datos[] = array(
			'id'          => $row['IDUSUARIO'],
			'PUESTO'      => $row['PUESTO'],
			'USUARIO'       => $row['USUARIO'],
			'FECHA_CREACION'  => $row['FECHA_CREACION'],
			'DEPARTAMENTO'        => $row['DEPARTAMENTO']
		);
	}
	// convertimos el array de datos a formato json
	echo json_encode($datos);
}

?>