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
import pe.edu.upeu.application.dao_imp.InterfaceComentario_DGPDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;
import pe.edu.upeu.application.model.X_List_Comen_DGP;

/**
 *
 * @author Admin
 */
public class Comentario_DGPDAO implements InterfaceComentario_DGPDAO {

    ConexionBD conn;

    @Override
    public void INSERT_COMENTARIO_DGP(String ID_COMENTARIO_DGP, String ID_DGP, String ID_AUTORIZACION, String CM_COMENTARIO, String US_CREACION, String FE_CREACION, String US_MODIFICACION, String FE_MODIFICACION, String ES_COMENTARIO_DGP) {

        CallableStatement cst;
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            cst = conn.conex.prepareCall("{CALL RHSP_INSERT_COMENTARIO_DGP( ?, ?, ?, ?, ?, ?, ?, ?)}");
            cst.setString(1, ID_COMENTARIO_DGP);
            cst.setString(2, ID_DGP);
            cst.setString(3, ID_AUTORIZACION);
            cst.setString(4, CM_COMENTARIO);
            cst.setString(5, US_CREACION);
            cst.setString(6, US_MODIFICACION);
            cst.setString(7, FE_MODIFICACION);
            cst.setString(8, ES_COMENTARIO_DGP);
            cst.execute();
       } catch (SQLException ex) {
            throw new RuntimeException(ex.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR : " + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
    }

    @Override
    public List<Map<String, ?>> List_Comentario_DGP(String id_dgp) {
        List<Map<String, ?>> lista = new ArrayList<Map<String, ?>>();
        
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select * from rhtr_comentario_dgp cm, rhvd_usuario u where cm.us_creacion=u.id_usuario and cm.id_dgp='" + id_dgp + "' order by cm.id_comentario_dgp ASC";
        try {
            ResultSet rs = this.conn.query(sql);
            
            while (rs.next()) {
                Map<String, Object> cd = new HashMap<String, Object>();

                cd.put("id_comentario_dgp",rs.getString("id_comentario_dgp"));
                cd.put("id_dgp",rs.getString("id_dgp"));
                cd.put("id_utorizacion",rs.getString("id_autorizacion"));
                cd.put("cm_comentaio",rs.getString("cm_comentario"));
                cd.put("us_creacion",rs.getString("us_creacion"));
                cd.put("fe_creacion",rs.getString("fe_creacion"));
                cd.put("us_modificacion",rs.getString("us_modificacion"));
                cd.put("fe_modificacion",rs.getString("fe_modificacion"));
                cd.put("es_comentario_dgp",rs.getString("es_comentario_dgp"));
                cd.put("id_trabajador",rs.getString("id_trabajador"));
                cd.put("id_rol",rs.getString("id_rol"));
                cd.put("id_empleado",rs.getString("id_empleado"));
                cd.put("no_usuario",rs.getString("no_usuario"));
                cd.put("pw_usuario",rs.getString("pw_usuario"));
                cd.put("no_puesto",rs.getString("no_puesto"));
                cd.put("id_puesto",rs.getString("id_puesto"));
                cd.put("no_area",rs.getString("no_area"));
                cd.put("id_area",rs.getString("id_area"));
                cd.put("no_dep",rs.getString("no_dep"));
                cd.put("id_departamento",rs.getString("id_departamento"));
                cd.put("no_direccion",rs.getString("no_direccion"));
                cd.put("id_direccion",rs.getString("id_direccion"));
                cd.put("id_seccion",rs.getString("id_seccion"));
                cd.put("no_seccion",rs.getString("no_seccion"));
                cd.put("no_trabajador",rs.getString("no_trabajador"));
                cd.put("ap_paterno",rs.getString("ap_paterno"));
                cd.put("ap_materno",rs.getString("ap_materno"));
                cd.put("fe_creacion",rs.getString("fe_creacion"));
                cd.put("ar_foto",rs.getString("ar_foto"));
              lista.add(cd);
            }
      } catch (SQLException ex) {
            throw new RuntimeException(ex.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR : " + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
        return lista;
    }

    @Override
    public String Comentario_dgp_aut(String iddgp, String id_aut) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "SELECT (CM_COMENTARIO||'/'||US_CREACION||'/'||to_char(FE_CREACION,'dd-mm-yy'))AS INF FROM  RHTR_COMENTARIO_DGP WHERE ID_DGP='"+iddgp.trim()+"' and ID_AUTORIZACION='"+id_aut.trim()+"'";
        String info_comentario = "";
        try {
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                info_comentario = rs.getString("INF");
            }
      } catch (SQLException ex) {
            throw new RuntimeException(ex.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR : " + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
        return info_comentario;
    }

}
