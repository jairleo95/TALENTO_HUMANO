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

Servicio Espec�fico, conforme lo dispone el Art. 63 del T.U.O del D. Leg. 728, Ley de Productividad y 

Competitividad Laboral (D.S. N� 003-97-TR), que celebran de una parte la <strong>UNIVERSIDAD PERUANA 

    UNI�N</strong>, con RUC N� 20138122256, con domicilio en Villa Uni�n s/n, altura del Km. 19 de la carretera 

    central, �a�a, Lurigancho-Chosica, a quien se le denominar� <strong>"EMPLEADOR"</strong>, representada por su 

    Apoderado Mg. Julio Cesar Rengifo Pe�a, con DNI No. 06690086,; y de la otra parte <strong><? echo $list[$i][0].' '.$list[$i][1].' '.$list[$i][2];?></strong> , con DNI N�(<strong><? echo $list[$i][3];?></strong>), domiciliado(a) en (<strong><?
      require_once '../Modelo/ModeloLista.php';
                                $mod_list= new ModeloLista();
                                $list_d1=$mod_list->LISTA_DOM_D1_ID();
                                for ($x = 0; $x < count($list_d1); $x++) {
                                    if ($list[$i][4]==($x+1)) {
                                        echo $list_d1[$x][0];
                                    }
                                }

                                if ($list[$i][6]==1) {
                                    echo ' '.$list[$i][5].'N�mero';
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
    ?></strong>, a quien se le denominar� el (la) <strong>"TRABAJADOR?(A)</strong>, en los t�rminos y condiciones 

siguientes:</p>

 <p><strong>PRIMERA:</strong> EL EMPLEADOR tiene por actividad principal la educaci�n en todos sus niveles.

El (la)TRABAJADOR (A) conoce que la Universidad Peruana Uni�n es parte integrante del sistema 

educativo Adventista, normado y regulada bajo pr�cticas, costumbres, principios �ticos morales, por lo 

que acepta respetar, observar y cumplir estos principios practicados por esta instituci�n, dentro y fuera 

del Campus Universitario.</p>

 <p><strong>SEGUNDA:</strong> El EMPLEADOR requiere de personal temporal en las �reas de la <strong><? echo $list[$i][10];?></strong>, con el objeto de dise�ar detalladamente los requerimientos del sistema acad�mico, 

programando nuevos m�dulos, reportes o actualizaciones de m�dulos, dise�ar detalladamente los 

requerimientos de cada proyecto asignado, programando adecuadamente los m�dulos del sistema, 

apoyar en el mantenimiento de los recursos inform�ticos o brindar soporte t�cnico especializado a 

los equipos y sistemas solventando problemas o requerimientos de los usuarios; en consecuencia, el 

EMPLEADOR ha visto por conveniente contratar al TRABAJADOR (A), bajo la modalidad de servicio 

espec�fico.

 <p><strong>TERCERA:</strong> EL EMPLEADOR de acuerdo con la condici�n expresada en la segunda cl�usula, contrata al 

(la) TRABAJADOR (A) para que se desempe�e como <strong><? echo $list[$i][11];?></strong>.</p> 

 <p><strong>CUARTA:</strong> EL EMPLEAOR en virtud del presente documento, contrata, al (la) TRABAJADOR (A) desde el 

<strong><? echo $list[$i][12];?></strong> hasta el <strong><? echo $list[$i][13];?></strong>.</p>

 <p><strong>QUINTA:</strong> EL (la) TRABAJADOR (A) percibir� una remuneraci�n mensual de S/ <strong><? echo $list[$i][14];?></strong>. 

(Nuevos Soles), como retribuci�n por las labores realizadas en la jornada y horario laboral establecido por 

el ?EMPLEADOR?, la que ser� de 48 horas semanales.<p>

<p><strong>SEXTA:</strong> EL (la) TRABAJADOR (A) se obliga a prestar sus servicios con eficiencia, puntualidad y bajo 

principio de subordinaci�n, cumplir con las directivas de sus jefes y de su Centro de Labor y con lo que 

dispone El Reglamento General Interno de Trabajo, Reglamento de Trabajo en Sobretiempo, Reglamento 

de Seguridad y Salud en el Trabajo, Recomendaciones sobre Seguridad y Salud en el Trabajo y dem�s 

pol�ticas, que por su funci�n le son entregados a la suscripci�n del presente contrato, caso contrario se 

resolver� el presente contrato conforme las normas laborales vigentes.</p>

<p><strong>S�PTIMA:</strong> EL (LA) TRABAJADOR (A) conoce y acepta que al t�rmino del plazo fijado en la cl�usula 

CUARTA del presente contrato, �ste quedar� extinguido autom�ticamente sin obligaci�n de aviso previo 

o comunicaci�n alguna. EL EMPLEADOR sin perjuicio de lo indicado en las cl�usulas anteriores, podr� 

dar por terminado el presente contrato si EL (la) TRABAJADOR (A) incurre en alguna de las causales de 

despido conforme a las leyes vigentes.</p>

<p><strong>OCTAVA:</strong> EL (LA) TRABAJADOR (A), en cualquier momento, podr� dar por terminada la relaci�n laboral 

    en forma expresa, con la sola limitaci�n de presentar su carta de renuncia con 30 d�as de anticipaci�n.</p>

<p><strong>NOVENA:</strong> En todo lo no previsto en el presente contrato se aplicar� la Ley vigente de nuestro pa�s.

Estando de acuerdo en todo el contenido del presente contrato, firmamos en se�al de conformidad, en 

�a�a, Chosica, Lima, al <strong><? echo $list[$i][16];?></strong>.

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
