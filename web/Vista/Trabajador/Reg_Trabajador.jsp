<%@page import="pe.edu.upeu.application.model.Ub_Departamento"%>
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
<jsp:useBean id="List_Departamento" scope="application" class="java.util.ArrayList"/>
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
                        $("#nac").change(
                                function() {
                                    if ($("#nac").val() != "NAC-0044") {
                                        $("#dist").hide();
                                    }
                                    if ($("#nac").val() == "NAC-0044") {

                                        $("#dist").show();
                                    }
                                }
                        );

                        $("#sit_edu").change(function() {
                            if ($("#sit_edu").val() == 'SED-0011' | $("#sit_edu").val() == 'SED-0013' | $("#sit_edu").val() == 'SED-0014'
                                    | $("#sit_edu").val() == 'SED-0015'
                                    | $("#sit_edu").val() == 'SED-0016' | $("#sit_edu").val() == 'SED-0017'
                                    | $("#sit_edu").val() == 'SED-0017' | $("#sit_edu").val() == 'SED-0018'
                                    | $("#sit_edu").val() == 'SED-0019' | $("#sit_edu").val() == 'SED-0020'
                                    | $("#sit_edu").val() == 'SED-0021') {

                                $("#es_inst_p").show();

                            }
                            else {
                                $("#es_inst_p").hide();
                                $("#regimen").hide();
                                $("#egreso").hide();
                                $("#ti").hide();
                                $("#institucion").hide();
                                $("#carr").hide();

                            }

                        });

                        $("#es_inst_p").change(function() {
                            if ($("#inst_peru").val() == "1") {
                                $("#regimen").show();
                                $("#egreso").show();
                                $("#ti").show();
                                $("#institucion").show();
                                $("#carr").show();
                            } else {
                                $("#regimen").hide();
                                $("#egreso").hide();
                                $("#ti").hide();
                                $("#institucion").hide();
                                $("#carr").hide();

                            }

                        });

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

    <center>
        <script type="text/javascript">
            Esperar();
        </script>
        <label class="title">FICHA DE DATOS DEL TRABAJADOR </label>

        <br>
        <br>
        <form class="form" action="../../trabajador" method="post" novalidate="" > 

            <table class="table" >      


                <tr><td colspan="4"><div class="sub_title"><label class="label">Datos Personales</label></div></td></tr>
                <tr ><td >Apellido Paterno:</td><td>
                        <div class="item">
                            <input type="text" name="APELLIDO_P"  required=""  class="text-box"  onkeyup="this.value = this.value.toUpperCase()" maxlength="50" >
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
                            <input type="text" name="APELLIDO_M" required=""  class="text-box" onkeyup="this.value = this.value.toUpperCase()" maxlength="50" >
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
                            <input type="text" name="NOMBRES" class="text-box" required="" onkeyup="this.value = this.value.toUpperCase()" maxlength="50">
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
                            <p class="edad">
                            <div class="alerta-req" style="display: none;">Es un menor de edad</div>
                            </p>
                        </div>
                    </td>
                </tr>   
                <tr><td>Nacionalidad:</td><td>
                        <select name="NACIONALIDAD" class="text-box chosen-select" id="nac"  required="">
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
                <tr id="dist"><td>Lugar de Nacimiento: </td>

                    <td>
                        Departamento:
                        <select  id="dep_nac" class="text-box chosen-select"  required="">
                            <option value="" >-----</option>
                            <%for (int d = 0; d < List_Departamento.size(); d++) {
                                    Ub_Departamento dep = new Ub_Departamento();
                                    dep = (Ub_Departamento) List_Departamento.get(d);

                            %>
                            <option value="<%=dep.getId_departamento()%>" ><%=dep.getNo_departamento()%></option>
                            <%}%>
                        </select>
                        Provincia:
                        <select  id="pro_nac" class="text-box"  required="">
                            <option value="" >-----</option>

                        </select>
                        Distrito:
                        <div class="item">
                            <select name="DISTRITO" id="dist_nac" class="text-box"  required="">
                                <option value="" >-----</option>
                        </div>
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
                            <input type="text" name="NRO_DOC" class="text-box doc" id="doc" required="" maxlength="10"></div></td></tr> 
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
                <tr><td>Teléfono:</td><td><input type="text" name="TELEFONO" class="text-box" maxlength="50">Celular:<input type="text" name="CELULAR" class="text-box" maxlength="38"></td></tr>      
                <tr><td>Correo Personal:</td><td>
                        <div class="item">
                            <input type="email" name="CORREO_PERSONAL"  required="" class="text-box email" maxlength="100" >
                        </div>

                    </td></tr>  
                <tr><td>Correo Institucional:</td><td>

                        <div class="item">

                            <input type="email" name="CORREO_INST" required="" class="text-box email" maxlength="100" >
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
                            <select name="NIVEL_EDUCATIVO"  id="sit_edu" class="text-box required" required="">
                                <option value="">------</option>
                                <%for (int s = 0; s < List_Situacion_Educativa.size(); s++) {
                                        Situacion_Educativa e = new Situacion_Educativa();
                                        e = (Situacion_Educativa) List_Situacion_Educativa.get(s);
                                %>
                                <option value="<%=e.getId_situacion_educativa()%>"><%=e.getNo_s_educativa()%></option>
                                <%}%>

                            </select></div>
                    </td></tr>   

                <tr id="es_inst_p"style="display: none"><td>¿Estudio en una institucion educativa del Perú?</td><td>
                        <div class="item">
                            <select name="ES_INST_PERU" id="inst_peru" class="text-box required" required="">
                                <option value="">--------</option>
                                <option value="1">Si</option>
                                <option value="2">No</option>

                            </select></div>
                    </td></tr>  
                <tr id="regimen" style="display: none"><td>Regimen de la Institución Educativa</td><td>
                        <div class="item">
                            <select name="REGIMEN" id="rg" class="text-box required" required="" >
                                <option value="">--------</option>
                                <option value="1">Publica</option>
                                <option value="2">Privada</option>

                            </select></div>
                    </td></tr>  
                <tr id="ti"style="display: none" ><td>Tipo de Institución</td><td>
                        <div class="item">
                            <select name="" id="ti_inst" class="text-box" >
                                <option value="">--------</option>
                            </select></div>
                    </td></tr>  

                <tr id="institucion"style="display: none"><td>Institución:</td><td>
                        <div class="item">
                            <select name="" id="inst"  class="text-box"> 
                                <option value="">----</option>
                            </select>
                        </div>
                    </td></tr>
                <tr id="carr"style="display: none"><td>Carrera:</td><td>
                        <div class="item">
                            <select name="CARRERA"  id="carrera"  class="text-box">
                                <option value="">-----</option>
                            </select>
                        </div>
                    </td></tr>
                <tr id="egreso" style="display: none"><td>Año Egreso(Nuevo)</td><td>   <div class="item"><input type="text" name="A_EGRESO" id="" class="text-box"></div></td></tr> 

                <tr><td>Tipo Hora Pago Referencial:</td><td><input type="text" name="TIPO_HORA_PAGO_REFEERENCIAL"  value="0" class="text-box" maxlength="6"></td></tr> 
                <tr><td>Otros Estudios:</td><td colspan="3"><textarea name="OTROS_ESTUDIOS" class="text-box" cols="60" rows="6" maxlength="500"></textarea></td></tr> 


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
                        <div class="item"><input type="text" name="DIR_DOM_A_D2" id="DOM_A_D2" class="text-box" required="" maxlength="100"></div>
                        <div class="item"><select name="DIR_DOM_A_D3_ID" class="text-box required" id="DOM_A_D3" required="">
                                <option value="">------</option>
                                <option value="1">Número</option>
                                <option value="2">Lote</option>
                                <option value="3">S/N</option>
                            </select></div><div class="item"><input type="text" name="DIR_DOM_A_D4" id="DOM_A_D4" class="text-box" required="" maxlength="100"></div></td></tr>  

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
                        <div class="item"><input type="text" name="DIR_DOM_A_D6" id="DOM_A_D6" class="text-box" required="" maxlength="100"></div></tr> 
                <tr><td>Referencia:</td><td>   <div class="item"><input type="text" name="DIR_DOM_A_REF" id="DOM_A_REF" class="text-box" required="" maxlength="200"></div></td></tr> 



                <tr><td></td><td> Departamento:
                        <select  id="dep_dir_a" class="text-box chosen-select"  required="">
                            <option value="" >-----</option>
                            <%for (int d = 0; d < List_Departamento.size(); d++) {
                                    Ub_Departamento dep = new Ub_Departamento();
                                    dep = (Ub_Departamento) List_Departamento.get(d);

                            %>
                            <option value="<%=dep.getId_departamento()%>" ><%=dep.getNo_departamento()%></option>
                            <%}%>
                        </select>
                        Provincia:
                        <select  id="pro_dir_a" class="text-box"  required="">
                            <option value="" >-----</option>

                        </select>Distrito:
                        <div class="item">
                            <select name="DIR_DOM_A_DISTRITO_ID" id="DOM_A_DISTRITO" class="text-box required" required="">
                                <option value="">----------</option>
                            </select>
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
                        <div class="item"><input type="text" name="DIR_DOM_LEG_D2" id="DOM_LEG_D2" class="text-box"  required="" maxlength="100"></div>
                        <div class="item">
                            <select name="DIR_DOM_LEG_D3_ID"  id="DOM_LEG_D3" class="text-box required"  required="">
                                <option value="">----------</option>
                                <option value="1">Número</option>
                                <option value="2">Lote</option>
                                <option value="3">S/N</option>
                            </select>
                        </div>
                        <div class="item">
                            <input type="text" name="DIR_DOM_LEG_D4" id="DOM_LEG_D4" class="text-box"  required="" maxlength="100"></div></td></tr> 
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
                        <div class="item"> <input type="text" name="DIR_DOM_LEG_D6" id="DOM_LEG_D6" class="text-box"  required="" maxlength="100"></div></td></tr> 

                <tr><td></td><td> Departamento:
                        <select  id="dep_dir_l" class="text-box"  required="">
                            <option value="" >-----</option>
                            <%for (int d = 0; d < List_Departamento.size(); d++) {
                                    Ub_Departamento dep = new Ub_Departamento();
                                    dep = (Ub_Departamento) List_Departamento.get(d);

                            %>
                            <option value="<%=dep.getId_departamento()%>" ><%=dep.getNo_departamento()%></option>
                            <%}%>
                        </select>
                        Provincia:
                        <select  id="pro_dir_l" class="text-box"  required="">
                            <option value="" >-----</option>

                        </select>Distrito:
                        <div class="item">
                            <select name="DIR_DOM_LEG_DISTRITO_ID"   id="DOM_LEG_DISTRITO" class="text-box required" required="">
                                <option value="">----------</option>

                            </select></div>
                    </td></tr>
                <tr><td colspan="4"><div class="sub_title"><label class="label">Ingresos de Quinta Categoria</label></div>
                        <input type="hidden" name="REFERENCIA" class="text-box"  > </td></tr>
                <tr><td>Empresa:</td><td><input type="text" name="ING_QTA_CAT_EMPRESA" class="text-box" maxlength="100"></td></tr> 
                <tr><td>RUC:</td><td><input type="text" name="ING_QTA_CAT_RUC" class="text-box" maxlength="20"></td></tr> 
                <tr><td>Otras Empresas:</td><td><textarea name="ING_QTA_CAT_OTRAS_EMPRESAS" class="text-box" cols="60" rows="6" maxlength="500"></textarea></td></tr> 
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
                <tr><td>Iglesia:</td><td><div class="item"><input type="text" name="IGLESIA" class="text-box"  required="" maxlength="30"></div></td></tr>  
                <tr><td>Cargo en la Iglesia:</td><td><input type="text" name="CARGO" class="text-box" maxlength="30"></td></tr>  
                <tr><td>Autoridad:</td><td>
                        <select name="AUTORIDAD" class="text-box">
                            <option value="">-----</option>
                            <option value="1">Pastor</option>
                            <option value="2">Primer Anciano</option>
                            <option value="3">Sacerdote</option>
                        </select></td></tr>  
                <tr><td>Nombres y Apellidos:</td><td><input type="text" name="AUT_APELLIDOSNOMBRES" class="text-box" maxlength="90"></td></tr> 
                <tr><td>Telefono/Celular:</td><td><input type="text" name="AUT_CELULAR" class="text-box" maxlength="20"></td></tr>   
                <tr><td>Observaciones:</td><td> <textarea  name="OBSERVACIONES" class="text-box" cols="60" rows="6" maxlength="500"></textarea>
                        <input type="hidden" value="<%=iduser%>" name="USER_CREACION" class="text-box" ></td></tr> 
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

        var DEP_A = $("#dep_dir_a").val();


        var DADIS = $("#DOM_A_DISTRITO").val();

        $("#DOM_LEG_D1").val(DAD1);
        $("#DOM_LEG_D2").val(DAD2);
        $("#DOM_LEG_D3").val(DAD3);
        $("#DOM_LEG_D4").val(DAD4);
        $("#DOM_LEG_D5").val(DAD5);
        $("#DOM_LEG_D6").val(DAD6);
        $("#DOM_LEG_DISTRITO").val(DADIS);
        $("#dep_dir_l").val(DEP_A);

    }


</script>
<script type="text/javascript">
    /*Ubigeo*/
    $("#dep_nac").change(function() {
        var ti = $("#pro_nac");
        ti.empty();
        var rg = $("#dep_nac").val();
        var data = "id_dep=" + rg + "&opc=dep_nac";
        ti.append('<option value="">Cargando...</option>').val('');
        $.post("../../ubigeo", data, function(objJson) {
            ti.empty();
            if (objJson.rpta == -1) {
                alert(objJson.mensaje);
                return;
            }
            var lista = objJson.lista;
            if (lista.length > 0) {
                ti.append("<option value=''>[Seleccione]</option>");
            } else {
                ti.append("<option value=''>[]</option>");
            }
            for (var i = 0; i < lista.length; i++) {
                var item = "<option value='" + lista[i].id + "'>" + lista[i].descripcion + "</option>";
                ti.append(item);
            }
        });
    });
    $("#pro_nac").change(function() {
        var ti = $("#dist_nac");
        ti.empty();
        var rg = $("#pro_nac").val();
        var data = "id_dist=" + rg + "&opc=pro_nac";
        ti.append('<option value="">Cargando...</option>').val('');
        $.post("../../ubigeo", data, function(objJson) {
            ti.empty();
            if (objJson.rpta == -1) {
                alert(objJson.mensaje);
                return;
            }
            var lista = objJson.lista;
            if (lista.length > 0) {
                ti.append("<option value=''>[Seleccione]</option>");
            } else {
                ti.append("<option value=''>[]</option>");
            }
            for (var i = 0; i < lista.length; i++) {
                var item = "<option value='" + lista[i].id + "'>" + lista[i].descripcion + "</option>";
                ti.append(item);
            }
        });
    });
    $("#dep_dir_a").change(function() {
        var ti = $("#pro_dir_a");
        ti.empty();
        var rg = $("#dep_dir_a").val();
        var data = "id_dep=" + rg + "&opc=dep_nac";
        ti.append('<option value="">Cargando...</option>').val('');
        $.post("../../ubigeo", data, function(objJson) {
            ti.empty();
            if (objJson.rpta == -1) {
                alert(objJson.mensaje);
                return;
            }
            var lista = objJson.lista;
            if (lista.length > 0) {
                ti.append("<option value=''>[Seleccione]</option>");
            } else {
                ti.append("<option value=''>[]</option>");
            }
            for (var i = 0; i < lista.length; i++) {
                var item = "<option value='" + lista[i].id + "'>" + lista[i].descripcion + "</option>";
                ti.append(item);
            }
        });
    });
    $("#pro_dir_a").change(function() {
        var ti = $("#DOM_A_DISTRITO");
        ti.empty();
        var rg = $("#pro_dir_a").val();
        var data = "id_dist=" + rg + "&opc=pro_nac";
        ti.append('<option value="">Cargando...</option>').val('');
        $.post("../../ubigeo", data, function(objJson) {
            ti.empty();
            if (objJson.rpta == -1) {
                alert(objJson.mensaje);
                return;
            }
            var lista = objJson.lista;
            if (lista.length > 0) {
                ti.append("<option value=''>[Seleccione]</option>");
            } else {
                ti.append("<option value=''>[]</option>");
            }
            for (var i = 0; i < lista.length; i++) {
                var item = "<option value='" + lista[i].id + "'>" + lista[i].descripcion + "</option>";
                ti.append(item);
            }
        });
    });
    $("#dep_dir_l").change(function() {
        var ti = $("#pro_dir_l");
        ti.empty();
        var rg = $("#dep_dir_l").val();
        var data = "id_dep=" + rg + "&opc=dep_nac";
        ti.append('<option value="">Cargando...</option>').val('');
        $.post("../../ubigeo", data, function(objJson) {
            ti.empty();
            if (objJson.rpta == -1) {
                alert(objJson.mensaje);
                return;
            }
            var lista = objJson.lista;
            if (lista.length > 0) {
                ti.append("<option value=''>[Seleccione]</option>");
            } else {
                ti.append("<option value=''>[]</option>");
            }
            for (var i = 0; i < lista.length; i++) {
                var item = "<option value='" + lista[i].id + "'>" + lista[i].descripcion + "</option>";
                ti.append(item);
            }
        });
    });
    $("#pro_dir_l").change(function() {
        var ti = $("#DOM_LEG_DISTRITO");
        ti.empty();
        var rg = $("#pro_dir_l").val();
        var data = "id_dist=" + rg + "&opc=pro_nac";
        ti.append('<option value="">Cargando...</option>').val('');
        $.post("../../ubigeo", data, function(objJson) {
            ti.empty();
            if (objJson.rpta == -1) {
                alert(objJson.mensaje);
                return;
            }
            var lista = objJson.lista;
            if (lista.length > 0) {
                ti.append("<option value=''>[Seleccione]</option>");
            } else {
                ti.append("<option value=''>[]</option>");
            }
            for (var i = 0; i < lista.length; i++) {
                var item = "<option value='" + lista[i].id + "'>" + lista[i].descripcion + "</option>";
                ti.append(item);
            }
        });
    });




    /*Datos Academicos*/
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
                ti.append("<option value=''>[Seleccione]</option>");
            } else {
                ti.append("<option value=''>[]</option>");
            }
            for (var i = 0; i < lista.length; i++) {
                var item = "<option value='" + lista[i].id + "'>" + lista[i].descripcion + "</option>";
                ti.append(item);
            }
        });
    });


    $("#ti_inst").change(function() {
        var inst = $("#inst");
        inst.empty();
        var ti = $("#ti_inst").val();
        /* if (sucursal == '000') {
         return;
         }*/
        var data = "ti=" + ti + "&opc=institucion";
        inst.append('<option value="">Cargando...</option>').val('');
        $.post("../../detalle_carrera", data, function(objJson) {
            inst.empty();
            if (objJson.rpta == -1) {
                alert(objJson.mensaje);
                return;
            }
            var lista = objJson.lista;
            if (lista.length > 0) {
                inst.append("<option value='0'>[Seleccione]</option>");
            } else {
                inst.append("<option value='0'>[]</option>");
            }
            for (var i = 0; i < lista.length; i++) {
                var item = "<option value='" + lista[i].id + "'>" + lista[i].descripcion + "</option>";
                inst.append(item);
            }
        });
    });
    $("#inst").change(function() {
        var carr = $("#carrera");
        carr.empty();
        var insti = $("#inst").val();
        /* if (sucursal == '000') {
         return;
         }*/
        var data = "inst=" + insti + "&opc=carrera";
        carr.append('<option value="">Cargando...</option>').val('');
        $.post("../../detalle_carrera", data, function(objJson) {
            carr.empty();
            if (objJson.rpta == -1) {
                alert(objJson.mensaje);
                return;
            }
            var lista = objJson.lista;
            if (lista.length > 0) {
                carr.append("<option value='0'>[Seleccione]</option>");
            } else {
                carr.append("<option value='0'>[]</option>");
            }
            for (var i = 0; i < lista.length; i++) {
                var item = "<option value='" + lista[i].id + "'>" + lista[i].descripcion + "</option>";
                carr.append(item);
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
