<?
set_time_limit(60);
// se sobrecarga la pagina y el appserv le da un tiempo limite de 30 seg aqui lo modifico a 60 seg
// 
//aqui se valida los trabajadores nuevos por su contrato empleados para agregar  usuario
require_once '../Modelo/modelopersonal.php';
require_once '../Modelo/ModeloContrato.php';
$mper = new modelopersonal();
$mcnt = new ModeloContrato();
$list_tr_cont = $mcnt->LIST_RH_CONTRATO_IDTR();


for ($r = 0; $r < count($list_tr_cont); $r++) {
    $mper->VALIDAR_EMPLEADO($list_tr_cont[$r][0]);
}
//fin de validacion
?>
<!DOCTYPE html>
<html>
    <head>
        <style type="text/css">

        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Mantenimiento de Usuarios</title>
        <link rel="stylesheet" href="../CSS/estilos.css" />

            <link rel="stylesheet" href="../CSS/chosen.css">
            <script src="../js3/abc.js"></script>
            <script src="../js3/organictabs.jquery.js"></script>
        <style type="text/css">

            .submit{
                margin:10px;
                margin-left:0px;
                width: 100%;
                height:90%;
                color:white;
                background-color: #0575f4 ;

            }
            .tab-mant{
                margin:10px;   
            }   
            .lab-mant{
                color:#0575f4;  
                //font-size:34px; 
               // margin: 5px;
            }
            .body{
                background-color: #EEE;

            }
          
            td{
                text-align: left;
            }
        </style>

    </head>
    <body class="body">
    <center>
        <label class="lab-mant"> <h1>Mantenimiento Usuarios de  Personal</h1></label>

        <center>
            <form class="form" action="../Control/ControlPersonal.php"> 
                <table class="table">      
                    <tr><td>Empleado:</td><td>
                            <?
                            require_once '../Modelo/modelopersonal.php';
                            $mper = new modelopersonal();
                            $list_per = $mper->LIST_PERS();
                            ?>
                            <select name="IDEMPLEADO" class="text-box chosen-select">
                                <option value=""></option>
                                <? for ($p = 0; $p < count($list_per); $p++) { ?>
                                    <option value="<? echo $list_per[$p][0]; ?>"><? echo $list_per[$p][4] . ' ' . $list_per[$p][5] . ' ' . $list_per[$p][6]; ?></option>
                                <? } ?>
                            </select>
                        </td></tr>  
                    <tr><td>Rol:</td><td>
                            <?
                            require_once '../Modelo/modelorol.php';
                            $mdrol = new modelorol();
                            $list_rol = $mdrol->ListarRol();
                            ?>
                            <select name="IDROLES" class="text-box chosen-select">
                                <option value=""></option>
                                <? for ($t = 0; $t < count($list_rol); $t++) { ?>
                                    <option value="<? echo$list_rol[$t][0]; ?>"><? echo $list_rol[$t][1]; ?></option>
                                <? } ?>
                            </select>
                        </td></tr>  
                    <input type="hidden" name="IDUSUARIO" class="text-box" >
                    <tr><td>Usuario:</td><td><input type="text" required="" name="USUARIO" class="text-box" ></td></tr> 
                    <tr><td>Clave:</td><td><input type="password"  required="" name="CLAVE" class="text-box" ></td></tr>   
                    <tr><td><input type="submit" name="opc"  class="submit" value="Registrar Usuario"></td></tr>
                </table>
            </form>
        </center><br><br>
    </center>
</body>
 <script src="../js2/prism.jss" type="text/javascript" charset="utf-8"></script>
        <script src="../js2/chosen.jquery.js" type="text/javascript"></script>
        <script src="../JS/prism.js" type="text/javascript" charset="utf-8"></script>
        <script type="text/javascript">
                            var config = {
                                '.chosen-select': {},
                                '.chosen-select-deselect': {allow_single_deselect: true},
                                '.chosen-select-no-single': {disable_search_threshold: 10},
                                '.chosen-select-no-results': {no_results_text: 'Oops, nothing found!'},
                                '.chosen-select-width': {width: "95%"}
                            }
                            for (var selector in config) {
                                $(selector).chosen(config[selector]);
                            }
</script>
  
    

</html>
<? include '../Vistas/listarper.php'; ?>