<%
HttpSession sesion =  request.getSession(true);
    String id_user = (String) sesion.getAttribute("IDUSER");
    String id_dep = (String) sesion.getAttribute("ID_DEPARTAMENTO");
    if (id_user != "") {
 
    
    
    /*require_once '../Modelo/ModeloRH_Departamento.php';
    $md=new ModelorRH_Departamento();
    $list_d=$md->LISTA_RH_DEPARTAMENTO();*/
    %>
    <!DOCTYPE html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
            <title>Requerimientos Autorizados</title>
            <!--
            <link rel="stylesheet" href="../../css/Css_Sort/style.css" />
            <script type="text/javascript" src="../../js/JQuery/jQuery.js"></script>
            <script type="text/javascript" src="../../js/JQuery/jquery-ui-1.8.16.custom.min.js"></script>
            <script type="text/javascript" src="../../js/Js_DGP/js_dgp_aut.js"></script>
            <link type="text/css" rel="stylesheet" href="../../css/Css_Reporte/Reportes.css">
            <link type="text/css" rel="stylesheet" href="../../css/Css_Formulario/form.css">
            -->
            <link rel="stylesheet" href="../../css1/bootstrap.min.css">
        </head>
        <body>  

            <div class="spacing">
                <center><h3 class="spacing">REQUERIMIENTOS AUTORIZADOS</h3></center>
            </div>
        <center>
            <div style="width: 600px;">
                
                    <form id="frm_filtro" method="post" action="">
                        <div class="row">
                            <div class="col-xs-6">
                                <label>Fecha inicio:</label><br>
                                 <input type="date"  class="form-control" name="del"  />
                            </div>
                            <div class="col-xs-6">
                                <label>Fecha fin:</label>
                                <input type="date" name="al" class="form-control" />
                                <input type="hidden" name="iddep" value="<? echo $_SESSION['DEPARTAMENTO_ID']; ?>">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-6">  
                                <label>Nombres y Apellidos :</label>
                                <input type="text" class="form-control" name="nom_ape"   size="25"/>
                            </div>
                            <div class="col-xs-6">  
                                <label>Area :</label><br>
                                <select name="area" class="form-control">
                                     <option value="0"></option>
                                        <?
                                        require '../Modelo/ModeloRH_Area.php';
                                        $md_a = new ModelorRH_Area();
                                         $iddgp=$_SESSION["DEPARTAMENTO_ID"];
                                        if ( $_SESSION["IDROL"]==5) {
                                            $iddgp=0;
                                        }
                                        
                                        $list_a = $md_a->LISTA_RH_AREA_ID($iddgp);
                                        for ($u = 0; $u < count($list_a); $u++) {
                                            ?>
                                            <option value="<? echo $list_a[$u][0]; ?>"><? echo $list_a[$u][1]; ?></option>
                                        <? } ?>
                                    </select>
                            </div>
                        </div>
                        <div class="row">
                           <div class="col-xs-6">
                                <label>Puesto :</label>
                                <input type="text" name="puesto" class="form-control" size="25" />
                            </div>
                            <div class="col-xs-6">
                                 <label>Sueldo :</label>
                                <input type="text" name="sueldo" class="form-control" size="25" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-6">
                                <label>Sección :</label>
                                <input type="text" name="seccion" class="form-control">
                            </div>
                            <div class="col-xs-6">
                            <label>Requerimiento :</label>
                            <select name="motivo" class="form-control" > 
                                        <option value="0"></option>
                                        <?
                                        require_once '../Modelo/ModeloRequerimiento.php';
                                        $mreq = new ModeloRequerimiento();
                                        $list_r = $mreq->ListarRequerimiento();

                                        for ($g = 0; $g < count($list_r); $g++) {
                                            ?>
                                            <option value="<? echo $list_r[$g][0]; ?>"><? echo $list_r[$g][1]; ?></option>
                                        <? } ?>
                             </select>
                             <input type="hidden" name="iduser" value="<? echo $iduser; ?>">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-6">
                            <label>Proceso :</label>
                            <select name="proceso" class="form-control">
                                    <option value="0"></option>
                                    <?
                                    require_once '../Modelo/ModeloLista.php';
                                    $mpro = new ModeloLista();
                                    $list_pro = $mpro->LISTA_PROCESO();
                                    for ($f = 0; $f < count($list_pro); $f++) {
                                        ?>
                                        <option value="<? echo $list_pro[$f][0]; ?>"><? echo $list_pro[$f][1]; ?></option>
                                    <? } ?>
                                </select>
                            </div>
                            <? //if ($_SESSION["IDROL"] == 1) { ?>
                            <div class="col-xs-6">
                            <label>Departamento :</label>
                             <select name="dep" class="form-control">
                                        <option value="0" ></option>
                                        <?  for ($kk = 0; $kk < count($list_d); $kk++) {?>
                                        <option value="<?echo $list_d[$kk][0]?>"><?echo $list_d[$kk][1];?></option>
                                            <?}?>
                             </select>
                            </div>
                        </div>
                            <? //} ?>
                         
                                <hr/>
             
                         <div class="row">
                            <div class="col-xs-6">                            
                            <button type="button" class="btn btn-primary" id="btnfiltrar">Buscar</button>
                            </div>
                            <div class="col-xs-6">  
                            <a href="javascript:;"  id="btncancel" class="btn btn-default">Cancelar</a>
                            </div>
                         </div>

                    </form>
                
                <br>
                <br>
                <div class="container">
                    <table     id="data" class="tinytable" style="width: 1050px;">
                        <thead class="tab_cabe">
                            <tr class="tr">
                                <td style="width: 230px;" ><span title="NOMBRE_P">Nombres y Apellidos</span></td>
                                <td  ><span title="DEPARTAMENTO" >Departamento</span></td>
                                <td  ><span title="AREA" >Area</span></td>
                                <td><span title="SECCION">Sección</span></td>
                                <td><span title="PUESTO">Puesto</span></td>
                                <td><span title="SUELDO">Sueldo</span></td>
                               <!-- <th><span title="PROCESO">Proceso</span></th>-->
                                <td><span title="MOTIVO">Requerimiento</span></td>
                                <td><span title="FECHA_CREACION">Fecha de Contratación</span></td>
                            </tr>
                        </thead>

                        <tbody>


                        </tbody>
                    </table>

                </div>

            </div>


        </center>

    </body>

    </html>
    <%
} %>
