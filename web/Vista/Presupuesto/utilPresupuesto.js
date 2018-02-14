var iDestino;

function convertir_fecha(fecha) {
    var fi = fecha.split("-");
    var year = fi[0];
    var month = fi[1];
    var day = fi[2];
    var s = day + '/' + month + '/' + year;
    return s;
}

function createAlert(mensaje) {
    var s = '<div class="alert alert-info" role="alert">';
    s += '<i class="fa fa-info"></i>  ' + mensaje;
    s += '</div>';
    return s;
}

function listar_opciones(opc, id) {
    var ap = "";
    if (opc == 'Listar_direccion') {
        var a = $(".select_direccion");
        $(".select_dep").empty();
        $(".select_dep").append("<option value='' selected disabled>[Seleccione]</option>");
        $(".select_area").empty();
        $(".select_area").append("<option value='' selected disabled>[Seleccione]</option>");
        a.empty();
        a.append("<option value='0' selected disabled>[Seleccione]</option>");
    }
    if (opc == 'Listar_dir_dep') {
        var a = $(".select_dep");
        $(".select_area").empty();
        $(".select_area").append("<option value='' selected disabled>[Seleccione]</option>");
        ap = "&id=" + id;
        a.empty();
        a.append("<option value='0' selected disabled>[Seleccione]</option>");
    }
    if (opc == 'Listar_area2') {
        var a = $(".select_area");
        ap = "&id=" + id;
        $(".select_seccion").empty();
        $(".select_seccion").append("<option value='' selected disabled>[Seleccione]</option>");
        a.empty();
        a.append("<option value='0' selected disabled>[Seleccione]</option>");
    }
    if (opc === "Listar_sec2") {
        var a = $(".select_seccion");
        ap = "&id=" + id;
        $(".select_puesto").empty();
        $(".select_puesto").append("<option value='' selected disabled>[Seleccione]</option>");
        a.empty();
        a.append("<option value='0' selected disabled>[Seleccione]</option>");
    }
    if (opc === "Listar_pu_id") {
        var a = $(".select_puesto");
        ap = "&id=" + id;
        a.empty();
        a.append("<option value='0' selected disabled>[Seleccione]</option>");
    }
    $.post("../../Direccion_Puesto", "opc=" + opc + ap, function (objJson) {
        var list = objJson.lista;
        for (var i = 0; i < list.length; i++) {
            a.append("<option value='" + list[i].id + "'>" + list[i].nombre + "</option>");
        }
    });
}

function init() {
    var opc = 'Listar_direccion';
    var id = "";
    listar_opciones(opc, id);
    $(".select_direccion").change(function () {
        var opc = 'Listar_dir_dep';
        var id = $(".select_direccion").val();
        listar_opciones(opc, id);
    });
    $(".select_dep").change(function () {
        var opc = 'Listar_area2';
        var id = $(".select_dep").val();
        listar_opciones(opc, id);
        //$("#iDestino").attr("value", id);
        $("#iDestinoM").attr("value", $(".select_dep").val());
        $("#tipo_p").attr("value", 2);
        //statusPresupuesto(id);        
        //loadTemporada(id);
        listCCostos(id, 2);
    });
    $(".select_area").change(function () {
        var id = $(".select_area").val();
        var opc = 'Listar_sec2';
        listar_opciones(opc, id);
        $("#iDestino").attr("value", id);
        $("#iDestinoM").attr("value", $(".select_area").val());
        $("#tipo_p").attr("value", 1);
        //statusPresupuesto(id);
        //loadTemporada(id);
        listCCostos(id, 1);
    });
    $(".select_cc").change(function () {
        var id = $(".select_cc").val();
        $("#id_cc").attr("value", id);
    });
    $(".select_seccion").change(function () {
        var id = $(".select_seccion").val();
        var opc = 'Listar_pu_id';
        listar_opciones(opc, id);
        getPresupuestoDetails();
    });
    $(".select_puesto").change(function () {
        var id = $(".select_puesto").val();
        $("#ipuesto").attr("value", id);
        $(".cPuestoT").empty();
        $(".cPuestoT").append("<small>Puesto de : </small> <strong>" + $(".select_puesto option:selected").text() + "</strong>");
///////////////////////////////////////////////////////////////////////////////
        var objJson = listDetPuesto($(".select_puesto").val());
        if (objJson !== null) {
            if (objJson.detTPuesto.length > 0) {
                idDetPrePuesto=objJson.detTPuesto[0].id_det_pre_puesto;
                $(".bND").empty();
                $(".bND").append('<input type="number" name="sueldo" id="ntraD" class="form-control" value="' + objJson.detTPuesto[0].n_trabajadores + '"  placeholder="Número de trabajadores">');
                getInfoSueldo();
            } else {
                $("#ntraD").val(0);
            }
        } else {
            $.smallBox({
                title: "¡Oh no!",
                content: "<i>Nuestro trabajador metió la pata. Ocurrió un problema, talvez es mejor que recargues la página ;)</i><img width='400' src='../../img/sleeping_cat.jpg' alt='Sleeping Cat' >",
                color: "#FF7A7A",
                iconSmall: "fa fa-close fa-2x fadeInRight animated",
                timeout: 6000
            });
        }
    });
    $(".select_temporada").change(function () {
        var temp = $(".select_temporada").val();
        var t = temp.split("**");
        var id = t[0];
        var fecha_i = t[1];
        var fecha_f = t[2];
        var f_i = fecha_i.split(" ");
        var f_f = fecha_f.split(" ");
        $("#fe_f").attr("value", f_f[0]);
        $("#fe_i").attr("value", f_i[0]);
        $("#itemp").attr("value", id);
        /////////////////////////////////////////////////////////////////
        var idDestino = $("#iDestino").val();
        var c_c = $(".select_cc").val();
        var tip = $("#tipo_p").val();
        var temp = $(".select_temporada").val();
        if (idDestino !== "" && temp !== null) {
            var t = temp.split("**");
            statusPresupuesto(idDestino, c_c, tip, t[0]);
        } else {
            new PNotify({
                title: 'Incompleto',
                text: 'Los campos están incompletos',
                type: 'info'
            });
        }
    });
}

function helpDG() {
    new PNotify({
        title: 'Datos Generales',
        text: 'El presupuesto es destinado para un área,las temporadas se muestran dependiendo de la elección del área. El presupuesto del Departamento será la suma de los presupuestos de sus áreas',
        type: 'info'
    });
}
function helpCL() {
    new PNotify({
        title: 'Condición Laboral',
        text: 'Asigne un número de trabajadores máximo deacuerdo a su condición laboral y al tiempo de trabajo',
        type: 'info'
    });
}
function helpTP() {
    new PNotify({
        title: 'Trabajadores por Puesto',
        text: 'Este número será contabilizado del total antes presupuestado',
        type: 'info'
    });
}
function helpSM() {
    new PNotify({
        title: 'Asignación de Sueldo',
        text: 'La asignación será únicamente para el puesto que haya seleccionado',
        type: 'info'
    });
}

function oModal() {
    //conB
    var text;
    var a = $("#iDestinoM").val();
    if (a === null || a === undefined || a === "") {
        $(".bbst").attr("disabled", "");
        text = "No ha escogido un destino para esta temporada, puede ser un Departamento o un Área";
    } else {
        var t = a.split("**");
        text = "Temporada destinada para : <strong>" + t[1] + "</strong>";
        jQuery(".bbst").removeAttr("disabled");
    }
    $(".conB").empty();
    $(".conB").append(text);

    /*var opc = 'Listar_direccion';
     var id = "";
     listar_opcionesM(opc, id);
     $(".select_direccion_M").change(function () {
     var opc = 'Listar_dir_dep';
     var id = $(".select_direccion_M").val().split("**")[0];
     listar_opcionesM(opc, id);
     });
     $(".select_dep_M").change(function () {
     var opc = 'Listar_area2';
     var id = $(".select_dep_M").val().split("**")[0];
     listar_opcionesM(opc, id);
     $("#iDestinoM").attr("value", id);
     $("#tipo_pM").attr("value", 2);
     });
     $(".select_area_M").change(function () {
     var id = $(".select_area_M").val().split("**")[0];
     $("#iDestinoM").attr("value", id);
     $("#tipo_pM").attr("value", 1);
     });*/
}

function listar_opcionesM(opc, id) {
    var ap = "";
    if (opc == 'Listar_direccion') {
        var a = $(".select_direccion_M");
        $(".select_dep_M").empty();
        $(".select_dep_M").append("<option value='' selected disabled>[Seleccione]</option>");
        $(".select_area_M").empty();
        $(".select_area_M").append("<option value='' selected disabled>[Seleccione]</option>");
        a.empty();
        a.append("<option value='' selected disabled>[Seleccione]</option>");
    }
    if (opc == 'Listar_dir_dep') {
        var a = $(".select_dep_M");
        $(".select_area_M").empty();
        $(".select_area_M").append("<option value='' selected disabled>[Seleccione]</option>");
        ap = "&id=" + id;
        a.empty();
        a.append("<option value='' selected disabled>[Seleccione]</option>");
    }
    if (opc == 'Listar_area2') {
        var a = $(".select_area_M");
        ap = "&id=" + id;
        a.empty();
        a.append("<option value='' selected disabled>[Seleccione]</option>");
    }
    $.post("../../Direccion_Puesto", "opc=" + opc + ap, function (objJson) {
        var list = objJson.lista;
        for (var i = 0; i < list.length; i++) {
            a.append("<option value='" + list[i].id + "'>" + list[i].nombre + "</option>");
        }
    });
}