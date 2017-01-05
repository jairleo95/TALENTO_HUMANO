/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function toDouble() {
    var a = parseFloat($("#sueldo").val());
    alert(a);
}

function listar_opciones(opc, id) {
    if (opc == 'Listar_dir_dep') {
        var a = $(".selectdep");
        $(".selectarea").empty();
        $(".selectarea").append("<option value=''>[Seleccione]</option>");
        $(".selectsec").empty();
        $(".selectsec").append("<option value=''>[Seleccione]</option>");
        $(".selectpu").empty();
        $(".selectpu").append("<option value=''>[Seleccione]</option>");
    }
    if (opc == 'Listar_area2') {
        var a = $(".selectarea");
        $(".selectsec").empty();
        $(".selectsec").append("<option value=''>[Seleccione]</option>");
        $(".selectpu").empty();
        $(".selectpu").append("<option value=''>[Seleccione]</option>");
    }
    if (opc == 'Listar_sec2') {
        var a = $(".selectsec");
        $(".selectpu").empty();
        $(".selectpu").append("<option value=''>[Seleccione]</option>");
    }
    if (opc == 'Listar_pu_id') {
        var a = $(".selectpu");
    }
    $.post("../../Direccion_Puesto", "opc=" + opc.trim() + "&id=" + id.trim(), function (objJson) {
        var list = objJson.lista;
        a.empty();
        a.append("<option value=''>[Seleccione]</option>");
        for (var i = 0; i < list.length; i++) {
            a.append("<option value='" + list[i].id + "'>" + list[i].nombre + "</option>");
        }
        $(".tbodys").append();
    });
}
function buscar(del, al, nombre, dir, dep, area, sec, puesto, fe_i, fe_fi, ca_sueldo, fe_sus) {

    $.post("../../impresion_masiva?opc=filtrar" + "&desde=" + del + "&al=" + al + "&nom_ape=" + nombre + "&direccion=" + dir + "&departamento=" + dep + "&area=" + area + "&seccion=" + sec + "&puesto=" + puesto + "&fec_i=" + fe_i + "&fec_f=" + fe_fi + "&sueldo=" + ca_sueldo + "&fe_sus=" + fe_sus, function (objJson) {
        var list = objJson.lista;
        if (objJson.rpta == -1) {
            return;
        }
        var nuro = 1;
        if (list.length > 0) {
            $(".advice").attr("class", "col-md-12 advice hidden");
            var b = "";
            for (var i = 0; i < list.length; i++) {
                nuro = nuro + i;
                b += "<tr>";
                b += "<td style='font-family:arial;'>" + nuro + "</td>";
                b += "<td style='font-family:arial;'>" + list[i].nombre.toUpperCase();
                +"</td>";
                b += "<td style='font-family:arial;'>" + list[i].fe_de + "</td>";
                if (list[i].fe_ha != null) {
                    b += "<td style='font-family:arial;'>" + list[i].fe_ha + "</td>";
                } else {
                    b += "<td style='font-family:arial;'>indefinido</td>";
                }
                b += "<td style='font-family:arial;'>" + list[i].no_ar + "</td>";
                b += "<td style='font-family:arial;'>" + list[i].no_se + "</td>";
                b += "<td style='font-family:arial;'>" + list[i].no_pu + "</td>";
                b += "<td style='font-family:arial;'>" + list[i].ca_su + '</td>';
                b += "<td style='font-family:arial;'>" + list[i].fe_su + "</td>";
                b += '<td style="font-family:arial;"><a class="btn btn-success" href="../../contrato?opc=Detalle_Contractual&idtr=' + list[i].id_tr + '"><i class="glyphicon glyphicon-info-sign"></i>   Ver detalle</a> </td>';
                if (list[i].id_pl != null) {
                    b += '<td style="font-family:arial;"><center><input type="checkbox" class="cprint" id="imp" name="Imprimir" value="' + list[i].id_co + '/' + list[i].id_pl + '"></center></td>';
                } else {
                    b += '<td style="font-family:arial;"><center>No tiene</center></td>';
                }
                b += "</tr>";
                nuro = 1;
            }
            var table = createTable();
            $(".conTable").empty();
            $(".conTable").append(table);
            $(".tbodys").empty();
            $(".tbodys").append(b);
            if (list.length !== 0) {
                $("#asa").show();
            }
            /*$("#btns").click(
             function () {
             $("#gg :checkbox").attr('checked', true);
             $('#imp').is(':checked');
             alerta(checkboxValues.push($("#imp").val()));
             });*/
            /*$("#btns2").click(
             function () {
             var checkboxValues = new Array();
             //recorremos todos los checkbox seleccionados con .each
             $('input[name="orderBox[]"]:checked').each(function () {
             //$(this).val() es el valor del checkbox correspondiente
             checkboxValues.push($(this).val());
             alert(checkboxValues.push($(this).val()));
             });
             });*/
        } else {
            //mensaje cuando no hay datos
            $(".conTable").empty();
            $(".advice").attr("class", "col-md-12 advice");
        }
        $("#wait").css("display", "none");
    }
    );
}
function marcado() {
    if (document.form.termin.checked) {
        document.form.submit();
    } else {
        alert("Debes aceptar los términos y condiciones");
        document.form.termin.focus();
        return false;
    }

}
$(document).ready(function () {
    /* $.ajax({
     data:$("#frm_filtro2").serialize(),
     type:"POST",
     dataType:"json",
     url:"../../Ajax/Ajax_Dgp/Ajax_Dgp_Aut.jsp"
     
     }
     var b=$('#tbodys');
     });
     */
    $("#select_direccion").change(function () {
        var opc = 'Listar_dir_dep';
        var id = $("#select_direccion").val();
        listar_opciones(opc, id);
    });
    $("#select_dep").change(function () {
        var opc = 'Listar_area2';
        var id = $("#select_dep").val();
        listar_opciones(opc, id);
    });
    $("#select_area").change(function () {
        var opc = 'Listar_sec2';
        var id = $("#select_area").val();
        listar_opciones(opc, id);
    });
    $("#select_sec").change(function () {
        var opc = 'Listar_pu_id';
        var id = $("#select_sec").val();
        listar_opciones(opc, id);
    });
    $("#seleccionar_pl").hide();
    $("#asa").hide();
    $("#btnbuscar").click(
            function () {
                var del = $("#del").val();
                var al = $("#al").val();
                var nombre = $("#ap").val();
                var dir;
                var dep;
                var deps = $(".is_d_ses").val();
                if (deps.trim() == 'DPT-0019') {
                    dir = $("#select_direccion").val();
                    dep = $("#select_dep").val();
                } else {
                    dir = '';
                    dep = '';
                }
                var area = $("#select_area").val();
                var sec = $("#select_sec").val();
                var pu = $("#select_pu").val();
                var fe_i = $("#fe_i").val();
                var fe_f = $("#fe_fin").val();
                var sueldo = $("#sueldo").val();
                var fe_sus = $("#fe_sus").val();
                $("#wait").css("display", "block");
                //alert(del + al + nombre + dir + dep + area + sec + pu + fe_i + fe_f + sueldo)
                buscar(del, al, nombre, dir, dep, area, sec, pu, fe_i, fe_f, sueldo, fe_sus);
            }
    );
    /* $("#btnbuscar").click(
     function() {
     
     $.post("../../ajax/Ajax_Contrato/Ajax_Contrato.jsp", $("#frm_filtro2").serialize(), function(objJson) {
     alert( );
     }
     );
     
     }
     );*/
    $("#btncancel").click(
            function () {
                $(".conTable").empty();
                /*document.formulario.reset();
                 html = '<tr><td colspan="8" align="center">Haga la busqueda por algunos de los filtros...</td></tr>'
                 $(".tbodys").html(html);*/
            }

    );
    $(".validarform").submit(function () {
        var check = $("input[type='checkbox']:checked").length;
        var radio = $("input[type='radio']:checked").length;
        var select = $("select option:selected").val();
        if (check == "") {
                alert("seleccione un contrato");
                return false;
        }
    });
});
function createTable() {
    var t = '<table id="data"  class="table table-striped table-hover table-responsive">';
    t += '<thead class="tab_cabe" style="box-shadow: 0 0 20px 0 black;">';
    t += '<tr class="tr" >';
    t += '<th style="width:3%;"><center><h6>N°  </h6></center></th>';
    t += '<th><center><h6 title="NOM_APE"><i class="glyphicon glyphicon-user"></i>   Nombres y Apellidos</h6></center></th>';
    t += '<th><center><h6 title="FEC_DESDE"><i class="glyphicon glyphicon-calendar"></i>   Fecha Desde</h6></center></th>';
    t += '<th><center><h6 title="FEC_HASTA"><i class="glyphicon glyphicon-calendar"></i>   Fecha Hasta</h6></center></th>';
    t += '<th><center><h6 title="AREA"><i class="glyphicon glyphicon-record"></i>   Area</h6></center></th>';
    t += '<th><center><h6 title="SECCION"><i class="glyphicon glyphicon-adjust"></i>   Sección</h6></center></th>';
    t += '<th><center><h6 title="PUESTO"><i class="glyphicon glyphicon-briefcase"></i>   Puesto</h6></center></th>';
    t += '<th><center><h6 title="SUELDO"><i class="glyphicon glyphicon-usd"></i>   Sueldo</h6></center></th>';
    t += '<th><center><h6 title="FECHA_CREACION"><i class="glyphicon glyphicon-calendar"></i>   Fecha de Contratación</h6></center></th>';
    t += '<th><center><h6 ><i class="glyphicon glyphicon-info-sign"></i>   Opcion</h6></center></th>';
    t += '<th style="width:7%;"><button type="button" class="btn btn-warning" id="btns" onclick="select_all()"><i class="glyphicon glyphicon-check"></i></button>';
    t += '<button type="submit" name="opc" class="btn btn-info" id="asa" value="Imprimir" style="margin-left: 1%;"><i class="glyphicon glyphicon-print"></i></button></th>';
    t += '</tr>';
    t += '</thead>';
    t += '<tbody class="tbodys" id="gg" style="box-shadow: 0 0 10px 0 black;">';
    t += '</tbody>';
    t += '</table>';
    return t;
}
function select_all() {
    $(".cprint").attr('checked', true);
}
