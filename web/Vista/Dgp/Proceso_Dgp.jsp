<%
/*session_start();
if (isset($_SESSION['IDUSER'])) {
    require '../Modelo/ModeloDGP.php';
    $iddep = $_SESSION["DEPARTAMENTO_ID"];
    $mddgp = new ModeloDGP();
    $list_dgp = $mddgp->LIST_DGP($iddep);
    $s = count($list_dgp);*/
    %>

    <!DOCTYPE html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
            <title>Requeriemiento en Proceso</title>
            <!--<link type="text/css" rel="stylesheet" href="../CSS/form.css">-->
            <link type="text/css" rel="stylesheet" href="../../css/Css_Reporte/Reportes.css">
            <!-- <link type="text/css" rel="stylesheet" href="../CSS/desplegable.css">
            --><style>



                * {
                    font-family:sans-serif;
                    list-style:none;
                    text-decoration:none;
                    margin:0;
                    padding:0;
                }

                .nav > li {
                    float: left;
                    // width: 90%;
                }

                .nav li a {
                    background:#0099FF;
                    color:white;
                    display:block;
                    border:1px solid;
                    width: 150%;


                }
                /*
                .nav li .flecha{
                font-size: 9px;
                padding-left: 6px;
                display: none;
                }
                
                .nav li a:not(:last-child) .flecha {
                display: inline;
                }*/

                .nav li a:hover {
                    background:#00529B;
                }

                .nav li {
                    position:relative;
                    width: 100%;
                    height: 100%;
                    //  background-color: black;
                }

                /* ul (submenu)*/
                .nav li ul {
                    display:none ;
                    position:absolute;
                    left:100%;

                    //margin-top: 1px;
                    //min-width:200px;
                }

                .nav li:hover > ul {
                    display:block;
                    top: -30%;

                }

                .nav li ul li ul {
                    //right:-140px;
                    top:0;
                }

                td,th,table{
                    padding: 0;
                    margin: 0;
                }



            </style>
        </head>
        <body style="height: 1024px">  
            <div class="spacing">
                <center><h1 class="spacing">Estado de Requerimientos</h1></center>
            </div>
        <center>
            <div class="">
                <table >
                    <tr><td colspan="2"> Requerimientos (<? echo $s; ?>)</td>
                </table>       

                <table class="tinytable"   >
                    <tr  class="tab_cabe">
                        <td><strong>Nro</strong></td>
                        <td><strong>Foto</strong></td>
                        <td><strong>Nombre</strong></td>
                        <td ><strong>Acciones</strong></td>
                    </tr>
                    <? if ($s == 0) { ?>
                        <tr><td colspan="6" align="center"><h3>No hay ningún DGP en proceso...</h3></td></tr>
                    <? } ?>

                    <? for ($index = 0; $index < count($list_dgp); $index++) { ?>


                        <tr>
                            <td><strong><? echo $index + 1 ?></strong></td>
                          <!--<td ><div class="roundedOne">
                                  <input type="checkbox" value="None" id="roundedOne" name="check" />
                                  <label for="roundedOne"></label>
                              </div></td>-->

                            <%
                            /*require_once '../Modelo/Modelo_Imagen.php';
                            $mod_f = new Modelo_Imagen();
                            $idf = $mod_f->LIST_FOTO_TRABAJADOR($list_dgp[$index][0]);
                            */
                            %>

                            <? if ($idf == null) { ?>
                            <td><img src="../../imagenes/avatar_default.jpg"  width="60"  height="60">
                                </td>
                            <? } else { ?>
                                <td><img src="Foto.php?idf=<? echo $idf; ?>"  width="60"  height="60"></td>
                            <? } ?>
                            <td>   
                                <div><a href="../Trabajador/Detalle_Trabajador.jsp?idtr=<? echo $list_dgp[$index][0]; ?>"> <strong><? echo strtoupper($list_dgp[$index][1] . ' ' . $list_dgp[$index][2] . ' ' . $list_dgp[$index][3]); ?></strong></a></div>
                            </td>
                            <td>
                                <ul class="nav">
                                    <li>
                                        <div class="opc">
                                            <img src="../../imagenes/engranaje-hi.png" width="40" height="40">
                                        </div>   
                                        <ul>
                                            <li><a href="User_Dgp.jsp?iddgp=<? echo $list_dgp[$index][4]; ?>">Usuarios - Prox. Autorizacion</a></li>

                                            <li><a href="Detalle_Seguimiento_Dgp.jsp?iddgp=<? echo $list_dgp[$index][4]; ?>">Ver Seguimiento</a> </li>
                                            <li><a href="Documento/Reg_Documento.jsp?iddgp=<? echo $list_dgp[$index][4]; ?>&idtr=<? echo $list_dgp[$index][0]; ?>">Ver Documentos</a></li>
                                            <li><a href="Comentario/Reg_Comentario.jsp?iddgp=<? echo$list_dgp[$index][4]; ?>&idp=<? ?>">Comentarios</a></li>    
                                        </ul>
                                    </li>
                                </ul>



                            </td> 






                <!-- <td><a href="List_Coment.php?iddgp=<? //echo $list_dgp[$index][4];   ?>">Ver Comentarios</a></td>
                            -->
                        </tr>
                    <? } ?>
                </table>
            </div>
        </center>

    </body>

    </html>
