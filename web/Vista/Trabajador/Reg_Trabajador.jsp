<%@page import="pe.edu.upeu.application.model.Situacion_Educativa"%>
<%@page import="pe.edu.upeu.application.model.Universidad"%>
<%@page import="pe.edu.upeu.application.model.Carrera"%>
<%@page import="pe.edu.upeu.application.model.V_Ubigeo"%>
<%@page import="pe.edu.upeu.application.model.Nacionalidad"%>
<%
    HttpSession sesion = request.getSession(true);
    String iddep = (String) sesion.getAttribute("DEPARTAMENTO_ID");
    String iduser = (String) sesion.getAttribute("IDUSER");

%>
<jsp:useBean id="List_Nacionalidad" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="List_Distrito" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="List_Carrera" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="List_Universidad" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="List_Situacion_Educativa" scope="application" class="java.util.ArrayList"/>
<!DOCTYPE html >
<html>
    <head>
        <meta charset="windows-1252">
        <title>Registrar Trabajador</title>
        <link rel="stylesheet" type="text/css"  href="../../css/Css_Formulario/form.css">

        <link rel="stylesheet" href="../../css/Css_Formulario/chosen.css">
        <script src="../../js/Js_Formulario/abc.js"></script>
        <script src="../../js/Js_Formulario/organictabs.jquery.js"></script>


        <script type="text/javascript" src="../../js/Js_Alerta/alertify.js"></script>
        <link rel="stylesheet" href="../../css/Css_Alerta/alertify.core.css" />
        <link rel="stylesheet" href="../../css/Css_Alerta/alertify.default.css" />
        <script type="text/javascript"  src="../../js/Js_Alerta/Alertas.js"></script>


        <link rel="stylesheet" href="../../css/Css_Validar/fv.css" type="text/css" />



        <script type="text/javascript" src="../../js/JQuery/jQuery.js" ></script>
        <script type="text/javascript" src="../../js/JQuery/jquery.numeric.js"></script>

        <script type="text/javascript">
            $(document).ready(
                    function() {
                        $(".doc").attr("maxlength", "8");
                        $(".doc").val("");
                        $(".select-doc").change(
                                function() {
                                    $(".doc").val("");
                                    if ($(".select-doc").val() == 1) {
                                        $("#doc").numeric(false, function() {
                                        });
                                        $(".doc").attr("maxlength", "8");
                                        // $(".doc").val("");

                                    }
                                    if ($(".select-doc").val() == 2) {
                                        $(".doc").removeAttr("maxlength");
                                        $("#doc").removeNumeric();
                                        //    $(".doc").val("");
                                    }
                                    if ($(".select-doc").val() == 3) {
                                        $("#doc").removeNumeric();
                                        $(".doc").removeAttr("maxlength");
                                    }
                                }
                        );
                    }
            );
        </script>

        <script type="text/javascript">
            $(document).ready(
                    function() {
                        $(".alerta-req").hide();
                        $("#edad").change(
                                function() {
                                    $(".alerta-req").hide();
                                    var fecha = $("#edad").val();
                                    var fechaActual = new Date();
                                    var diaActual = fechaActual.getDate();
                                    var mmActual = fechaActual.getMonth() + 1;
                                    var yyyyActual = fechaActual.getFullYear();
                                    FechaNac = fecha.split("-");
                                    var diaCumple = FechaNac[2];
                                    var mmCumple = FechaNac[1];
                                    var yyyyCumple = FechaNac[0];
                                    //retiramos el primer cero de la izquierda
                                    if (mmCumple.substr(0, 1) == 0) {
                                        mmCumple = mmCumple.substring(1, 2);
                                    }
//retiramos el primer cero de la izquierda
                                    if (diaCumple.substr(0, 1) == 0) {
                                        diaCumple = diaCumple.substring(1, 2);
                                    }
                                    var edad = yyyyActual - yyyyCumple;

                                    if ((mmActual < mmCumple) || (mmActual == mmCumple && diaActual < diaCumple)) {
                                        edad--;
                                    }

                                    $(".edad").text(edad + " años");
                                    if (edad < 18) {
                                        $(".alerta-req").show();
                                    }

                                }
                        );

                    }

            );

        </script>
        <style>

            .btn-duplicar{
                margin-left: 30%;

            }
        </style>

    </head>
    <body>
        <br>
    <center>
        <script type="text/javascript">
            Esperar();
        </script>
        <label class="title">FICHA DE DATOS DEL TRABAJADOR <%=iduser%></label>


        <button onclick="alerta_dt_ingresados();">Hola</button>


        <br>
        <br>
        <form class="form" action="../../trabajador" method="post" novalidate="" > 

            <table class="table" >      


                <tr><td colspan="4"><div class="sub_title"><label class="label">Datos Personales</label></div></td></tr>
                <tr ><td>Apellido Paterno:</td><td>
                        <div class="item">
                            <input type="text" name="APELLIDO_P"  required=""  class="text-box"  >
                            <div class='tooltip help'>
                                <span>?</span>
                                <div class='content'>
                                    <b></b>
                                    <p>Apellido Paterno del Trabajador</p>
                                </div>
                            </div>
                        </div>
                    </td></tr>                 
                <tr><td>Apellido Materno:</td><td>

                        <div class="item">
                            <input type="text" name="APELLIDO_M" required="" class="text-box" >
                            <div class='tooltip help'>
                                <span>?</span>
                                <div class='content'>
                                    <b></b>
                                    <p>Apellido Materno del Trabajador</p>
                                </div>
                            </div>
                        </div>
                    </td></tr>              
                <tr><td>Nombres:</td><td>

                        <div class="item">
                            <input type="text" name="NOMBRES" class="text-box" required="" >
                            <div class='tooltip help'>
                                <span>?</span>
                                <div class='content'>
                                    <b></b>
                                    <p>Nombre Completo del Trabajador</p>
                                </div>
                            </div>
                        </div>
                    </td></tr>     
                <tr><td>Sexo:</td><td>
                        <div class="item">
                            <select name="SEXO" required="" class="text-box">
                                <option value=""  >----------</option>
                                <option value="M">Masculino</option>
                                <option value="F">Femenino</option>
                            </select></div>
                    </td></tr>   
                <tr><td>Fecha Nacimiento:</td><td>
                        <div class="item">
                            <input type="date" name="FECHA_NAC" required=""id="edad"  class="text-box" onchange="" >    <div class='tooltip help'>
                                <span>?</span>
                                <div class='content'>
                                    <b></b>
                                    <p>El Trabajador debe ser mayor de edad</p>
                                </div>
                            </div>
                            <br>
                            <p class="edad"><div class="alerta-req" style="display: none;">Es un menor de edad</div></p>
                        </div>

                    </td>

                </tr>   
                <tr><td>Nacionalidad:</td><td>
                        <select name="NACIONALIDAD" class="text-box chosen-select"   required="">
                            <option value="" > </option>
                            <%for (int s = 0; s < List_Nacionalidad.size(); s++) {
                                    Nacionalidad nac = new Nacionalidad();
                                    nac = (Nacionalidad) List_Nacionalidad.get(s);
                                    if (nac.getId_nacionalidad().equals("NAC-0044")) {
                            %>
                            <option value="<%=nac.getId_nacionalidad()%>" selected="selected" ><%=nac.getNo_nacionalidad()%></option>
                            <%} else {%>
                            <option value="<%=nac.getId_nacionalidad()%>" ><%=nac.getNo_nacionalidad()%></option>
                            <%}
                                }%>
                        </select></td></tr>  
                <tr><td>Distrito:</td><td>
                        <select name="DISTRITO" class="text-box chosen-select"  required="">
                            <option value="" >-----</option>
                            <%for (int index = 0; index < List_Distrito.size(); index++) {
                                    V_Ubigeo ub_dist = new V_Ubigeo();
                                    ub_dist = (V_Ubigeo) List_Distrito.get(index);
                            %>
                            <option value="<%=ub_dist.getId_distrito()%>"><%=ub_dist.getNo_distrito()%></option>
                            <%}%>
                        </select>

                    </td></tr> 
                <tr><td> Documento:</td><td>
                        <div class="item">
                            <select name="TIPO_DOC" class="required text-box select-doc "  required="">
                                <option value="">------</option>
                                <option value="1" selected="selected" >DNI</option>
                                <option value="2">Carné de Extranjeria</option>
                                <option value="3">Pasaporte</option>
                            </select>
                        </div> <div class="item">
                            <input type="text" name="NRO_DOC" class="text-box doc" id="doc" required=""></div></td></tr> 


                <tr><td>Estado Civil:</td><td>
                        <div class="item">
                            <select name="ESTADO_CIVIL"  class="text-box required" required="">
                                <option value="">-------------</option>
                                <option value="1">Soltero(a)</option>
                                <option value="2">Casado(a)</option>
                                <option value="3">Divorciado(a)</option>
                                <option value="4">Viudo(a)</option>
                                <option value="5">Separado(a)</option>
                                <option value="6">Conviviente(a)</option>
                            </select></div>
                    </td></tr>   
                <tr><td>Grupo Sanguineo:</td><td>
                        <select name="GRUPO_SANGUINEO" class="text-box">
                            <option value="">---</option>
                            <option value="1">A</option>
                            <option value="2">B</option>
                            <option value="3">AB</option>
                            <option value="4">0</option>
                        </select>Factor RH:
                        <select name="FACTOR_RH_ID" class="text-box">
                            <option value="">--------</option>
                            <option value="1">Positivo</option>
                            <option value="2">Negativo</option>
                        </select>
                    </td></tr>   
                <tr><td>Teléfono:</td><td><input type="text" name="TELEFONO" class="text-box" >Celular:<input type="text" name="CELULAR" class="text-box" ></td></tr>      
                <tr><td>Correo Personal:</td><td>
                        <div class="item">
                            <input type="email" name="CORREO_PERSONAL"  required="" class="text-box email"  >
                        </div>

                    </td></tr>  
                <tr><td>Correo Institucional:</td><td>

                        <div class="item">

                            <input type="email" name="CORREO_INST"  class="text-box email" >
                        </div>



                    </td></tr>    
                <tr><td>Sistema Pensionario:</td><td>
                        <div class="item">
                            <select name="SISTEMA_PENSIONARIO" class="text-box required"  required="">
                                <option value="">-----------</option>
                                <option value="1">AFP</option>
                                <option value="2">ONP</option>
                                <option value="3">Ninguno</option>
                                <option value="4">Sin Régimen Provisional(jubilado, cesante).</option>
                            </select></div>

                    </td></tr> 

                <tr><td>Nombre AFP :</td><td>
                        <select name="NOMBRE_AFP_ID" class="text-box">
                            <option value="">--------</option>
                            <option value="1">Integra</option>
                            <option value="2">Prima</option>
                            <option value="3">Profuturo</option>
                            <option value="4">Horizonte</option>
                            <option value="4">Habitat</option>

                        </select></td></tr> 
                <tr><td>Afiliado ESSALUD-VIDA:</td><td>
                        <select name="AFILIADO_ESSALUD_ID" class="text-box">
                            <option value="">----</option>
                            <option value="1">Si</option>
                            <option value="2">No</option>
                        </select></td></tr> 
                <tr><td>Tipo Trabajador:</td><td>
                        <select  name="TIPO_TRABAJADOR_ID" class="text-box" >
                            <option value="">----</option>
                            <option value="T" selected >Trabajador</option>
                            <option value="A">Alumno</option>
                        </select>
                    </td></tr>  
                <tr><td colspan="4"><div class="sub_title"><label class="label">Datos de la Situación Educativa</label></div></td></tr>

                <tr><td>Situación Educativa</td><td>
                        <div class="item">
                            <select name="NIVEL_EDUCATIVO" class="text-box required" required="">
                                <option value="">------</option>
                                <%for (int s = 0; s < List_Situacion_Educativa.size(); s++) {
                                        Situacion_Educativa e = new Situacion_Educativa();
                                        e = (Situacion_Educativa) List_Situacion_Educativa.get(s);
                                %>
                                <option value="<%=e.getId_situacion_educativa()%>"><%=e.getNo_s_educativa()%></option>
                                <%}%>

                            </select></div>
                    </td></tr>   

                <tr><td>¿Estudio en una institucion educativa del Perú?</td><td>
                        <div class="item">
                            <select name="" class="text-box required" required="">
                                <option value="">--------</option>
                                <option value="1">Si</option>
                                <option value="2">No</option>

                            </select></div>
                    </td></tr>  
                <tr><td>Regimen de la Institución Educativa</td><td>
                        <div class="item">
                            <select name="" id="rg" class="text-box required" required="">
                                <option value="">--------</option>
                                <option value="1">Publica</option>
                                <option value="2">Privada</option>

                            </select></div>
                    </td></tr>  
                <tr><td>Tipo de Institución</td><td>
                        <div class="item">
                            <select name="" id="ti_inst" required="">
                                <option value="">--------</option>
                            </select></div>
                    </td></tr>  

                <tr><td>Institución:</td><td>
                        <div class="item0">
                            <select name="CENTRO_DE_ESTUDIO" id="inst"  required=""> 
                                <option value="">----</option>
                            </select>
                        </div>
                    </td></tr>
                <tr><td>Carrera:(Modificar)</td><td>
                        <div class="item0">
                            <select name="CARRERA"  id="carrera"  required="">
                                <option value=""></option>
                            </select>
                        </div>
                    </td></tr>
                <tr><td>Año Egreso(Nuevo)</td><td>   <div class="item"><input type="text" name="" id="" class="text-box" required=""></div></td></tr> 

                <tr><td>Tipo Hora Pago Referencial:</td><td><input type="text" name="TIPO_HORA_PAGO_REFEERENCIAL"  value="0" class="text-box" ></td></tr> 
                <tr><td>Otros Estudios:</td><td colspan="3"><textarea name="OTROS_ESTUDIOS" class="text-box" cols="60" rows="6"></textarea></td></tr> 


                <tr><td colspan="4"><div class="sub_title"><label class="label">Domicilio Actual del Trabajador</label></div></td></tr>

                <tr><td>Dirección:</td><td> 
                        <div class="item">
                            <select name="DIR_DOM_A_D1_ID" class="text-box required" id="DOM_A_D1" required="">
                                <option value="">------</option>
                                <option value="1">Avenida</option>
                                <option value="2">Jiron</option>
                                <option value="3">Manzana</option>
                                <option value="4">Calle</option>
                                <option value="5">Pasaje</option>
                                <option value="6">Alameda</option>
                                <option value="7">Malecón</option>
                                <option value="8">Ovalo</option>
                                <option value="9">Plaza</option>
                                <option value="10">Carretera</option>
                                <option value="11">Block</option>
                            </select>
                        </div>
                        <div class="item"><input type="text" name="DIR_DOM_A_D2" id="DOM_A_D2" class="text-box" required=""></div>
                        <div class="item"><select name="DIR_DOM_A_D3_ID" class="text-box required" id="DOM_A_D3" required="">
                                <option value="">------</option>
                                <option value="1">Número</option>
                                <option value="2">Lote</option>
                                <option value="3">S/N</option>
                            </select></div><div class="item"><input type="text" name="DIR_DOM_A_D4" id="DOM_A_D4" class="text-box" required="" ></div></td></tr>  

                <tr><td> </td><td>
                        <div class="item">
                            <select  class="text-box required"  name="DIR_DOM_A_D5_ID" id="DOM_A_D5" required="">
                                <option value="">-----</option>
                                <option value="1">Urbanizacion</option>
                                <option value="2">Pueblo Joven</option>
                                <option value="3">Unidad Vecinal</option>
                                <option value="4">Conjuto Habitacional</option>
                                <option value="5">Asentamiento Humano</option>
                                <option value="6">Cooperativa</option>
                                <option value="7">Residencial</option>
                                <option value="8">Zona Industrial</option>
                                <option value="9">Grupo</option>
                                <option value="10">Caserío</option>
                                <option value="11">Fundo</option>
                                <option value="12">Ninguno</option>
                            </select></div>
                        <div class="item"><input type="text" name="DIR_DOM_A_D6" id="DOM_A_D6" class="text-box" required="" ></div></tr> 
                <tr><td>Referencia:</td><td>   <div class="item"><input type="text" name="DIR_DOM_A_REF" id="DOM_A_REF" class="text-box" required=""></div></td></tr> 
                <tr><td>Distrito:</td><td>
                        <div class="item0">
                            <select name="DIR_DOM_A_DISTRITO_ID" id="DOM_A_DISTRITO" class="chosen-select required" required="">
                                <option value="">----------</option>
                                <%for (int ff = 0; ff < List_Distrito.size(); ff++) {
                                        V_Ubigeo ub = new V_Ubigeo();
                                        ub = (V_Ubigeo) List_Distrito.get(ff);
                                %>
                                <option value="<%=ub.getId_distrito()%>"><%=ub.getNo_distrito()%></option>
                                <%}%></select>
                        </div>
                        <button onclick="duplicar();
                return false;" class="btn-duplicar" >duplicar</button></td></tr>



                <tr><td colspan="4"><div class="sub_title"><label class="label">Domicilio Legal (segun DNI)</label></div></td></tr>

                <tr><td>Dirección:</td><td>
                        <div class="item">
                            <select name="DIR_DOM_LEG_D1_ID" class="text-box required"  id="DOM_LEG_D1" required="">

                                <option value=""></option>
                                <option value="1">Avenida</option>
                                <option value="2">Jiron</option>
                                <option value="3">Manzana</option>
                                <option value="4">Calle</option>
                                <option value="5">Pasaje</option>
                                <option value="6">Alameda</option>
                                <option value="7">Malecón</option>
                                <option value="8">Ovalo</option>
                                <option value="9">Plaza</option>
                                <option value="10">Carretera</option>
                                <option value="11">Block</option>

                            </select>
                        </div>
                        <div class="item"><input type="text" name="DIR_DOM_LEG_D2" id="DOM_LEG_D2" class="text-box"  required=""></div>
                        <div class="item">
                            <select name="DIR_DOM_LEG_D3_ID"  id="DOM_LEG_D3" class="text-box required"  required="">
                                <option value="">----------</option>
                                <option value="1">Número</option>
                                <option value="2">Lote</option>
                                <option value="3">S/N</option>
                            </select>
                        </div>
                        <div class="item">
                            <input type="text" name="DIR_DOM_LEG_D4" id="DOM_LEG_D4" class="text-box"  required=""></div></td></tr> 
                <tr><td> </td><td>
                        <div class="item">
                            <select name="DIR_DOM_LEG_D5_ID" id="DOM_LEG_D5" class="text-box required" required="">
                                <option value="">-----------</option>
                                <option value="1">Urbanizacion</option>
                                <option value="2">Pueblo Joven</option>
                                <option value="3">Unidad Vecinal</option>
                                <option value="4">Conjuto Habitacional</option>
                                <option value="5">Asentamiento Humano</option>
                                <option value="6">Cooperativa</option>
                                <option value="7">Residencial</option>
                                <option value="8">Zona Industrial</option>
                                <option value="9">Grupo</option>
                                <option value="10">Caserío</option>
                                <option value="11">Fundo</option>
                                <option value="12">Ninguno</option>  
                            </select>
                        </div>
                        <div class="item"> <input type="text" name="DIR_DOM_LEG_D6" id="DOM_LEG_D6" class="text-box"  required=""></div></td></tr> 

                <tr><td>Distrito:</td><td>
                        <div class="item">
                            <select name="DIR_DOM_LEG_DISTRITO_ID"   id="DOM_LEG_DISTRITO" class="text-box required" required="">
                                <option value="">----------</option>
                                <%for (int i = 0; i < List_Distrito.size(); i++) {
                                        V_Ubigeo ub = new V_Ubigeo();
                                        ub = (V_Ubigeo) List_Distrito.get(i);
                                %>
                                <option value="<%=ub.getId_distrito()%>"><%=ub.getNo_distrito()%></option>
                                <%}%> 
                            </select></div>
                    </td></tr>
                <tr><td colspan="4"><div class="sub_title"><label class="label">Ingresos de Quinta Categoria</label></div></td></tr>
                <input type="hidden" name="REFERENCIA" class="text-box"  > 
                <tr><td>Empresa:</td><td><input type="text" name="ING_QTA_CAT_EMPRESA" class="text-box" ></td></tr> 
                <tr><td>RUC:</td><td><input type="text" name="ING_QTA_CAT_RUC" class="text-box" ></td></tr> 
                <tr><td>Otras Empresas:</td><td><textarea name="ING_QTA_CAT_OTRAS_EMPRESAS" class="text-box" cols="60" rows="6"></textarea></td></tr> 
                <tr><td colspan="4"><div class="sub_title"><label class="label">Informacion Religiosa</label></div></td></tr>
                <tr><td>Religión:</td><td>
                        <div class="item">
                            <select  name="RELIGION" required class="text-box required">
                                <option value="">-----</option>
                                <option value="1">Adventista</option>
                                <option value="2">Catolico</option>
                                <option value="3">Otros</option>
                            </select>
                        </div>
                    </td></tr>  
                <tr><td>Iglesia:</td><td><div class="item"><input type="text" name="IGLESIA" class="text-box"  required></div></td></tr>  
                <tr><td>Cargo en la Iglesia:</td><td><input type="text" name="CARGO" class="text-box" ></td></tr>  
                <tr><td>Autoridad:</td><td>
                        <select name="AUTORIDAD" class="text-box">
                            <option value="">-----</option>
                            <option value="1">Pastor</option>
                            <option value="2">Primer Anciano</option>
                            <option value="3">Sacerdote</option>
                        </select></td></tr>  
                <tr><td>Nombres y Apellidos:</td><td><input type="text" name="AUT_APELLIDOSNOMBRES" class="text-box" ></td></tr> 
                <tr><td>Telefono/Celular:</td><td><input type="text" name="AUT_CELULAR" class="text-box" ></td></tr>   
                <tr><td>Observaciones:</td><td> <textarea  name="OBSERVACIONES" class="text-box" cols="60" rows="6"></textarea></td></tr> 
                <input type="hidden" value="<%=iduser%>" name="USER_CREACION" class="text-box" >
                <input type="hidden" value="" name="FECHA_CREACION" class="text-box" >
                <input type="hidden" value="" name="USUARIO_IP" class="text-box" >
                <tr><td colspan="2"><input type="submit" name="opc"  class="submit" value="Registrar"></td></tr> 
            </table></form></center><br><br>
</body>

<script src="../js2/prism.jss" type="text/javascript" charset="utf-8"></script>
<script src="../../js/chosen.jquery.js" type="text/javascript"></script>
<script src="../../js/prism.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
            var config = {
                '.chosen-select': {},
                '.chosen-select-deselect': {allow_single_deselect: true},
                '.chosen-select-no-single': {disable_search_threshold: 10},
                '.chosen-select-no-results': {no_results_text: 'Oops, nothing found!'},
                '.chosen-select-width': {width: "95%"}
            }
            for (var selector in config) {
                $(selector).chosen(config[selector]);
            }
</script>
<script src="../../js/Js_Validar/multifield.js"></script>
<script src="../../js/Js_Validar/validator.js"></script>
<script>
            // initialize the validator function
            validator.message['date'] = 'not a real date';

            // validate a field on "blur" event, a 'select' on 'change' event & a '.reuired' classed multifield on 'keyup':
            $('form')
                    .on('blur', 'input[required], input.optional, select.required', validator.checkField)
                    .on('change', 'select.required', validator.checkField)
                    .on('keypress', 'input[required][pattern]', validator.keypress);

            $('.multi.required')
                    .on('keyup blur', 'input', function() {
                validator.checkField.apply($(this).siblings().last()[0]);
            });

            // bind the validation to the form submit event
            //$('#send').click('submit');//.prop('disabled', true);

            $('form').submit(function(e) {
                e.preventDefault();
                var submit = true;
                // evaluate the form using generic validaing
                if (!validator.checkAll($(this))) {
                    submit = false;
                }

                if (submit)
                    this.submit();
                return false;
            });

            /* FOR DEMO ONLY */
            $('#vfields').change(function() {
                $('form').toggleClass('mode2');
            }).prop('checked', false);

            $('#alerts').change(function() {
                validator.defaults.alerts = (this.checked) ? false : true;
                if (this.checked)
                    $('form .alert').remove();
            }).prop('checked', false);
</script>

<script type="text/javascript">
    $("#docs").numeric();
    $("#doc").numeric(false, function() {
        alert("Solo Numeros Enteros");
        this.value = "";
        this.focus();
    });
    $(".positive").numeric({negative: false}, function() {
        alert("No negative values");
        this.value = "";
        this.focus();
    });
    $(".positive-integer").numeric({decimal: false, negative: false}, function() {
        alert("Positive integers only");
        this.value = "";
        this.focus();
    });

    $("#remove").click(
            function(e)
            {
                e.preventDefault();
                $(".numeric,.integer,.positive").removeNumeric();
            }
    );
</script>

<script>
    function  duplicar() {

        var DAD1 = $("#DOM_A_D1").val();
        var DAD2 = $("#DOM_A_D2").val();
        var DAD3 = $("#DOM_A_D3").val();
        var DAD4 = $("#DOM_A_D4").val();
        var DAD5 = $("#DOM_A_D5").val();
        var DAD6 = $("#DOM_A_D6").val();


        var DADIS = $("#DOM_A_DISTRITO").val();

        $("#DOM_LEG_D1").val(DAD1);
        $("#DOM_LEG_D2").val(DAD2);
        $("#DOM_LEG_D3").val(DAD3);
        $("#DOM_LEG_D4").val(DAD4);
        $("#DOM_LEG_D5").val(DAD5);
        $("#DOM_LEG_D6").val(DAD6);
        $("#DOM_LEG_DISTRITO").val(DADIS);

    }


</script>
<script type="text/javascript">
    $("#rg").change(function() {
        var ti = $("#ti_inst");
        ti.empty();
        var rg = $("#rg").val();
        var data = "regimen=" + rg + "&opc=ti_inst";

        ti.append('<option value="">Cargando...</option>').val('');
        $.post("../../detalle_carrera", data, function(objJson) {
            ti.empty();
            if (objJson.rpta == -1) {
                alert(objJson.mensaje);
                return;
            }
            var lista = objJson.lista;
            if (lista.length > 0) {
                ti.append("<option value='0'>[Seleccione]</option>");
            } else {
                ti.append("<option value='0'>[No hay cuentas]</option>");
            }
            for (var i = 0; i < lista.length; i++) {
                var item = "<option value='" + lista[i].id + "'>" + lista[i].descripcion + "</option>";
                ti.append(item);
            }
        });
    });


    $("#ti_inst").change(function() {
        var cboCuenta = $("#inst");
        cboCuenta.empty();
        var sucursal = $("#ti_inst").val();
        /* if (sucursal == '000') {
         return;
         }*/
        var data = "sucursal=" + sucursal + "&opc=institucion";
        cboCuenta.append('<option value="">Cargando...</option>').val('');
        $.post("../../detalle_carrera", data, function(objJson) {
            cboCuenta.empty();
            if (objJson.rpta == -1) {
                alert(objJson.mensaje);
                return;
            }
            var lista = objJson.lista;
            if (lista.length > 0) {
                cboCuenta.append("<option value='0'>[Seleccione]</option>");
            } else {
                cboCuenta.append("<option value='0'>[No hay cuentas]</option>");
            }
            for (var i = 0; i < lista.length; i++) {
                var item = "<option value='" + lista[i].id + "'>" + lista[i].descripcion + "</option>";
                cboCuenta.append(item);
            }
        });
    });
    $("#inst").change(function() {
        var cboCuenta = $("#carrera");
        cboCuenta.empty();
        var sucursal = $("#inst").val();
        /* if (sucursal == '000') {
         return;
         }*/
        var data = "inst=" + sucursal + "&opc=carrera";
        cboCuenta.append('<option value="">Cargando...</option>').val('');
        $.post("../../detalle_carrera", data, function(objJson) {
            cboCuenta.empty();
            if (objJson.rpta == -1) {
                alert(objJson.mensaje);
                return;
            }
            var lista = objJson.lista;
            if (lista.length > 0) {
                cboCuenta.append("<option value='0'>[Seleccione]</option>");
            } else {
                cboCuenta.append("<option value='0'>[No hay cuentas]</option>");
            }
            for (var i = 0; i < lista.length; i++) {
                var item = "<option value='" + lista[i].id + "'>" + lista[i].descripcion + "</option>";
                cboCuenta.append(item);
            }
        });
    });
    /*$("#cboCuenta").change(function() {
     var cuenta = $("#cboCuenta").val();
     if (cuenta == "0") {
     return;
     }
     alert("Cuenta: " + cuenta);
     });*/
</script>
</html>
