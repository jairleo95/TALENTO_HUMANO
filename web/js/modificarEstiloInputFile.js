/**
 * Permite que se muestre el contenido del input file oculto en otro input.
 * 
 * @param numeroInput Numero del input file que se quiere ver con un estilo modificado 
 * y del input en el que se mostrara.
 */
function mostrarInputFileModificado(numeroInput) {
    $("#archivo_oculto"+numeroInput).change(function(){
        $("#archivo"+numeroInput).val($("#archivo_oculto"+numeroInput).val());
    });
}