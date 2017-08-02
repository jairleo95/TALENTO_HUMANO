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

    public boolean Reg_PresupuestoArea(Object s);

    public ArrayList<Map<String, ?>> comprobar(String idDestino);

    public ArrayList<Map<String, ?>> dataPresupuesto(String idDestino);

    public ArrayList<Map<String, ?>> pActual(String idDestino);
    
    public boolean statusPresupuesto(String idDestino);
    
    public ArrayList<Map<String, ?>> CCostos(String id,int tipo);
    
}
