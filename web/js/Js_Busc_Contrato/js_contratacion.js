// JavaScript Document
var ordenar = '';
$(document).ready(function(){
	
	// Llamando a la funcion de busqueda al
	// cargar la pagina
	//filtrar()
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
		$(".filtro input").val('')
		$(".filtro select").find("option[value='0']").attr("selected",true)
		//filtrar() 
                 html = '<tr><td colspan="9" align="center">Haga la busqueda por algunos de los filtros...</td></tr>'
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
		url: "../Modelo/FILTRO_AJAX/ajax_contrato.php?action=listar",
			success: function(data){
				var html = '';
				if(data.length > 0){
					$.each(data, function(i,item){// $.each es un iterador para los elementos DOM
						html += '<tr>'
                                                        html += '<td  ><a href="DetalleTrabajador.php?idtr='+ item.IDTR+'">'+item.NOMBRE+'</a></td>'
							html += '<td>'+item.FEC_DESDE+'</td>'
							html += '<td>'+item.FEC_HASTA+'</td>'
                                                        html += '<td>'+item.AREA+'</td>'
							html += '<td>'+item.SECCION+'</td>'
                                                        html += '<td>'+item.PUESTO+'</td>'
							html += '<td>'+item.SUELDO+'</td>'
							html += '<td>'+item.FECHA_CONTRATACION+'</td>'
							html += '<td><a href="Info_Contractual.php?idtr='+item.IDTR+'">Ver Contrato</a></td>'
                                                        
							
						html += '</tr>';
															
					});					
				}
                                
				if(html == '') html = '<tr><td colspan="9" align="center">No se encontraron registros...</td></tr>'
				$("#data tbody").html(html);
			}
                        //con succes llamo a una funcion ajax dentro del ajax
	  });
}