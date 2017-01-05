/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


 function Listar() {
            var a = $("#list");
            $.post("../../modulo", "opc=lis_pr_mod_x_id&" + "id_modulo=" + $("#selec_modulo").val(), function(objJson) {

                a.empty();
                var lista = objJson.lista;
                var nroe = 1;
                if (lista.length > 0) {
                    for (var i = 0; i < lista.length; i++) {
                        nroe = nroe + i;
                        a.append("<tr>");
                        a.append("<td align='center'>" + nroe + "</td>");
                        a.append("<td align='center'>" + lista[i].no_md + "</td>");
                        if (lista[i].es_md == '1') {
                            a.append("<td align='center'><p>ACTIVADO</p></td>");
                        } else {
                            a.append("<td align='center'><p>DESACTIVADO</p></td>");
                        }
                        a.append("<td><p>" + lista[i].no_pr + "</p></td>");
                        if (lista[i].es_pr == '1') {
                            a.append("<td align='center'><p>ACTIVADO</p></td>");
                        } else {
                            a.append("<td align='center'><p>DESACTIVADO</p></td>");
                        }
                        if (lista[i].id_md == 'MOD-0010') {
                            a.append('<td align="center"><button value=' + lista[i].id_pr + ' class="btn_activar" disabled="">Activar</button></td>');
                            a.append('<td align="center"><button value=' + lista[i].id_pr + ' class="btn_desactiva" disabled="">Desactivar</button></td>');
                        } else {
                            a.append("<td align='center'><button value=" + lista[i].id_pr + " class='btn_activar'>Activar</button></td>");
                            a.append("<td align='center'><button value=" + lista[i].id_pr + " class='btn_desactivar'>Desactivar</button></td>");
                        }
                        $(".btn_desactivar").click(
                                function() {
                                    $.post("../../modulo", "opc=desactivar_pri_mod&" + "id_privilegio=" + $(this).val(), function() {
                                        Listar();
                                    });

                                });
                        $(".btn_activar").click(
                                function() {
                                    $.post("../../modulo", "opc=activar_pri_mod&" + "id_pr=" + $(this).val(), function() {
                                        Listar();
                                    });
                                });
                        nroe = 1;
                    }
                } else {
                    a.append('<tr><td colspan="10" align="center">No tiene Privilegios</td></tr>');
                }

            });
        }

        $(document).ready(function() {
            list_modulo();
            list_Priv();
            //lerta_decir('asas');
            //list_Priv_mod();
            function list_modulo() {
                var mo = $("#selec_modulo");
                $.post("../../modulo", "opc=lis_mod", function(objJson) {
                    mo.empty();
                    var lista = objJson.lista;
                    mo.append("<option value''>[SELECCIONAR]</option>");
                    for (var i = 0; i <= lista.length; i++) {
                        mo.append("<option value='" + lista[i].id_mod + "' >" + lista[i].no_mod + "</option>");
                    }

                });
            }
            function list_Priv() {
                var mo = $("#selec_priv");
                $.post("../../modulo", "opc=lis_req", function(objJson) {
                    mo.empty();
                    var lista = objJson.lista;
                    mo.append("<option value=''>[SELECCIONAR]</option>");
                    for (var i = 0; i <= lista.length; i++) {
                        mo.append("<option value='" + lista[i].id_prv + "'>" + lista[i].no_prv + "</option>");
                    }
                });
            }

            $("#selec_modulo").change(
                    function() {
                        Listar();
                    });

            $("#btn_prv").click(
                    function() {
                        $.post("../../modulo", $(".form-modulo").serialize(), function(objJson) {
                            //alert(objJson.rpta);
                            //alert($(".form-modulo").serialize());
                            Listar();
                        });
                        return false;
                    });
        });