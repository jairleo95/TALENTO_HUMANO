
document.oncontextmenu = function () {
    return false;
}
//   runAllForms();
function nobackbutton() {
    window.location.hash = "" //chrome
    window.onhashchange = function () {
        window.location.hash = "";
    }
}
$(function () {
    // Validation
    $("#login-form").validate({
        submitHandler: function () {
            $("#mensaje").removeClass().addClass('myinfo').text('Validando Datos... ').fadeIn(50);
            $.ajax({
                type: 'POST',
                url: 'valida',
                data: $("#login-form").serialize(),
                success: function (msg) {
                    if (msg != 'ERROR') {
                        $("#mensaje").html('Usuario Verificado!').addClass('myinfo').fadeTo(50, 1,
                                function () {
                                    document.location = 'menu';
                                });
                    } else {
                        $("#mensaje").fadeTo(20, 0.1, function ()
                        {
                            $(this).html('Usuario o clave incorrecto').removeClass().addClass('myerror').fadeTo(50, 1);
                        });
                    }
                }
            }).error(function (event, jqXHR, ajaxSettings, thrownError) {
                $("#mensaje").html(ajaxSettings).removeClass().addClass('myerror');
            });
        },
        // Rules for form validation
        rules: {
            username: {
                required: true
            },
            clave: {
                required: true,
                minlength: 3,
                maxlength: 20
            }
        },
        // Messages for form validation
        messages: {
        },
        // Do not change code below
        errorPlacement: function (error, element) {
            error.insertAfter(element.parent());
        }
    });
});