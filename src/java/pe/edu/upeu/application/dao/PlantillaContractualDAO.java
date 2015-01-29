/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.dao;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.spi.DirStateFactory;
import pe.edu.upeu.application.dao_imp.InterfacePlantillaContractualDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;
import pe.edu.upeu.application.model.Plantilla_Contractual;

/**
 *
 * @author joserodrigo
 */
public class PlantillaContractualDAO implements InterfacePlantillaContractualDAO {

    ConexionBD cnn;

    @Override
    public List<Map<String, ?>> List_PLantillas(String id_puesto) {
        List<Map<String, ?>> Lista = new ArrayList<Map<String, ?>>();
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "SELECT (pl.ID_PLANTILLA_CONTRACTUAL)AS id_platilla_c,(pl.NO_PLANTILLA)as no_plantilla,(pl.NO_ARCHIVO) as no_arch FROM RHTC_PLANTILLA_PUESTO p,RHTC_PLANTILLA_CONTRACTUAL pl WHERE p.ID_PUESTO='" + id_puesto.trim() + "' AND pl.ID_PLANTILLA_CONTRACTUAL = p.ID_PLANTILLA_CONTRACTUAL AND p.ES_PLANTILLA_PUESTO='1' UNION SELECT pl.ID_PLANTILLA_CONTRACTUAL,pl.NO_PLANTILLA,pl.NO_ARCHIVO FROM RHTC_PLANTILLA_PUESTO p,RHTC_PLANTILLA_CONTRACTUAL pl WHERE p.ID_SECCION=(SELECT ID_SECCION FROM RHVD_PUESTO_DIRECCION WHERE ID_PUESTO='" + id_puesto.trim() + "') AND p.ID_PUESTO='0' AND pl.ID_PLANTILLA_CONTRACTUAL = p.ID_PLANTILLA_CONTRACTUAL AND p.ES_PLANTILLA_PUESTO='1' UNION SELECT pl.ID_PLANTILLA_CONTRACTUAL,pl.NO_PLANTILLA,pl.NO_ARCHIVO FROM RHTC_PLANTILLA_PUESTO p,RHTC_PLANTILLA_CONTRACTUAL pl WHERE p.ID_AREA=(SELECT ID_AREA FROM RHVD_PUESTO_DIRECCION WHERE ID_PUESTO='" + id_puesto.trim() + "')AND p.ID_SECCION='0'AND p.ID_PUESTO='0'AND pl.ID_PLANTILLA_CONTRACTUAL = p.ID_PLANTILLA_CONTRACTUAL AND p.ES_PLANTILLA_PUESTO='1'UNION SELECT pl.ID_PLANTILLA_CONTRACTUAL,pl.NO_PLANTILLA, pl.NO_ARCHIVO FROM RHTC_PLANTILLA_PUESTO p,RHTC_PLANTILLA_CONTRACTUAL pl WHERE p.ID_DEPARTAMENTO=(SELECT ID_DEPARTAMENTO FROM RHVD_PUESTO_DIRECCION WHERE ID_PUESTO='" + id_puesto.trim() + "') AND p.ID_AREA='0'AND p.ID_SECCION='0' AND p.ID_PUESTO='0' AND pl.ID_PLANTILLA_CONTRACTUAL = p.ID_PLANTILLA_CONTRACTUAL AND p.ES_PLANTILLA_PUESTO='1' UNION SELECT pl.ID_PLANTILLA_CONTRACTUAL,pl.NO_PLANTILLA,pl.NO_ARCHIVO FROM RHTC_PLANTILLA_PUESTO p,RHTC_PLANTILLA_CONTRACTUAL pl WHERE p.ID_DIRECCION=(SELECT ID_DIRECCION FROM RHVD_PUESTO_DIRECCION WHERE ID_PUESTO='" + id_puesto.trim() + "')AND p.ID_DEPARTAMENTO='0'AND p.ID_AREA='0' AND p.ID_SECCION='0' AND p.ID_PUESTO='0' AND pl.ID_PLANTILLA_CONTRACTUAL = p.ID_PLANTILLA_CONTRACTUAL AND p.ES_PLANTILLA_PUESTO='1' UNION SELECT pl.ID_PLANTILLA_CONTRACTUAL, pl.NO_PLANTILLA, pl.NO_ARCHIVO FROM RHTC_PLANTILLA_PUESTO p, RHTC_PLANTILLA_CONTRACTUAL pl WHERE p.ID_DIRECCION='0' AND p.ID_DEPARTAMENTO='0' AND p.ID_AREA='0' AND p.ID_SECCION='0' AND p.ID_PUESTO='0' AND pl.ID_PLANTILLA_CONTRACTUAL = p.ID_PLANTILLA_CONTRACTUAL AND p.ES_PLANTILLA_PUESTO='1'";
            ResultSet rs = this.cnn.query(sql);
            while (rs.next()) {
                Map<String, Object> rec = new HashMap<String, Object>();
                rec.put("id", rs.getString("id_platilla_c"));
                rec.put("nom_pl", rs.getString("no_plantilla"));
                rec.put("nom_ar", rs.getString("no_arch"));
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
    public void Crear_Plantilla(String no_pl) {
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.cnn.conex.prepareCall("{CALL RHSP_INSERT_PLANTILLA( ?,?,?,?,?,?,?,? )} ");
            cst.setString(1, null);
            cst.setString(2, no_pl);
            cst.setString(3, null);
            cst.setString(4, null);
            cst.setString(5, null);
            cst.setString(6, null);
            cst.setString(7, null);
            cst.setString(8, null);
            cst.execute();
        } catch (SQLException ex) {
            throw new RuntimeException(ex.getMessage());

        } finally {
            this.cnn.close();
        }
    }

    @Override
    public String Obt_no_arch() {
        this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select NO_ARCHIVO from RHTC_PLANTILLA_CONTRACTUAL  where ID_PLANTILLA_CONTRACTUAL=(SELECT 'PLC-'||lpad(to_char(MAX(TO_NUMBER(SUBSTR(ID_PLANTILLA_CONTRACTUAL,5,8)))),6,'0')  FROM RHTC_PLANTILLA_CONTRACTUAL)";
        String no_archivo = null;
        try {
            ResultSet rs = this.cnn.query(sql);
            while (rs.next()) {
                no_archivo = rs.getString(1);
            }
        } catch (SQLException e) {

        } finally {
            this.cnn.close();
        }
        return no_archivo;
    }

    @Override
    public List<Map<String, ?>> List_PLanti_x_sel(String id_pu, String id_sec, String id_are, String id_dep, String id_dir) {
        List<Map<String, ?>> Lista = new ArrayList<Map<String, ?>>();
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "SELECT (pl.ID_PLANTILLA_CONTRACTUAL)AS id_platilla_c,(pl.NO_PLANTILLA)AS no_plantilla,(pl.NO_ARCHIVO)AS no_arch FROM RHTC_PLANTILLA_PUESTO p,RHTC_PLANTILLA_CONTRACTUAL pl WHERE p.ID_PUESTO ='"+id_pu.trim()+"' AND pl.ID_PLANTILLA_CONTRACTUAL = p.ID_PLANTILLA_CONTRACTUAL AND p.ES_PLANTILLA_PUESTO ='1' UNION SELECT pl.ID_PLANTILLA_CONTRACTUAL, pl.NO_PLANTILLA, pl.NO_ARCHIVO from RHTC_PLANTILLA_CONTRACTUAL pl,RHTC_PLANTILLA_PUESTO p WHERE p.ID_SECCION='"+id_sec.trim()+"' AND p.ID_PUESTO ='0' AND pl.ID_PLANTILLA_CONTRACTUAL = p.ID_PLANTILLA_CONTRACTUAL AND p.ES_PLANTILLA_PUESTO ='1' UNION SELECT pl.ID_PLANTILLA_CONTRACTUAL, pl.NO_PLANTILLA, pl.NO_ARCHIVO FROM RHTC_PLANTILLA_PUESTO p, RHTC_PLANTILLA_CONTRACTUAL pl WHERE p.ID_AREA ='"+id_are.trim()+"' AND p.ID_SECCION='0' AND p.ID_PUESTO ='0' AND pl.ID_PLANTILLA_CONTRACTUAL = p.ID_PLANTILLA_CONTRACTUAL AND p.ES_PLANTILLA_PUESTO ='1' UNION SELECT pl.ID_PLANTILLA_CONTRACTUAL, pl.NO_PLANTILLA, pl.NO_ARCHIVO FROM RHTC_PLANTILLA_PUESTO p, RHTC_PLANTILLA_CONTRACTUAL pl WHERE p.ID_DEPARTAMENTO ='"+id_dep.trim()+"' AND p.ID_AREA ='0' AND p.ID_SECCION ='0' AND p.ID_PUESTO ='0' AND pl.ID_PLANTILLA_CONTRACTUAL = p.ID_PLANTILLA_CONTRACTUAL AND p.ES_PLANTILLA_PUESTO       ='1' UNION SELECT pl.ID_PLANTILLA_CONTRACTUAL, pl.NO_PLANTILLA, pl.NO_ARCHIVO FROM RHTC_PLANTILLA_PUESTO p, RHTC_PLANTILLA_CONTRACTUAL pl WHERE p.ID_DIRECCION ='"+id_dir.trim()+"' AND p.ID_DEPARTAMENTO ='0' AND p.ID_AREA ='0' AND p.ID_SECCION ='0' AND p.ID_PUESTO ='0'AND pl.ID_PLANTILLA_CONTRACTUAL = p.ID_PLANTILLA_CONTRACTUAL AND p.ES_PLANTILLA_PUESTO ='1' UNION SELECT pl.ID_PLANTILLA_CONTRACTUAL, pl.NO_PLANTILLA, pl.NO_ARCHIVO FROM RHTC_PLANTILLA_PUESTO p, RHTC_PLANTILLA_CONTRACTUAL pl WHERE p.ID_DIRECCION ='0' AND p.ID_DEPARTAMENTO ='0' AND p.ID_AREA='0' AND p.ID_SECCION ='0' AND p.ID_PUESTO ='0' AND pl.ID_PLANTILLA_CONTRACTUAL = p.ID_PLANTILLA_CONTRACTUAL AND p.ES_PLANTILLA_PUESTO ='1'";
            ResultSet rs = this.cnn.query(sql);
            while (rs.next()) {
                Map<String, Object> rec = new HashMap<String, Object>();
                rec.put("id", rs.getString("ID_PLANTILLA_CONTRACTUAL"));
                rec.put("nom_pl", rs.getString("NO_PLANTILLA"));
                rec.put("nom_ar", rs.getString("NO_ARCHIVO"));
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
    public String List_pl_con_x_id(String id_plan_con) {
       this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "SELECT NO_ARCHIVO FROM RHTC_PLANTILLA_CONTRACTUAL WHERE ID_PLANTILLA_CONTRACTUAL='"+id_plan_con.trim()+"'";
        String no_archivo = null;
        try {
            ResultSet rs = this.cnn.query(sql);
            while (rs.next()) {
                no_archivo = rs.getString(1);
            }
        } catch (SQLException e) {

        } finally {
            this.cnn.close();
        }
        return no_archivo;
    }

    @Override
    public List<Map<String, ?>> List_PLant_x_sel(String id_pu, String id_sec, String id_are, String id_dep, String id_dir) {
       List<Map<String, ?>> Lista = new ArrayList<Map<String, ?>>();
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "SELECT pl.ID_PLANTILLA_CONTRACTUAL,pl.NO_PLANTILLA, pl.NO_ARCHIVO FROM RHTC_PLANTILLA_PUESTO p, RHTC_PLANTILLA_CONTRACTUAL pl WHERE p.ID_DIRECCION='0'AND p.ID_DEPARTAMENTO='0'AND p.ID_AREA='0'AND p.ID_SECCION='0' AND p.ID_PUESTO='0' AND pl.ID_PLANTILLA_CONTRACTUAL = p.ID_PLANTILLA_CONTRACTUAL AND p.ES_PLANTILLA_PUESTO='1' UNION SELECT pl.ID_PLANTILLA_CONTRACTUAL, pl.NO_PLANTILLA, pl.NO_ARCHIVO FROM RHTC_PLANTILLA_PUESTO p, RHTC_PLANTILLA_CONTRACTUAL pl WHERE p.ID_DIRECCION='"+id_dir.trim()+"' AND p.ID_DEPARTAMENTO='0' AND p.ID_AREA='0' AND p.ID_SECCION='0' AND p.ID_PUESTO='0' AND pl.ID_PLANTILLA_CONTRACTUAL = p.ID_PLANTILLA_CONTRACTUAL AND p.ES_PLANTILLA_PUESTO='1' UNION SELECT pl.ID_PLANTILLA_CONTRACTUAL, pl.NO_PLANTILLA, pl.NO_ARCHIVO FROM RHTC_PLANTILLA_PUESTO p, RHTC_PLANTILLA_CONTRACTUAL pl WHERE p.ID_DEPARTAMENTO='"+id_dep.trim()+"' AND p.ID_AREA='0' AND p.ID_SECCION='0' AND p.ID_PUESTO='0' AND pl.ID_PLANTILLA_CONTRACTUAL = p.ID_PLANTILLA_CONTRACTUAL AND p.ES_PLANTILLA_PUESTO       ='1' UNION SELECT pl.ID_PLANTILLA_CONTRACTUAL, pl.NO_PLANTILLA, pl.NO_ARCHIVO FROM RHTC_PLANTILLA_PUESTO p, RHTC_PLANTILLA_CONTRACTUAL pl WHERE p.ID_AREA='"+id_are.trim()+"' AND p.ID_SECCION='0' AND p.ID_PUESTO ='0' AND pl.ID_PLANTILLA_CONTRACTUAL = p.ID_PLANTILLA_CONTRACTUAL AND p.ES_PLANTILLA_PUESTO='1' UNION SELECT pl.ID_PLANTILLA_CONTRACTUAL, pl.NO_PLANTILLA, pl.NO_ARCHIVO FROM RHTC_PLANTILLA_PUESTO p, RHTC_PLANTILLA_CONTRACTUAL pl WHERE p.ID_SECCION='"+id_sec.trim()+"' AND p.ID_PUESTO='0' AND pl.ID_PLANTILLA_CONTRACTUAL = p.ID_PLANTILLA_CONTRACTUAL AND p.ES_PLANTILLA_PUESTO='1' UNION SELECT (pl.ID_PLANTILLA_CONTRACTUAL)AS id_platilla_c, (pl.NO_PLANTILLA)AS no_plantilla, (pl.NO_ARCHIVO)AS no_arch FROM RHTC_PLANTILLA_PUESTO p, RHTC_PLANTILLA_CONTRACTUAL pl WHERE p.ID_PUESTO='"+id_pu+"' AND pl.ID_PLANTILLA_CONTRACTUAL = p.ID_PLANTILLA_CONTRACTUAL AND p.ES_PLANTILLA_PUESTO='1'";
            ResultSet rs = this.cnn.query(sql);
            while (rs.next()) {
                Map<String, Object> rec = new HashMap<String, Object>();
                rec.put("id", rs.getString("ID_PLANTILLA_CONTRACTUAL"));
                rec.put("nom_pl", rs.getString("NO_PLANTILLA"));
                rec.put("nom_ar", rs.getString("NO_ARCHIVO"));
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
