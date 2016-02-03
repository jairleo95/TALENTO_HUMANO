/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.dao;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import pe.edu.upeu.application.dao_imp.InterfaceFotos_TrabajadorDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;

/**
 *
 * @author Alfa.sistemas
 */
public class Fotos_TrabajadorDAO implements InterfaceFotos_TrabajadorDAO {

    ConexionBD cnn;

    @Override
    public String List_id_Fotos_Trabajador(String idtr) {
        this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select id_foto from rhtr_fotos_trabajador where id_trabajador='" + idtr + "' ";
        String id = "";
        try {
            ResultSet rs = this.cnn.query(sql);
            while (rs.next()) {
                id = rs.getString("id_foto");
            }
        } catch (SQLException e) {
        }
        return id;
    }

    @Override
    public void INSERT_FOTOS_TRABAJADOR(String ID_FOTO, String DE_FOTO, String AR_FOTO, String NO_AR_FOTO, String TA_AR_FOTO, String TI_AR_FOTO, String ID_TRABAJADOR) {
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = cnn.conex.prepareCall("{CALL RHSP_INSERT_FOTOS_TRABAJADOR( ?, ?, ?, ?, ?, ?, ?)}");
            cst.setString(1, null);
            cst.setString(2, DE_FOTO);
            cst.setString(3, AR_FOTO);
            cst.setString(4, NO_AR_FOTO);
            cst.setString(5, TA_AR_FOTO);
            cst.setString(6, TI_AR_FOTO);
            cst.setString(7, ID_TRABAJADOR);
            cst.execute();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error al subir foto de trabajador...");
        } finally {
            try {
                this.cnn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
    }

    @Override
    public List<Map<String, ?>> Fotos_usuario(String idtr,String tipo) {
        
    List<Map<String, ?>> lista = new ArrayList<Map<String, ?>>();
    String tabla ;     
          if(tipo.equals("todo")){
           tabla ="rhth_fotos_trabajador";    
          }else{
           tabla ="rhtr_fotos_trabajador";
          }
        this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select * from "+tabla+" where id_trabajador= '"+idtr+"'";
        try {
            ResultSet rs = this.cnn.query(sql);
            
            while (rs.next()) {
                Map<String, Object> cd = new HashMap<String, Object>();
                cd.put("ar_foto",rs.getString("ar_foto"));
                cd.put("EFOTO",rs.getString("EFOTO"));
              lista.add(cd);
            }
      } catch (SQLException ex) {
            throw new RuntimeException(ex.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR : " + e.getMessage());
        } finally {
            try {
                this.cnn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
        return lista;
    }

}
