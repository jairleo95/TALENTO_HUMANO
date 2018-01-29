/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.dao_imp;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Leandro Burgos
 */
public interface InterfacePresupuestoDAO {

    public String Reg_Presupuesto(Object s);
    
    public int comprobarContratadosByDept(String idDestino, String idReq);

    public int comprobarContratadosByArea(String idDestino, String idReq);
    
    public int comprobarContratadosByPuesto(String idDestino, String idReq);
    
    public int calcTrabPresByDept(String idDestino, String idReq);
    
    public int calcTrabPresByArea(String idPres, String idReq);

    public ArrayList<Map<String, ?>> getPresupuestoActual(String idDestino);
    
    public String getIdPresupuestoActual(String idDestino);
    
    public String getIdDetallePresupuestoActual(String id, String idreq);

    public ArrayList<Map<String, ?>> getDetallePresupuestoActual(String idDestino);

    public String statusPresupuesto(String idDestino);
    
    public List<Map<String, Object>> listDetPres(String idpres);

    public ArrayList<Map<String, ?>> CCostos(String id, int tipo);

    public boolean Reg_DetPresupuesto(Object s);

    public ArrayList<Map<String, ?>> historial_cont(String idDestino);

    public boolean Reg_Temporada(String nombre, String f_i, String f_f, String id, String destino);

    public ArrayList<Map<String, ?>> listTemporadas(String idDestino);

    public boolean Reg_Det_Presupuesto(Object s);

    public ArrayList<Map<String, ?>> listDetPresupuesto(Object s);

    public ArrayList<Map<String, ?>> compDet(String idPresupuesto, int con, int time);
    
    public List<Map<String, Object>> listDetPrePuesto(String idDetalle);
    
    public Map<String, Object> getDetPrePuesto(String idpres, String idpuesto);

    public ArrayList<Map<String, ?>> listDetalleTra(String idDetalle);

    public ArrayList<Map<String, ?>> listDetalleTraPuesto(String idPuesto, String idDet_pre_puesto);

    public boolean Reg_DetTraPuesto(String idPuesto, String idDet, int ntra);

    public ArrayList<Map<String, ?>> infoPrePuesto(String idPuesto,String idDetPres);
    
    public int checkNumTraDispByDetPres(String idDetPres);
    
    public boolean UpdateDetSueldo(Object s);

    public boolean Reg_DetSueldo(Object s);

}
