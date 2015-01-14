<%-- 
    Document   : Reg_Formato_Horario
    Created on : 13/01/2015, 10:24:45 AM
    Author     : Alex
--%>
<%@page import="pe.edu.upeu.application.model.Formato_Horario"%>
<jsp:useBean id="LISTAR_FORMATO_HORARIO" scope="application" class="java.util.ArrayList" />
<!DOCTYPE html>
<html>
    <head>
        <meta charset="windows-1252">
        <title> FORMATO-HOARIO</title>
        <style>
            table{
                // display:block;
                position: static;
                float: left;
                border-style: solid;
                border-width: 5px;
                margin: 2px;
            }
            .input-desp{ 
                margin-top: 5%;
                width:100%;
                //height: 200px;
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
                //  float: start;
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
                //  height: 500px;
            }

        </style>

        <%
            String noFor = request.getParameter("nofor");
        %>

    </head>
    <body>
       
        <b><label><%=noFor%></label></b>
        <br> 
        <br> 
        <br> 
    <center>
        <form class="form" action="../../formato_horario" method="POST"> 
            

            <input type="hidden" name="NOMRBE"  value="<%=noFor%>"  >

            <div class="input-desp">
                <table style="" id="show_1" class="cont_lunes"> 
                    <tr><td align="center" colspan="2">Lunes</td></tr>
                    <tr class="tr-count">
                        <td>T1 :</td>
                        <%for (int i = 0; i < LISTAR_FORMATO_HORARIO.size(); i++) {
                                Formato_Horario fh = new Formato_Horario();
                                fh = (Formato_Horario) LISTAR_FORMATO_HORARIO.get(i);
                            }
                        %>
                        <td><input type="text"  id="HORA_DESDE_lun1" class="texto-h" value=""></td>      
                        <td><input type="text"  id="HORA_HASTA_lun1" class="texto-h" value=""></td>
                    </tr>                         
                    <tr class="tr-count">
                        <td>T2 :</td>
                        <td><input type="text"  id="HORA_DESDE_lun2" class="texto-h" ></td>           
                        <td ><input type="text" id="HORA_HASTA_lun2" class="texto-h" > </td>
                    </tr>      
                </table>

                <table id="show_2" class="cont_martes">     
                    <tr><td align="center" colspan="2">Martes</td></tr>
                    <tr class="tr-count_2">
                        <td>T1 :</td>
                        <td><input type="text" id="HORA_DESDE_mar1" class="texto-h" ></td>             
                        <td><input type="text" id="HORA_HASTA_mar1" class="texto-h" ></td></tr>         
                    <tr class="tr-count_2">
                        <td>T2 :</td>
                        <td><input type="text" name="HORA_DESDE_mar2" id="HORA_DESDE_mar2" class="texto-h" ></td>             
                        <td><input type="text" name="HORA_HASTA_mar2"  id="HORA_HASTA_mar2" class="texto-h" ></td></tr>         
                </table>

                <table id="show_3" class="cont_miercoles">     
                    <tr ><td align="center" colspan="2">Miercoles</td></tr>
                    <tr class="tr-count_3">
                        <td>T1 :</td>
                        <td><input type="text" id="HORA_DESDE_mier1" class="texto-h" ></td>           
                        <td><input type="text" id="HORA_HASTA_mier1" class="texto-h" ></td></tr>         
                    <tr class="tr-count_3">
                        <td>T2 :</td>
                        <td><input type="text" id="HORA_DESDE_mier2" class="texto-h" ></td>           
                        <td><input type="text" id="HORA_HASTA_mier2" class="texto-h" ></td></tr>         
                </table>


                <table id="show_4" class="cont_jueves">     
                    <tr><td align="center" colspan="2">Jueves</td></tr>
                    <tr class="tr-count_4">
                        <td>T1 :</td>
                        <td><input type="text" id="HORA_DESDE_jue1" class="texto-h" ></td>            
                        <td><input type="text" id="HORA_HASTA_jue1" class="texto-h" ></td></tr>         
                    <tr class="tr-count_4">
                        <td>T2 :</td><td>
                            <input type="text" id="HORA_DESDE_jue2" class="texto-h" ></td>          
                        <td><input type="text" id="HORA_HASTA_jue2" class="texto-h" ><a href="#" id="remove_4">-</a></td></tr>         
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
                
                <table id="show_6" class="cont_domingo" >
                    <tr><td align="center" colspan="2">Domingo</td></tr>
                    <tr class="tr-count_6"><td>T1 :</td><td><input type="text" name="HORA_DESDE_dom1"  id="HORA_DESDE_dom1" class="texto-h" ></td>
                        <td><input type="text" name="HORA_HASTA_dom1"  id="HORA_HASTA_dom1" class="texto-h" ></td></tr>         
                    <input type="hidden" name="DIA_dom1" value="dom" class="texto-h" >                    
                    <input type="hidden" name="TURNO_dom1" value="T1" >


                    <tr class="tr-count_6"><td>T2 :</td><td><input type="text" name="HORA_DESDE_dom2"  id="HORA_DESDE_dom2" class="texto-h" ></td>
                        <td><input type="text" name="HORA_HASTA_dom2"  id="HORA_HASTA_dom2" class="texto-h" ><a href="#" id="remove_6">-</a></td></tr>         
                    <input type="hidden" name="DIA_dom2" value="dom" class="texto-h" >                    
                    <input type="hidden" name="TURNO_dom2" value="T2" >
                    <tr><td colspan="2"><a href="#" id="add_6">+</a></td></tr>
                </table>
            </div>
        </form>
    </center>
    <br><br>

</body>

<script language="javascript" type="text/javascript">
    $(document).ready(
            function mostrar() {
                $(".cont_lunes").hide();
                $(".cont_martes").hide();
                $(".cont_miercoles").hide();
                $(".cont_jueves").hide();
                $(".cont_viernes").hide();
                $(".cont_domingo").hide();

                $("#lunes").change(
                        function() {
                            if ($(this).val() == 1) {
                                $("#show_1").show();
                            }
                            if ($(this).val() == 2) {
                                $(".cont_lunes").hide();
                                $("#show_1 input").val("");
                            }
                        }
                );

                $("#martes").change(
                        function() {
                            if ($(this).val() == 1) {
                                $("#show_2").show();
                            }
                            if ($(this).val() == 2) {
                                $(".cont_martes").hide();
                                $("#show_2 input").val("");
                            }
                        }
                );
                $("#miercoles").change(
                        function() {
                            if ($(this).val() == 1) {
                                $("#show_3").show();
                            }
                            if ($(this).val() == 2) {
                                $(".cont_miercoles").hide();
                                $("#show_1 input").val("");
                            }
                        }
                );
                $("#jueves").change(
                        function() {
                            if ($(this).val() == 1) {
                                $("#show_4").show();
                            }
                            if ($(this).val() == 2) {
                                $(".cont_jueves").hide();
                                $("#show_1 input").val("");
                            }
                        }
                );
                $("#viernes").change(
                        function() {
                            if ($(this).val() == 1) {
                                $("#show_5").show();
                            }
                            if ($(this).val() == 2) {
                                $(".cont_viernes").hide();
                                $("#show_1 input").val("");
                            }
                        }
                );
                $("#domingo").change(
                        function() {
                            if ($(this).val() == 1) {
                                $("#show_6").show();
                            }
                            if ($(this).val() == 2) {
                                $(".cont_domingo").hide();
                                $("#show_1 input").val("");
                            }
                        }
                );


            }

    );

</script>

<script type="text/javascript">
    $(function() {
        var scntDiv = $('#show_1');
        var i = $('#show_1 .texto-h').size() + 1;
        var s = $('#show_1 .tr-count').size() + 1;

        $('#addScnt').live('click', function() {

            $('<tr><td>T' + s + ' :</td><td><input type="text"   name="HORA_DESDE_lun' + i + '" value="" placeholder="" /></td><td><input type="text"  size="20" name="HORA_HASTA_lun' + i + '" value="" placeholder=" " /><input type="hidden" name="DIA_lun' + i + '" value="lun" ><input type="hidden" name="TURNO_lun' + i + '" value="T'+i-2+'" > <a href="#" id="remScnt">-</a></td></tr>').appendTo(scntDiv);

            i++;
            s++;
            return false;
        });
        $('#remScnt').live('click', function() {
            if (i > 2) {
                $(this).parents('tr').remove();
                //  $("#tr-d").remove();           
                i--;
                s--;
            }
            return false;
        });
    });

    //MARTES
    $(function() {
        var scntDiv = $('#show_2');
        var i = $('#show_2 .texto-h').size() + 1;
        var s = $('#show_2 .tr-count_2').size() + 1;

        $('#add_2').live('click', function() {

            $('<tr><td>T' + s + ' :</td><td><input type="text"  name="HORA_DESDE_mar' + i + '" value="" placeholder="" /></td><td><input type="text"  size="20" name="HORA_HASTA_mar' + i + '" value="" placeholder=" " /><input type="hidden" name="DIA_mar' + i + '" value="mar" ><input type="hidden" name="USER_CREACION_mar' + i + '"> <a href="#" id="remove_2">-</a></td></tr>').appendTo(scntDiv);

            i++;
            s++;
            return false;
        });
        $('#remove_2').live('click', function() {
            if (i > 2) {
                $(this).parents('tr').remove();
                //  $("#tr-d").remove();           
                i--;
                s--;
            }
            return false;
        });
    });
    //MIERCOLES
    $(function() {
        var scntDiv = $('#show_3');
        var i = $('#show_3 .texto-h').size() + 1;
        var s = $('#show_3 .tr-count_3').size() + 1;

        $('#add_3').live('click', function() {

            $('<tr><td>T' + s + ' :</td><td><input type="text"  name="HORA_DESDE_mie' + i + '" value="" placeholder="" /></td><td><input type="text"  size="20" name="HORA_HASTA_mie' + i + '" value="" placeholder=" " /><input type="hidden" name="DIA_mie' + i + '" value="mie" ><input type="hidden" name="USER_CREACION_mie' + i + '"> <a href="#" id="remove_3">-</a></td></tr>').appendTo(scntDiv);

            i++;
            s++;
            return false;
        });
        $('#remove_3').live('click', function() {
            if (i > 2) {
                $(this).parents('tr').remove();
                //  $("#tr-d").remove();           
                i--;
                s--;
            }
            return false;
        });
    });
    //JUEVES
    $(function() {
        var scntDiv = $('#show_4');
        var i = $('#show_4 .texto-h').size() + 1;
        var s = $('#show_4 .tr-count_4').size() + 1;

        $('#add_4').live('click', function() {

            $('<tr><td>T' + s + ' :</td><td><input type="text"  name="HORA_DESDE_jue' + i + '" value="" placeholder="" /></td><td><input type="text"  size="20" name="HORA_HASTA_jue' + i + '" value="" placeholder=" " /><input type="hidden" name="DIA_jue' + i + '" value="jue" ><input type="hidden" name="USER_CREACION_jue' + i + '"> <a href="#" id="remove_4">-</a></td></tr>').appendTo(scntDiv);

            i++;
            s++;
            return false;
        });
        $('#remove_4').live('click', function() {
            if (i > 2) {
                $(this).parents('tr').remove();
                //  $("#tr-d").remove();           
                i--;
                s--;
            }
            return false;
        });
    });
    //VIERNES
    $(function() {
        var scntDiv = $('#show_5');
        var i = $('#show_5 .texto-h').size() + 1;
        var s = $('#show_5 .tr-count_5').size() + 1;

        $('#add_5').live('click', function() {

            $('<tr><td>T' + s + ' :</td><td><input type="text"  name="HORA_DESDE_vie' + i + '" value="" placeholder="" /></td><td><input type="text"  size="20" name="HORA_HASTA_vie' + i + '" value="" placeholder=" " /><input type="hidden" name="DIA_vie' + i + '" value="vie" ><input type="hidden" name="USER_CREACION_vie' + i + '"> <a href="#" id="remove_5">-</a></td></tr>').appendTo(scntDiv);

            i++;
            s++;
            return false;
        });
        $('#remove_5').live('click', function() {
            if (i > 2) {
                $(this).parents('tr').remove();
                //  $("#tr-d").remove();           
                i--;
                s--;
            }
            return false;
        });
    });
    //DOMINGO
    $(function() {
        var scntDiv = $('#show_6');
        var i = $('#show_6 .texto-h').size() + 1;
        var s = $('#show_6 .tr-count_6').size() + 1;

        $('#add_6').live('click', function() {

            $('<tr><td>T' + s + ' :</td><td><input type="text"  name="HORA_DESDE_dom' + i + '" value="" placeholder="" /></td><td><input type="text"  size="20" name="HORA_HASTA_dom' + i + '" value="" placeholder=" " /><input type="hidden" name="DIA_dom' + i + '" value="dom" ><input type="hidden" name="USER_CREACION_dom' + i + '"> <a href="#" id="remove_6">-</a></td></tr>').appendTo(scntDiv);

            i++;
            s++;
            return false;
        });
        $('#remove_6').live('click', function() {
            if (i > 2) {
                $(this).parents('tr').remove();
                //  $("#tr-d").remove();           
                i--;
                s--;
            }
            return false;
        });
    });

</script>

</html>
