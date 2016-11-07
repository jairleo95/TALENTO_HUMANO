function validarLogin() {
    var formLogin = $(".formLogin");
    var txtStatus = $(".texto_box_h");
    $(".txtClave").addClass("ui-autocomplete-loading");
    $(".btnIngresar").hide();
    $(".box_cargando").hide();
    $.ajax({
        type: 'POST',
        url: 'valida',
        data: formLogin.serialize(),
        success: function (objJson) {
            if (objJson.status) {
                 console.log(objJson);
                document.location = 'menu';
            } else {
                txtStatus.text(objJson.message);
                $(".box_cargando").show();
                $(".txtClave").removeClass("ui-autocomplete-loading");
                $(".btnIngresar").show();
            }
        }
    });
}
function pagefunction() {
    //$.menu_speed=235;
}
function soloLetrasNumeros(e) {
    var tecla = (document.all) ? e.keyCode : e.which;
    if ((tecla > 47 && tecla < 58) || (tecla >= 97 && tecla <= 122)
            || (tecla >= 65 && tecla <= 90))
        return true;
    else
        return false;
}
function aliniciar() {
    document.getElementById("txtUsuario").focus();
}
function antiSqlInjection(txt) {
    //	var txt = elemento.val();
    var txt2 = txt.replace(/^\s*|\s*$/g, "");
    var txt3 = txt2.toUpperCase();
    if (txt3 == "INSERT" || txt3 == "INTO" || txt3 == "SELECT"
            || txt3 == "WHERE") {
        return false;
    }
    return true;
}
$(document).ready(function () {
    var formLogin = $(".formLogin");
    formLogin[0].reset();
    pageSetUp();
   // validateSession();
    $('input').keypress(function (e) {
        if (e.which == 13) {
            formLogin.submit();
            return false;   
        }
    });
    $('.txtClave').focus(function () {
        $(".lbClave").show();
    });
    // movie form
    formLogin.on('change keyup', function () {
        if ($(".txtUsuario").val() !== "" && $(".txtClave").val() !== "") {
            $(".btnIngresar").removeAttr("disabled");
        } else {
            $(".btnIngresar").attr("disabled", "disabled");
        }
    });
    var $validator = formLogin.validate(
            {
                rules: {
                    username: {
                        required: true,
                        val_injection: true
                    },
                    clave: {
                        required: true,
                        val_injection: true
                    }
                },
                messages: {
                    username: {
                        required: "Porfavor ingresar usuario."
                    },
                    clave: {
                        required: "Porfavor ingresar clave."
                    }
                },
                highlight: function (element) {
                    $(element).closest('.form-group').removeClass(
                            'has-success').addClass('has-error');
                },
                unhighlight: function (element) {
                    $(element).closest('.form-group').removeClass(
                            'has-error').addClass('has-success');
                },
                errorElement: 'span',
                errorClass: 'help-block',
                errorPlacement: function (error, element) {
                    $(".error_message_div").empty();
                    if (element.parent('.input-group').length) {
                        error.insertAfter(element.parent());
                    } else {
                        error.insertAfter(element);
                    }
                },
                submitHandler: function () {
                    validarLogin();
                }
            });
    jQuery.validator.addMethod("val_injection", function (value,
            element) {
        return this.optional(element) || antiSqlInjection(value);
    }, "Caracteres no permitidos.");

});

 