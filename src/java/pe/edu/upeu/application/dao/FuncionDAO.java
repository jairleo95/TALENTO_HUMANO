/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package pe.edu.upeu.application.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import pe.edu.upeu.application.dao_imp.InterfaceFuncionDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;
import pe.edu.upeu.application.model.Funciones;

/**
 *
 * @author joserodrigo
 */
public class FuncionDAO implements InterfaceFuncionDAO{
    ConexionBD cnn;
    
    @Override
    public List<Funciones> Listar_funciones() {
         this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "SELECT f.ID_FUNCION,f.DE_FUNCION,f.ES_FUNCION,f.US_CREACION,f.FE_CREACION,f.US_MODIF,f.FE_MODIF,f.ID_PUESTO,p.NO_PUESTO FROM RHTD_FUNCION f, RHTR_PUESTO p where f.ID_PUESTO=p.ID_PUESTO ";
        List<Funciones> Lista = new ArrayList<Funciones>();
        try {
            ResultSet rs = this.cnn.query(sql);

            while (rs.next()) {
                Funciones x = new Funciones();
                x.setId_fucion(rs.getString("ID_FUNCION"));
                x.setDe_funcion(rs.getString("DE_FUNCION"));
                x.setEs_funcion(rs.getString("ES_FUNCION"));
                x.setUs_creacion(rs.getString("US_CREACION"));
                x.setFe_creacion(rs.getString("FE_CREACION"));
                x.setUs_modif(rs.getString("US_MODIF"));
                x.setFe_modif(rs.getString("FE_MODIF"));
                x.setId_puesto(rs.getString("ID_PUESTO"));
                x.setNo_puesto(rs.getString("NO_PUESTO"));
                Lista.add(x);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } finally {
            this.cnn.close();
        }
        return Lista;
    }    

    @Override
    public List<Map<String, ?>> Listar_fun_x_pu(String id_pu) {
        List<Map<String, ?>> Lista = new ArrayList<Map<String, ?>>();
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "SELECT f.ID_FUNCION,f.DE_FUNCION,f.ES_FUNCION,p.ID_PUESTO,p.NO_PUESTO FROM RHTD_FUNCION f,RHTR_PUESTO p where p.ID_PUESTO = f.ID_PUESTO and f.ID_PUESTO='"+id_pu.trim()+"'";
            ResultSet rs = this.cnn.query(sql);
            while (rs.next()) {
                Map<String, Object> rec = new HashMap<String, Object>();
                rec.put("id_fu", rs.getString("ID_FUNCION"));
                rec.put("nom_fu", rs.getString("DE_FUNCION"));
                rec.put("es_fu", rs.getString("ES_FUNCION"));
                rec.put("id_pu", rs.getString("ID_PUESTO"));
                rec.put("no_pu", rs.getString("NO_PUESTO"));
                Lista.add(rec);
            }
            rs.close();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error!");
        } finally {
            try {
                this.cnn.close();
            } catch (Exception e) {
            }
        }
        return Lista;
    }
}
