<%-- 
    Document   : prueba3
    Created on : 06-ago-2014, 14:14:18
    Author     : Docente
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="js2/jquery-latest.min.js"></script>
        <script>	
	jQuery(document).ready(function($) {

		$('#tabs .tabscontent>div').not('div:first').hide();
		$('#tabs ul li:first,#tabs .tabscontent>div:first').addClass('active');

		$('#tabs ul li a').click(function(){

			var currentTab = $(this).parent();
			if(!currentTab.hasClass('active')){
				$('#tabs ul li').removeClass('active');				

				$('#tabs .tabscontent>div').slideUp('fast').removeClass('active');

				var currentcontent = $($(this).attr('href'));
				currentcontent.slideDown('fast', function() {
					currentTab.addClass('active');
					currentcontent.addClass('active');
				});
			}
			return false;							
		});
	});
        
</script>
<style>
	* { box-sizing: border-box;}
	body{font-size:11px;font-family:Verdana, Geneva, sans-serif;}
	a{ color: #000;	text-decoration: none;}
	.content *:first-child {margin-top: 0;}
	.content *:last-child {margin-bottom: 0;}

	/*clearfix*/
	.clearfix:before, .clearfix:after { display: table; content: ""; }
	.clearfix:after { clear: both; }
	.clearfix { zoom: 1; }


	/*tabs ul*/
	.tabs ul{
		margin: 0;padding: 0;
	}

	/*tabs li*/
	.tabs li { 
		position: relative; 
		display: inline-block; 
		margin: 1px .2em 0 0; 
		padding: 0;
		list-style: none; white-space: nowrap;
	}

	.tabs li.active a{
		position: relative;
		z-index: 10;
		margin-bottom: -1px;
		padding-bottom: 6px;
		background: #FAFAFA;
		box-shadow: 0 0 8px rgba(0, 0, 0, .2);
	}

	/*tabs a*/
	.tabs a{
		display: inline-block;
		margin-bottom: -5px;
		padding: 5px;
		padding-bottom: 10px;
		border: 1px solid #DFDFDF;
		border-bottom: none;
		border-radius: 5px 5px 0 0;
		background: #F3F3F3;
	}

	/*content*/
	.tabs .tabscontent {
		position: relative;
		display: block;
		float: left; 
		border: 1px solid #DFDFDF;
		border-radius: 5px;
		background: #F3F3F3;
		box-shadow: 0 0 10px rgba(0, 0, 0, .2);
	}
	.tabs .tabscontent .active{
		position: relative;
		z-index: 200;
		display: inline-block;
		border-radius: 5px;
		background: #FAFAFA;
	}

	/*first tab with border-radius 0*/
	.tabs .tabscontent:first-child,
	.tabs .tabscontent .active:first-child {
		border-top-left-radius: 0;
	}

	.tabs .content{
		padding: 20px;
	}

</style>

    </head>
    <body>
        <div id="tabs" class="tabs">
		<ul>
			<li><a href="#tab-1">Tab One</a></li>
			<li><a href="#tab-2">Tab Two</a></li>
			<li><a href="#tab-3">Tab Three</a></li>
		</ul>
		<div class="tabscontent">
			<div id="tab-1">
				<div class="content">
					<h3>Tab One</h3>
					<p>
						Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis laoreet diam eget nulla tincidunt vulputate. Suspendisse potenti. Donec nibh augue, adipiscing at egestas sed, sodales at quam. Quisque egestas, magna quis mattis porta, nibh nisi aliquam velit, a egestas enim tellus sit amet est. Suspendisse potenti. In hac habitasse platea dictumst. Pellentesque porttitor est vitae odio viverra porta blandit erat facilisis. Quisque felis velit, ornare ac fermentum vulputate, aliquet eu est.
					</p>
				</div>
			</div>
			<div id="tab-2">
				<div class="content">
					<h3>Tab Two</h3>
					<p>
						In dui elit, vulputate id bibendum eget, tristique vel sem. Donec in orci et turpis aliquet tempor id at risus. Pellentesque ac neque et felis ornare cursus sed id dui. Nulla eleifend sapien quis lorem auctor in pretium urna tincidunt. Etiam tempor convallis ipsum a aliquet. Ut nec ipsum sed nunc fringilla placerat ac ac tortor. Sed rhoncus vestibulum fermentum. Quisque sollicitudin luctus porttitor. Donec orci lacus, blandit at pulvinar ac, fringilla vitae turpis. Sed auctor molestie nibh vitae laoreet. Maecenas libero ipsum, gravida ac imperdiet in, convallis vel augue.
					</p>
					<p>
						Aliquam sodales dui in ligula mollis non luctus justo consectetur. Phasellus ipsum erat, adipiscing quis vehicula dapibus, pretium vel orci. Morbi iaculis mi quis dui condimentum aliquet. Sed ut sapien ante. Nam sit amet enim vitae est fringilla ullamcorper. Proin purus diam, tincidunt ac posuere ut, auctor ac magna. Nullam scelerisque molestie enim eu porta.
					</p>
				</div>
			</div>
			<div id="tab-3">
				<div class="content">
					<h3>Tab Three</h3>
					<p>
						Morbi elit lorem, egestas sed blandit sed, fermentum a leo. Suspendisse a quam erat, non vestibulum urna. Lorem ipsum dolor sit amet, consectetur adipiscing elit. In tellus tortor, tempus quis fringilla ac, tempor at sapien. Nulla facilisi. Morbi dui enim, vestibulum et rutrum sed, tincidunt eu felis. Vestibulum suscipit erat ac arcu viverra a porttitor velit vulputate. Donec at tellus metus. Pellentesque at sapien ligula, sit amet egestas mauris. Nunc euismod ante at erat hendrerit varius. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec nec porta elit.
					</p>
					<p>
						Integer in felis ut massa vestibulum vestibulum. Sed sit amet pretium odio. Ut congue, augue et mattis porta, risus dui pharetra nulla, sit amet semper neque nisi sed urna. Pellentesque cursus volutpat dignissim. Donec tristique, risus tincidunt varius mattis, nisl ligula pulvinar tellus, sit amet porta orci mi ut tellus. Ut suscipit sapien ut odio placerat at cursus diam venenatis. Aliquam et dolor egestas enim congue venenatis quis sed metus. Fusce ut nisi sed diam mattis tempor.
					</p>
				</div>
			</div>
		</div>
	</div>

    </body>
</html>
