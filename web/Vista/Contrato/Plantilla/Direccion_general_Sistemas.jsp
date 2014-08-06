<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">

<html>
   <!-- <?
    require_once '../Modelo/modelotrabajador.php';
    $mdtr=new modelotrabajador();
    $id=$_REQUEST["idc"];
   // echo $id;
    $list=$mdtr->LIST_DAT_TR_PLANTILLA($id);
    ?>-->
    <head>

        <link rel="stylesheet" type="text/css" href="../CSS/estilo_impresion.css"  media="print">
        <title></title>
        <style  type="text/css" >
            .text{
            font-size: 18px;
            width: 1024px;
            margin-left:auto;
            margin-right:auto;
            text-align: justify;
            padding: 30px;
            }
            
            .imprimirTexto{
                background-image:url(../Imagenes/print.png);
                width: 222px;
                height: 100px;
                    
                
            }
        </style>
        <script >
        function imprSelec(nombre)
{
  var ficha = document.getElementById(nombre);
  var ventimp = window.open(' ', 'Impresion');
  ventimp.document.write('<head><title></title><link rel="stylesheet" type="text/css" href="../CSS/estilo_impresion.css"  media="print"/></head>');
  ventimp.document.write( ficha.innerHTML );
  ventimp.document.close();
  ventimp.print( );
  ventimp.close();
}

        </script>
    </head>
    <body>
       
       <br>
       <br>
       <br>
       <div id="muestra">
  
       <?  
       //echo count($list);
       for ($i = 0; $i < count($list); $i++) {?>
        <div class="text">
            <center>  <h2> CONTRATO DE TRABAJO A PLAZO FIJO Y BAJO MODALIDAD</h2></center> 
 <p>Conste por el presente documento el contrato de trabajo a plazo fijo y sujeto a modalidad por 

Servicio Específico, conforme lo dispone el Art. 63 del T.U.O del D. Leg. 728, Ley de Productividad y 

Competitividad Laboral (D.S. Nº 003-97-TR), que celebran de una parte la <strong>UNIVERSIDAD PERUANA 

    UNIÓN</strong>, con RUC Nº 20138122256, con domicilio en Villa Unión s/n, altura del Km. 19 de la carretera 

    central, Ñaña, Lurigancho-Chosica, a quien se le denominará <strong>"EMPLEADOR"</strong>, representada por su 

    Apoderado Mg. Julio Cesar Rengifo Peña, con DNI No. 06690086,; y de la otra parte <strong><? echo $list[$i][0].' '.$list[$i][1].' '.$list[$i][2];?></strong> , con DNI Nº(<strong><? echo $list[$i][3];?></strong>), domiciliado(a) en (<strong><?
      require_once '../Modelo/ModeloLista.php';
                                $mod_list= new ModeloLista();
                                $list_d1=$mod_list->LISTA_DOM_D1_ID();
                                for ($x = 0; $x < count($list_d1); $x++) {
                                    if ($list[$i][4]==($x+1)) {
                                        echo $list_d1[$x][0];
                                    }
                                }

                                if ($list[$i][6]==1) {
                                    echo ' '.$list[$i][5].'Número';
                                }
                                if ($list[$i][6]==2) {
                                    echo ' '.$list[$i][5].'Lote';
                                }
                                
                                if ($list[$i][6]==3) {
                                    echo ' '.$list[$i][5].'S/N';
                                }
                                
                                $list_d5=$mod_list->LISTA_DOM_D5_ID();
                                for ($c = 0; $c < count($list_d5); $c++) {
                                    if ($list[$i][8]==($c+1)) {
                                         echo ' '.$list[$i][7].' '.$list_d5[$c][0];
                                    }
                                }
                 echo ' '.$list[$i][9];
   // echo $list[$i][4].' '.$list[$i][5].' '.$list[$i][6].' '.$list[$i][7].' '.$list[$i][8].' '.$list[$i][9];
                 ?></strong>),<strong><? 
   require_once '../Modelo/ModeloUbigeo.php';
        $mod_u=new ModeloUbigeo();
        
        $list_dir=$mod_u->ListarDistrito();
        for ($y = 0; $y < count($list_dir); $y++) {
            if (trim($list[$i][17])==$list_dir[$y][0]) {
                echo $list_dir[$y][1];
            }
             }
    ?></strong>, a quien se le denominará el (la) <strong>"TRABAJADOR?(A)</strong>, en los términos y condiciones 

siguientes:</p>

 <p><strong>PRIMERA:</strong> EL EMPLEADOR tiene por actividad principal la educación en todos sus niveles.

El (la)TRABAJADOR (A) conoce que la Universidad Peruana Unión es parte integrante del sistema 

educativo Adventista, normado y regulada bajo prácticas, costumbres, principios éticos morales, por lo 

que acepta respetar, observar y cumplir estos principios practicados por esta institución, dentro y fuera 

del Campus Universitario.</p>

 <p><strong>SEGUNDA:</strong> El EMPLEADOR requiere de personal temporal en las áreas de la <strong><? echo $list[$i][10];?></strong>, con el objeto de diseñar detalladamente los requerimientos del sistema académico, 

programando nuevos módulos, reportes o actualizaciones de módulos, diseñar detalladamente los 

requerimientos de cada proyecto asignado, programando adecuadamente los módulos del sistema, 

apoyar en el mantenimiento de los recursos informáticos o brindar soporte técnico especializado a 

los equipos y sistemas solventando problemas o requerimientos de los usuarios; en consecuencia, el 

EMPLEADOR ha visto por conveniente contratar al TRABAJADOR (A), bajo la modalidad de servicio 

específico.

 <p><strong>TERCERA:</strong> EL EMPLEADOR de acuerdo con la condición expresada en la segunda cláusula, contrata al 

(la) TRABAJADOR (A) para que se desempeñe como <strong><? echo $list[$i][11];?></strong>.</p> 

 <p><strong>CUARTA:</strong> EL EMPLEAOR en virtud del presente documento, contrata, al (la) TRABAJADOR (A) desde el 

<strong><? echo $list[$i][12];?></strong> hasta el <strong><? echo $list[$i][13];?></strong>.</p>

 <p><strong>QUINTA:</strong> EL (la) TRABAJADOR (A) percibirá una remuneración mensual de S/ <strong><? echo $list[$i][14];?></strong>. 

(Nuevos Soles), como retribución por las labores realizadas en la jornada y horario laboral establecido por 

el ?EMPLEADOR?, la que será de 48 horas semanales.<p>

<p><strong>SEXTA:</strong> EL (la) TRABAJADOR (A) se obliga a prestar sus servicios con eficiencia, puntualidad y bajo 

principio de subordinación, cumplir con las directivas de sus jefes y de su Centro de Labor y con lo que 

dispone El Reglamento General Interno de Trabajo, Reglamento de Trabajo en Sobretiempo, Reglamento 

de Seguridad y Salud en el Trabajo, Recomendaciones sobre Seguridad y Salud en el Trabajo y demás 

políticas, que por su función le son entregados a la suscripción del presente contrato, caso contrario se 

resolverá el presente contrato conforme las normas laborales vigentes.</p>

<p><strong>SÉPTIMA:</strong> EL (LA) TRABAJADOR (A) conoce y acepta que al término del plazo fijado en la cláusula 

CUARTA del presente contrato, éste quedará extinguido automáticamente sin obligación de aviso previo 

o comunicación alguna. EL EMPLEADOR sin perjuicio de lo indicado en las cláusulas anteriores, podrá 

dar por terminado el presente contrato si EL (la) TRABAJADOR (A) incurre en alguna de las causales de 

despido conforme a las leyes vigentes.</p>

<p><strong>OCTAVA:</strong> EL (LA) TRABAJADOR (A), en cualquier momento, podrá dar por terminada la relación laboral 

    en forma expresa, con la sola limitación de presentar su carta de renuncia con 30 días de anticipación.</p>

<p><strong>NOVENA:</strong> En todo lo no previsto en el presente contrato se aplicará la Ley vigente de nuestro país.

Estando de acuerdo en todo el contenido del presente contrato, firmamos en señal de conformidad, en 

Ñaña, Chosica, Lima, al <strong><? echo $list[$i][16];?></strong>.

  </p>
<br>
<div  ><table  style="width: 100%;  height: 50px; "><tr><td align="center">______________________________<br><br>EMPLEADOR</td>
        <td align="center">_______________________________<br><br>TRABAJADOR(A)</td></tr></table></div>

        </div>     
       <?
       }?>
           </div>
       <center>
           
  <td align="center"><a href="javascript:imprSelec('muestra')" id="imprime" class="imprimirTexto">Imprimir Plantilla</a></td>
</center>

       <!-- 
<input type="button" name="imprimir" value="Imprimir" onclick="window.print();">-->
    </body>

</html>
