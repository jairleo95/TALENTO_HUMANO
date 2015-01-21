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
import pe.edu.upeu.application.dao_imp.InterfaceFormato_HorarioDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;
import pe.edu.upeu.application.model.Formato_Horario;
import pe.edu.upeu.application.model.Tipo_Horario;

/**
 *
 * @author Alex
 */
public class Formato_HorarioDAO implements InterfaceFormato_HorarioDAO {

    ConexionBD conn;

    @Override
    public void Insert_Horario(String ID_TIPO_HORARIO, String NO_HORARIO, String DE_HORARIO, String ES_HORARIO, Double CA_HORAS) {

        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.conn.conex.prepareCall("{CALL RHSP_INSERT_TIPO_HORARIO (?,?,?,?,?)}");
            cst.setString(1, null);
            cst.setString(2, NO_HORARIO);
            cst.setString(3, DE_HORARIO);
            cst.setString(4, ES_HORARIO);
            cst.setDouble(5, CA_HORAS);
            cst.execute();
        } catch (SQLException ex) {
            throw new RuntimeException(ex.getMessage());
        } finally {
            this.conn.close();
        }
    }

    @Override
    public List<Tipo_Horario> Listar_Tipo_Horario() {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "SELECT id_tipo_horario,no_horario,de_horario,es_horario,ca_horas,es_turno_formato_h(ID_TIPO_HORARIO) as  ca_formato FROM RHTR_TIPO_HORARIO";
        List<Tipo_Horario> list = new ArrayList<Tipo_Horario>();
        try {
            ResultSet rs = this.conn.query(sql);

            while (rs.next()) {
                Tipo_Horario tih = new Tipo_Horario();
                tih.setId_tipo_horario(rs.getString("id_tipo_horario"));
                tih.setNo_horario(rs.getString("no_horario"));
                tih.setDe_horario(rs.getString("de_horario"));
                tih.setEs_horario(rs.getString("es_horario"));
                tih.setCa_horas(rs.getDouble("ca_horas"));
                tih.setCa_formato(rs.getString("ca_formato"));
                list.add(tih);
            }
        } catch (Exception e) {
        } finally {
            this.conn.close();
        }
        return list;
    }

    @Override
    public void Insert_Formato_Horario(String ID_FORMATO_HORARIO, String NO_TURNO, String NO_DIA, String HO_DESDE, String HO_HASTA, String ES_F_HORARIO, String ID_TIPO_HORARIO) {
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.conn.conex.prepareCall("{CALL RHSP_INSERT_FORMATO_HORARIO (?,?,?,?,?,?,?)}");
            cst.setString(1, null);
            cst.setString(2, NO_TURNO);
            cst.setString(3, NO_DIA);
            cst.setString(4, HO_DESDE);
            cst.setString(5, HO_HASTA);
            cst.setString(6, ES_F_HORARIO);
            cst.setString(7, ID_TIPO_HORARIO);
            cst.execute();
        } catch (SQLException ex) {
            throw new RuntimeException(ex.getMessage());
        } finally {
            this.conn.close();
        }
    }

    @Override
    public List<Formato_Horario> Listar_Formato_Horario(String idth) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "Select * from RHTR_FORMATO_HORARIO  where ID_TIPO_HORARIO ='" + idth + "' ";
        List<Formato_Horario> list = new ArrayList<Formato_Horario>();
        try {
            ResultSet rs = this.conn.query(sql);

            while (rs.next()) {
                Formato_Horario fh = new Formato_Horario();
                fh.setId_formato_horario(rs.getString("id_formato_horario"));
                fh.setEs_f_horario(rs.getString("es_f_horario"));
                fh.setHo_desde(rs.getString("ho_desde"));
                fh.setHo_hasta(rs.getString("ho_hasta"));
                fh.setId_tipo_horario(rs.getString("id_tipo_horario"));
                fh.setNo_turno(rs.getString("no_turno"));
                fh.setNo_dia(rs.getString("no_dia"));
                list.add(fh);
            }
        } catch (Exception e) {
        } finally {
            this.conn.close();
        }
        return list;
    }

    @Override
    public List<Map<String, ?>> List_Tipo_Horario() {

        List<Map<String, ?>> Lista = new ArrayList<Map<String, ?>>();
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "select  * from RHTR_TIPO_HORARIO where trim(es_horario) ='1'";
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                Map<String, Object> rec = new HashMap<String, Object>();
                rec.put("id", rs.getString("ID_TIPO_HORARIO"));
                rec.put("nombre", rs.getString("NO_HORARIO"));

                Lista.add(rec);
            }
            rs.close();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error!");
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
            }
        }
        return Lista;

    }

    @Override
    public List<Map<String, ?>> List_Formato_h(String id_th) {
        List<Map<String, ?>> Lista = new ArrayList<Map<String, ?>>();
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "select  *  from RHTR_FORMATO_HORARIO  where ID_TIPO_HORARIO='" + id_th + "' order by ID_FORMATO_HORARIO asc ";
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                Map<String, Object> rec = new HashMap<String, Object>();
                rec.put("turno", rs.getString("NO_TURNO"));
                rec.put("dia", rs.getString("no_dia"));
                rec.put("desde", rs.getString("ho_desde"));
                rec.put("hasta", rs.getString("ho_hasta"));
                Lista.add(rec);
            }
            rs.close();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error!");
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
            }
        }
        return Lista;
    }

    @Override
    public String[][] List_D() {
        String[][] l = new String[7][2];
        l[0][0] = "lun";
        l[0][1] = "Lunes";

        l[1][0] = "mar";
        l[1][1] = "Martes";

        l[2][0] = "mie";
        l[2][1] = "Miercoles";

        l[3][0] = "jue";
        l[3][1] = "Jueves";

        l[4][0] = "vie";
        l[4][1] = "Viernes";

        l[5][0] = "sab";
        l[5][1] = "Sabado";

        l[6][0] = "dom";
        l[6][1] = "Domingo";

        return l;
    }

    @Override
    public List<Map<String, ?>> Lista_Plantilla_Puesto(String id) {

        List<Map<String, ?>> Lista = new ArrayList<Map<String, ?>>();
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "select   pc.ID_PLANTILLA_CONTRACTUAL,pc.NO_PLANTILLA,pc.NO_ARCHIVO,pp.ID_PLANTILLA_PUESTO,pp.ID_DEPARTAMENTO,pp.ID_DIRECCION,pp.ID_AREA,pp.ID_SECCION,pp.ID_PUESTO  from RHTC_PLANTILLA_CONTRACTUAL pc , RHTC_PLANTILLA_PUESTO pp where pp.ID_PLANTILLA_CONTRACTUAL = pc.ID_PLANTILLA_CONTRACTUAL and pp.ES_PLANTILLA_PUESTO='1' and pc.ES_PLAN_CONTRACTUAL='1'";
            if (id.substring(0, 3).equals("PUT")) {
                sql += " and pp.id_puesto='" + id.trim() + "'";
            }
            if (id.substring(0, 3).equals("DIR")) {
                sql += " and pp.ID_DIRECCION='" + id.trim() + "'";
            }
            if (id.substring(0, 3).equals("DPT")) {
                sql += " and pp.ID_DEPARTAMENTO='" + id.trim() + "'";
            }
            if (id.substring(0, 3).equals("ARE")) {
                sql += " and pp.ID_AREA='" + id.trim() + "'";
            }
            if (id.substring(0, 3).equals("SEC")) {
                sql += " and pp.ID_SECCION='" + id.trim() + "'";
            }

            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                Map<String, Object> rec = new HashMap<String, Object>();
                rec.put("id_plantilla", rs.getString("ID_PLANTILLA_CONTRACTUAL"));
                rec.put("nombre", rs.getString("NO_PLANTILLA"));
                rec.put("plantilla", rs.getString("NO_ARCHIVO"));
                Lista.add(rec);
            }
            rs.close();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error al listar las plantillas...");
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
        return Lista;

    }

}
