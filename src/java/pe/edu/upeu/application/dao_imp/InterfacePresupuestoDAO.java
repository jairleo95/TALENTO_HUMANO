/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.dao_imp;

import java.util.ArrayList;
import java.util.Map;

/**
 *
 * @author Leandro Burgos
 */
public interface InterfacePresupuestoDAO {

    public String Reg_Presupuesto(Object s);

    public ArrayList<Map<String, ?>> comprobar(String idDestino);

    public ArrayList<Map<String, ?>> dataPresupuesto(String idDestino);

    public ArrayList<Map<String, ?>> pActual(String idDestino);

    public String statusPresupuesto(String idDestino);

    public ArrayList<Map<String, ?>> CCostos(String id, int tipo);

    public boolean Reg_DetPresupuesto(Object s);

    public ArrayList<Map<String, ?>> historial_cont(String idDestino);

    public boolean Reg_Temporada(String nombre, String f_i, String f_f, String id, String destino);

    public ArrayList<Map<String, ?>> listTemporadas(String idDestino);

    public boolean Reg_Det_Presupuesto(Object s);

    public ArrayList<Map<String, ?>> listDetPresupuesto(Object s);

    public ArrayList<Map<String, ?>> compDet(String idPresupuesto, int con, int time);

    public ArrayList<Map<String, ?>> listDetalleTra(String idDetalle);

    public ArrayList<Map<String, ?>> listDetalleTraPuesto(String idPuesto, String idDet_pre_puesto);

}
