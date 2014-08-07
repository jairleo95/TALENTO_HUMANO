<?php
session_start();

require_once '../../confi/Conexion.php';
if ($_GET['action'] == 'listar') {
    //$iddep = $_POST['iddep'];
    $iddep = $_SESSION['DEPARTAMENTO_ID'];
    $nom_ape = $_POST['nom_ape'];
    $vpuesto = $_POST['puesto'];
    $area = $_POST['area'];

    $sueldo = $_POST['sueldo'];
    $seccion = $_POST['seccion'];

    $fec_i = ($_POST['fec_i'] != '' ) ? explode("-", $_POST['fec_i']) : '';
    $fec_f = ($_POST['fec_f'] != '' ) ? explode("-", $_POST['fec_f']) : '';

    $vdel = ($_POST['del'] != '' ) ? explode("-", $_POST['del']) : '';
    $val = ($_POST['al'] != '' ) ? explode("-", $_POST['al']) : '';

    $sql = "select c.idcontrato, C.IDDATOS_TRABAJADOR,c.sueldo ,UPPER(dt.nombres ||' '||dt.apellido_p ||' '||dt.apellido_m )AS NOMBRE_P,c.fec_desde,c.fec_hasta,pd.seccion, pd.area_id ,PD.PUESTO,AREA
            ,c.fecha_creacion AS FECHA_CREACION from rh_contrato c, datos_trabajador dt , det_puesto_direccion pd 
where pd.puesto_id=c.puesto_id and dt.iddatos_trabajador = c.iddatos_trabajador";

    $nom_ape = strtoupper($nom_ape);
    $sueldo = strtoupper($sueldo);
    $seccion = strtoupper($seccion);
    $vpuesto = strtoupper($vpuesto);



    $sql .= ($nom_ape != '') ? "  and upper(dt.nombres ||' '||dt.apellido_p ||' '||dt.apellido_m)   like '%$nom_ape%'" : "";
    $sql .= ($sueldo != '') ? "  and upper(c.sueldo)   like '$sueldo'" : "";
    $sql .= ($vpuesto != '') ? " AND upper(pd.puesto) LIKE '%$vpuesto%'" : "";

    $sql .= ($area > 0) ? " AND  pd.area_id  = '" . $area . "'" : "";

    $sql .= ($seccion != '') ? " AND  pd.seccion LIKE '$seccion%'" : "";

    $sql .= ($fec_i != '') ? " AND  c.fec_desde ='$fec_i[2]/$fec_i[1]/$fec_i[0]'" : "";
    $sql .= ($fec_f != '') ? " AND  c.fec_hasta ='$fec_f[2]/$fec_f[1]/$fec_f[0]'" : "";

    $sql .= ($vdel && $val) ? " AND c.fecha_creacion >= '$vdel[2]/$vdel[1]/$vdel[0]' and  c.fecha_creacion <='$val[2]/$val[1]/ $val[0]' " : "";

    $sql.= ($iddep != '') ? " AND PD.DEPARTAMENTO_ID='$iddep'" : "";

    // Ordenar por
    $vorder = $_POST['orderby'];

    if ($vorder != '') {
        $sql .= " ORDER BY " . $vorder;
    }

    //$query = mysql_query($sql);
    $query = oci_parse(Conexion::conex(), $sql);
    oci_execute($query);
    //echo $query;
    $datos = array();

    while ($row = oci_fetch_array($query)) {
        $datos[] = array(
            'IDTR' => $row['IDDATOS_TRABAJADOR'],
            'IDCONTRATO'          => $row['IDCONTRATO'],
            'NOMBRE' => $row['NOMBRE_P'],
            'FEC_DESDE' => $row['FEC_DESDE'],
            'FEC_HASTA' => $row['FEC_HASTA'],
            'SECCION' => $row['SECCION'],
            'PUESTO' => $row['PUESTO'],
            'FECHA_CONTRATACION' => $row['FECHA_CREACION'],
            'AREA' => $row['AREA'],
            'SUELDO' => $row['SUELDO']
        );
    }
    // convertimos el array de datos a formato json
    echo json_encode($datos);
}
?>