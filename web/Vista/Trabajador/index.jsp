
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>COMBOS ANIDADOS</title>
    </head>
    <body>
        <h1>COMBOS ANIDADOS</h1>
        <form id="form">

            <label>Regimen</label><br/>
            <select id="rg">
                <option value=""></option>
                <option value="1">Publica</option>
                <option value="2">Privada</option>
            </select>
            <br/>
            <label>Tipo Institucion</label><br/>
            <select id="ti_inst">
                <option value=""></option>
            </select>
            <br/>
            <label>Institucion</label><br/>
       <select id="inst">
            </select><br/>
        
            <br/>
            <label>Carrera</label>
            <br/>
            <select id="carrera">
            </select><br/>
        </form>
    </body>
    <script type="text/javascript" src="../../js/JQuery/jQuery.js"></script>
    <script type="text/javascript">
        $("#rg").change(function() {
            var ti = $("#ti_inst");
            ti.empty();
            var rg = $("#rg").val();
            var data = "regimen=" + rg+"&opc=ti_inst";

            ti.append('<option value="">Cargando...</option>').val('');
            $.post("../../carrera_universidad", data, function(objJson) {
                ti.empty();
                if (objJson.rpta == -1) {
                    alert(objJson.mensaje);
                    return;
                }
                var lista = objJson.lista;
                if (lista.length > 0) {
                    ti.append("<option value='0'>[Seleccione]</option>");
                } else {
                    ti.append("<option value='0'>[No hay cuentas]</option>");
                }
                for (var i = 0; i < lista.length; i++) {
                    var item = "<option value='" + lista[i].id + "'>" + lista[i].descripcion + "</option>";
                    ti.append(item);
                }
            });
        });


        $("#ti_inst").change(function() {
            var cboCuenta = $("#inst");
            cboCuenta.empty();
            var sucursal = $("#ti_inst").val();
            /* if (sucursal == '000') {
             return;
             }*/
            var data = "sucursal=" + sucursal+"&opc=institucion";
            cboCuenta.append('<option value="">Cargando...</option>').val('');
            $.post("../../carrera_universidad", data, function(objJson) {
                cboCuenta.empty();
                if (objJson.rpta == -1) {
                    alert(objJson.mensaje);
                    return;
                }
                var lista = objJson.lista;
                if (lista.length > 0) {
                    cboCuenta.append("<option value='0'>[Seleccione]</option>");
                } else {
                    cboCuenta.append("<option value='0'>[No hay cuentas]</option>");
                }
                for (var i = 0; i < lista.length; i++) {
                    var item = "<option value='" + lista[i].id + "'>" + lista[i].descripcion + "</option>";
                    cboCuenta.append(item);
                }
            });
        });
        $("#inst").change(function() {
            var cboCuenta = $("#carrera");
            cboCuenta.empty();
            var sucursal = $("#inst").val();
            /* if (sucursal == '000') {
             return;
             }*/
            var data = "inst=" + sucursal+"&opc=carrera";
            cboCuenta.append('<option value="">Cargando...</option>').val('');
            $.post("../../carrera_universidad", data, function(objJson) {
                cboCuenta.empty();
                if (objJson.rpta == -1) {
                    alert(objJson.mensaje);
                    return;
                }
                var lista = objJson.lista;
                if (lista.length > 0) {
                    cboCuenta.append("<option value='0'>[Seleccione]</option>");
                } else {
                    cboCuenta.append("<option value='0'>[No hay cuentas]</option>");
                }
                for (var i = 0; i < lista.length; i++) {
                    var item = "<option value='" + lista[i].id + "'>" + lista[i].descripcion + "</option>";
                    cboCuenta.append(item);
                }
            });
        });
        /*$("#cboCuenta").change(function() {
         var cuenta = $("#cboCuenta").val();
         if (cuenta == "0") {
         return;
         }
         alert("Cuenta: " + cuenta);
         });*/
    </script>
</html>
