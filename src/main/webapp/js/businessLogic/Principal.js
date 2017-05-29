/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


var btnclose = 0;
document.oncontextmenu = function () {
    return false;
};
function scrolingToTop(size) {
    console.log('scrolling to top...');
    $('html, body').animate({
        scrollTop: $("body").offset().top
    }, size);
}
function nobackbutton() {
    window.location.hash = "no-back-button";
    window.location.hash = "Again-No-back-button" //chrome
    window.onhashchange = function () {
        window.location.hash = "";
    };
}
/*WEBSOCKET*/
var websocket = new WebSocket("ws://" + document.location.host + "/TALENTO_HUMANO/serverGth");

websocket.onopen = function openConnection() {
    websocket.send("Hi");
};
websocket.onmessage = function processMessage(request) {
    var data = JSON.parse(request.data);
    console.log(data);
    if (data.data !== null) {
        if (data.message === "Autorizacion") {
            UpdateNotifications();
            $.smallBox({
                title: "Se ha autorizado un requerimiento...",
                content: "<i class='fa fa-clock-o'></i> <i>2 seconds ago...</i>",
                color: "#296191",
                iconSmall: "fa fa-thumbs-up bounce animated",
                timeout: 4000
            });
        } else {

        }

        // messagesTextArea.value += jsonData.message + "\n";
    }
}
function sendMessage() {
    websocket.send("Autorizacion");

}

document.getElementById('myframe').onload = function () {
    /*$(".iframe_principal").show(250);
     $(".animacion_load").empty();*/
};
function readNotification(idnoti) {
    var page = "cnot";
    $.post(page, {
        data: idnoti,
        op: 2
    });
}
function UpdateNotifications() {
    //console.log("aqui");
    var page = "cnot";
    $.post(page, {
        op: 5,
        id: '<%=id_user%>'
    }, function (objson) {
        var rpta = objson.rpta;
        if (rpta === "1") {
            var si = parseInt(objson.si);
            var no = parseInt(objson.no);
            var total = si + no;
            if (total !== 0) {
                $(".autorizacionList").empty();
                $(".autorizacionList").append("Autori... (" + si + ") ");
                $(".rechazarList").empty();
                $(".rechazarList").append("Rechazados (" + no + ") ");
                $(".total").empty();
                $(".total").append(total);
                $(".total").addClass("bg-color-red");
            }
        }
    });
}
var ii = 0;
function listAjaxNotification(objOption) {
    console.log("enter to listAjax");
    if (typeof objOption !== 'undefined') {
        objOption.parent().find("label").removeClass("active");
    }
    var listid = [];
    var url = "cnot";
    $.ajax({
        url: url,
        data: 'op=1&id=<%=id_user%>', async: false,
        type: 'POST', success: function (objson, textStatus, jqXHR) {
            var rpta = 0;
            rpta = objson.rpta;
            if (rpta === "1") {
                var lista = objson.lista;
                var infoaut = "";
                var fcn = "";
                var count = 0;
                listid = [];
                for (var i = 0; i < lista.length; i++) {
                    if (lista[i].tipo_notification == 1) {
                        infoaut += '<li>';
                        if (lista[i].es_visualizado == 0) {
                            infoaut += '<span class="unread">';
                            listid.push(lista[i].id_notification);
                            count++;
                        } else if (lista[i].es_visualizado == 1) {
                            infoaut += '<span>';
                        }
                        fcn = "readNotification('" + lista[i].id_notification + "')"
                        infoaut += '<a onclick="' + fcn + '" target="myframe" href="' + lista[i].di_notification + '" class="msg">';
                        infoaut += '<img src="img/avatars/4.png" alt="" class="air air-top-left margin-top-5" width="40" height="40" />';
                        infoaut += '<span class="from">' + lista[i].titulo + ' <i class="icon-paperclip"></i></span>';
                        var d = new Date(); //establecemos la fecha de hoy
                        //Establecemos la fecha final con los parametros anteriores
                        var fechaFinal = new Date(d.getFullYear() + "/" + (d.getMonth() + 1) + "/" + d.getDate() + " " + d.getHours() + ":" + d.getMinutes() + ":" + d.getSeconds());

                        //Establecemos la fecha inicio
                        var fechaInicio = new Date(lista[i].fecha);

                        //Restamos la fechaFinal menos fechaInicio,
                        //esto establece la diferencia entre las fechas
                        var fechaResta = fechaFinal - fechaInicio;

                        //imprimir
                        if ((((fechaResta / 1000) / 60) / 60) / 24 < 2) {     //dias
                            if ((((fechaResta / 1000) / 60) / 60) / 24 < 1) {
                                if (((fechaResta / 1000) / 60) / 60 >= 1) {
                                    infoaut += '<time>Hace ' + parseInt(((fechaResta / 1000) / 60) / 60) + ' horas</time>';
                                } else {
                                    if (parseInt((fechaResta / 1000) / 60) >= 1) {
                                        infoaut += '<time>Hace ' + parseInt((fechaResta / 1000) / 60) + ' minutos</time>';
                                    } else {
                                        infoaut += '<time>Recientemente</time>';
                                    }
                                }
                            } else {
                                if ((((fechaResta / 1000) / 60) / 60) / 24 == 1) {
                                    infoaut += '<time>Hace 1 día</time>';
                                } else {
                                    infoaut += '<time>Hace 2 días</time>';
                                }
                            }
                        } else {
                            infoaut += '<time>' + fechaInicio.getDate() + "/" + (parseInt(fechaInicio.getMonth()) + 1) + '/' + fechaInicio.getFullYear() + '</time>';
                        }
                        infoaut += '<span class="subject">' + lista[i].de_notification + '</span>';
                        infoaut += '<span class="msg-body">Nada importante</span>';
                        infoaut += '</a>';
                        infoaut += '</span>';
                        infoaut += '</li>';
                    }
                    $(".autnot").empty();
                    $(".autnot").append(infoaut);
                }
                if (count > 0) {
                    $(".autorizacionList").empty();
                    $(".autorizacionList").append("Autorizados (" + count + ") ");
                }
                if (count == 0) {
                    $(".autorizacionList").empty();
                    $(".autorizacionList").append("Autorizados ");
                }
                if (listid.length > 0) {
                    $.post(url, {
                        op: 4,
                        'listid[]': listid
                    });
                }
            }


        }});

}
function listAjaxNotificationRec(objOption) {
    console.log("enter to listAjaxREC");
    if (typeof objOption !== 'undefined') {
        objOption.parent().find("label").removeClass("active");
    }
    var listid2 = [];
    var url = "cnot";
    $.ajax({
        url: url,
        data: 'op=3&id=<%=id_user%>', async: false,
        type: 'POST',
        success: function (objson, textStatus, jqXHR) {
            var rpta = 0;
            rpta = objson.rpta;
            if (rpta === "1") {
                var lista = objson.lista;
                var inforec = "";
                var fcn = "";
                var count2 = 0;
                listid2 = [];
                for (var i = 0; i < lista.length; i++) {
                    if (lista[i].tipo_notification == 0) {
                        inforec += '<li>';
                        if (lista[i].es_visualizado == 0) {
                            inforec += '<span class="unread">';
                            listid2.push(lista[i].id_notification);
                            count2++;
                        }
                        if (lista[i].es_visualizado == 1) {
                            inforec += '<span>';
                        }
                        fcn = "readNotification('" + lista[i].id_notification + "')"
                        inforec += '<a onclick="' + fcn + '" target="myframe" href="' + lista[i].di_notification + '" class="msg">';
                        inforec += '<img src="img/avatars/4.png" alt="" class="air air-top-left margin-top-5" width="40" height="40" />';
                        inforec += '<span class="from">' + lista[i].titulo + ' <i class="icon-paperclip"></i></span>';
                        var d = new Date(); //establecemos la fecha de hoy
                        //Establecemos la fecha final con los parametros anteriores
                        var fechaFinal = new Date(d.getFullYear() + "/" + (d.getMonth() + 1) + "/" + d.getDate() + " " + d.getHours() + ":" + d.getMinutes() + ":" + d.getSeconds());

                        //Establecemos la fecha inicio
                        var fechaInicio = new Date(lista[i].fecha);

                        //Restamos la fechaFinal menos fechaInicio,
                        //esto establece la diferencia entre las fechas
                        var fechaResta = fechaFinal - fechaInicio;

                        //imprimir
                        if ((((fechaResta / 1000) / 60) / 60) / 24 < 2) {     //dias
                            if ((((fechaResta / 1000) / 60) / 60) / 24 < 1) {
                                if (((fechaResta / 1000) / 60) / 60 >= 1) {
                                    inforec += '<time>Hace ' + parseInt(((fechaResta / 1000) / 60) / 60) + ' horas</time>';
                                } else {
                                    if (parseInt((fechaResta / 1000) / 60) >= 1) {
                                        inforec += '<time>Hace ' + parseInt((fechaResta / 1000) / 60) + ' minutos</time>';
                                    } else {
                                        inforec += '<time>Recientemente</time>';
                                    }
                                }
                            } else {
                                if ((((fechaResta / 1000) / 60) / 60) / 24 == 1) {
                                    inforec += '<time>Hace 1 día</time>';
                                } else {
                                    inforec += '<time>Hace 2 días</time>';
                                }
                            }
                        } else {
                            inforec += '<time>' + fechaInicio.getDate() + "/" + (parseInt(fechaInicio.getMonth()) + 1) + '/' + fechaInicio.getFullYear() + '</time>';
                        }
                        inforec += '<span class="subject">' + lista[i].de_notification + '</span>';
                        inforec += '<span class="msg-body">Nada importante</span>';
                        inforec += '</a>';
                        inforec += '</span>';
                        inforec += '</li>';
                    }
                    $(".recnot").empty();
                    $(".recnot").append(inforec);
                }
                if (count2 > 0) {
                    $(".rechazarList").empty();
                    $(".rechazarList").append("Rechazados (" + count2 + ") ");
                }
                if (count2 == 0) {
                    $(".rechazarList").empty();
                    $(".rechazarList").append("Rechazados ");
                }
                if (listid2.length > 0) {
                    $.post(url, {
                        op: 4,
                        'listid[]': listid2
                    });
                }
            }
        }});

}



$(document).ready(function () {
    var idtra = $('#id_trabajador').val();
    getAvatar("perfil", idtra);
    pageSetUp();
    UpdateNotifications();
    $(".repCargaAcademica").click(function () {
     
        $(".oldContent").hide();
        $(".newContent").show();
        loadURL("carga_academica?opc=Reporte_Carga_Academica", $(".newContent"));
        // return false;
    });
    $('nav a[href!="#"]').click(function () {
        $(".newContent").hide();
        if (typeof pagedestroy === "function") {
            pagedestroy();
            //  pagedestroy = undefined;
        }
        pagefunction = null;
        $(".newContent").removeData().html("");
        $(".newContent").empty();
        $(".oldContent").show();
    });
//var iduser=$("#iuser").val();
// alert('<%="Maximum Inactive Interval of Session in Seconds is : " + sesion.getMaxInactiveInterval() / 60%>');
    $(".menu-item-parent").parent().click(function () {
        $(".titulo_menu").text(" " + $(this).text());
        $("#icon_menu").removeClass();
        $("#icon_menu").addClass($(this).data('value'));
        $("#icon_menu").removeClass("fa-lg");
    });
    $(".li-privilegio").click(function () {
        $(".li-privilegio").removeClass("active");
        $(this).addClass("active");
        //$(".iframe_principal").hide();
        //$(".animacion_load").append('<h1 class="ajax-loading-animation"><i class="fa fa-cog fa-spin"></i> Cargando...</h1>');
    });
    $(".js-status-update a").click(function () {
        var selText = $(this).text();
        var $this = $(this);
        $this.parents('.btn-group').find('.dropdown-toggle').html(selText + ' <span class="caret"></span>');
        $this.parents('.dropdown-menu').find('li').removeClass('active');
        $this.parent().addClass('active');
    });

    $(".hola2 ").click(function () {
        $(".autorizacionList").click();
    });
    function getAvatar(tipo, idtra) {
        $.ajax({
            url: "./foto",
            type: "POST",
            data: "opc=getfoto&tipo=" + tipo + "&idtra=" + idtra,
            success: getImagen,
            error: errors
        });
        function getImagen(data) {
            $.each(data, function (i, datos) {
                $.each(datos, function (i, obj) {
                    $('#foto_usuario').attr("src", "Archivo/Fotos/" + obj.ar_foto);
                });
            });
        }
        function errors(data) {
            console.log("error" + data)
        }

    }
    $(".autorizacionList").click(function () {
        listAjaxNotification($(this));

    });
    $(".rechazarList").click(function () {
        listAjaxNotificationRec($(this));

    });
    $(".porautList").click(function () {
        listAjaxNotification($(this));

    });
    /*$(".hola2").click(function () {
     if (ii == 0) {
     ii = 1;
     } else {
     listAjaxNotification();
     listAjaxNotificationRec()();
     }
     });*/
});
$("#btn-ocultar").click(function () {
    if (btnclose == 0) {
        $(".logininfo").css({display: "none"});
        btnclose += 1;
    } else {
        $(".logininfo").css({display: "block"});
        btnclose = 0;
    }

});