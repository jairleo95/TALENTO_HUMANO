// JavaScript Document
var ordenar = '';
$(document).ready(function(){
	
	// Llamando a la funcion de busqueda al
	// cargar la pagina
	filtrar()
	
	var dates = $( "#del, #al" ).datepicker({
			yearRange: "-50",
			defaultDate: "+1w",
			changeMonth: true,
			changeYear: true,
			onSelect: function( selectedDate ) {
				var option = this.id == "del" ? "minDate" : "maxDate",
					instance = $( this ).data( "datepicker" ),
					date = $.datepicker.parseDate(
						instance.settings.dateFormat ||
						$.datepicker._defaults.dateFormat,
						selectedDate, instance.settings );
				dates.not( this ).datepicker( "option", option, date );
			}
	});
	
	// filtrar al darle click al boton
	$("#btnfiltrar").click(function(){ filtrar() });
	
	// boton cancelar
	$("#btncancel").click(function(){ 
		$(".filtro input").val('');
		$(".filtro select").find("option[value='0']").attr("selected",true);
		//filtrar() 
                html = '<tr><td colspan="6" align="center">Haga la busqueda por algunos de los filtros...</td></tr>'
				$("#data tbody").html(html);
	});
	
	// ordenar por
	$("#data th span").click(function(){
		var orden = '';
		if($(this).hasClass("desc"))
		{
			$("#data th span").removeClass("desc").removeClass("asc")
			$(this).addClass("asc");
			ordenar = "&orderby="+$(this).attr("title")+" asc"		
		}else
		{
			$("#data th span").removeClass("desc").removeClass("asc")
			$(this).addClass("desc");
			ordenar = "&orderby="+$(this).attr("title")+" desc"
		}
                
		filtrar()
	});
});

function filtrar()
{	
	$.ajax({
		data: $("#frm_filtro").serialize()+ordenar,
		type: "POST",
		dataType: "json",
		url: "../Ajax/Ajax_Dgp/Prueb_Filtro.?action=listar",
			success: function(data){
				var html = '';
				if(data.length > 0){
					$.each(data, function(i,item){
						html += '<tr >'
                                                  //html += '<td><a href="DetalleTrabajador.php?idtr='+ item.IDTR+'">'+item.NOMBRE+'</a></td>'
							html += '<td>'+'gndlñsgnlñsdnlñsdng</td>'
						//	html += '<td>'+item.AREA+'</td>'
						//	html += '<td>'+item.SECCION+'</td>'
                                                  //      html += '<td>'+item.PUESTO+'</td>'
						//	html += '<td>'+item.SUELDO+'</td>'
                                                      //html += '<td>'+item.PROCESO+'</td>'
							//html += '<td>'+item.REQUERIMIENTO+'</td>'
                                            //html += '<td><a href="DetalleDGP.php?iddgp='+item.IDDGP+'&idtr='+item.IDTR+'">'+item.REQUERIMIENTO+'</a></td>'		
                                          //  html += '<td>'+item.FECHA_CREACION+'</td>'

							
						html += '</tr>';
															
					});					
				}
				if(html == '') html = '<tr><td colspan="6" align="center">No se encontraron registros..</td></tr>'
				$("#data tbody").html(html);
			}
	  });
}