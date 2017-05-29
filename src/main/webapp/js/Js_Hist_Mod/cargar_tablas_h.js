/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function cargar_historial(lista, text) {
    var x = ["ID_TRABAJADOR",
        "APELLIDO PATERNO",
        "APELLIDO MATERNO",
        "NOMBRES",
        "TIPO DE DOCUMENTO",
        "NUMERO DE DOCUMENTO",
        "ESTADO CIVIL",
        " FECHA DE NACIMIENTO",
        "NACIONALIDAD",
        "DEPARTAMENTO",
        "PROVINCIA",
        "DISTRITO",
        "TELEFONO",
        "CELULAR",
        "CORREO PERSONAL",
        "CORREO INSTITUCIONAL",
        "SISTEMA PENSIONARIO",
        "SITUACION EDUCATIVA",
        "REGIMEN SITUACION EDUCATIVA",
        "INSTITUCION EDUCATIVA PERUANA",
        "UNIVERSIDAD",
        "CARRERA",
        "AÑO DE EGRESO",
        "OTROS ESTUDIOS",
        "SEXO",
        "GRUPO SANGUINEO",
        "REFERENCIA",
        "RELIGION",
        "IGLESIA",
        "CARGO",
        "AUTORIDAD",
        "NOMBRES AUTORIDAD",
        "CELULAR AUTORIDAD",
        "NOMBRE AFP",
        "ESSALUD",
        "TIPO DE TRABAJADOR",
        "TIPO HORA DE PAGO REFEERENCIAL",
        "FACTOR RH",
        "VIA",
        "NOMBRE VIA",
        "UBICACION",
        "NOMBRE UBICACION",
        "ZONA",
        "NOMBRE ZONA",
        "REFERENCIA DIRECCION",
        "DISTRITO",
        "VIA(DNI)",
        "NOMBRE VIA(DNI)",
        "UBICACION(DNI)",
        "NOMBRE UBICACION(DNI)",
        "ZONA (DNI)",
        "NOMBRE ZONA (DNI)",
        "DISTRITO (DNI)",
        "EMPRESA( 5TA CATEGORIA)",
        "RUC",
        "OTRAS EMPRESAS",
        "CM_OBSERVACIONES",
        "USUARIO CREACION",
        "FECHA DE CREACION",
        "USUARIO MODIFICADOR",
        "FECHA DE MODIFICACION",
        "IP DE USUARIO",
        "APELLIDOS Y NOMBRES PADRE",
        "APELLIDOS Y NOMBRES MADRE",
        "TRABAJA EN LA UPEU(CONYUGE)",
        "APELLIDOS Y NOMBRES (CONYUGE)",
        "FECHA DE NACIMIENTO(CONYUGE)",
        "TIPO DE DOCUEMNTO CONYUGE",
        "NUMERO DE DOCUMENTO CONYUGE",
        "ESSALUD (CONYUGE)",
        "ID CONYUGUE",
        "CODIGO UNIVERSITARIO",
        "SEMESTRE",
        "¿PROCESADO?"

    ];
    var cont = 0;
    text += "<tr class='roh" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deth" + cont + "'>" + lista[0].col1 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roh" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deth" + cont + "'>" + lista[0].col2 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roh" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deth" + cont + "'>" + lista[0].col3 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roh" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deth" + cont + "'>" + lista[0].col4 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roh" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deth" + cont + "'>" + lista[0].col5 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roh" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deth" + cont + "'>" + lista[0].col6 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roh" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    switch (parseInt(lista[0].col7)) {
        case 1:
            text += "<td class='deth" + cont + "'>SOLTERO(A)</td>";
            break;
        case 2:
            text += "<td class='deth" + cont + "'>CASADO(A)</td>";
            break;
        case 3:
            text += "<td class='deth" + cont + "'>DIVORCIADO(A)</td>";
            break;
        case 4:
            text += "<td class='deth" + cont + "'>VIUDO(A)</td>";
            break;
        case 5:
            text += "<td class='deth" + cont + "'>SEPARADO(A)</td>";
            break;
        case 6:
            text += "<td class='deth" + cont + "'>CONVIVIENTE</td>";
            break;
        default:
            text += "<td class='deth" + cont + "'>SIN DATOS</td>";
    }
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roh" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deth" + cont + "'>" + lista[0].col8 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roh" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deth" + cont + "'>" + lista[0].col9 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roh" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deth" + cont + "'>" + lista[0].col10 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roh" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deth" + cont + "'>" + lista[0].col11 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roh" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deth" + cont + "'>" + lista[0].col12 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roh" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deth" + cont + "'>" + lista[0].col13 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roh" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deth" + cont + "'>" + lista[0].col14 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roh" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deth" + cont + "'>" + lista[0].col15 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roh" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deth" + cont + "'>" + lista[0].col16 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roh" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    switch (parseInt(lista[0].col17)) {
        case 1:
            text += "<td class='deth" + cont + "'>AFP</td>";
            break;
        case 2:
            text += "<td class='deth" + cont + "'>ONP</td>";
            break;
        case 3:
            text += "<td class='deth" + cont + "'>SIN REGIMEN PROVISIONAL</td>";
            break;
        case 4:
            text += "<td class='deth" + cont + "'>FUERA DE PLANILLA</td>";
            break;
        default:
            text += "<td class='deth" + cont + "'>SIN DATOS</td>";
    }

    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roh" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deth" + cont + "'>" + lista[0].col18 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roh" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deth" + cont + "'>" + lista[0].col19 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roh" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deth" + cont + "'>" + lista[0].col20 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roh" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deth" + cont + "'>" + lista[0].col21 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roh" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deth" + cont + "'>" + lista[0].col22 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roh" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deth" + cont + "'>" + lista[0].col23 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roh" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deth" + cont + "'>" + lista[0].col24 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roh" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";

    if (lista[0].col25 == 'M') {
        text += "<td class='deth" + cont + "'>Masculino</td>";
    } else if (lista[0].col25 == 'F') {
        text += "<td class='deth" + cont + "'>Femenino</td>";
    } else {
        text += "<td class='deth" + cont + "'>SIN DATOS</td>";
    }
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roh" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deth" + cont + "'>" + lista[0].col26 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roh" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deth" + cont + "'>" + lista[0].col27 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roh" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deth" + cont + "'>" + lista[0].col28 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roh" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deth" + cont + "'>" + lista[0].col29 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roh" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deth" + cont + "'>" + lista[0].col30 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roh" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deth" + cont + "'>" + lista[0].col31 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roh" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deth" + cont + "'>" + lista[0].col32 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roh" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deth" + cont + "'>" + lista[0].col33 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roh" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deth" + cont + "'>" + lista[0].col34 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roh" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deth" + cont + "'>" + lista[0].col35 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roh" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deth" + cont + "'>" + lista[0].col36 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roh" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deth" + cont + "'>" + lista[0].col37 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roh" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deth" + cont + "'>" + lista[0].col38 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roh" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deth" + cont + "'>" + lista[0].col39 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roh" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deth" + cont + "'>" + lista[0].col40 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roh" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deth" + cont + "'>" + lista[0].col41 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roh" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deth" + cont + "'>" + lista[0].col42 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roh" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deth" + cont + "'>" + lista[0].col43 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roh" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deth" + cont + "'>" + lista[0].col44 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roh" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deth" + cont + "'>" + lista[0].col45 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roh" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deth" + cont + "'>" + lista[0].col46 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roh" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deth" + cont + "'>" + lista[0].col47 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roh" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deth" + cont + "'>" + lista[0].col48 + "</td>";
    text += "</tr>";
    cont = cont + 1;
    text += "<tr class='roh" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deth" + cont + "'>" + lista[0].col49 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roh" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deth" + cont + "'>" + lista[0].col50 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roh" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deth" + cont + "'>" + lista[0].col51 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roh" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deth" + cont + "'>" + lista[0].col52 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roh" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deth" + cont + "'>" + lista[0].col53 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roh" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deth" + cont + "'>" + lista[0].col54 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roh" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deth" + cont + "'>" + lista[0].col55 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roh" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deth" + cont + "'>" + lista[0].col56 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roh" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deth" + cont + "'>" + lista[0].col57 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roh" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deth" + cont + "'>" + lista[0].col58 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roh" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deth" + cont + "'>" + lista[0].col59 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roh" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deth" + cont + "'>" + lista[0].col60 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roh" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deth" + cont + "'>" + lista[0].col61 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roh" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deth" + cont + "'>" + lista[0].col62 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roh" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deth" + cont + "'>" + lista[0].col63 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roh" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deth" + cont + "'>" + lista[0].col64 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roh" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deth" + cont + "'>" + lista[0].col65 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roh" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deth" + cont + "'>" + lista[0].col66 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roh" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deth" + cont + "'>" + lista[0].col67 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roh" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deth" + cont + "'>" + lista[0].col68 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roh" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deth" + cont + "'>" + lista[0].col69 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roh" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deth" + cont + "'>" + lista[0].col70 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roh" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deth" + cont + "'>" + lista[0].col71 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roh" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deth" + cont + "'>" + lista[0].col72 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roh" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deth" + cont + "'>" + lista[0].col73 + "</td>";
    text += "</tr>";
    cont = cont + 1;
    
    text += "<tr class='roh" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    if(lista[0].col74==0){
        text+="<td class='smart-form deth" + cont + "'>";
        text+="<label class='toggle'>";
        text+="<input type='checkbox' value=''  class='ck_procesadoh'  name='estado' name='checkbox-toggle' >";
        text+="<i data-swchon-text='SI' data-swchoff-text='NO'></i></label></td>";
    }else{
      text += "<td class='deth" + cont + "'>Si</td>";  
    }
    
    text += "</tr>";
    cont = cont + 1;    

    return text;

}
;
function cargar_actual(lista, text) {
    var x = ["ID_TRABAJADOR",
        "APELLIDO PATERNO",
        "APELLIDO MATERNO",
        "NOMBRES",
        "TIPO DE DOCUMENTO",
        "NUMERO DE DOCUMENTO",
        "ESTADO CIVIL",
        " FECHA DE NACIMIENTO",
        "NACIONALIDAD",
        "DEPARTAMENTO",
        "PROVINCIA",
        "DISTRITO",
        "TELEFONO",
        "CELULAR",
        "CORREO PERSONAL",
        "CORREO INSTITUCIONAL",
        "SISTEMA PENSIONARIO",
        "SITUACION EDUCATIVA",
        "REGIMEN SITUACION EDUCATIVA",
        "INSTITUCION EDUCATIVA PERUANA",
        "UNIVERSIDAD",
        "CARRERA",
        "AÑO DE EGRESO",
        "OTROS ESTUDIOS",
        "SEXO",
        "GRUPO SANGUINEO",
        "REFERENCIA",
        "RELIGION",
        "IGLESIA",
        "CARGO",
        "AUTORIDAD",
        "NOMBRES AUTORIDAD",
        "CELULAR AUTORIDAD",
        "NOMBRE AFP",
        "ESSALUD",
        "TIPO DE TRABAJADOR",
        "TIPO HORA DE PAGO REFEERENCIAL",
        "FACTOR RH",
        "VIA",
        "NOMBRE VIA",
        "UBICACION",
        "NOMBRE UBICACION",
        "ZONA",
        "NOMBRE ZONA",
        "REFERENCIA DIRECCION",
        "DISTRITO",
        "VIA(DNI)",
        "NOMBRE VIA(DNI)",
        "UBICACION(DNI)",
        "NOMBRE UBICACION(DNI)",
        "ZONA (DNI)",
        "NOMBRE ZONA (DNI)",
        "DISTRITO (DNI)",
        "EMPRESA( 5TA CATEGORIA)",
        "RUC",
        "OTRAS EMPRESAS",
        "CM_OBSERVACIONES",
        "USUARIO CREACION",
        "FECHA DE CREACION",
        "USUARIO MODIFICADOR",
        "FECHA DE MODIFICACION",
        "IP DE USUARIO",
        "APELLIDOS Y NOMBRES PADRE",
        "APELLIDOS Y NOMBRES MADRE",
        "TRABAJA EN LA UPEU(CONYUGE)",
        "APELLIDOS Y NOMBRES (CONYUGE)",
        "FECHA DE NACIMIENTO(CONYUGE)",
        "TIPO DE DOCUEMNTO CONYUGE",
        "NUMERO DE DOCUMENTO CONYUGE",
        "ESSALUD (CONYUGE)",
        "ID CONYUGUE",
        "CODIGO UNIVERSITARIO",
        "SEMESTRE",
        "¿PROCESADO?"

    ];
    var cont = 0;
    text += "<tr class='roa" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deta" + cont + "'>" + lista[0].col1 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roa" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deta" + cont + "'>" + lista[0].col2 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roa" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deta" + cont + "'>" + lista[0].col3 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roa" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deta" + cont + "'>" + lista[0].col4 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roa" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deta" + cont + "'>" + lista[0].col5 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roa" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deta" + cont + "'>" + lista[0].col6 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roa" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    switch (parseInt(lista[0].col7)) {
        case 1:
            text += "<td class='deta" + cont + "'>SOLTERO(A)</td>";
            break;
        case 2:
            text += "<td class='deta" + cont + "'>CASADO(A)</td>";
            break;
        case 3:
            text += "<td class='deta" + cont + "'>DIVORCIADO(A)</td>";
            break;
        case 4:
            text += "<td class='deta" + cont + "'>VIUDO(A)</td>";
            break;
        case 5:
            text += "<td class='deta" + cont + "'>SEPARADO(A)</td>";
            break;
        case 6:
            text += "<td class='deta" + cont + "'>CONVIVIENTE</td>";
            break;
        default:
            text += "<td class='deta" + cont + "'>SIN DATOS</td>";
    }
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roa" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deta" + cont + "'>" + lista[0].col8 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roa" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deta" + cont + "'>" + lista[0].col9 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roa" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deta" + cont + "'>" + lista[0].col10 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roa" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deta" + cont + "'>" + lista[0].col11 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roa" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deta" + cont + "'>" + lista[0].col12 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roa" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deta" + cont + "'>" + lista[0].col13 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roa" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deta" + cont + "'>" + lista[0].col14 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roa" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deta" + cont + "'>" + lista[0].col15 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roa" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deta" + cont + "'>" + lista[0].col16 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roa" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    switch (parseInt(lista[0].col17)) {
        case 1:
            text += "<td class='deta" + cont + "'>AFP</td>";
            break;
        case 2:
            text += "<td class='deta" + cont + "'>ONP</td>";
            break;
        case 3:
            text += "<td class='deta" + cont + "'>SIN REGIMEN PROVISIONAL</td>";
            break;
        case 4:
            text += "<td class='deta" + cont + "'>FUERA DE PLANILLA</td>";
            break;
        default:
            text += "<td class='deta" + cont + "'>SIN DATOS</td>";
    }
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roa" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deta" + cont + "'>" + lista[0].col18 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roa" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deta" + cont + "'>" + lista[0].col19 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roa" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deta" + cont + "'>" + lista[0].col20 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roa" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deta" + cont + "'>" + lista[0].col21 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roa" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deta" + cont + "'>" + lista[0].col22 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roa" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deta" + cont + "'>" + lista[0].col23 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roa" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deta" + cont + "'>" + lista[0].col24 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roa" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    if (lista[0].col25 == 'M') {
        text += "<td class='deta" + cont + "'>Masculino</td>";
    } else if (lista[0].col25 == 'F') {
        text += "<td class='deta" + cont + "'>Femenino</td>";
    } else {
        text += "<td class='deta" + cont + "'>SIN DATOS</td>";
    }
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roa" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deta" + cont + "'>" + lista[0].col26 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roa" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deta" + cont + "'>" + lista[0].col27 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roa" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deta" + cont + "'>" + lista[0].col28 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roa" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deta" + cont + "'>" + lista[0].col29 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roa" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deta" + cont + "'>" + lista[0].col30 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roa" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deta" + cont + "'>" + lista[0].col31 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roa" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deta" + cont + "'>" + lista[0].col32 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roa" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deta" + cont + "'>" + lista[0].col33 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roa" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deta" + cont + "'>" + lista[0].col34 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roa" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deta" + cont + "'>" + lista[0].col35 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roa" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deta" + cont + "'>" + lista[0].col36 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roa" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deta" + cont + "'>" + lista[0].col37 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roa" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deta" + cont + "'>" + lista[0].col38 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roa" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deta" + cont + "'>" + lista[0].col39 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roa" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deta" + cont + "'>" + lista[0].col40 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roa" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deta" + cont + "'>" + lista[0].col41 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roa" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deta" + cont + "'>" + lista[0].col42 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roa" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deta" + cont + "'>" + lista[0].col43 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roa" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deta" + cont + "'>" + lista[0].col44 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roa" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deta" + cont + "'>" + lista[0].col45 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roa" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deta" + cont + "'>" + lista[0].col46 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roa" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deta" + cont + "'>" + lista[0].col47 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roa" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deta" + cont + "'>" + lista[0].col48 + "</td>";
    text += "</tr>";
    cont = cont + 1;
    text += "<tr class='roa" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deta" + cont + "'>" + lista[0].col49 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roa" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deta" + cont + "'>" + lista[0].col50 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roa" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deta" + cont + "'>" + lista[0].col51 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roa" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deta" + cont + "'>" + lista[0].col52 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roa" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deta" + cont + "'>" + lista[0].col53 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roa" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deta" + cont + "'>" + lista[0].col54 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roa" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deta" + cont + "'>" + lista[0].col55 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roa" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deta" + cont + "'>" + lista[0].col56 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roa" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deta" + cont + "'>" + lista[0].col57 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roa" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deta" + cont + "'>" + lista[0].col58 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roa" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deta" + cont + "'>" + lista[0].col59 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roa" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deta" + cont + "'>" + lista[0].col60 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roa" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deta" + cont + "'>" + lista[0].col61 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roa" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deta" + cont + "'>" + lista[0].col62 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roa" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deta" + cont + "'>" + lista[0].col63 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roa" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deta" + cont + "'>" + lista[0].col64 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roa" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deta" + cont + "'>" + lista[0].col65 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roa" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deta" + cont + "'>" + lista[0].col66 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roa" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deta" + cont + "'>" + lista[0].col67 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roa" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deta" + cont + "'>" + lista[0].col68 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roa" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deta" + cont + "'>" + lista[0].col69 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roa" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deta" + cont + "'>" + lista[0].col70 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roa" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deta" + cont + "'>" + lista[0].col71 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roa" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deta" + cont + "'>" + lista[0].col72 + "</td>";
    text += "</tr>";
    cont = cont + 1;

    text += "<tr class='roa" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    text += "<td class='deta" + cont + "'>" + lista[0].col73 + "</td>";
    text += "</tr>";
    cont = cont + 1;
    
    text += "<tr class='roa" + cont + "'>";
    text += "<td>" + (cont + 1) + "</td>";
    text += "<td>" + x[cont] + "</td>";
    if(lista[0].col74==0){
        text+="<td class='smart-form deta" + cont + "'>";
        text+="<label class='toggle'>";
        text+="<input type='checkbox' value=''  class='ck_procesadoa'  name='estado' name='checkbox-toggle' >";
        text+="<i data-swchon-text='SI' data-swchoff-text='NO'></i></label></td>";
    }else{
      text += "<td class='deta" + cont + "'>Si</td>";  
    }
    
    text += "</tr>";
    cont = cont + 1;

    return text;

}
;