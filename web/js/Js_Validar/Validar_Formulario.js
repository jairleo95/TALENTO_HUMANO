/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function calcular_edad(fecha) {
    /* format 2016-12-11 yyyy-mm-dd
     * 09
     * */
    var fechaActual = new Date();
    var diaActual = fechaActual.getDate();
    var mmActual = fechaActual.getMonth() + 1;
    var yyyyActual = fechaActual.getFullYear();
    var FechaNac = fecha.split("-");
    var diaCumple = FechaNac[2];
    var mmCumple = FechaNac[1];
    var yyyyCumple = FechaNac[0];
    //retiramos el primer cero de la izquierda
    if (mmCumple.substr(0, 1) == 0) {
        mmCumple = mmCumple.substring(1, 2);
    }
    if (diaCumple.substr(0, 1) == 0) {
        diaCumple = diaCumple.substring(1, 2);
    }
    var edad = yyyyActual - yyyyCumple;
    if ((mmActual < mmCumple) || (mmActual == mmCumple && diaActual < diaCumple)) {
        edad--;
    }
    return edad;
}

