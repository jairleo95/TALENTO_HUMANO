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
import pe.edu.upeu.application.dao_imp.InterfaceNotificationDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;
import pe.edu.upeu.application.model.Notification;

/**
 *
 * @author Cesar
 */
public class NotificationDAO implements InterfaceNotificationDAO {

    public ConexionBD conn;
    public String sql;
    public ResultSet rs;

    @Override
    public void Registrar(Notification x) {
        sql = "{CALL RHSP_INSERT_NOTIFICATION( ?, ?, ?, ?, ?, ?, ?)}";
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.conn.conex.prepareCall(sql);
            cst.setString(1, x.getId_rol());
            cst.setString(2, x.getEs_visualizado());
            cst.setString(3, x.getEs_leido());
            cst.setString(4, x.getDe_notification());
            cst.setString(5, x.getDi_notification());
            cst.setString(6, x.getTitulo());
            cst.setString(7, x.getTipo_notification());
            cst.execute();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error aquiii..." + e);
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
    }

    @Override
    public List<Notification> List_Notifications() {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        sql = "select * from RHTV_NOTIFICATION order by FECHA_REG desc";
        List<Notification> list = new ArrayList<Notification>();
        try {
            rs = this.conn.query(sql);

            while (rs.next()) {
                Notification n = new Notification();
                n.setId_notification(rs.getString("id_notification"));
                n.setId_rol(rs.getString("id_rol"));
                n.setEs_visualizado(rs.getString("es_visualizado"));
                n.setEs_leido(rs.getString("es_leido"));
                n.setDe_notification(rs.getString("de_notification"));
                n.setDi_notification(rs.getString("di_notification"));
                n.setTitulo(rs.getString("titulo"));
                n.setFecha(rs.getString("fecha_reg"));
                n.setTipo_notification(rs.getString("tipo_notification"));
                list.add(n);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error :" + e.getMessage());
        } finally {
            this.conn.close();
        }
        return list;
    }

    @Override
    public int CountUnreadAuthorized() {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        sql = "select count(*) as nuevas from RHTV_NOTIFICATION where ES_VISUALIZADO=0 and TIPO_NOTIFICATION=1 order by FECHA_REG desc";
        int n=0;
        try {
            rs = this.conn.query(sql);
            while (rs.next()) {
                n = Integer.parseInt(rs.getString("nuevas"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error :" + e.getMessage());
        } finally {
            this.conn.close();
        }
        return n;
    }

    @Override
    public int CountUnreadUnAuthorized() {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        sql = "select count(*) as nuevas from RHTV_NOTIFICATION where ES_VISUALIZADO=0 and TIPO_NOTIFICATION=0 order by FECHA_REG desc";
        int n=0;
        try {
            rs = this.conn.query(sql);
            while (rs.next()) {
                n = Integer.parseInt(rs.getString("nuevas"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error :" + e.getMessage());
        } finally {
            this.conn.close();
        }
        return n;
    }
    
    @Override
    public List<Map<String, ?>> List_Notifications_json() {
        List<Map<String, ?>> list = new ArrayList<Map<String, ?>>();
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            sql = "select * from rhtv_notification order by FECHA_REG desc";
            rs = this.conn.query(sql);
            while (rs.next()) {
                Map<String, Object> rec = new HashMap<String, Object>();
                rec.put("id_notification", rs.getString("id_notification"));
                rec.put("id_rol", rs.getString("id_rol"));
                rec.put("es_visualizado", rs.getString("es_visualizado"));
                rec.put("es_leido", rs.getString("es_leido"));
                rec.put("de_notification", rs.getString("de_notification"));
                rec.put("di_notification", rs.getString("di_notification"));
                rec.put("titulo", rs.getString("titulo"));
                rec.put("fecha", rs.getString("fecha_reg"));
                rec.put("tipo_notification", rs.getString("tipo_notification"));
                list.add(rec);
            }
        } catch (SQLException e) {
            System.out.println("ERROR SQL: " + e);
        } catch (Exception e) {
            System.out.println("ERROR EXCEPTION: " + e);
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
        return list;

    }

    @Override
    public void visualizado(String id) {

        sql = "{CALL RHSP_UPDATE_VIS_NOTIFICATION (?)}";
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.conn.conex.prepareCall(sql);
            cst.setString(1, id);
            cst.execute();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error arreglar aquiii..." + e);
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
    }

    @Override
    public void leido(String id) {
        sql = "{CALL RHSP_UPDATE_REA_NOTIFICATION (?)}";
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.conn.conex.prepareCall(sql);
            cst.setString(1, id);
            cst.execute();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error arreglar aquiii..." + e);
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
    }

}
