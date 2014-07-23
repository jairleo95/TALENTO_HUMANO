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
            <link rel="stylesheet" href="../Vistas/sort/style.css" />
            <script type="text/javascript" src="../JS/jquery-1.7.2.min.js"></script>
            <script type="text/javascript" src="../JS/jquery-ui-1.8.16.custom.min.js"></script>
            <script type="text/javascript" src="../JS/js_dgp_aut.js"></script>
            
            <link type="text/css" rel="stylesheet" href="../CSS/Reportes.css">
            <link type="text/css" rel="stylesheet" href="../CSS/form.css">
        </head>
        <body class="body" style="height: 1024px;" >  

            <div class="spacing">
                <center><h1 class="spacing">REQUERIMIENTOS AUTORIZADOS</h1></center>
            </div>
        <center>
            <div id="content">
                <div class="filtro">
                    <form id="frm_filtro" method="post" action="">
                        <table id="tab" >
                            <tr>
                                <td class="td-form"><strong>Fecha de Creación  del : </strong> </td>
                                <td><input type="date"  class="text-box" name="del"  size="15" class="" /></td>
                                <td class="td-form"><strong>al :</strong></td> 
                                <td><input type="date" name="al" size="15" class="text-box" /></td>
                            <input type="hidden" name="iddep" value="<? echo $_SESSION["DEPARTAMENTO_ID"]; ?>">
                            </tr>
                            <tr>
                                <td class="td-form"><strong>Nombres y Apellidos :</strong></td><td><input type="text" class="text-box" name="nom_ape"   size="25" /></td>

                                <td class="td-form"><strong>Area :</strong></td><td><select name="area" class="text-box">
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
                                    </select></td>    
                            </tr>
                            <tr >
                                <td class="td-form"><strong>Puesto :</strong></td><td><input type="text" name="puesto" class="text-box" size="25" /></td>
                                <td class="td-form"><strong>Sueldo :</strong></td><td><input type="text" name="sueldo" class="text-box" size="25" /></td>
                            </tr>
                            <tr>
                                <td class="td-form"><strong>Sección :</strong></td><td><input type="text" name="seccion" class="text-box"></td>
                                <td class="td-form"><strong>Requerimiento :</strong></td>
                                <td>
                                    <select name="motivo" class="text-box" > 
                                        <option value="0"></option>
                                        <?
                                        require_once '../Modelo/ModeloRequerimiento.php';
                                        $mreq = new ModeloRequerimiento();
                                        $list_r = $mreq->ListarRequerimiento();

                                        for ($g = 0; $g < count($list_r); $g++) {
                                            ?>
                                            <option value="<? echo $list_r[$g][0]; ?>"><? echo $list_r[$g][1]; ?></option>
                                        <? } ?>
                                    </select></td>
                            </tr>
                            <tr>
                            <input type="hidden" name="iduser" value="<? echo $iduser; ?>">
                            <td class="td-form"><strong>Proceso :</strong></td>
                            <td><select name="proceso" class="text-box">
                                    <option value="0"></option>
                                    <?
                                    require_once '../Modelo/ModeloLista.php';
                                    $mpro = new ModeloLista();
                                    $list_pro = $mpro->LISTA_PROCESO();
                                    for ($f = 0; $f < count($list_pro); $f++) {
                                        ?>
                                        <option value="<? echo $list_pro[$f][0]; ?>"><? echo $list_pro[$f][1]; ?></option>
                                    <? } ?>
                                </select></td>
                            <? //if ($_SESSION["IDROL"] == 1) { ?>
                                <td class="td-form">Departamento :</td>
                                <td><select name="dep" class="text-box">
                                        <option value="0"></option>
                                        <?  for ($kk = 0; $kk < count($list_d); $kk++) {?>
                                        <option value="<?echo $list_d[$kk][0]?>"><?echo $list_d[$kk][1];?></option>
                                            <?}?>
                                    </select></td>
                            <? //} ?>
                            <td><button type="button" class="button blue" id="btnfiltrar">Buscar</button></td>
                            <td><a href="javascript:;"  id="btncancel" class="button blue">Cancelar</a></td>
                            </tr>
                        </table>
                    </form>
                </div>
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
