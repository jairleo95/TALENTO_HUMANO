package pe.edu.upeu.application.dao;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import pe.edu.upeu.application.dao_imp.InterfacePlantillaContractualDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;

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
            String sql = "SELECT (pl.ID_PLANTILLA_CONTRACTUAL)AS id_platilla_c,(pl.NO_PLANTILLA)as no_plantilla,(pl.NO_ARCHIVO) as no_arch FROM RHTC_PLANTILLA_PUESTO p,RHTC_PLANTILLA_CONTRACTUAL pl WHERE p.ID_PUESTO='" + id_puesto.trim() + "' AND pl.ID_PLANTILLA_CONTRACTUAL = p.ID_PLANTILLA_CONTRACTUAL AND p.ES_PLANTILLA_PUESTO='1' UNION SELECT pl.ID_PLANTILLA_CONTRACTUAL,pl.NO_PLANTILLA,pl.NO_ARCHIVO FROM RHTC_PLANTILLA_PUESTO p,RHTC_PLANTILLA_CONTRACTUAL pl WHERE p.ID_SECCION=(SELECT ID_SECCION FROM RHVD_PUESTO_DIRECCION WHERE ID_PUESTO='" + id_puesto.trim() + "') AND p.ID_PUESTO='0' AND pl.ID_PLANTILLA_CONTRACTUAL = p.ID_PLANTILLA_CONTRACTUAL AND p.ES_PLANTILLA_PUESTO='1' UNION SELECT pl.ID_PLANTILLA_CONTRACTUAL,pl.NO_PLANTILLA,pl.NO_ARCHIVO FROM RHTC_PLANTILLA_PUESTO p,RHTC_PLANTILLA_CONTRACTUAL pl WHERE p.ID_AREA=(SELECT ID_AREA FROM RHVD_PUESTO_DIRECCION WHERE ID_PUESTO='" + id_puesto.trim() + "')AND p.ID_SECCION='0'AND p.ID_PUESTO='0'AND pl.ID_PLANTILLA_CONTRACTUAL = p.ID_PLANTILLA_CONTRACTUAL AND p.ES_PLANTILLA_PUESTO='1'UNION SELECT pl.ID_PLANTILLA_CONTRACTUAL,pl.NO_PLANTILLA, pl.NO_ARCHIVO FROM RHTC_PLANTILLA_PUESTO p,RHTC_PLANTILLA_CONTRACTUAL pl WHERE p.ID_DEPARTAMENTO=(SELECT ID_DEPARTAMENTO FROM RHVD_PUESTO_DIRECCION WHERE ID_PUESTO='" + id_puesto.trim() + "') AND p.ID_AREA='0'AND p.ID_SECCION='0' AND p.ID_PUESTO='0' AND pl.ID_PLANTILLA_CONTRACTUAL = p.ID_PLANTILLA_CONTRACTUAL AND p.ES_PLANTILLA_PUESTO='1' UNION SELECT pl.ID_PLANTILLA_CONTRACTUAL,pl.NO_PLANTILLA,pl.NO_ARCHIVO FROM RHTC_PLANTILLA_PUESTO p,RHTC_PLANTILLA_CONTRACTUAL pl WHERE p.ID_DIRECCION=(SELECT ID_DIRECCION FROM RHVD_PUESTO_DIRECCION WHERE ID_PUESTO='" + id_puesto.trim() + "')AND p.ID_DEPARTAMENTO='0'AND p.ID_AREA='0' AND p.ID_SECCION='0' AND p.ID_PUESTO='0' AND pl.ID_PLANTILLA_CONTRACTUAL = p.ID_PLANTILLA_CONTRACTUAL AND p.ES_PLANTILLA_PUESTO='1' UNION SELECT pl.ID_PLANTILLA_CONTRACTUAL, pl.NO_PLANTILLA, pl.NO_ARCHIVO FROM RHTC_PLANTILLA_PUESTO p, RHTC_PLANTILLA_CONTRACTUAL pl WHERE p.ID_DIRECCION='0' AND p.ID_DEPARTAMENTO='0' AND p.ID_AREA='0' AND p.ID_SECCION='0' AND p.ID_PUESTO='0' AND pl.ID_PLANTILLA_CONTRACTUAL = p.ID_PLANTILLA_CONTRACTUAL AND p.ES_PLANTILLA_PUESTO='1' order by NO_PLANTILLA";
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
    public void Crear_Plantilla(String no_pl, String User_crea) {
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.cnn.conex.prepareCall("{CALL RHSP_INSERT_PLANTILLA( ?,?,?,?,?,?,?,? )} ");
            cst.setString(1, null);
            cst.setString(2, no_pl);
            cst.setString(3, null);
            cst.setString(4, User_crea.trim());
            cst.setString(5, null);
            cst.setString(6, null);
            cst.setString(7, null);
            cst.setString(8, null);
            cst.execute();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR" + e.getMessage());
        } finally {
            try {
                this.cnn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
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
            String sql = "SELECT (pl.ID_PLANTILLA_CONTRACTUAL)AS id_platilla_c,(pl.NO_PLANTILLA)AS no_plantilla,(pl.NO_ARCHIVO)AS no_arch FROM RHTC_PLANTILLA_PUESTO p,RHTC_PLANTILLA_CONTRACTUAL pl WHERE p.ID_PUESTO ='" + id_pu.trim() + "' AND pl.ID_PLANTILLA_CONTRACTUAL = p.ID_PLANTILLA_CONTRACTUAL AND p.ES_PLANTILLA_PUESTO ='1' UNION SELECT pl.ID_PLANTILLA_CONTRACTUAL, pl.NO_PLANTILLA, pl.NO_ARCHIVO from RHTC_PLANTILLA_CONTRACTUAL pl,RHTC_PLANTILLA_PUESTO p WHERE p.ID_SECCION='" + id_sec.trim() + "' AND p.ID_PUESTO ='0' AND pl.ID_PLANTILLA_CONTRACTUAL = p.ID_PLANTILLA_CONTRACTUAL AND p.ES_PLANTILLA_PUESTO ='1' UNION SELECT pl.ID_PLANTILLA_CONTRACTUAL, pl.NO_PLANTILLA, pl.NO_ARCHIVO FROM RHTC_PLANTILLA_PUESTO p, RHTC_PLANTILLA_CONTRACTUAL pl WHERE p.ID_AREA ='" + id_are.trim() + "' AND p.ID_SECCION='0' AND p.ID_PUESTO ='0' AND pl.ID_PLANTILLA_CONTRACTUAL = p.ID_PLANTILLA_CONTRACTUAL AND p.ES_PLANTILLA_PUESTO ='1' UNION SELECT pl.ID_PLANTILLA_CONTRACTUAL, pl.NO_PLANTILLA, pl.NO_ARCHIVO FROM RHTC_PLANTILLA_PUESTO p, RHTC_PLANTILLA_CONTRACTUAL pl WHERE p.ID_DEPARTAMENTO ='" + id_dep.trim() + "' AND p.ID_AREA ='0' AND p.ID_SECCION ='0' AND p.ID_PUESTO ='0' AND pl.ID_PLANTILLA_CONTRACTUAL = p.ID_PLANTILLA_CONTRACTUAL AND p.ES_PLANTILLA_PUESTO       ='1' UNION SELECT pl.ID_PLANTILLA_CONTRACTUAL, pl.NO_PLANTILLA, pl.NO_ARCHIVO FROM RHTC_PLANTILLA_PUESTO p, RHTC_PLANTILLA_CONTRACTUAL pl WHERE p.ID_DIRECCION ='" + id_dir.trim() + "' AND p.ID_DEPARTAMENTO ='0' AND p.ID_AREA ='0' AND p.ID_SECCION ='0' AND p.ID_PUESTO ='0'AND pl.ID_PLANTILLA_CONTRACTUAL = p.ID_PLANTILLA_CONTRACTUAL AND p.ES_PLANTILLA_PUESTO ='1' UNION SELECT pl.ID_PLANTILLA_CONTRACTUAL, pl.NO_PLANTILLA, pl.NO_ARCHIVO FROM RHTC_PLANTILLA_PUESTO p, RHTC_PLANTILLA_CONTRACTUAL pl WHERE p.ID_DIRECCION ='0' AND p.ID_DEPARTAMENTO ='0' AND p.ID_AREA='0' AND p.ID_SECCION ='0' AND p.ID_PUESTO ='0' AND pl.ID_PLANTILLA_CONTRACTUAL = p.ID_PLANTILLA_CONTRACTUAL AND p.ES_PLANTILLA_PUESTO ='1'";
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
        String sql = "SELECT NO_ARCHIVO FROM RHTC_PLANTILLA_CONTRACTUAL WHERE ID_PLANTILLA_CONTRACTUAL='" + id_plan_con.trim() + "'";
        String no_archivo = null;
        try {
            ResultSet rs = this.cnn.query(sql);
            while (rs.next()) {
                no_archivo = rs.getString(1);
            }
        } catch (SQLException e) {
            System.out.println("Error en List_pl_con_x_id : " + e);
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
            String sql = "select cc.* ,dd.no_direccion,dd.no_dep,dd.no_area,dd.no_seccion,dd.no_puesto from ( SELECT pl.ID_PLANTILLA_CONTRACTUAL,pl.NO_PLANTILLA,pl.NO_ARCHIVO,p.ES_PLANTILLA_PUESTO,p.ID_PLANTILLA_PUESTO FROM RHTC_PLANTILLA_PUESTO p, RHTC_PLANTILLA_CONTRACTUAL pl WHERE p.ID_DIRECCION='0'AND p.ID_DEPARTAMENTO='0'AND p.ID_AREA='0'AND p.ID_SECCION='0'AND p.ID_PUESTO='0'AND pl.ID_PLANTILLA_CONTRACTUAL = p.ID_PLANTILLA_CONTRACTUAL UNION SELECT pl.ID_PLANTILLA_CONTRACTUAL,pl.NO_PLANTILLA,pl.NO_ARCHIVO,p.ES_PLANTILLA_PUESTO,p.ID_PLANTILLA_PUESTO FROM RHTC_PLANTILLA_PUESTO p,RHTC_PLANTILLA_CONTRACTUAL pl WHERE p.ID_PUESTO='" + id_pu.trim() + "'AND pl.ID_PLANTILLA_CONTRACTUAL = p.ID_PLANTILLA_CONTRACTUAL UNION SELECT pl.ID_PLANTILLA_CONTRACTUAL,pl.NO_PLANTILLA,pl.NO_ARCHIVO,p.ES_PLANTILLA_PUESTO,p.ID_PLANTILLA_PUESTO FROM RHTC_PLANTILLA_PUESTO p, RHTC_PLANTILLA_CONTRACTUAL pl WHERE p.ID_SECCION='" + id_sec.trim() + "'AND p.ID_PUESTO='0'AND pl.ID_PLANTILLA_CONTRACTUAL = p.ID_PLANTILLA_CONTRACTUAL UNION SELECT pl.ID_PLANTILLA_CONTRACTUAL,pl.NO_PLANTILLA,pl.NO_ARCHIVO, p.ES_PLANTILLA_PUESTO,p.ID_PLANTILLA_PUESTO FROM RHTC_PLANTILLA_PUESTO p, RHTC_PLANTILLA_CONTRACTUAL pl WHERE p.ID_AREA='" + id_are.trim() + "'AND p.ID_SECCION='0'AND p.ID_PUESTO='0'AND pl.ID_PLANTILLA_CONTRACTUAL = p.ID_PLANTILLA_CONTRACTUAL UNION SELECT pl.ID_PLANTILLA_CONTRACTUAL, pl.NO_PLANTILLA, pl.NO_ARCHIVO,p.ES_PLANTILLA_PUESTO,ID_PLANTILLA_PUESTO FROM RHTC_PLANTILLA_PUESTO p, RHTC_PLANTILLA_CONTRACTUAL pl WHERE p.ID_DEPARTAMENTO='" + id_dep.trim() + "'AND p.ID_AREA='0'AND p.ID_SECCION='0'AND p.ID_PUESTO='0'AND pl.ID_PLANTILLA_CONTRACTUAL = p.ID_PLANTILLA_CONTRACTUAL UNION SELECT pl.ID_PLANTILLA_CONTRACTUAL,pl.NO_PLANTILLA,pl.NO_ARCHIVO,p.ES_PLANTILLA_PUESTO,p.ID_PLANTILLA_PUESTO FROM RHTC_PLANTILLA_PUESTO p,RHTC_PLANTILLA_CONTRACTUAL pl WHERE p.ID_DIRECCION='" + id_dir.trim() + "'AND p.ID_DEPARTAMENTO='0'AND p.ID_AREA='0'AND p.ID_SECCION='0'AND p.ID_PUESTO='0'AND pl.ID_PLANTILLA_CONTRACTUAL = p.ID_PLANTILLA_CONTRACTUAL ) cc , (select  pp.ID_PLANTILLA_PUESTO,case when d.NO_DIRECCION is null then 'Todos' else d.NO_DIRECCION end  as no_direccion, case when de.NO_DEP is null then  'Todos' else de.NO_DEP end as no_dep, case when a.NO_AREA is null then 'Todos'  else a.NO_AREA end as no_area, case when s.NO_SECCION is null then 'Todos' else s.NO_SECCION end as no_seccion,case when  pu.NO_PUESTO is null then 'Todos' else pu.NO_PUESTO   end as no_puesto from RHTC_PLANTILLA_PUESTO pp  left outer join RHTX_DIRECCION d on (pp.ID_DIRECCION=d.ID_DIRECCION) left outer join RHTX_DEPARTAMENTO de on (de.ID_DEPARTAMENTO=pp.ID_DEPARTAMENTO) left outer join RHTD_AREA a on (a.id_area=pp.ID_AREA) left outer join RHTR_SECCION s on (s.ID_SECCION=pp.ID_SECCION) left outer join RHTR_PUESTO pu on (pu.ID_PUESTO=pp.id_puesto) ) dd where dd.id_plantilla_puesto=cc.id_plantilla_puesto";
            ResultSet rs = this.cnn.query(sql);
            while (rs.next()) {
                Map<String, Object> rec = new HashMap<String, Object>();
                rec.put("id", rs.getString("ID_PLANTILLA_CONTRACTUAL"));
                rec.put("nom_pl", rs.getString("NO_PLANTILLA"));
                rec.put("nom_ar", rs.getString("NO_ARCHIVO"));
                rec.put("es_pl", rs.getString("ES_PLANTILLA_PUESTO"));
                rec.put("id_pp", rs.getString("ID_PLANTILLA_PUESTO"));
                rec.put("direccion", "<strong> Dirección: </strong> " + rs.getString("no_direccion") + " <strong>Area: </strong>" + rs.getString("no_dep") + "<strong> Departamento:</strong> " + rs.getString("no_area") + " <strong>Sección: </strong>" + rs.getString("no_seccion") + " <strong>Puesto: </strong>" + rs.getString("no_puesto"));
                Lista.add(rec);
            }
            rs.close();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error!" + e.getMessage());
        } finally {
            try {
                this.cnn.close();
            } catch (Exception e) {
            }
        }
        return Lista;
    }

    @Override
    public void Insertar_pertenencia(String id_plt_con, String dir, String dep, String area, String sec, String puesto, String id_user) {
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.cnn.conex.prepareCall("{CALL RHSP_INSERT_PLANTILLA_PUEST( ?,?,?,?,?,?,? )} ");
            cst.setString(1, id_plt_con.trim());
            cst.setString(2, dir.trim());
            cst.setString(3, dep.trim());
            cst.setString(4, area.trim());
            cst.setString(5, sec.trim());
            cst.setString(6, puesto);
            cst.setString(7, id_user);
            cst.execute();
        } catch (SQLException ex) {
            throw new RuntimeException(ex.getMessage());

        } finally {
            this.cnn.close();
        }
    }

    @Override
    public String ob_id_pl_max() {
        this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select ID_PLANTILLA_CONTRACTUAL from RHTC_PLANTILLA_CONTRACTUAL  where ID_PLANTILLA_CONTRACTUAL=(SELECT 'PLC-'||lpad(to_char(MAX(TO_NUMBER(SUBSTR(ID_PLANTILLA_CONTRACTUAL,5,8)))),6,'0')  FROM RHTC_PLANTILLA_CONTRACTUAL)";
        String id_pl = null;
        try {
            ResultSet rs = this.cnn.query(sql);
            while (rs.next()) {
                id_pl = rs.getString(1);
            }
        } catch (SQLException e) {

        } finally {
            this.cnn.close();
        }
        return id_pl;
    }

    @Override
    public void Activar_pl_pu(String id_pp, String id_user) {
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.cnn.conex.prepareCall("{CALL RHSP_ACTIVAR_PLANTILLA_PUESTO( ?,? )}");
            cst.setString(1, id_pp);
            cst.setString(2, id_user);
            cst.execute();
        } catch (SQLException ex) {
            throw new RuntimeException(ex.getMessage());

        } finally {
            this.cnn.close();
        }
    }

    @Override
    public void Desactivar_pl_pu(String id_pp, String id_user) {
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.cnn.conex.prepareCall("{CALL RHSP_DES_PLANTILLA_PUESTO(?,? )}");
            cst.setString(1, id_pp);
            cst.setString(2, id_user);
            cst.execute();
        } catch (SQLException ex) {
            throw new RuntimeException(ex.getMessage());

        } finally {
            this.cnn.close();
        }
    }

    @Override
    public boolean Update_Name_File(String id, String nombre) {
        boolean x = false;
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.cnn.conex.prepareCall("{CALL rhsp_update_nombre_plantilla(?,? )}");
            cst.setString(1, id);
            cst.setString(2, nombre);
            cst.execute();
            x = true;
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR" + e.getMessage());
        } finally {
            try {
                this.cnn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
        return x;
    }

}
