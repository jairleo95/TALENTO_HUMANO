/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
  function statupdate(id, obj) {
                var datos;
                if (obj.is(":checked")) {
                    datos = {
                        id: id,
                        es: 1
                    };
                    $.ajax({
                        async: false,
                        url: '../../formato_horario?opc=statupdate',
                        data: datos,
                        type: 'POST'
                    });
                } else {
                    datos = {
                        id: id,
                        es: 0
                    };
                    $.ajax({
                        async: false,
                        url: '../../formato_horario?opc=statupdate',
                        data: datos,
                        type: 'POST'
                    });
                }
            }
            $(document).ready(function () {
                // Global Variables
                var typeofSave = 1;
                var idTipoH = undefined;

                //Start

                $('.tbd_t').DataTable();
                plDiasl($('.cont_Dias'));
                $('.cont_Dias').hide();
                $('.bca').show(300);
                cargar_tabla();
                //TRIGGERS
                $('.sel_dir').change(function () {
                    var idDireccion = $(this).val();
                    cargar_dep(idDireccion);
                    guardar = true;
                });
                $('.sel_dep').change(function () {
                    var idDep = $(this).val();
                    cargar_area(idDep);
                    guardar = true;
                });
                $('.sel_area').change(function () {
                    var idArea = $(this).val();
                    cargar_sec(idArea);
                    guardar = true;
                });

                $('.btnAgregar').click(function () {
                    toggleAgregar();
                });

                $('.Nom_horario').keyup(function () {
                    guardar = true;
                    toggleEditar();
                });
                $('.det_horario').keyup(function () {
                    guardar = true;
                });
                $('.btnClose').click(function () {
                    btnClose();
                });

                $('.btnGuardar').click(function () {
                    var data1;
                    data1 = "opc=GuardarFHAdmin&NO_HORARIO=" + $('.Nom_horario').val();
                    data1 += "&DE_HORARIO=" + $('.det_horario').val();
                    data1 += "&CA_HORAS=" + $('.h_totales').val();
                    data1 += "&id_ar=" + $('.sel_area').val();
                    data1 += "&id_sec=" + $('.sel_seccion').val();
                    data1 += "&ID_DEPARTAMENTO=" + $('.sel_dep').val();
                    if (typeofSave === 1) {
                        //Guardar
                        $.SmartMessageBox({
                            title: "Advertencia!",
                            content: "Â¿Esta seguro(a) de guardar este Elemento?",
                            buttons: '[No][Si]'
                        }, function (ButtonPressed) {
                            if (ButtonPressed === "Si") {
                                reg_th(data1, true);
                            }
                            if (ButtonPressed === "No") {
                                $.smallBox({
                                    title: "Notificacion",
                                    content: "<i class='fa fa-clock-o'></i> <i>Operacion Cancelada</i>",
                                    color: "#C46A69",
                                    iconSmall: "fa fa-times fa-2x fadeInRight animated",
                                    timeout: 4000
                                });
                                btnClose();
                            }

                        });



                    } else if (typeofSave === 2) {
                        //Editar
                        $.SmartMessageBox({
                            title: "Advertencia!",
                            content: "Â¿Esta seguro(a) de Editar este Elemnto?",
                            buttons: '[No][Si]'
                        }, function (ButtonPressed) {
                            if (ButtonPressed === "Si") {
                                edit_th(idTipoH);
                            }
                            if (ButtonPressed === "No") {
                                $.smallBox({
                                    title: "Notificacion",
                                    content: "<i class='fa fa-clock-o'></i> <i>Operacion Cancelada</i>",
                                    color: "#C46A69",
                                    iconSmall: "fa fa-times fa-2x fadeInRight animated",
                                    timeout: 4000
                                });
                                btnClose();
                            }


                        });

                    }
                });
                //funciones
                function reg_fh() {
                    var data = $('.frm_Dias').serialize();
                    $.post("../../formato_horario?opc=REGISTRAR_FORMATOS", data, function () {
                        cargar_tabla();
                        btnClose();
                    });


                }
                function reg_th(data, regfh) {
                    $.post("../../formato_horario", data, function () {
                        reset_select($('.sel_seccion'), "Seccion");
                        reset_select($('.sel_dep'), "Departamento");
                        reset_select($('.sel_area'), "Area");

                        if (regfh) {
                            reg_fh();
                        } else {
                            cargar_tabla();
                            btnClose();
                        }
                        $.smallBox({
                            title: "Notificacion",
                            content: "<i class='fa fa-clock-o'></i> <i>Guardado con Ãxito!</i>",
                            color: "#659265",
                            iconSmall: "fa fa-check fa-2x fadeInRight animated",
                            timeout: 4000
                        });
                    });
                }
                function edit_th(id) {
                    var data = "opc=editar_fh&NO_HORARIO=" + $('.Nom_horario').val();
                    data += "&ID_HORARIO=" + id;
                    data += "&DE_HORARIO=" + $('.det_horario').val();
                    data += "&CA_HORAS=" + $('.h_totales').val();
                    data += "&id_ar=" + $('.sel_area').val();
                    data += "&id_sec=" + $('.sel_seccion').val();
                    data += "&ID_DEPARTAMENTO=" + $('.sel_dep').val();
                    data += "&" + $('.frm_Dias').serialize();
                    if (guardar === true) {
                        $.post("../../formato_horario", data, function () {
                            cargar_tabla();
                            btnClose();
                        });
                    }


                }

                function cargar_area(id) {
                    var ti = $('.sel_area');
                    ti.empty();
                    var data = "opc=departamento" + "&idDepartamento=" + id;
                    ti.append('<option value="">Cargando...</option>').val('');
                    $.post("../../funcion", data, function (objJson) {
                        ti.empty();
                        var lista = objJson.lista;
                        if (lista.length > 0) {
                            ti.append("<option value=''>[Seleccione Area]</option>");
                        } else {
                            ti.append("<option value=''>[]</option>");
                        }
                        for (var i = 0; i < lista.length; i++) {
                            var item = "<option value='" + lista[i].id_ar + "'>" + lista[i].nom_ar + "</option>";
                            ti.append(item);
                        }
                    });
                }
                function reset_select(cont, n) {
                    cont.empty();
                    var t = "<option value=''>[Seleccione " + n + "]</option>";
                    cont.append(t);
                }
                function btnClose() {
                    $('.frmHorario').trigger('reset');
                    plDiasl($('.cont_Dias'));
                    $('.cDia').empty();
                    calc_Horas();
                    toggleAgregar();
                    $('.bcg').hide(200);
                    $('.bca').show(400);
                    typeofSave = 1;
                }
                function cargar_dep(idDir) {
                    var ti = $('.sel_dep');
                    ti.empty();
                    var data = "opc=direccion" + "&idDireccion=" + idDir;
                    ti.append('<option value="">Cargando...</option>').val('');
                    $.post("../../funcion", data, function (objJson) {
                        ti.empty();
                        if (objJson.rpta == -1) {
                            alert(objJson.mensaje);
                            return;
                        }
                        var lista = objJson.lista;
                        if (lista.length > 0) {
                            ti.append("<option value=''>[Seleccione Departamento]</option>");
                        } else {
                            ti.append("<option value=''>[]</option>");
                        }
                        for (var i = 0; i < lista.length; i++) {
                            var item = "<option value='" + lista[i].id_de + "'>" + lista[i].nom_de + "</option>";
                            ti.append(item);
                        }
                    });
                }
                function cargar_sec(id) {
                    var ti = $('.sel_seccion');
                    ti.empty();
                    var data = "opc=area" + "&idArea=" + id;
                    ti.append('<option value="">Cargando...</option>').val('');
                    $.post("../../funcion", data, function (objJson) {
                        ti.empty();
                        if (objJson.rpta == -1) {
                            alert(objJson.mensaje);
                            return;
                        }
                        var lista = objJson.lista;
                        if (lista.length > 0) {
                            ti.append("<option value=''>[Seleccione Seccion]</option>");
                        } else {
                            ti.append("<option value=''>[]</option>");
                        }
                        for (var i = 0; i < lista.length; i++) {
                            var item = "<option value='" + lista[i].id_se + "'>" + lista[i].nom_se + "</option>";
                            ti.append(item);
                        }
                    });
                }


                function cargar_tabla() {
                    $.post("../../formato_horario?opc=LFH", function (objJson) {
                        var lista = objJson.lista;
                        if (lista.length > 0) {
                            var t = "";
                            for (var i = 0; i < lista.length; i++) {
                                var x = i + 1;
                                if (lista[i].nombre === undefined) {
                                    lista[i].nombre = 'Sin Datos';
                                }
                                if (lista[i].detalle === undefined) {
                                    lista[i].detalle = 'Sin Datos';
                                }
                                if (lista[i].horas === undefined) {
                                    lista[i].horas = 'Sin Datos';
                                }
                                if (lista[i].dep === undefined) {
                                    lista[i].dep = 'Sin Datos';
                                }
                                if (lista[i].area === undefined) {
                                    lista[i].area = 'Sin Datos';
                                }
                                if (lista[i].seccion === undefined) {
                                    lista[i].seccion = 'Sin Datos';
                                }
                                t += "<tr id='" + lista[i].id + "'>";
                                t += "<td>" + x + "</td>";
                                t += "<td class='nombre" + x + "'>" + lista[i].nombre + "</td>";
                                t += "<td class='detalle" + x + "'>" + lista[i].detalle + "</td>";
                                t += "<td class='horas" + x + "'>" + lista[i].horas + "</td>";
                                t += "<td id='" + lista[i].iddep + "' class='dep" + x + "'>" + lista[i].dep + "</td>";
                                t += "<td id='" + lista[i].idarea + "' class='area" + x + "'>" + lista[i].area + "</td>";
                                t += "<td id='" + lista[i].idseccion + "' class='seccion" + x + "'>" + lista[i].seccion + "</td>";
                                t += "<td><a class='btn btn-link btnVer' target='_blanck' href='../../formato_horario?opc=LISTAR_FORMATO_HORARIO&idth=" + lista[i].id + "&nofor=" + lista[i].nombre + "'><span><i class='fa fa-eye'></i></span></a>";
                                t += "<a id='" + x + "' class='btn btn-link btnEditar' href='#'><span><i class='fa fa-pencil'></i></span></a>";
                                t += "<a class='btn btn-link btnEliminar' href='#'><span><i class='fa fa-times'></i></span></a></td>";
                                var info = 'statupdate("' + lista[i].id + '",$(this))';
                                if (lista[i].es_horario == 1) {
                                    t += "<td><div class='smart-form'><label class='toggle'>" +
                                            "<input type='checkbox' onchange='" + info + "' name='checkbox-toggle' checked='checked'>" +
                                            "<i data-swchon-text='ACTIVO' data-swchoff-text='INACTIVO'></i></label></div></td>";
                                } else {
                                    t += "<td><div class='smart-form'><label class='toggle'>" +
                                            "<input type='checkbox' onchange='" + info + "' name='checkbox-toggle'>" +
                                            "<i data-swchon-text='ACTIVO' data-swchoff-text='INACTIVO'></i></label></div></td>";
                                }
                                t += "</tr>";
                            }
                            crear_tabla();
                            $('.tbd').append(t);
                            $('.btnEditar').click(function () {
                                idTipoH = $(this).parent().parent().attr('id');
                                typeofSave = 2;
                                $('.frmHorario').trigger('reset');
                                plDiasl($('.cont_Dias'));
                                $('.cDia').empty();
                                calc_Horas();
                                var num = $(this).attr('id');
                                llenar_horario($(this).parent().parent().attr('id'));
                                cargarDatos($('.Nom_horario'), $('.nombre' + num).text());
                                if ($('.detalle' + num).text() === 'Sin Datos') {
                                    cargarDatos($('.det_horario'), "");
                                } else {
                                    cargarDatos($('.det_horario'), $('.detalle' + num).text());
                                }
                                //if ($('.bca').is(":visible")) {
                                $('.bca').hide(200);
                                $('.bcg').show(400);
                                $('.fcGuardar').show(200);
                                $('.cont_Dias').show(200);
                                $('.cDia').show(100);
                                $('.hTotal').show(200);
                                //}

                            });
                            $('.btnEliminar').click(function () {
                                var id = $(this).parent().parent().attr('id');
                                $.SmartMessageBox({
                                    title: "Advertencia!",
                                    content: "Â¿Esta seguro(a) de Eliminar este Elemnto?",
                                    buttons: '[No][Si]'
                                }, function (ButtonPressed) {
                                    if (ButtonPressed === "Si") {
                                        $.post('../../formato_horario?opc=eliminar_fh&ID_HORARIO=' + id, function () {
                                            cargar_tabla();
                                            $.smallBox({
                                                title: "Notificacion",
                                                content: "<i class='fa fa-clock-o'></i> <i>Eliminado con Ãxito!</i>",
                                                color: "#659265",
                                                iconSmall: "fa fa-check fa-2x fadeInRight animated",
                                                timeout: 4000
                                            });

                                        });
                                    }
                                    if (ButtonPressed === "No") {
                                        $.smallBox({
                                            title: "Notificacion",
                                            content: "<i class='fa fa-clock-o'></i> <i>Operacion Cancelada</i>",
                                            color: "#C46A69",
                                            iconSmall: "fa fa-times fa-2x fadeInRight animated",
                                            timeout: 4000
                                        });
                                    }

                                });


                            });
                            $('.tbd_t').DataTable();
                        }

                    });

                }
                function crear_tabla() {
                    var t = "";
                    t += '<table class="table table-hover table-responsive table-striped tbd_t">';
                    t += '<thead><tr><td>Nro</td><td>Nombre</td><td>Comentario</td><td>Cant Horas</td>';
                    t += '<td>Departamento</td><td>Area</td><td>Seccion</td><td>Opciones</td><td>Habilitar</td></tr>';
                    t += '</thead><tbody class="tbd"></tbody></table>';
                    $('.cnt_t').empty();
                    $('.cnt_t').append(t);
                }

            });
            function toggleAgregar() {
                if ($('.fcGuardar').is(":visible")) {
                    $('.fcGuardar').hide(200);
                    $('.cont_Dias').hide(200);
                    $('.cDia').hide(200);
                    $('.hTotal').hide(200);
                } else {
                    $('.fcGuardar').show(200);
                    $('.cont_Dias').show(200);
                    $('.cDia').show(200);
                    $('.hTotal').show(200);
                }
            }
            function toggleEditar() {
                if ($('.bca').is(':visible')) {
                    $('.bca').hide(200);
                    $('.bcg').show(400);
                }
            }
            function disableElements(el) {
                for (var i = 0; i < el.length; i++) {
                    el[i].disabled = true;

                    disableElements(el[i].children);
                }
            }

            function enableElements(el) {
                for (var i = 0; i < el.length; i++) {
                    el[i].disabled = false;

                    enableElements(el[i].children);
                }
            }
            function cargarDatos(cont, valor) {
                cont.val(valor);
            }
