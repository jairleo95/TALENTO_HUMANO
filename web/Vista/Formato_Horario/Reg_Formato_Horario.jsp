<%@page import="pe.edu.upeu.application.properties.globalProperties"%>
<%@page import="pe.edu.upeu.application.model.Usuario"%>
<%
    HttpSession sesion_1 = request.getSession();
    String id_user_1 = (String) sesion_1.getAttribute("IDUSER");
    if (id_user_1 != null) {
%>
<%-- 
    Document   : Reg_Formato_Horario
    Created on : 13/01/2015, 10:24:45 AM
    Author     : Alex
--%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="windows-1252">
        <title>REGISTRO FORMATO-HOARIO</title>
        <style>
            table{
                /*// display:block;*/
                position: static;
                float: left;
                border-style: solid;
                border-width: 5px;
                margin: 2px;
            }
            .input-desp{ 
                margin-top: 5%;
                width:100%;
                /*  //height: 200px;*/
                position: static;
                float: left;
                border-color: #F2F2F2;
                border-style: solid;
                border-width: 5px;
            }
            .tab-horario{
                margin: 0;
                position: static;
                float: left;
                /* //  float: start;*/
            }
            input{
                position: static;
                float: left;
                width: 40px;
            }
            .submit{
                position: static;
                float: left;
                margin-top: 5%;
                width:200px; 

            }
            label{
                color: F2F2F2;
            }

            * { font-family:Arial; }
            h2 { padding:0 0 5px 5px; }
            h2 a { color: #224f99; }
            a { color:#999; text-decoration: none; }
            a:hover { color:#802727; }
            p { padding:0 0 5px 0; }
            input { padding:5px; border:1px solid #999; border-radius:4px; -moz-border-radius:4px; -web-kit-border-radius:4px; -khtml-border-radius:4px; }
            body{
                /*  //  height: 500px;*/
            }

        </style>
        <script language="javascript" type="text/javascript" src="../../js/jquery-1.3.2.min.js"></script>

        <%
            String idth = request.getParameter("idth");
            String noFor = request.getParameter("nofor");
        %>

    </head>
    <body>
        <b><label><%=noFor%></label></b>

    <center>
        <form class="form" action="../../formato_horario" method="POST"> 
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
                    <td><label class="title">SABADO</label>
                        <select id="sabado" >

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
            <input type="hidden" name="IDTIPOHORARIO"  value="<%=idth%>"  >
            <input type="hidden" name="NOMRBE"  value="<%=noFor%>"  >
            <input type="hidden" name="ESTADO"  value="1"  >

            <div class="input-desp">
                <table style="" id="show_1" class="cont_lunes"> 
                    <tr><td align="center" colspan="2">Lunes</td></tr>
                    <tr class="tr-count">
                        <td>T1 :</td>
                        <td><input type="text" name="HORA_DESDE_lun1" id="HORA_DESDE_lun1" class="texto-h" ></td>      
                        <td><input type="text" name="HORA_HASTA_lun1" id="HORA_HASTA_lun1" class="texto-h" ></td>
                    </tr>         
                    <input type="hidden" name="DIA_lun1" value="lun" >                    
                    <input type="hidden" name="TURNO_lun1" value="T1" >                    

                    <tr class="tr-count">
                        <td>T2 :</td>
                        <td><input type="text" name="HORA_DESDE_lun2" id="HORA_DESDE_lun2" class="texto-h" ></td>           
                        <td ><input type="text" name="HORA_HASTA_lun2" id="HORA_HASTA_lun2" class="texto-h" > <a href="#" id="remove_1">-</a></td>
                    </tr>      
                    <input type="hidden" name="DIA_lun2" value="lun" >
                    <input type="hidden" name="TURNO_lun2" value="T2" > 
                    <tr><td colspan="2"><a href="#" id="add_1">+</a></td></tr>
                </table>

                <table id="show_2" class="cont_martes">     
                    <tr><td align="center" colspan="2">Martes</td></tr>
                    <tr class="tr-count_2">
                        <td>T1 :</td>
                        <td><input type="text" name="HORA_DESDE_mar1" id="HORA_DESDE_mar1" class="texto-h" ></td>             
                        <td><input type="text" name="HORA_HASTA_mar1" id="HORA_HASTA_mar1" class="texto-h" ></td></tr>         
                    <input type="hidden" name="DIA_mar1" value="mar" class="texto-h" > 
                    <input type="hidden" name="TURNO_mar1" value="T1" >

                    <tr class="tr-count_2">
                        <td>T2 :</td>
                        <td><input type="text" name="HORA_DESDE_mar2" id="HORA_DESDE_mar2" class="texto-h" ></td>             
                        <td><input type="text" name="HORA_HASTA_mar2"  id="HORA_HASTA_mar2" class="texto-h" ><a href="#" id="remove_2">-</a></td></tr>         
                    <input type="hidden" name="DIA_mar2" value="mar" class="texto-h">
                    <input type="hidden" name="TURNO_mar2" value="T2" >
                    <tr><td colspan="2"><a href="#" id="add_2">+</a></td></tr>

                </table>

                <table id="show_3" class="cont_miercoles">     
                    <tr ><td align="center" colspan="2">Miercoles</td></tr>
                    <tr class="tr-count_3">
                        <td>T1 :</td>
                        <td><input type="text" name="HORA_DESDE_mie1" id="HORA_DESDE_mier1" class="texto-h" ></td>           
                        <td><input type="text" name="HORA_HASTA_mie1" id="HORA_HASTA_mier1" class="texto-h" ></td></tr>         
                    <input type="hidden" name="DIA_mie1" value="mie" class="texto-h" >                    
                    <input type="hidden" name="TURNO_mie1" value="T1" >

                    <tr class="tr-count_3">
                        <td>T2 :</td>
                        <td><input type="text" name="HORA_DESDE_mie2" id="HORA_DESDE_mier2" class="texto-h" ></td>           
                        <td><input type="text" name="HORA_HASTA_mie2" id="HORA_HASTA_mier2" class="texto-h" ><a href="#" id="remove_3">-</a></td></tr>         
                    <input type="hidden" name="DIA_mie2" value="mie" class="texto-h" >                    
                    <input type="hidden" name="TURNO_mie2" value="T2" >
                    <tr><td colspan="2"><a href="#" id="add_3">+</a></td></tr>
                </table>


                <table id="show_4" class="cont_jueves">     
                    <tr><td align="center" colspan="2">Jueves</td></tr>
                    <tr class="tr-count_4">
                        <td>T1 :</td>
                        <td><input type="text" name="HORA_DESDE_jue1" id="HORA_DESDE_jue1" class="texto-h" ></td>            
                        <td><input type="text" name="HORA_HASTA_jue1" id="HORA_HASTA_jue1" class="texto-h" ></td></tr>         
                    <input type="hidden" name="DIA_jue1" value="jue" class="texto-h" >
                    <input type="hidden" name="TURNO_jue1" value="T1" >

                    <tr class="tr-count_4">
                        <td>T2 :</td><td>
                            <input type="text" name="HORA_DESDE_jue2" id="HORA_DESDE_jue2" class="texto-h" ></td>          
                        <td><input type="text" name="HORA_HASTA_jue2" id="HORA_HASTA_jue2" class="texto-h" ><a href="#" id="remove_4">-</a></td></tr>         
                    <input type="hidden" name="DIA_jue2" value="jue" class="texto-h" >
                    <input type="hidden" name="TURNO_jue2" value="T2" >
                    <tr><td colspan="2"><a href="#" id="add_4">+</a></td></tr>
                </table>


                <table id="show_5" class="cont_viernes">     
                    <tr><td align="center" colspan="2">Viernes</td></tr>
                    <tr class="tr-count_5">
                        <td>T1 :</td>
                        <td><input type="text" name="HORA_DESDE_vie1"  id="HORA_DESDE_vie1" class="texto-h" ></td>
                        <td><input type="text" name="HORA_HASTA_vie1" id="HORA_HASTA_vie1" class="texto-h" ></td></tr>         
                    <input type="hidden" name="DIA_vie1" value="vie" class="texto-h" >   
                    <input type="hidden" name="TURNO_vie1" value="T1" >
                    <tr><td colspan="2"><a href="#" id="add_5">+</a></td></tr>
                </table>

                <table id="show_6" class="cont_sabado">     
                    <tr><td align="center" colspan="2">Sabado</td></tr>
                    <tr class="tr-count_6">
                        <td>T2 :</td><td>
                            <input type="text" name="HORA_DESDE_sab1" id="HORA_DESDE_sab2" class="texto-h" ></td>          
                        <td><input type="text" name="HORA_HASTA_sab1" id="HORA_HASTA_sab2" class="texto-h" ></tr>         
                    <input type="hidden" name="DIA_sab1" value="sab" class="texto-h" >
                    <input type="hidden" name="TURNO_sab1" value="T1" >
                    <tr><td colspan="2"><a href="#" id="add_6">+</a></td></tr>
                </table>

                <table id="show_7" class="cont_domingo" >
                    <tr><td align="center" colspan="2">Domingo</td></tr>
                    <tr class="tr-count_7"><td>T1 :</td><td><input type="text" name="HORA_DESDE_dom1"  id="HORA_DESDE_dom1" class="texto-h" ></td>
                        <td><input type="text" name="HORA_HASTA_dom1"  id="HORA_HASTA_dom1" class="texto-h" ></td></tr>         
                    <input type="hidden" name="DIA_dom1" value="dom" class="texto-h" >                    
                    <input type="hidden" name="TURNO_dom1" value="T1" >


                    <tr class="tr-count_6"><td>T2 :</td><td><input type="text" name="HORA_DESDE_dom2"  id="HORA_DESDE_dom2" class="texto-h" ></td>
                        <td><input type="text" name="HORA_HASTA_dom2"  id="HORA_HASTA_dom2" class="texto-h" ><a href="#" id="remove_7">-</a></td></tr>         
                    <input type="hidden" name="DIA_dom2" value="dom" class="texto-h" >                    
                    <input type="hidden" name="TURNO_dom2" value="T2" >
                    <tr><td colspan="2"><a href="#" id="add_7">+</a></td></tr>
                </table>
            </div>
            <br>
            <input type="submit" name="opc" onclick="enviar()"   class="submit" value="REGISTRAR_FOR_HORARIO">
        </form>
    </center>
    <br><br>

</body>
<script src="../../js/businessLogic/Horario/regFormatoHorario.js?v=<%=globalProperties.VERSION_JS%>" type="text/javascript"></script>

</html>

<%} else {
        out.print("<script> window.parent.location.href = '/TALENTO_HUMANO/';</script>");
    }
%>
