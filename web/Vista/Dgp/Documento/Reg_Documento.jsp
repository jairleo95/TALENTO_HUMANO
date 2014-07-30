<?php
@session_start();

?>
<!DOCTYPE html >

<html>
    <head>
        <meta charset="windows-1252">
        <title>Archivos por adjuntar</title>
        <link href="../../../css/Css_Lista/listas.css"  rel="stylesheet" >
      <!--  <style>
          
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
                              
                td:nth-of-type(1):before { content: "Documento"; }
                td:nth-of-type(2):before { content: "Adjuntar"; }
                td:nth-of-type(3):before { content: "Descripcion"; }
                td:nth-of-type(4):before { content: "Recibido"; }

        }      
        </style>-->
    </head>

    <body>
        <?
        require_once '../Modelo/ModeloDocumento.php';
        $idtra = $_REQUEST["idtr"];
        $iddgp = $_REQUEST["iddgp"];
        $md = new ModeloDocumento();
        $list_d = $md->List_doc_req_pla($iddgp, $idtra);
        $cant_hijos=0;
         $list_h = $md->List_hijos($idtra);
         $list_c = $md->List_coyugue($idtra);
         $list_ad = $md->List_adventista($idtra);
         $list_ext = $md->List_req_nacionalidad($idtra);
        ?>
    <center>

        <form action="../Control/ControlDoc_Archivo.php" method="post" enctype="multipart/form-data">
            <table>
                <thead>
                    <tr>
                        <th class="cajita">DOCUMENTO</th>   
                        <th class="cajita">ADJUNTAR</th>   
                        <th class="cajita">DESCRIPCION</th>   
                        <th class="cajita">RECIBIDO?</th>   
                    </tr>
                </thead>
                <tbody>
<? 
$i=0;
for ($z = 0; $z < count($list_d); $z++) { ?>
                    
                     <?  if ($list_d[$z][39] == "DOCA") {?>
                    <?  if (count($list_ext)!=0) {?>
                        <tr>
                            <? echo count($list_ext)    ?>
                            <td class="caji"><strong><? echo $list_d[$z][3]; ?></strong></td>

                            <td class="caji">
                                <? if ($list_d[$z][25] == null & $_SESSION["IDROL"] == 2) { ?>
                                    <input type="file" name="lob_upload<? echo $i + 1; ?>">
                                <? } else { ?>
                                    <? if ($list_d[$z][25] == null) { ?>
                                        <label class="null">No Registrado</label>
        <? } else { ?>
                                        <a href="Ver_Doc.php?iddoc=<? echo $list_d[$z][25]; ?>"><? echo $list_d[$z][36]; ?></a>

        <? }
    } ?>
                            </td>

                            <td class="caji">
                                <? if ($list_d[$z][34] == null & $_SESSION["IDROL"] == 2) { ?>
                                    <input type="text" name="lob_description<? echo $i + 1; ?>">
                                <? } else { ?>
                                    <? if ($list_d[$z][34] == null) { ?>
                                        <label class="null" >No Registrado</label>
                                    <? } else { ?>
                                        <label> <? echo $list_d[$z][34]; ?></label>

        <? } ?>
                                <? } ?>    
                            </td>
                            <td class="caji">
                                <? if ($list_d[$z][28] == null & $_SESSION["IDROL"] == 2) { ?>
                                    <input type="checkbox"  value="1"  name="estado<? echo $i + 1; ?>">
    <? } else { ?>
                                    <? if ($list_d[$z][28] == null) { ?>

                                        <label class="null">No Registrado</label>
                                        <? } else { ?>
                                        <label><? if ($list_d[$z][28] == 1) { ?>

                                                <img src="../Imagenes/Aprobado.png" width="20" height="20">
                                                <?
                                            } else {
                                                echo $list_d[$z][28];
                                                ?></label>
            <? }
        }
    } ?>
                            </td>

                    <input type="hidden" name="iddoc<? echo $i + 1; ?>" value="<? echo $list_d[$z][0]; ?>">
                    </tr>  




                    <?}}?>
                    <?  if ($list_d[$z][39] == "COFE") {?>
                    <?  if (count($list_ad)!=0) {?>
                        <tr>
                            <td class="caji"><strong><? echo $list_d[$z][3]; ?></strong></td>

                            <td class="caji">
                                <? if ($list_d[$z][25] == null & $_SESSION["IDROL"] == 2) { ?>
                                    <input type="file" name="lob_upload<? echo $i + 1; ?>">
                                <? } else { ?>
                                    <? if ($list_d[$z][25] == null) { ?>
                                        <label class="null">No Registrado</label>
        <? } else { ?>
                                        <a href="Ver_Doc.php?iddoc=<? echo $list_d[$z][25]; ?>"><? echo $list_d[$z][36]; ?></a>

        <? }
    } ?>
                            </td>

                            <td class="caji">
                                <? if ($list_d[$z][34] == null & $_SESSION["IDROL"] == 2) { ?>
                                    <input type="text" name="lob_description<? echo $i + 1; ?>">
                                <? } else { ?>
                                    <? if ($list_d[$z][34] == null) { ?>
                                        <label class="null" >No Registrado</label>
                                    <? } else { ?>
                                        <label> <? echo $list_d[$z][34]; ?></label>

        <? } ?>
                                <? } ?>    
                            </td>
                            <td class="caji">
                                <? if ($list_d[$z][28] == null & $_SESSION["IDROL"] == 2) { ?>
                                    <input type="checkbox"  value="1"  name="estado<? echo $i + 1; ?>">
    <? } else { ?>
                                    <? if ($list_d[$z][28] == null) { ?>

                                        <label class="null">No Registrado</label>
                                        <? } else { ?>
                                        <label><? if ($list_d[$z][28] == 1) { ?>

                                                <img src="../Imagenes/Aprobado.png" width="20" height="20">
                                                <?
                                            } else {
                                                echo $list_d[$z][28];
                                                ?></label>
            <? }
        }
    } ?>
                            </td>

                    <input type="hidden" name="iddoc<? echo $i + 1; ?>" value="<? echo $list_d[$z][0]; ?>">
                    </tr>  




                    <?}}?>

<?  if ($list_d[$z][39] == "DNIC"|$list_d[$z][39] == "ACMA") {?>
               <? for ($kj = 0; $kj < count($list_c); $kj++) { ?>
                            
              <tr>
                  <td class="caji"><strong><?  if ($list_d[$z][39] == "ACMA") {
      echo 'ACTA DE MATRIMONIO CON: '.$list_c[$kj][4];
                            }if ($list_d[$z][39] == "DNIC") {
                                echo 'COPIA DNI CONYUGUE : '.$list_c[$kj][4]; 
                                      }?>
                      </strong></td>

                                <td class="caji">
                                    <? if ($list_d[$z][25] == null & $_SESSION["IDROL"] == 2) { ?>
                                        <input type="file" name="lob_upload<? echo $i + 1; ?>">
                                    <? } else { ?>
                                        <? if ($list_d[$z][25] == null) { ?>
                                            <label class="null">No Registrado</label>
                <? } else { ?>
                                            <a href="Ver_Doc.php?iddoc=<? echo $list_d[$z][25]; ?>"><? echo $list_d[$z][36]; ?></a>

                                        <? }
                                    } ?>
                                </td>

                                <td class="caji">
            <? if ($list_d[$z][34] == null & $_SESSION["IDROL"] == 2) { ?>
                                        <input type="text" name="lob_description<? echo $i + 1; ?>">
                                    <? } else { ?>
                                        <? if ($list_d[$z][34] == null) { ?>
                                            <label class="null" >No Registrado</label>
                                        <? } else { ?>
                                            <label> <? echo $list_d[$z][34]; ?></label>

                                        <? } ?>
                                    <? } ?>    
                                </td>
                                <td class="caji">
                                    <? if ($list_d[$z][28] == null & $_SESSION["IDROL"] == 2) { ?>
                                        <input type="checkbox"  value="1"  name="estado<? echo $i + 1; ?>">
                                        <? } else { ?>
                <? if ($list_d[$z][28] == null) { ?>

                                            <label class="null">No Registrado</label>
                                            <? } else { ?>
                                            <label><? if ($list_d[$z][28] == 1) { ?>

                                                    <img src="../Imagenes/Aprobado.png" width="20" height="20">
                        <?
                    } else {
                        echo $list_d[$z][28];
                        ?></label>
                    <? }
                }
            } ?>
                                </td>

                            <input type="hidden" name="iddoc<? echo $i + 1; ?>" value="<? echo $list_d[$z][0]; ?>">
                            </tr>  

        <? } ?>

    <?}?>
                            
                      <?if ($list_d[$z][39] == "DNIH") { ?>
                                <? for ($kk = 0; $kk < count($list_h); $kk++) {  ?>
                            
              <tr>
                                <td class="caji"><strong>COPIA DNI DEL HIJO :  <? echo $list_h[$kk][2].' '.$list_h[$kk][3].' '.$list_h[$kk][4]; ?></strong></td>

                                <td class="caji">
                                    <? if ($list_d[$z][25] == null & $_SESSION["IDROL"] == 2) { ?>
                                        <input type="file" name="lob_upload<? echo $i + 1; ?>">
                                    <? } else { ?>
                                        <? if ($list_d[$z][25] == null) { ?>
                                            <label class="null">No Registrado</label>
                <? } else { ?>
                                            <a href="Ver_Doc.php?iddoc=<? echo $list_d[$z][25]; ?>"><? echo $list_d[$z][36]; ?></a>

                                        <? }
                                    } ?>
                                </td>

                                <td class="caji">
            <? if ($list_d[$z][34] == null & $_SESSION["IDROL"] == 2) { ?>
                                        <input type="text" name="lob_description<? echo $i + 1; ?>">
                                    <? } else { ?>
                                        <? if ($list_d[$z][34] == null) { ?>
                                            <label class="null" >No Registrado</label>
                                        <? } else { ?>
                                            <label> <? echo $list_d[$z][34]; ?></label>

                                        <? } ?>
                                    <? } ?>    
                                </td>
                                <td class="caji">
                                    <? if ($list_d[$z][28] == null & $_SESSION["IDROL"] == 2) { ?>
                                        <input type="checkbox"  value="1"  name="estado<? echo $i + 1; ?>">
                                        <? } else { ?>
                <? if ($list_d[$z][28] == null) { ?>

                                            <label class="null">No Registrado</label>
                                            <? } else { ?>
                                            <label><? if ($list_d[$z][28] == 1) { ?>

                                                    <img src="../Imagenes/Aprobado.png" width="20" height="20">
                        <?
                    } else {
                        echo $list_d[$z][28];
                        ?></label>
                    <? }
                }
            } ?>
                                </td>

                            <input type="hidden" name="iddoc<? echo $i + 1; ?>" value="<? echo $list_d[$z][0]; ?>">
                            </tr>  

        <?
        $i++;
        
                    } 
      
        ?>
                    <? }
                    
                    else if($list_d[$z][39] != "DNIH"&$list_d[$z][39] != "DNIC"&$list_d[$z][39] != "ACMA"&$list_d[$z][39] != "COFE"&$list_d[$z][39] != "DOCA"){ ?>
                    
                    
                        <tr>
                            <td class="caji"><strong><? echo $list_d[$z][3]; ?></strong></td>

                            <td class="caji">
                                <? if ($list_d[$z][25] == null & $_SESSION["IDROL"] == 2) { ?>
                                    <input type="file" name="lob_upload<? echo $i + 1; ?>">
                                <? } else { ?>
                                    <? if ($list_d[$z][25] == null) { ?>
                                        <label class="null">No Registrado</label>
        <? } else { ?>
                                        <a href="Ver_Doc.php?iddoc=<? echo $list_d[$z][25]; ?>"><? echo $list_d[$z][36]; ?></a>

        <? }
    } ?>
                            </td>

                            <td class="caji">
                                <? if ($list_d[$z][34] == null & $_SESSION["IDROL"] == 2) { ?>
                                    <input type="text" name="lob_description<? echo $i + 1; ?>">
                                <? } else { ?>
                                    <? if ($list_d[$z][34] == null) { ?>
                                        <label class="null" >No Registrado</label>
                                    <? } else { ?>
                                        <label> <? echo $list_d[$z][34]; ?></label>

        <? } ?>
                                <? } ?>    
                            </td>
                            <td class="caji">
                                <? if ($list_d[$z][28] == null & $_SESSION["IDROL"] == 2) { ?>
                                    <input type="checkbox"  value="1"  name="estado<? echo $i + 1; ?>">
    <? } else { ?>
                                    <? if ($list_d[$z][28] == null) { ?>

                                        <label class="null">No Registrado</label>
                                        <? } else { ?>
                                        <label><? if ($list_d[$z][28] == 1) { ?>

                                                <img src="../Imagenes/Aprobado.png" width="20" height="20">
                                                <?
                                            } else {
                                                echo $list_d[$z][28];
                                                ?></label>
            <? }
        }
    } ?>
                            </td>

                    <input type="hidden" name="iddoc<? echo $i + 1; ?>" value="<? echo $list_d[$z][0]; ?>">
                    




  


                    <!--primer for-->

                    <? }$i++; } ?>
                    
                <input type="hidden" name="iddgp" value="<? echo $iddgp; ?>">
                <input type="hidden" name="idtr" value="<? echo $idtra; ?>">
                <input type="hidden" name="num" value="<? echo $i + 1; ?>">
        <? if ($_SESSION["IDROL"] == 2) { ?>
                    <tr><td><input type="submit" value="Registrar" name="opc"></td></tr>

<? } ?>
                </tbody>
                
            </table>

        </form>
<? if ($_REQUEST["P2"] == TRUE) { ?>

            <form action="../Control/ControlDGP.php" method="post">
                <input  type="hidden" value="<? echo $iddgp; ?>" name="iddgp">
                <input type="submit" value="Terminar" name="opc">

            </form>
<? } ?> 

    </center>
</body>
</html>
