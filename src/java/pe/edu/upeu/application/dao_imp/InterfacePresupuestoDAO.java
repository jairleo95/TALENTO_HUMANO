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
    
    public int comprobarContratadosInDeptByIdPP(String idPP);

    public int comprobarContratadosByArea(String idDestino, String idReq);
    
    public Map<String,Object> comprobarContratadosAndPresInAreaByIdPP(String idPP);
    
    public int comprobarContratadosByPuesto(String idDestino, String idReq);
    
    public int calcTrabPresByDept(String idDestino, String idReq);
    
    public int calcTrabPresInDeptByIdPP(String idPP);
    
    public int calcTrabPresByArea(String idPres, String idReq);

    public ArrayList<Map<String, ?>> getPresupuestoActual(String idDestino);
    
    public String getIdPresupuestoActual(String idDestino);
    
    public String getIdDetallePresupuestoActual(String id, String idreq);

    public ArrayList<Map<String, ?>> getDetallePresupuestoActual(String idDestino);

    public String statusPresupuesto(String idDestino, String temp);
    
    public List<Map<String, Object>> listDetPres(String idpres);
    
    public List<Map<String, Object>> listResumenPresupuesto(String dir, String dep, String area, String puesto, String req);

    public ArrayList<Map<String, ?>> CCostos(String id, int tipo);

    public boolean Reg_DetPresupuesto(Object s);

    public ArrayList<Map<String, ?>> historial_cont(String idDestino);

    public boolean Reg_Temporada(String nombre, String f_i, String f_f, String id, String destino);
    
    public boolean RegSolFueraPresupuesto(String idpp, int ntra, String com, String iduser);
    
    public ArrayList<Map<String, Object>> listSolFP();
    
    public ArrayList<Map<String, Object>> listAllSolFP(String idDep, String idArea, String idSeccion, String idPuesto);
    
    public int updateSFP(String idsfp, String est, String obs, String iduser);
    
    public boolean updatePresPuestoTrab(String idpp, int extra);
    
    public Map<String, Object> getTrabPresAndCon(String idpp);

    public ArrayList<Map<String, ?>> listTemporadas(String idDestino);
    
    public Map<String, Object> getTemporadaByIdPres(String idDestino);

    public boolean Reg_Det_Presupuesto(Object s);
    
    public int updateDetPresupuesto(String idDet,int ntra);

    public ArrayList<Map<String, ?>> listDetPresupuesto(Object s);

    public ArrayList<Map<String, Object>> compDet(String idPresupuesto, String idreq);
    
    public List<Map<String, Object>> listDetPrePuesto(String idDetalle);
    
    public Map<String, Object> getDetPrePuesto(String idpres, String idpuesto);

    public ArrayList<Map<String, ?>> listDetalleTra(String idDetalle);

    public ArrayList<Map<String, Object>> listDetalleTraPuesto(String idPuesto, String idDet_pre_puesto);
    
    public Map<String, Object> getTrabDispAndPresTotal(String idDet, String idpp);

    public boolean Reg_DetTraPuesto(String idPuesto, String idDet, int ntra);
    
    public boolean updateDetTraPuesto(String idpp, int ntra);

    public ArrayList<Map<String, ?>> infoPrePuesto(String idPuesto,String idDetPres);
    
    public int checkNumTraDispByDetPres(String idDetPres);
    
    public boolean UpdateDetSueldo(Object s);

    public boolean Reg_DetSueldo(Object s);
    
    public ArrayList<Map<String, Object>> getAllFltrPresupuesto(String idArea, String idDep, String idDir, String idReq, String idPuesto);
    
    public List<Map<String, Object>> getAllFltrDetPres(String idpres, String idPuesto, String idReq);

}
