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
import pe.edu.upeu.application.dao_imp.InterfaceValidarFoto;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;

/**
 *
 * @author USUARIO
 */
public class ValidarFotoDAO implements InterfaceValidarFoto{
  ConexionBD cnn;
    @Override
    public List<Map<String, ?>> ListFotos(String tipo) {
        List<Map<String, ?>> lista = new ArrayList<Map<String, ?>>();
        this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select * " +
         "from  RHTR_FOTOS_TRABAJADOR a , RHTM_TRABAJADOR b " +
         "where a.ID_TRABAJADOR = b.ID_TRABAJADOR" ;
         
        if(tipo.equals("2")){
          sql += " and a.EFOTO BETWEEN 1 and 2";
        }else{
         sql += " and a.EFOTO =0";
        }
        try {
            ResultSet rs = this.cnn.query(sql);
            
            while (rs.next()) {
                Map<String, Object> cd = new HashMap<String, Object>();
                cd.put("ID_TRABAJADOR",rs.getString("ID_TRABAJADOR"));
                cd.put("AR_FOTO",rs.getString("AR_FOTO"));
                cd.put("AP_PATERNO",rs.getString("AP_PATERNO"));
                cd.put("AP_MATERNO",rs.getString("AP_MATERNO"));
                cd.put("NO_TRABAJADOR",rs.getString("NO_TRABAJADOR"));
                cd.put("EFOTO",rs.getString("EFOTO"));
                cd.put("NU_DOC",rs.getString("NU_DOC"));
                
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

    @Override
    public void validar(String idtr, String estado) {
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = cnn.conex.prepareCall("{CALL RHSP_VAL_FOTO_TRABAJADOR( ?, ?)}");
            cst.setString(1, idtr);
            cst.setString(2, estado);

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

   
    }
    

