$(document).on("ready",function(){
    $("#enviar").click(function(){
	 var url = "jonas"; // El script a dónde se realizará la petición.
	    $.ajax({
	           type: "POST",
	           url: url,
	           data: $("#formulario").serialize(), // Adjuntar los campos del formulario enviado.
                   cache: false,
	           success: function(data)
	           {
	               $("#mensaje").html(data); // Mostrar la respuestas del script PHP.
                       $("#mensaje").addClass("test");
	           }
	         });
	 
	    return false; // Evitar ejecutar el submit del formulario.
	 });
});