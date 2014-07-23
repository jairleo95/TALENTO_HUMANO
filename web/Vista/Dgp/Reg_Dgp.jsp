
<!DOCTYPE html>
<?
//require '../Modelo/ModeloAño.php';
/*
 $listaU = new ModeloUbigeo();
  $distrito = $listaU->ListarDistrito();
  $provincia = $listaU->ListarProvincia();
  $departamento = $listaU->ListarDepartamento();
  $pais = $listaU->ListarPais(); */

/* require '../Modelo/modelotrabajador.php';
               
               $mtr=new modelotrabajador();
               $listra=$mtr->ListarTrabajador();
               $s=count($listra);*/
?>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title></title>
        
        <link rel="shortcut icon" href="../bootstrap-3.0.0/assets/ico/favicon.png">
        <link href="../bootstrap-3.0.0/dist/css/bootstrap-theme.min.css" rel="stylesheet">
        <link href="../bootstrap-3.0.0/examples/theme/theme.css" rel="stylesheet">
         
            <!-- 
            <link href="../bootstrap-3.0.0/dist/css/bootstrap.css" rel="stylesheet">
            -->
            <link rel="stylesheet" href="../CSS/style2.css"> 
            <link rel="stylesheet" href="../css/prism.css">    
            <link rel="stylesheet" href="../CSS/chosen.css">
            <script src="../js3/abc.js"></script>
            <script src="../js3/organictabs.jquery.js"></script>
            

            <script type="text/javascript">
                 $(function() {

                     $("#example-one").organicTabs();

                     $("#example-two").organicTabs({
                         "speed": 200
                     });

                 });
            </script>



            <link rel="stylesheet" href="../CSS/estilos.css">
            <link rel="stylesheet" href="../CSS/chosen.css">
            <link rel="stylesheet" href="../CSS/prism.css">

            <link href="../CSS/layout.css" rel="stylesheet" type="text/css" />
            <link href="../CSS/modal.css" rel="stylesheet" type="text/css" />

        
        <style type="text/css" media="all">
            /* fix rtl for demo */
            .chosen-rtl .chosen-drop { left: -9000px; }
        </style>
   
      
    </head>
    <style type="text/css">

      
         .table{
             margin-top: 40px;
             border-color: #000000; 
             background: #dce1fd;
             border-radius: 20px;
             margin:20px;
             border-color: blue;
         }
         .tables{
             margin-top: 40px;
             border-color: #000000; 
             background: #98b4fd;
             border-radius: 20px;
             margin:20px;
         }
          .body {
        
          background-color: #EEE;
        }
        
        
th {
  text-align: left;
}

.table {
  width: 100%;
  margin-bottom: 20px;
}

.table thead > tr > th,
.table tbody > tr > th,
.table tfoot > tr > th,
.table thead > tr > td,
.table tbody > tr > td,
.table tfoot > tr > td {
  padding: 2px;
  line-height: 1.428571429;
  vertical-align: top;
  border-top: 1px solid #dddddd;
}

.table thead > tr > th {
  vertical-align: bottom;
  border-bottom: 2px solid #dddddd;
}

.table caption + thead tr:first-child th,
.table colgroup + thead tr:first-child th,
.table thead:first-child tr:first-child th,
.table caption + thead tr:first-child td,
.table colgroup + thead tr:first-child td,
.table thead:first-child tr:first-child td {
  border-top: 0;
}

.table tbody + tbody {
  border-top: 2px solid #dddddd;
}

.table .table {
  background-color: #ffffff;
}
.btn {
  display: inline-block;
  padding: 6px 12px;
  margin-bottom: 0;
  font-size: 14px;
  font-weight: normal;
  line-height: 1.428571429;
  text-align: center;
  white-space: nowrap;
  vertical-align: middle;
  cursor: pointer;
  border: 1px solid transparent;
  border-radius: 4px;
  -webkit-user-select: none;
     -moz-user-select: none;
      -ms-user-select: none;
       -o-user-select: none;
          user-select: none;
          color: white;
          margin-top:17px;
}

.btn:focus {
  outline: thin dotted #333;
  outline: 5px auto -webkit-focus-ring-color;
  outline-offset: -2px;
}

.btn:hover,
.btn:focus {
  color: #333333;
  text-decoration: none;
}

.btn:active,
.btn.active {
  background-image: none;
  outline: 0;
  -webkit-box-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125);
  box-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125);
}


.form-control:-moz-placeholder {
  color: #999999;
}

.form-control::-moz-placeholder {
  color: #999999;
}

.form-control:-ms-input-placeholder {
  color: #999999;
}

.form-control::-webkit-input-placeholder {
  color: #999999;
}

.form-control {
  display: block;
  width: 100%;
  height: 25px;
  padding: 6px 12px;
  font-size: 14px;
  line-height: 1.428571429;
  color: #555555;
  vertical-align: middle;
  background-color: #ffffff;
  border: 1px solid #cccccc;
  border-radius: 4px;
  -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
          box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
  -webkit-transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s;
          transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s;
}

.form-control:focus {
  border-color: #66afe9;
  outline: 0;
  -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 8px rgba(102, 175, 233, 0.6);
          box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 8px rgba(102, 175, 233, 0.6);
}

.tab td{margin:10px;padding: 10px;}
.tab-a td{margin:4px;padding: 4px;}
.tab-b td{margin:4px;padding: 4px;}
.tab-c td{margin:2px;padding: 2px;}


    </style>

    <body>  
         <div class="page-header">
       <center><h1>DGP LABORAL</h1></center>
        </div>
    <center>
         
              <table  style="width: 1050px; "  class="table"  >
             
                  <?
                  require_once '../Modelo/modelotrabajador.php';
                  $mdtr=new modelotrabajador();
                  $list_tr=$mdtr->ListarTrabajador();
                  ?>
                  <tr><td>Buscar Trabajador:</td><td>
                          <select name="idtr"  >
                           <option value=""></option>
                           <?  for ($h = 0; $h < count($list_tr); $h++) {?>
                           <option value="<?echo $list_tr[$h][0];?>"><?echo $list_tr[$h][1].' '.$list_tr[$h][2].' '.$list_tr[$h][3];?></option>
                           <?}?>
                       </select>
                   </td>
                   <td><td><div >
            <div class="main" >
            <div class="panel" >
             
            <p><a href="#login_form"  class="btn btn-sm btn-primary" >Ficha del trabajador</a></p> 
     
           <!-- <a href="#join_form" id="join_pop">Sign Up</a>  -->        
            </div> 
            </div>
            
            <a href="#x" class="overlay" id="login_form"></a>
            <div class="popup">
                <form action="../Control/ControlTrabajador.php" method="post">
            <div id="page-wrap">
        <div id="example-two">
                <ul class="nav">
                        <li class="nav-one"><a href="#featured2" class="current"> Datos Personales</a></li>
                        <li class="nav-two"><a href="#core2">Familiares/Dependientes</a></li>
                        <li class="nav-three"><a href="#jquerytuts2">Aspecto Academico</a></li>
                        <li class="nav-four last"><a href="#classics2">Aspecto Social</a></li>
                    </ul> 
            <div class="list-wrap">
                <div id="featured2">
                    <div style="height: 350px;">
                        <table class="tab">
                       <!-- datos Generales -->
                        </table>
     
                        </div>
                    </div>
                <div id="core2" class="hide">
                    <div style="height: 350px;">
                        <table class="tab-a">
                       <!--datos personales -->
                    </table>
               
                        </div>
                    </div>
                <div id="jquerytuts2" class="hide">
                       <div style="height: 350px;">

                    <table class="tab-b">
                        <!-- datos academicos -->
                    </table>
                </fieldset>
                    </div>
                    </div>
                <div id="classics2" class="hide">
                   <div style="height: 350px;">

                    <table class="tab-c">
             <!--  datos adiciona>D-->
                                
                    </table>
            
                </div>
                </div>
              
            </div>
</div>            
</div>            

                <input type="hidden" name="idcontrato" value="1"  />            
                <input type="hidden" name="idpuesto" value="1"  />            
                
            </form>
                
                     <a class="close" href="#close"></a>
            </div>
            </table>
                
                
        </center>
    
  
 <? 
                             require_once '../Modelo/ModeloRequerimiento.php';
                             $mr= new ModeloRequerimiento();
                             $lisre= $mr->ListarRequerimiento();
                             $idd_t=$_REQUEST["idtr"];
                           // echo $idd_t;
                             
                             require_once '../Modelo/ModeloRH_Puesto.php';
                             $mod_pu=new ModelorRH_Puesto();
                             $list_pu=$mod_pu->LISTA_RH_PUESTO();
                             require_once '../Modelo/modelotrabajador.php';
                             $mod_tr=new modelotrabajador();
                             $lis_tr=$mod_tr->ListaridTrabajador($idd_t);
                             
                             ?>

    <center>
            <form class="form" action="../Control/ControlDGP.php"> 
                
                <table class="table" style="width:1050px; ">       
                    <input type="hidden" name="IDDETALLE_DGP" class="text-box" >
                    <tr><td>Fecha Desde:</td><td><input type="date" name="FEC_DESDE" class="text-box" ></td></tr>     
                    <tr><td>Fecha Hasta:</td><td><input type="date" name="FEC_HASTA" class="text-box" ></td></tr>   
                    <tr><td>Sueldo:</td><td><input type="text" name="SUELDO" class="text-box" ></td></tr>       
                    <tr><td>Dias de Trabajo:</td><td><input type="text" name="DIAS_TRABAJO" class="text-box" ></td></tr>    
                    <tr><td>Horario:</td><td><input type="text" name="HORARIO" class="text-box" ></td></tr>    
                    <tr><td>Puesto:</td><td>
                        <select name="IDPUESTO"  ata-placeholder="Elija un Pais..." class="chosen-select">
                            <option value=""></option>
                            <?  for ($k = 0; $k < count($list_pu); $k++) {?>
                            <option value="<?echo $list_pu[$k][0];?>"><?echo $list_pu[$k][1];?></option>
                            <?}?>
                        </select></td></tr>   
                    <tr><td>Requermiento:</td><td>
                        <select name="IDREQUERIMIENTO" class="text-box" > 
                            <option value=""></option>
                                   <? for ($index = 0; $index < count($lisre); $index++) { ?>
                               <option value="<? echo $lisre[$index][0];?>"><? echo $lisre[$index][1];?></option>
                           <?}?>
                        </select> 
                    </td></tr>   
                <? for ($j = 0; $j < count($lis_tr); $j++) {?>
                <tr><td>Trabajador:</td><td><?echo $lis_tr[$j][1].' '.$lis_tr[$j][2].' '.$lis_tr[$j][3]; ?><input type="hidden" value="<? echo $idd_t;?>" name="IDDATOS_TRABAJADOR" class="text-box" ></td></tr>   
                <?}?>    
                <tr><td>Ruc:</td><td><input type="text" name="RUC" class="text-box" ></td></tr>    
                    <tr><td>Lugar de Servicio:</td><td><input type="text" name="LUGAR_SERVICIO" class="text-box" ></td></tr>   
                    <tr><td>Descripcion de Servicio:</td><td><input type="text" name="DESCRIPCION_SERVICIO" class="text-box" ></td></tr> 
                    <tr><td>Periodo Pago:</td><td><input type="text" name="PERIODO_PAGO" class="text-box" ></td></tr>    
                    <tr><td>Domicilio Fiscal:</td><td><input type="text" name="DOMICILIO_FISCAL" class="text-box" ></td></tr>    
                    <tr><td>Subvencion:</td><td><input type="text" name="SUBVENCION" class="text-box" ></td></tr>   
                    <tr><td>Horario de Capacitacion:</td><td><input type="text" name="HORARIO_CAPACITACION" class="text-box" ></td></tr>   
                    <tr><td>Horario de Refrigerio:</td><td><input type="text" name="HORARIO_REFRIGERIO" class="text-box" ></td></tr>  
                    <tr><td>Dias de Capacitacion:</td><td><input type="text" name="DIAS_CAPACITACION" class="text-box" ></td></tr>  
               
                    <input type="hidden" name="ESTADO" class="text-box" >
                    <input type="hidden" name="USER_CREACION" class="text-box" >
                    <input type="hidden" name="FECHA_CREACION" class="text-box" >
                    <input type="hidden" name="USER_MODIF" class="text-box" > 
                    <input type="hidden" name="FECHA_MODIF" class="text-box" >
                    <input type="hidden" name="USUARIO_IP" class="text-box" >   
                    <tr><td><input type="submit" name="opc"  class="submit" value="REGISTRAR DETALLE_DGP"></td></tr>
                </table>
            </form>

       
   
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

 <!--   <script src="../bootstrap-3.0.0/assets/js/jquery.js"></script>
   
  
 -->
 
  <script src="../bootstrap-3.0.0/dist/js/bootstrap.min.js"></script>
   <script src="../bootstrap-3.0.0/assets/js/holder.js"></script>
<!--
<script src="../JS/jquery.min.js" type="text/javascript"></script>
<script src="../JS/chosen.jquery.js" type="text/javascript"></script>



-->
</html>
