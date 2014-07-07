$(function(){
    $('#frm_val').submit(function(){
        var data = $(this).serialize();

        $.post('Controlador.php', data, function(respuesta){
            $('.container').find('dl').slideUp('normal', function(){
                $('.container').html(respuesta);
            });
        });
        
        return false;
    });
});
