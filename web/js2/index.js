$(document).ready(function(){
    $("#formulario").submit(function(){
    $("#mensaje").removeClass().addClass('myinfo').text('Validating Your Login ').fadeIn(1000);
    this.timer = setTimeout(function () {
    $.ajax({
            type: 'POST',
            url: 'valida',
            data: $("#formulario").serialize(),
    success: function(msg){
    if(msg != 'ERROR') // Message Sent, check and redirect
    {                // and direct to the success page
        $("#mensaje").html('Login Verified, Logging in.....').addClass('myinfo').fadeTo(900,1,
            function()
            {
            //redirect to secure page
            document.location='menu';
            });
    }else{
        $("#mensaje").fadeTo(200,0.1,function() //start fading the messagebox
        {//add message and change the class of the box and start fading
        $(this).html('Disculpe. USUARIO Y CLAVE INCORRECTO').removeClass().addClass('myerror').fadeTo(900,1);
    });
 
    }
    }
 
    });
    }, 200);
    return false;
    }); 
});
 