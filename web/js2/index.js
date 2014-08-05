$(document).ready(function(){
    $("#formulario").submit(function(){
    $("#mensaje").removeClass().addClass('myinfo').text('Validando Datos!! ').fadeIn(1000);
    this.timer = setTimeout(function() {
    $.ajax({
            type: 'POST',
            url: 'valida',
            data: $("#formulario").serialize(),
    success: function(msg){
        if(msg != 'ERROR') 
        {   $("#mensaje").html('Usuario Verificando...!').addClass('myinfo').fadeTo(500,1,
                function()
                {      document.location='menu';});
        }else{
            $("#mensaje").fadeTo(200,0.1,function()
            {$(this).html('Disculpe. USUARIO Y CLAVE INCORRECTO').removeClass().addClass('myerror').fadeTo(300,1);});
            }
        } 
    });
    }, 200);
    return false;
    }); 
}); 