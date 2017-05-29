<%@page import="pe.edu.upeu.application.properties.globalProperties"%>
<%@page import="pe.edu.upeu.application.model.Usuario"%>
<%
    HttpSession sesion = request.getSession();
    String id_user = (String) sesion.getAttribute("IDUSER");
    if (id_user != null) {
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="windows-1252">
        <title>Registro de Horario</title>
        <link href="../../../css/businessLogic/Horario/regHorario.css" rel="stylesheet" type="text/css"/>
        <script language="javascript" type="text/javascript" src="../../../js/jquery-1.3.2.min.js"></script>

        <%
            String idtr = request.getParameter("idtr");
            String iddgp = request.getParameter("iddgp");

        %>

    </head>
    <body>
        <select id="horario" >
            <option value="0">Editable</option>
            <option value="1">Horario Tiempo Completo</option>
        </select>
    <center>
        <form class="form" action="../../../horario" method="POST"> 
            <table class="tab-horario">
                <tr>
                    <td> <label class="title">LUNES</label>
                        <select id="lunes" >

                            <option value="1">Habilitado</option>
                            <option value="2" selected="">Deshabilitado</option>
                        </select></td>

                    <td><label class="title">MARTES</label>
                        <select id="martes" >

                            <option value="1">Habilitado</option>
                            <option value="2" selected="">Deshabilitado</option>
                        </select></td>

                    <td>
                        <label class="title">MIERCOLES</label>
                        <select id="miercoles"  >

                            <option value="1">Habilitado</option>
                            <option value="2" selected="">Deshabilitado</option>
                        </select>
                    </td>

                    <td>
                        <label class="title">JUEVES</label>
                        <select id="jueves" >

                            <option value="1">Habilitado</option>
                            <option value="2" selected="">Deshabilitado</option>
                        </select> 
                    </td>

                    <td>
                        <label class="title">VIERNES</label>
                        <select id="viernes"  >

                            <option value="1">Habilitado</option>
                            <option value="2" selected="">Deshabilitado</option>
                        </select>

                    </td>
                    <td><label class="title">DOMINGO</label>
                        <select id="domingo" >

                            <option value="1">Habilitado</option>
                            <option value="2" selected="">Deshabilitado</option>
                        </select>
                    </td>
                </tr>
            </table>
            <br>
            <br>
            <input type="hidden" name="IDDETALLE_DGP"  value="<%=iddgp%>"  >
            <input type="hidden" name="idtr"  value="<%=idtr%>"  >

            <div class="input-desp">
                <table style="" id="show_1" class="cont_lunes"> 
                    <tr><td align="center" colspan="2">Lunes</td></tr>
                    <tr class="tr-count"><td>T1 :</td><td><input type="text" name="HORA_DESDE_lun1" id="HORA_DESDE_lun1" class="texto-h" ></td>      
                        <td><input type="text" name="HORA_HASTA_lun1" id="HORA_HASTA_lun1" class="texto-h" ></td></tr>         
                    <input type="hidden" name="DIA_lun1" value="lun" >                    
                    <input type="hidden" name="USER_CREACION_lun1"  >   

                    <tr class="tr-count"><td>T2 :</td><td><input type="text" name="HORA_DESDE_lun2" id="HORA_DESDE_lun2" class="texto-h" ></td>           
                        <td ><input type="text" name="HORA_HASTA_lun2" id="HORA_HASTA_lun2" class="texto-h" ><a href="#" id="remScnt">-</a></td></tr>      
                    <input type="hidden" name="DIA_lun2" value="lun" >                    

                    <input type="hidden" name="USER_CREACION_lun2"  >   


                    <tr><td colspan="2"><a href="#" id="addScnt">+</a></td></tr>

                </table>

                <table id="show_2" class="cont_martes">     
                    <tr><td align="center" colspan="2">Martes</td></tr>
                    <tr class="tr-count_2"><td>T1 :</td><td><input type="text" name="HORA_DESDE_mar1" id="HORA_DESDE_mar1" class="texto-h" ></td>             
                        <td><input type="text" name="HORA_HASTA_mar1" id="HORA_HASTA_mar1" class="texto-h" ></td></tr>         
                    <input type="hidden" name="DIA_mar1" value="mar" class="texto-h" >                    


                    <input type="hidden" name="USER_CREACION_mar1" class="texto-h" >   

                    <tr class="tr-count_2"><td>T2 :</td><td><input type="text" name="HORA_DESDE_mar2" id="HORA_DESDE_mar2" class="texto-h" ></td>             
                        <td><input type="text" name="HORA_HASTA_mar2"  id="HORA_HASTA_mar2" class="texto-h" ><a href="#" id="remove_2">-</a></td></tr>         
                    <input type="hidden" name="DIA_mar2" value="mar" class="texto-h">    

                    <tr><td colspan="2"><a href="#" id="add_2">+</a></td></tr>

                    <input type="hidden" name="USER_CREACION_mar2" class="texto-h" >   




                </table>




                <table id="show_3" class="cont_miercoles">     
                    <tr ><td align="center" colspan="2">Miercoles</td></tr>
                    <tr class="tr-count_3"><td>T1 :</td><td><input type="text" name="HORA_DESDE_mie1" id="HORA_DESDE_mier1" class="texto-h" ></td>           
                        <td><input type="text" name="HORA_HASTA_mie1" id="HORA_HASTA_mier1" class="texto-h" ></td></tr>         
                    <input type="hidden" name="DIA_mie1" value="mie" class="texto-h" >                    


                    <input type="hidden" name="USER_CREACION_mie1" class="texto-h" >   

                    <tr class="tr-count_3"><td>T2 :</td><td><input type="text" name="HORA_DESDE_mie2" id="HORA_DESDE_mier2" class="texto-h" ></td>           
                        <td><input type="text" name="HORA_HASTA_mie2" id="HORA_HASTA_mier2" class="texto-h" ><a href="#" id="remove_3">-</a></td></tr>         
                    <input type="hidden" name="DIA_mie2" value="mie" class="texto-h" >                    


                    <input type="hidden" name="USER_CREACION_mie2" class="texto-h" >   

                    <tr><td colspan="2"><a href="#" id="add_3">+</a></td></tr>
                </table>


                <table id="show_4" class="cont_jueves">     
                    <tr><td align="center" colspan="2">Jueves</td></tr>
                    <tr class="tr-count_4"><td>T1 :</td><td><input type="text" name="HORA_DESDE_jue1" id="HORA_DESDE_jue1" class="texto-h" ></td>            
                        <td><input type="text" name="HORA_HASTA_jue1" id="HORA_HASTA_jue1" class="texto-h" ></td></tr>         
                    <input type="hidden" name="DIA_jue1" value="jue" class="texto-h" >                    


                    <input type="hidden" name="USER_CREACION_jue1" class="texto-h" >   

                    <tr class="tr-count_4"><td>T2 :</td><td><input type="text" name="HORA_DESDE_jue2" id="HORA_DESDE_jue2" class="texto-h" ></td>          
                        <td><input type="text" name="HORA_HASTA_jue2" id="HORA_HASTA_jue2" class="texto-h" ><a href="#" id="remove_4">-</a></td></tr>         
                    <input type="hidden" name="DIA_jue2" value="jue" class="texto-h" >                    


                    <input type="hidden" name="USER_CREACION_jue2" class="texto-h" >   
                    <tr><td colspan="2"><a href="#" id="add_4">+</a></td></tr>
                </table>


                <table id="show_5" class="cont_viernes">     
                    <tr><td align="center" colspan="2">Viernes</td></tr>
                    <tr class="tr-count_5"><td>T1 :</td><td><input type="text" name="HORA_DESDE_vie1"  id="HORA_DESDE_vie1" class="texto-h" ></td>
                        <td><input type="text" name="HORA_HASTA_vie1" id="HORA_HASTA_vie1" class="texto-h" ></td></tr>         
                    <input type="hidden" name="DIA_vie1" value="vie" class="texto-h" >                    
                    <input type="hidden" name="USER_CREACION_vie1" class="texto-h" >   
                    <tr><td colspan="2"><a href="#" id="add_5">+</a></td></tr>
                </table>
                <table id="show_6" class="cont_domingo" >
                    <tr><td align="center" colspan="2">Domingo</td></tr>
                    <tr class="tr-count_6"><td>T1 :</td><td><input type="text" name="HORA_DESDE_dom1"  id="HORA_DESDE_dom1" class="texto-h" ></td>
                        <td><input type="text" name="HORA_HASTA_dom1"  id="HORA_HASTA_dom1" class="texto-h" ></td></tr>         
                    <input type="hidden" name="DIA_dom1" value="dom" class="texto-h" >                    


                    <input type="hidden" name="USER_CREACION_dom1" class="texto-h" >   

                    <tr class="tr-count_6"><td>T2 :</td><td><input type="text" name="HORA_DESDE_dom2"  id="HORA_DESDE_dom2" class="texto-h" ></td>
                        <td><input type="text" name="HORA_HASTA_dom2"  id="HORA_HASTA_dom2" class="texto-h" ><a href="#" id="remove_6">-</a></td></tr>         
                    <input type="hidden" name="DIA_dom2" value="dom" class="texto-h" >                    

                    <tr><td colspan="2"><a href="#" id="add_6">+</a></td></tr>
                    <input type="hidden" name="USER_CREACION_dom2" class="texto-h" >   
                </table>
            </div>
            <br>
            <input type="submit" name="opc" onclick="enviar()"   class="submit" value="REGISTRAR HORARIO">
        </form>
    </center>
    <br><br>

    <script src="../../../js/businessLogic/Horario/regHorario.js?v=<%=globalProperties.VERSION_JS%>" type="text/javascript"></script>
</body>
 

</html>
<%} else {
        out.print("<script> window.parent.location.href = '/TALENTO_HUMANO/';</script>");
    }
%>