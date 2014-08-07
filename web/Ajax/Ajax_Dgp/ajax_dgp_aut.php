<?php

session_start();
require_once '../../confi/Conexion.php';
if ($_GET['action'] == 'listar') {
    $iddep = $_POST["dep"];
    $nom_ape = trim($_POST['nom_ape']);
    $vpuesto = trim($_POST['puesto']);
    $area = $_POST['area'];

    $sueldo = $_POST['sueldo'];
    $seccion = $_POST['seccion'];

    $reque = $_POST['motivo'];
    $proc = $_POST['proceso'];
    $iduser = $_SESSION["IDUSUARIO"];



    $vdel = ($_POST['del'] != '' ) ? explode("-", $_POST['del']) : '';
    $val = ($_POST['al'] != '' ) ? explode("-", $_POST['al']) : '';



    // if ($nom_ape!=""||$vpuesto=!""||$area>0) {
    if (true) {


        $sql = "SELECT dgp.iddetalle_dgp,dd.departamento AS DEP,a.idautorizacion,dgp.iddatos_trabajador,a.estado, UPPER(tr.apellido_p||' '||tr.apellido_m 
||' '||tr.nombres) AS NOMBRE_P,dd.puesto,dp.descripcion,to_char(a.fecha_creacion,'dd/mm/yy hh:mm:ss') AS FECHA_CREACION, dp.nombre as PROC ,pro.nombre as REQUERIMIENTO, dd.area,dd.seccion
,dgp.sueldo
FROM autorizacion a,
  detalle_dgp dgp ,
  det_req_paso_pu dp ,
  det_puesto_direccion dd,
  datos_trabajador tr, requerimiento pro,
  det_usuario du 
WHERE dgp.iddetalle_dgp                 = a.iddetalle_dgp
AND a.iddetalle_req_proceso             =dp.iddetalle_req_proceso
AND dp.puesto_id = a.puesto_id
AND dgp.idpuesto                        = dd.puesto_id
and a.user_creacion=du.idusuario
AND tr.iddatos_trabajador               = dgp.iddatos_trabajador
AND dp.idpasos                          = a.idpasos
and dgp.estado is not null
and pro.idrequerimiento = dp.idrequerimiento";


        $nom_ape = strtoupper($nom_ape);
        $sueldo = strtoupper($sueldo);
        $seccion = strtoupper($seccion);
        $vpuesto = strtoupper($vpuesto);




        $sql .= ($nom_ape != '') ? " and upper(tr.nombres ||' '||tr.apellido_p ||' '||tr.apellido_m)  like '%$nom_ape%'" : "";
        $sql .= ($sueldo != '') ? "   and upper(dgp.sueldo) like '$sueldo'" : "";
        $sql .= ($vpuesto != '') ? " AND upper(dd.puesto)  LIKE '%$vpuesto%'" : "";

        $sql .= ($area > 0) ? " AND  dd.area_id  = '" . $area . "'" : "";

        $sql .= ($seccion != '') ? " AND  upper(dd.seccion) LIKE '$seccion%'" : "";
        $sql .= ($iduser != '') ? " AND  a.user_creacion ='$iduser'" : "";


        $sql .= ($reque > 0) ? " AND dgp.idrequerimiento=$reque" : "";

        $sql .= ($proc > 0) ? " and dp.idproceso=$proc" : "";
        $sql .= ($vdel && $val) ? " AND dgp.fecha_creacion BETWEEN '$vdel[2]/$vdel[1]/$vdel[0]' AND '$val[2]/$val[1]/ $val[0]' " : "";

        $sql.= ($iddep > 0) ? " AND du.DEPARTAMENTO_ID='$iddep'" : "";

        // Ordenar por
        $vorder = $_POST['orderby'];

        if ($vorder != '') {
            $sql .= " ORDER BY  a.idautorizacion, " . $vorder;
        }

        //$query = mysql_query($sql);
        $query = oci_parse(Conexion::conex(), $sql);
        oci_execute($query);
        //echo $query;
        $datos = array();

        while ($row = oci_fetch_array($query)) {
            $datos[] = array(
                'IDDGP' => $row['IDDETALLE_DGP'],
                //'IDCONTRATO'          => $row['IDCONTRATO'],
                'NOMBRE' => $row['NOMBRE_P'],
                'IDTR' => $row['IDDATOS_TRABAJADOR'],
                'SECCION' => $row['SECCION'],
                'PUESTO' => $row['PUESTO'],
                'DEPARTAMENTO' => $row['DEP'],
                'REQUERIMIENTO' => $row['REQUERIMIENTO'],
                'FECHA_CREACION' => $row['FECHA_CREACION'],
                'AREA' => $row['AREA'],
                'SUELDO' => $row['SUELDO']
            );
        }

        echo json_encode($datos);
    }
}
?>