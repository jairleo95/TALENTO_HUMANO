/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.dao;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.AbstractList;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.swing.JOptionPane;
import pe.edu.upeu.application.dao_imp.InterfaceCentro_CostosDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;
import pe.edu.upeu.application.model.Centro_Costos;
import pe.edu.upeu.application.model.Detalle_Centro_Costo;

/**
 *
 * @author JAIR
 */
public class Centro_CostoDAO implements InterfaceCentro_CostosDAO {

    ConexionBD cnn;

    @Override
    public List<Map<String, ?>> List_centro_costo(String iddep) {

        List<Map<String, ?>> Lista = new ArrayList<Map<String, ?>>();
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "select id_centro_costo, CO_CENTRO_COSTO ||' -  '||DE_CENTRO_COSTO as DE_CENTRO_COSTO from rhtr_centro_costo where  id_departamento='" + iddep.trim() + "' ";
            ResultSet rs = this.cnn.query(sql);
            while (rs.next()) {
                Map<String, Object> rec = new HashMap<String, Object>();
                rec.put("id", rs.getString("id_centro_costo"));
                rec.put("nombre", rs.getString("DE_CENTRO_COSTO"));
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

    @Override
    public List<Centro_Costos> List_centro_costo() {
        this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select ID_CENTRO_COSTO,CO_CENTRO_COSTO,ID_DEPARTAMENTO,CO_CENTRO_COSTO ||' -  '||DE_CENTRO_COSTO as DE_CENTRO_COSTO   from RHTR_CENTRO_COSTO order by DE_CENTRO_COSTO";
        List<Centro_Costos> list = new ArrayList<Centro_Costos>();
        try {
            ResultSet rs = this.cnn.query(sql);
            while (rs.next()) {
                Centro_Costos d = new Centro_Costos();
                d.setId_centro_costo(rs.getString("ID_CENTRO_COSTO"));
                d.setDe_centro_costo(rs.getString("DE_CENTRO_COSTO"));
                d.setCo_centro_costo(rs.getString("CO_CENTRO_COSTO"));
                d.setId_departamento(rs.getString("ID_DEPARTAMENTO"));
                list.add(d);
            }
        } catch (SQLException e) {
        } finally {
            this.cnn.close();
        }

        return list;
    }

    @Override
    public List<Map<String, ?>> Direccion_CC() {

        List<Map<String, ?>> Lista = new ArrayList<Map<String, ?>>();
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "select distinct(d.id_direccion) as id_direccion, d.no_direccion    from rhtr_centro_costo cc, rhtx_departamento dp , rhtx_direccion d where dp.id_departamento = cc.id_departamento and  dp.id_direccion = d.id_direccion ORDER BY d.NO_DIRECCION";
            ResultSet rs = this.cnn.query(sql);
            while (rs.next()) {
                Map<String, Object> rec = new HashMap<String, Object>();
                rec.put("id", rs.getString("id_direccion"));
                rec.put("nombre", rs.getString("no_direccion"));
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

    @Override
    public List<Map<String, ?>> Departamento_CC(String iddir) {

        List<Map<String, ?>> Lista = new ArrayList<Map<String, ?>>();
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "select  distinct (cc.id_departamento) as id_departamento,dp.no_dep   from rhtr_centro_costo cc, rhtx_departamento dp , rhtx_direccion d where dp.id_departamento = cc.id_departamento and  dp.id_direccion = d.id_direccion and d.id_direccion='" + iddir + "' ORDER BY dp.NO_DEP";
            ResultSet rs = this.cnn.query(sql);
            while (rs.next()) {
                Map<String, Object> rec = new HashMap<String, Object>();
                rec.put("id", rs.getString("id_departamento"));
                rec.put("nombre", rs.getString("no_dep"));
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

    @Override
    public List<Map<String, ?>> Centro_Costo_Dep(String iddep) {

        List<Map<String, ?>> Lista = new ArrayList<Map<String, ?>>();
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "select  cc.id_centro_costo,cc.CO_CENTRO_COSTO ||' -  '||cc.DE_CENTRO_COSTO as DE_CENTRO_COSTO  from rhtr_centro_costo cc, rhtx_departamento dp , rhtx_direccion d where dp.id_departamento = cc.id_departamento and  dp.id_direccion = d.id_direccion and cc.id_departamento='" + iddep + "'  ORDER BY cc.DE_CENTRO_COSTO";
            ResultSet rs = this.cnn.query(sql);
            while (rs.next()) {
                Map<String, Object> rec = new HashMap<String, Object>();
                rec.put("id", rs.getString("id_centro_costo"));
                rec.put("nombre", rs.getString("de_centro_costo"));
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

    @Override
    public List<Map<String, ?>> List_centr_id(String id_dgp) {
        List<Map<String, ?>> Lista = new ArrayList<Map<String, ?>>();
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "SELECT (C.ID_CENTRO_COSTO) as id_centro ,c.CO_CENTRO_COSTO ||' -  '||c.DE_CENTRO_COSTO as DE_CENTRO_COSTO  ,(d.ID_DETALLE_CENTRO_COSTO)as id_det_cen FROM RHTR_CENTRO_COSTO C, RHTD_DETALLE_CENTRO_COSTO d where d.ID_DGP='" + id_dgp.trim() + "' and C.ID_CENTRO_COSTO=d.ID_CENTRO_COSTO";
            ResultSet rs = this.cnn.query(sql);
            while (rs.next()) {
                Map<String, Object> rec = new HashMap<String, Object>();
                rec.put("id", rs.getString("id_centro"));
                rec.put("nombre", rs.getString("DE_CENTRO_COSTO"));
                rec.put("id_det_ce", rs.getString("id_det_cen"));
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

    @Override
    public void Mod_det_centro(String id_cent_cos, String id_contrato) {
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.cnn.conex.prepareCall("{CALL RHSP_MOD_DET_CEN_C_IDT(?, ? )} ");
            cst.setString(1, id_cent_cos);
            cst.setString(2, id_contrato);
            cst.execute();
        } catch (SQLException ex) {
            throw new RuntimeException(ex.getMessage());
        } finally {
            this.cnn.close();
        }
    }

    @Override
    public List<Centro_Costos> Lis_c_c_id_contr(String id_contrato) {
        this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "SELECT c.ID_CENTRO_COSTO ,c.DE_CENTRO_COSTO ,c.CO_CENTRO_COSTO, c.ID_DEPARTAMENTO, d.CA_PORCENTAJE FROM RHTR_CENTRO_COSTO c,RHTD_DETALLE_CENTRO_COSTO d where d.ID_CENTRO_COSTO=c.ID_CENTRO_COSTO and  d.ID_CONTRATO='" + id_contrato.trim() + "'";
        List<Centro_Costos> list = new ArrayList<Centro_Costos>();
        try {
            ResultSet rs = this.cnn.query(sql);
            while (rs.next()) {
                Centro_Costos d = new Centro_Costos();
                d.setId_centro_costo(rs.getString("ID_CENTRO_COSTO"));
                d.setDe_centro_costo(rs.getString("DE_CENTRO_COSTO"));
                d.setCo_centro_costo(rs.getString("CO_CENTRO_COSTO"));
                d.setId_departamento(rs.getString("ID_DEPARTAMENTO"));
                d.setCa_porcentaje(rs.getString("CA_PORCENTAJE"));
                list.add(d);
            }
        } catch (SQLException e) {
        } finally {
            this.cnn.close();
        }

        return list;

    }

    @Override
    public List<Map<String, ?>> Cargar_cc_dgp(String id) {

        List<Map<String, ?>> Lista = new ArrayList<Map<String, ?>>();
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "select  CC.ID_DGP , cc.ID_CENTRO_COSTO,d.ID_DIRECCION,c.ID_DEPARTAMENTO,c.ID_AREA,cc.CA_PORCENTAJE,c.DE_CENTRO_COSTO from RHTD_DETALLE_CENTRO_COSTO cc , RHTR_CENTRO_COSTO c , RHTX_DIRECCION d , RHTX_DEPARTAMENTO dp where cc.ID_CENTRO_COSTO = c.ID_CENTRO_COSTO  and dp.ID_DEPARTAMENTO = c.ID_DEPARTAMENTO  and cc.ES_DETALLE_CC='1'  and dp.ID_DIRECCION = d.ID_DIRECCION and id_contrato='" + id + "'";
            ResultSet rs = this.cnn.query(sql);
            while (rs.next()) {
                Map<String, Object> rec = new HashMap<String, Object>();
                rec.put("id_cc", rs.getString("id_centro_costo"));
                rec.put("id_dir", rs.getString("id_direccion"));
                rec.put("id_dep", rs.getString("id_departamento"));
                rec.put("id_area", rs.getString("id_area"));
                rec.put("porcent_cc", rs.getString("ca_porcentaje"));
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

    @Override
    public List<Map<String, ?>> listar_cc_area(String id) {

        List<Map<String, ?>> Lista = new ArrayList<Map<String, ?>>();
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = " select ID_CENTRO_COSTO,CO_CENTRO_COSTO,DE_CENTRO_COSTO  from RHVD_CENTRO_COSTO where ID_AREA='"+id+"' ";
            ResultSet rs = this.cnn.query(sql);
            while (rs.next()) {
                Map<String, Object> rec = new HashMap<String, Object>();
                rec.put("id", rs.getString("id_centro_costo"));
                rec.put("nombre", rs.getString("co_centro_costo")+" - "+rs.getString("de_centro_costo"));
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
                throw new RuntimeException(e.getMessage());
            }
        }
        return Lista;

    }
    @Override
    public List<Map<String, ?>> listar_cc_seccion(String id) {

        List<Map<String, ?>> Lista = new ArrayList<Map<String, ?>>();
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = " select ID_CENTRO_COSTO,CO_CENTRO_COSTO,DE_CENTRO_COSTO  from RHVD_CENTRO_COSTO where ID_SECCION='"+id+"' ";
            ResultSet rs = this.cnn.query(sql);
            while (rs.next()) {
                Map<String, Object> rec = new HashMap<String, Object>();
                rec.put("id", rs.getString("id_centro_costo"));
                rec.put("nombre", rs.getString("co_centro_costo")+" - "+rs.getString("de_centro_costo"));
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
                throw new RuntimeException(e.getMessage());
            }
        }
        return Lista;
    }

    @Override
    public List<Centro_Costos> Lis_c_c_id_dgp(String id_dgp) {
        this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "SELECT c.ID_CENTRO_COSTO ,c.DE_CENTRO_COSTO ,c.CO_CENTRO_COSTO, c.ID_DEPARTAMENTO, d.CA_PORCENTAJE FROM RHTR_CENTRO_COSTO c,RHTD_DETALLE_CENTRO_COSTO d where d.ID_CENTRO_COSTO=c.ID_CENTRO_COSTO and  d.ID_DGP ='" + id_dgp.trim() + "';";
        List<Centro_Costos> list = new ArrayList<Centro_Costos>();
        try {
            ResultSet rs = this.cnn.query(sql);
            while (rs.next()) {
                Centro_Costos d = new Centro_Costos();
                d.setId_centro_costo(rs.getString("ID_CENTRO_COSTO"));
                d.setDe_centro_costo(rs.getString("DE_CENTRO_COSTO"));
                d.setCo_centro_costo(rs.getString("CO_CENTRO_COSTO"));
                d.setId_departamento(rs.getString("ID_DEPARTAMENTO"));
                d.setCa_porcentaje(rs.getString("CA_PORCENTAJE"));
                list.add(d);
            }
        } catch (SQLException e) {
        } finally {
            this.cnn.close();
        }

        return list;
    }

    @Override
    public List<Detalle_Centro_Costo> Cargar_dcc_dgp(String id) {
        this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select  CC.ID_DGP , cc.ID_CENTRO_COSTO,d.ID_DIRECCION,c.ID_DEPARTAMENTO,c.ID_AREA,cc.CA_PORCENTAJE,c.DE_CENTRO_COSTO from RHTD_DETALLE_CENTRO_COSTO cc , RHTR_CENTRO_COSTO c , RHTX_DIRECCION d , RHTX_DEPARTAMENTO dp where cc.ID_CENTRO_COSTO = c.ID_CENTRO_COSTO  and dp.ID_DEPARTAMENTO = c.ID_DEPARTAMENTO  and cc.ES_DETALLE_CC='1'  and dp.ID_DIRECCION = d.ID_DIRECCION and cc.id_dgp='" + id + "'";
        List<Detalle_Centro_Costo> Lista = new ArrayList<Detalle_Centro_Costo>();
        try {
            ResultSet rs = this.cnn.query(sql);
            while (rs.next()) {
                Detalle_Centro_Costo d = new Detalle_Centro_Costo();
                d.setId_centro_costo(rs.getString("id_centro_costo"));
                d.setId_direccion(rs.getString("id_direccion"));
                d.setId_departamento(rs.getString("id_departamento"));
                d.setId_area(rs.getString("id_area"));
                d.setCa_porcentaje(rs.getDouble("ca_porcentaje"));
                d.setDe_centro_costo(rs.getString("de_centro_costo"));
                Lista.add(d);
            }
        } catch (SQLException e) {
        } finally {
            this.cnn.close();
        }

        return Lista;

    }

    @Override
    public List<String> list_cc_x_con(String id_con) {
        this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "SELECT (DC.ID_DETALLE_CENTRO_COSTO||'/'||CC.ID_DEPARTAMENTO||'/'||pu.ID_DIRECCION)as centro_costos FROM RHTR_CENTRO_COSTO CC,RHTD_DETALLE_CENTRO_COSTO DC,RHVD_PUESTO_DIRECCION pu WHERE DC.ID_CENTRO_COSTO = CC.ID_CENTRO_COSTO and pu.ID_DEPARTAMENTO = CC.ID_DEPARTAMENTO AND DC.ID_CONTRATO='" + id_con.trim() + "' GROUP by (DC.ID_DETALLE_CENTRO_COSTO||'/'||CC.ID_DEPARTAMENTO||'/'||pu.ID_DIRECCION)";
        List<String> list = new ArrayList<String>();
        try {
            ResultSet rs = this.cnn.query(sql);
            while (rs.next()) {
                list.add(rs.getString("centro_costos"));
            }
        } catch (SQLException e) {
        } finally {
            this.cnn.close();
        }
        return list;
    }

    @Override
    public List<Map<String, ?>> List_centr_idcon(String id_con) {
        List<Map<String, ?>> Lista = new ArrayList<Map<String, ?>>();
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "SELECT (c.ID_CENTRO_COSTO)as id_centro ,(c.CO_CENTRO_COSTO||' - '||c.DE_CENTRO_COSTO)as DE_CENTRO_COSTO,c.CO_CENTRO_COSTO, c.ID_DEPARTAMENTO, d.CA_PORCENTAJE,pd.ID_DIRECCION,(d.ID_DETALLE_CENTRO_COSTO)as id_det_cen FROM RHTR_CENTRO_COSTO c,RHTD_DETALLE_CENTRO_COSTO d,RHVD_PUESTO_DIRECCION pd where pd.ID_DEPARTAMENTO=c.ID_DEPARTAMENTO and d.ID_CENTRO_COSTO=c.ID_CENTRO_COSTO and  d.ID_CONTRATO='" + id_con.trim() + "' GROUP by( c.ID_CENTRO_COSTO ,c.DE_CENTRO_COSTO ,c.CO_CENTRO_COSTO, c.ID_DEPARTAMENTO,d.CA_PORCENTAJE,pd.ID_DIRECCION,d.ID_DETALLE_CENTRO_COSTO)";
            ResultSet rs = this.cnn.query(sql);
            while (rs.next()) {
                Map<String, Object> rec = new HashMap<String, Object>();
                rec.put("id", rs.getString("id_centro"));
                rec.put("nombre", rs.getString("DE_CENTRO_COSTO"));
                rec.put("id_det_ce", rs.getString("id_det_cen"));
                rec.put("co_cen_c", rs.getString("CO_CENTRO_COSTO"));
                rec.put("id_dep_cc", rs.getString("ID_DEPARTAMENTO"));
                rec.put("id_dir_cc", rs.getString("ID_DIRECCION"));
                rec.put("ca_por_cc", rs.getString("CA_PORCENTAJE"));
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

    @Override
    public int count_cc_x_id_cont(String id_con) {
        this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "SELECT COUNT(*) FROM RHTD_DETALLE_CENTRO_COSTO WHERE ID_CONTRATO='" + id_con.trim() + "'";
        int count = 0;
        try {
            ResultSet rs = this.cnn.query(sql);
            while (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException e) {
        } finally {
            this.cnn.close();
        }
        return count;
    }

    @Override
    public void Eliminar_dcc(String id_dcc) {
        CallableStatement cst;
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            cst = cnn.conex.prepareCall("{CALL RHSP_ELIMINAR_DET_CC( ? )}");
            cst.setString(1, id_dcc.trim());
            cst.execute();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, e);
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR");
        } finally {
            try {
                this.cnn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
    }

    @Override
    public void Modificar_Centro_Costo(String id_dcc) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Map<String, ?>> List_centr_iddgp(String id_dgp) {
        List<Map<String, ?>> Lista = new ArrayList<Map<String, ?>>();
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "SELECT (c.ID_CENTRO_COSTO)as id_centro ,(c.CO_CENTRO_COSTO||' - '||c.DE_CENTRO_COSTO)as DE_CENTRO_COSTO,c.CO_CENTRO_COSTO, c.ID_DEPARTAMENTO, d.CA_PORCENTAJE,pd.ID_DIRECCION,(d.ID_DETALLE_CENTRO_COSTO)as id_det_cen FROM RHTR_CENTRO_COSTO c,RHTD_DETALLE_CENTRO_COSTO d,RHVD_PUESTO_DIRECCION pd where pd.ID_DEPARTAMENTO=c.ID_DEPARTAMENTO and d.ID_CENTRO_COSTO=c.ID_CENTRO_COSTO and  d.ID_DGP='" + id_dgp.trim() + "' GROUP by( c.ID_CENTRO_COSTO ,c.DE_CENTRO_COSTO ,c.CO_CENTRO_COSTO, c.ID_DEPARTAMENTO,d.CA_PORCENTAJE,pd.ID_DIRECCION,d.ID_DETALLE_CENTRO_COSTO)";
            ResultSet rs = this.cnn.query(sql);
            while (rs.next()) {
                Map<String, Object> rec = new HashMap<String, Object>();
                rec.put("id", rs.getString("id_centro"));
                rec.put("nombre", rs.getString("DE_CENTRO_COSTO"));
                rec.put("id_det_ce", rs.getString("id_det_cen"));
                rec.put("co_cen_c", rs.getString("CO_CENTRO_COSTO"));
                rec.put("id_dep_cc", rs.getString("ID_DEPARTAMENTO"));
                rec.put("id_dir_cc", rs.getString("ID_DIRECCION"));
                rec.put("ca_por_cc", rs.getString("CA_PORCENTAJE"));
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
