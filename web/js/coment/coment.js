var insert = true;
//----------------- Script comentario --------------------------

             $( ".add-coment" ).click(function() {
              $( ".add-coment" ).addClass( "disabled" );
              $( ".area-coment" ).css({ display: "block" });
              $( ".add-coment" ).css({ display: "none" });
              });
              
              var valor, contador, parrafo;
                $('<p class="indicador">Tienes 500 caracteres restantes</p>').appendTo('.contador');
              $('.mensaje').keydown(function(){
                contador = 500;
                $('.advertencia').remove();
                $('.indicador').remove();
                valor = $('.mensaje').val().length;
                contador = contador - valor;
                if(contador < 0) {
                   parrafo = '<p class="advertencia">';
                   $( ".comet" ).addClass( "disabled" );
                }
                else {
                   parrafo = '<p class="indicador">';
                   $( ".comet" ).removeClass( "disabled" );
                }
                $('.contador').append(parrafo + 'Tienes ' + contador + ' caracteres restantes</p>');

                });

             $( ".close-form" ).click(function() {
                 jQuery.fn.reset = function () {
               $(this).each (function() { this.reset(); });
                   }
               $(".comentari-form").reset();
               $(".comentario-dgp").empty();
               $(".contador").empty();
               $(".datos_trabajador").empty();
               insert = true;
              });

          $(".click").hover(function(e) {
              var data = $(this).attr("data-valor");
              var d = data.split(";");
              var imgs = '.user_avatar_'+d[1];
              var img =$(imgs).attr('src');
              $('.idDgp').val(d[0]);     
               if(insert){
               $('.datos_trabajador').append('<h3>'+d[2]+'  <img src="'+img+'" style="border-radius: 50%; " class="avatart text-right" width="60"  height="50" /></h3>');
               insert = false;

                 }
              });

//--------------------- jalar comentarios --------------
        function sendAjax(parm) {
        var idDgp = $('.idDgp').val();
        var url1 = '../../comentario?iddgp=';
	var url = url1.trim()+idDgp+'&opc=list';
        var tipo = parm;
        var ln = 0;
        var cant_coment = 0;
        var img ="";
	$.ajax({
		url: url,
		type: 'POST',
		dataType: 'json',
		contentType: 'application/json',
		mimeType: 'application/json',
		success: function (data) {
                    
                 $.each(data, function(i, obj) {
                        $.each(obj, function(i, objt) {
                         cant_coment +=1;
                        });
                     $.each(obj, function(idx, objt) {
                         console.log("objetosde la base de datos ...");
                         console.log(objt);
                         if(objt.ar_foto == null || objt.ar_foto == "" ){
                                img+="../../img/avatar_default.jpg"; 
                              }else{
                                img+="../../Vista/Usuario/Fotos/"+objt.ar_foto; 
                              }
                         
                        if(cant_coment == 1){
                             tipo +='todo';
                        }

                        if(tipo == "todo" || tipo =="eight"){
                              var contenido= '<div class="row">'+
                            '<div class="cont_avatar col-sm-2 col-xs-1">'+
                            '<img style="border-radius:100%;height:60px;width:60px; class="img-responsive user-photo" src="'+img+'" >'+
                            '</div>'+
                            '<div class="col-sm-10">'+
                            '<div class="panel panel-info">'+
                            '<div class="panel-heading">'+
                            '<strong>'+objt.no_puesto+' / '+objt.no_trabajador+'</strong>'+
                            '<small class="pull-right text-muted">'+
                            '<span class="glyphicon glyphicon-time"> '+
                            '</span> '+objt.fe_creacion +'</small>'+
                            '</div><div class="panel-body">'+
                            '<div style="word-wrap: break-word;">'+
                            ''+objt.cm_comentaio+''+
                            '</div>'+
                            '</div>'+
                            '</div>'+
                            '<div class="mas-coment">'+
                            '</div>';
                            $(".comentario-dgp").append(contenido);
                            img="";
                            if(ln == 1){
                            $('<button class="todoc btn btn-default btn-block" onclick="listodo()"> + <span class="glyphicon glyphicon-comment"> </span> '+
                            cant_coment+' comentarios </button> ').appendTo('.mas-coment');

                            }
                            }else{
                           if(cant_coment-2==idx){
                               ln +=1;
                               tipo +='todo';
                           }
                        }
                     img="";

                    });
                  });

                },
		error:function(data,status,er) {
			console.log("error: "+data+" status: "+status+" er:"+er);
		}
	      });
         $( ".img-load" ).css({ display: "none" });
   }
// ---------------------- registara comentario ------------------------------
  function Registrar() {
	// get inputs
	var idDgp = $('.idDgp').val();
	var cometario = $('.mensaje').val();
        var url1 = '../../comentario?opc=COMENTAR&iddgp=';
	var url = url1.trim()+idDgp+'&coment='+cometario.trim();
	$.ajax({
		url: url,
		type: 'POST',
		dataType: 'json',
		contentType: 'application/json',
		mimeType: 'application/json',
		success: function (data) {
               },

	     });

               jQuery.fn.reset = function () {
               $(this).each (function() { this.reset(); });
               
                   }
                   var eight='eight';
                  
               $(".comentari-form").reset();
               $(".comentario-dgp").empty();
               $(".contador").empty();
               sendAjax('eight') ;

  }
function listodo(){
    $( ".todoc" ).css({ display: "none" });
    $(".comentario-dgp").empty();
    var  todo = 'todo';
    sendAjax(todo);
}



