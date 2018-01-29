/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import pe.edu.upeu.application.dao_imp.InterfacePresupuestoDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;

/**
 *
 * @author Leandro Burgos
 */
public class PresupuestoDAO implements InterfacePresupuestoDAO {

    String sql;
    ConexionBD cnn;
    PreparedStatement ps;
    ResultSet rs;
    CallableStatement cs;

    @Override
    public String Reg_Presupuesto(Object s) {
        System.out.println("===============INGRESANDO A Reg_Presupuesto======================");
        String p = null;
        sql = "{CALL INSERT_PRESUPUESTO (?,?,?,?,?,?)}";
        Map<String, Object> m = (Map<String, Object>) s;
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            cs = this.cnn.conex.prepareCall(sql);
            cs.setString(1, m.get("id").toString());
            cs.setString(2, m.get("cc").toString());
            cs.setString(3, m.get("temp").toString());
            cs.setString(4, m.get("idUSER").toString());
            cs.setString(5, m.get("destino").toString());
            cs.registerOutParameter(6, Types.CHAR);
            System.out.println("Insertando un nuevo registro en RHTM_PRESUPUESTO");
            cs.execute();
            p = cs.getString(6);
        } catch (SQLException | NumberFormatException e) {
            System.out.println("Error al agregar Presupuesto " + e + "MÉTODO Reg_Presupuesto");
        } finally {
            this.cnn.close();
        }
        System.out.println("===============SALIENDO DE Reg_Presupuesto======================");
        return p;
    }

    @Override
    public boolean Reg_DetPresupuesto(Object s) {
        System.out.println("===============INGRESANDO A Reg_DetPresupuesto======================");
        boolean p = false;
        sql = "INSERT into DETPRESUPUESTO values (null,?,sysdate(),?,2,?,?,?,?,?)";
        Map<String, Object> m = (Map<String, Object>) s;
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            ps = this.cnn.conex.prepareStatement(sql);
            ps.setString(1, m.get("idDes").toString());
            ps.setString(2, m.get("idUSER").toString());
            ps.setString(3, m.get("idtr").toString());
            ps.setInt(4, Integer.parseInt(m.get("SB").toString()));
            ps.setInt(5, Integer.parseInt(m.get("AF").toString()));
            ps.setInt(6, Integer.parseInt(m.get("BA").toString()));
            ps.setInt(7, Integer.parseInt(m.get("BO").toString()));
            int r = ps.executeUpdate();
            if (r > 0) {
                p = true;
            }
        } catch (SQLException | NumberFormatException e) {
            System.out.println("Error al agregar DETPresupuesto " + e + "MÉTODO Reg_DetPresupuesto");
            p = false;
        } finally {
            this.cnn.close();
        }
        System.out.println("===============SALIENDO DE Reg_DetPresupuesto======================");
        return p;
    }

    @Override
    public int comprobarContratadosByDept(String idDestino, String idReq) {
        System.out.println("===============INGRESANDO A comprobarByDept======================");
        sql = "select count(con.ID_CONTRATO) as ntra from RHTM_CONTRATO con,RHTX_TEMPORADA t, RHTM_DGP dgp where "
                + "con.ES_CONTRATO=1 and con.ID_PUESTO in (select ID_PUESTO from RHTR_PUESTO where "
                + "RHTR_PUESTO.ID_SECCION in (select ID_SECCION from RHTR_SECCION where "
                + "ID_AREA in (select ID_AREA from RHTD_AREA where ID_DEPARTAMENTO=?))) and con.ID_DGP=dgp.ID_DGP and dgp.ID_REQUERIMIENTO=?";
        int ntra = 0;
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            ps = this.cnn.conex.prepareStatement(sql);
            ps.setString(1, idDestino);
            ps.setString(2, idReq);
            rs = ps.executeQuery();
            while (rs.next()) {
                ntra = rs.getInt("ntra");
            }
        } catch (Exception e) {
            System.out.println("Error al obtener el número de trabajadores contratados por departamento " + e + " MÉTODO comprobar");
        } finally {
            this.cnn.close();
        }
        System.out.println("===============SALIENDO DE comprobarByDept======================");
        return ntra;
    }

    @Override
    public int calcTrabPresByDept(String idDestino, String idReq) {
        System.out.println("===============INGRESANDO A calcTrabPresByDept======================");
        sql = "select nvl(sum(dp.N_TRABAJADORES),0) as ntrad from RHTD_DETALLE_PRESUPUESTO dp, RHTM_PRESUPUESTO pr where dp.ID_PRESUPUESTO=pr.ID_PRESUPUESTO "
                + "and pr.ID_TEMPORADA in (select ID_TEMPORADA from RHTX_TEMPORADA where IDDESTINO in (select ID_AREA from RHTD_AREA where RHTD_AREA.ID_DEPARTAMENTO=?) "
                + "and sysdate between FECHA_INICIO and FECHA_FIN) and dp.ID_REQUERIMIENTO=?";
        int ntra = 0;
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            ps = this.cnn.conex.prepareStatement(sql);
            ps.setString(1, idDestino);
            ps.setString(2, idReq);
            rs = ps.executeQuery();
            while (rs.next()) {
                ntra = rs.getInt("ntrad");
            }
        } catch (SQLException e) {
            System.out.println("Error al obtener el número de trabajadores presupuestados por departamento " + e + " MÉTODO calcTrabPresByDept");
        } finally {
            this.cnn.close();
        }
        System.out.println("===============SALIENDO DE calcTrabPresByDept======================");
        return ntra;
    }

    @Override
    public int calcTrabPresByArea(String idPres, String idReq) {
        System.out.println("===============INGRESANDO A calcTrabPresByArea======================");
        sql = "select nvl(sum(dp.N_TRABAJADORES),0) as ntrad from RHTD_DETALLE_PRESUPUESTO dp where dp.ID_PRESUPUESTO=? and dp.ID_REQUERIMIENTO=?";
        int ntra = 0;
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            ps = this.cnn.conex.prepareStatement(sql);
            ps.setString(1, idPres);
            ps.setString(2, idReq);
            rs = ps.executeQuery();
            while (rs.next()) {
                ntra = rs.getInt("ntrad");
            }
        } catch (SQLException e) {
            System.out.println("Error al obtener el número de trabajadores presupuestados por area " + e + " MÉTODO calcTrabPresByDept");
        } finally {
            this.cnn.close();
        }
        System.out.println("===============SALIENDO DE calcTrabPresByArea======================");
        return ntra;
    }

    @Override
    public int comprobarContratadosByArea(String idDestino, String idReq) {
        System.out.println("===============INGRESANDO A comprobarContratadosByArea======================");
        sql = "select count(con.ID_CONTRATO) as ntra from RHTM_CONTRATO con,RHTX_TEMPORADA t, RHTM_DGP dgp where "
                + "con.ES_CONTRATO=1 and con.ID_PUESTO in (select RHTR_PUESTO.ID_PUESTO from RHTR_PUESTO where "
                + "RHTR_PUESTO.ID_SECCION in (select RHTR_SECCION.ID_SECCION from RHTR_SECCION where "
                + "RHTR_SECCION.ID_AREA=?)) and con.ID_DGP=dgp.ID_DGP and dgp.ID_REQUERIMIENTO=?";
        int ntra = 0;
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            ps = this.cnn.conex.prepareStatement(sql);
            ps.setString(1, idDestino);
            ps.setString(2, idReq);
            rs = ps.executeQuery();
            while (rs.next()) {
                ntra = rs.getInt("ntra");
            }
        } catch (SQLException e) {
            System.out.println("Error al obtener el número de trabajadores contratados por área " + e + " MÉTODO comprobarContratadosByArea");
        } finally {
            this.cnn.close();
        }
        System.out.println("===============SALIENDO DE comprobarContratadosByArea======================");
        return ntra;
    }
    
    @Override
    public int comprobarContratadosByPuesto(String idDestino, String idReq) {
        System.out.println("===============INGRESANDO A comprobarContratadosByPuesto======================");
        sql = "select count(con.ID_CONTRATO) as ntra from RHTM_CONTRATO con,RHTX_TEMPORADA t, RHTM_DGP dgp where "
                + "con.ES_CONTRATO=1 and con.ID_PUESTO = ? and con.ID_DGP=dgp.ID_DGP and dgp.ID_REQUERIMIENTO=?";
        int ntra = 0;
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            ps = this.cnn.conex.prepareStatement(sql);
            ps.setString(1, idDestino);
            ps.setString(2, idReq);
            rs = ps.executeQuery();
            while (rs.next()) {
                ntra = rs.getInt("ntra");
            }
        } catch (SQLException e) {
            System.out.println("Error al obtener el número de trabajadores contratados por puesto " + e + " MÉTODO comprobarContratadosByPuesto");
        } finally {
            this.cnn.close();
        }
        System.out.println("===============SALIENDO DE comprobarContratadosByPuesto======================");
        return ntra;
    }

    @Override
    public ArrayList<Map<String, ?>> getPresupuestoActual(String idDestino) {
        System.out.println("===============INGRESANDO A getPresupuestoActual======================");
        sql = "select * from RHTM_PRESUPUESTO where ID_TEMPORADA=(select ID_TEMPORADA from RHTX_TEMPORADA where "
                + "IDDESTINO=? and sysdate BETWEEN FECHA_INICIO  and FECHA_FIN) and IDDESTINO=? and ESTADO=1";
        ArrayList<Map<String, ?>> lista = new ArrayList<>();
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            ps = this.cnn.conex.prepareStatement(sql);
            ps.setString(1, idDestino);
            ps.setString(2, idDestino);
            System.out.println(sql + " - " + idDestino);
            rs = ps.executeQuery();
            while (rs.next()) {
                Map<String, Object> m = new HashMap<>();
                m.put("ID_PRESUPUESTO", rs.getString("ID_PRESUPUESTO"));
                m.put("IDDESTINO", rs.getString("IDDESTINO"));
                m.put("DESTINO", rs.getString("DESTINO"));
                m.put("ID_TEMPORADA", rs.getString("ID_TEMPORADA"));
                m.put("ESTADO", rs.getString("ESTADO"));
                m.put("ID_CENTRO_COSTO", rs.getString("ID_CENTRO_COSTO"));
                lista.add(m);
            }
        } catch (Exception e) {
            System.out.println("Error al listar Condiciones Presupuestado " + e + " MÉTODO getPresupuestoActual");
        } finally {
            this.cnn.close();
        }
        System.out.println("===============SALIENDO DE getPresupuestoActual======================");
        return lista;
    }

    @Override
    public String getIdPresupuestoActual(String idDestino) {
        System.out.println("===============INGRESANDO A getIdPresupuestoActual======================");
        sql = "select ID_PRESUPUESTO from RHTM_PRESUPUESTO where ID_TEMPORADA=(select ID_TEMPORADA from RHTX_TEMPORADA where "
                + "IDDESTINO=? and sysdate BETWEEN FECHA_INICIO  and FECHA_FIN) and IDDESTINO=? and ESTADO=1";
        ArrayList<Map<String, ?>> lista = new ArrayList<>();
        String idpres = null;
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            ps = this.cnn.conex.prepareStatement(sql);
            ps.setString(1, idDestino);
            ps.setString(2, idDestino);
            System.out.println(sql + " - " + idDestino);
            rs = ps.executeQuery();
            while (rs.next()) {
                idpres = rs.getString("ID_PRESUPUESTO");
                System.out.println(rs.getString("ID_PRESUPUESTO"));
            }
        } catch (Exception e) {
            System.out.println("Error al obtener el ID del presupuesto escogido " + e + "MÉTODO getIdPresupuestoActual");
        } finally {
            this.cnn.close();
        }
        System.out.println("===============SALIENDO DE getIdPresupuestoActual======================");
        return idpres;
    }

    @Override
    public ArrayList<Map<String, ?>> getDetallePresupuestoActual(String id) {
        System.out.println("===============INGRESANDO A getDetallePresupuestoActual======================");
        sql = "select * from RHTD_DETALLE_PRESUPUESTO where ID_PRESUPUESTO=?";
        ArrayList<Map<String, ?>> lista = new ArrayList<>();
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            ps = this.cnn.conex.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Map<String, Object> m = new HashMap<>();
                m.put("ID_DETALLE_PRESUPUESTO", rs.getString("ID_DETALLE_PRESUPUESTO"));
                m.put("ID_REQUERIMIENTO", rs.getString("ID_REQUERIMIENTO"));
                m.put("N_TRABAJADORES", rs.getString("N_TRABAJADORES"));
                m.put("ESTADO", rs.getString("ESTADO"));

                /*m.put("sbdet", rs.getString(19));
                 m.put("afdet", rs.getString(20));
                 m.put("badet", rs.getString(21));
                 m.put("bodet", rs.getString(22));*/
                lista.add(m);
            }
        } catch (SQLException e) {
            System.out.println("Error al listar Presupuestado " + e + "MÉTODO getDetallePresupuestoActual");
        } finally {
            this.cnn.close();
        }
        System.out.println("===============SALIENDO DE getDetallePresupuestoActual======================");
        return lista;
    }

    @Override
    public String getIdDetallePresupuestoActual(String id, String idreq) {
        System.out.println("===============INGRESANDO A getIdDetallePresupuestoActual======================");
        sql = "select ID_DETALLE_PRESUPUESTO from RHTD_DETALLE_PRESUPUESTO where ID_PRESUPUESTO=? and ID_REQUERIMIENTO=?";
        String iddet = null;
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            ps = this.cnn.conex.prepareStatement(sql);
            ps.setString(1, id);
            ps.setString(2, idreq);
            rs = ps.executeQuery();
            while (rs.next()) {
                iddet = rs.getString("ID_DETALLE_PRESUPUESTO");
                System.out.println(iddet);
            }
        } catch (SQLException e) {
            System.out.println("Error al obtener id de detalle presupuesto " + e + "MÉTODO getIdDetallePresupuestoActual");
        } finally {
            this.cnn.close();
        }
        System.out.println("===============SALIENDO DE getIdDetallePresupuestoActual======================");
        return iddet;
    }

    @Override
    public String statusPresupuesto(String idDestino) {
        System.out.println("===============INGRESANDO A statusPresupuesto======================");
        String s = "no";
        sql = "select * from RHTM_PRESUPUESTO where IDDESTINO=? and ESTADO='1'";
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            ps = this.cnn.conex.prepareStatement(sql);
            ps.setString(1, idDestino);
            rs = ps.executeQuery();
            while (rs.next()) {
                s = rs.getString("ID_PRESUPUESTO");
            }
        } catch (SQLException e) {
            System.out.println("Error al listar Estado de Presupuestado " + e + "MÉTODO statusPresupuesto");
        } finally {
            this.cnn.close();
        }
        System.out.println("===============SALIENDO DE statusPresupuesto======================");
        return s;
    }

    @Override
    public List<Map<String, Object>> listDetPres(String idpres) {
        System.out.println("===============INGRESANDO A listDetPres======================");
        sql = "select * from RHTD_DETALLE_PRESUPUESTO where ID_PRESUPUESTO=? and ESTADO='1'";
        List<Map<String, Object>> lista = new ArrayList();
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            ps = this.cnn.conex.prepareStatement(sql);
            ps.setString(1, idpres);
            rs = ps.executeQuery();
            while (rs.next()) {
                Map<String, Object> m = new HashMap<>();
                m.put("ID_DETALLE_PRESUPUESTO", rs.getString("ID_DETALLE_PRESUPUESTO"));
                m.put("ID_PRESUPUESTO", rs.getString("ID_PRESUPUESTO"));
                m.put("ID_REQUERIMIENTO", rs.getString("ID_REQUERIMIENTO"));
                m.put("N_TRABAJADORES", rs.getString("N_TRABAJADORES"));
                lista.add(m);
            }
        } catch (SQLException e) {
            System.out.println("Error al listar Estado de Presupuestado " + e + "MÉTODO listDetPres");
        } finally {
            this.cnn.close();
        }
        System.out.println("===============SALIENDO DE listDetPres======================");
        return lista;
    }

    @Override
    public ArrayList<Map<String, ?>> CCostos(String id, int tipo) {
        System.out.println("===============INGRESANDO A CCostos======================");
        String sr = "";
        if (tipo == 2) {
            sr = "where ID_DEPARTAMENTO=?";
        }
        if (tipo == 1) {
            sr = "where ID_AREA=?";
        }
        sql = "select * from RHVD_CENTRO_COSTO " + sr;
        ArrayList<Map<String, ?>> lista = new ArrayList<>();
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            ps = this.cnn.conex.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            System.out.println(sql);
            System.out.println(id);
            while (rs.next()) {
                Map<String, Object> m = new HashMap<>();
                m.put("idccosto", rs.getString("ID_CENTRO_COSTO"));
                m.put("codigo", rs.getString("CO_CENTRO_COSTO"));
                m.put("denominacion", rs.getString("DE_CENTRO_COSTO"));
                m.put("iddireccion", rs.getString("ID_DIRECCION"));
                m.put("no_direccion", rs.getString("NO_DIRECCION"));
                m.put("iddepartamento", rs.getString("ID_DEPARTAMENTO"));
                m.put("no_departamento", rs.getString("NO_DEP"));
                m.put("idarea", rs.getString("ID_AREA"));
                lista.add(m);
            }
        } catch (SQLException e) {
            System.out.println("Error al listar Centros de Costo " + e);
        } finally {
            this.cnn.close();
        }
        System.out.println("===============SALIENDO DE CCostos======================");
        return lista;
    }

    @Override
    public ArrayList<Map<String, ?>> historial_cont(String idDestino) {
        System.out.println("===============INGRESANDO A historial_cont======================");
        sql = "select * "
                + "from rhtm_contrato rc,rhtm_dgp dgp,rhtr_puesto rp,rhtr_seccion rs,rhtd_area ra,presupuesto pr "
                + "where dgp.ID_DGP=rc.ID_DGP "
                + "and dgp.ID_PUESTO=rp.ID_PUESTO "
                + "and rs.ID_SECCION=rp.ID_SECCION "
                + "and rs.ID_AREA=ra.ID_AREA "
                + "and pr.FE_DESDE < rc.FE_DESDE "
                + "and pr.FE_HASTA > rc.FE_HASTA "
                + "and pr.IDDESTINO=?";
        ArrayList<Map<String, ?>> lista = new ArrayList<>();
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            ps = this.cnn.conex.prepareStatement(sql);
            ps.setString(1, idDestino);
            rs = ps.executeQuery();
            while (rs.next()) {
                Map<String, Object> m = new HashMap<>();
                m.put("fe_creacion", rs.getString("fe_creacion"));
                m.put("ca_sueldo", rs.getString("ca_sueldo"));
                m.put("ca_asig_familiar", rs.getString("ca_asig_familiar"));
                m.put("ca_bono_alimento", rs.getString("ca_bono_alimento"));
                m.put("ca_bonificacion_p", rs.getString("ca_bonificacion_p"));
                //m.put("ca_bonificacion_p", rs.getString("ca_bonificacion_p"));
                lista.add(m);
            }
        } catch (Exception e) {
            System.out.println("Error al listar Condiciones Presupuestado " + e);
        } finally {
            this.cnn.close();
        }
        System.out.println("===============SALIENDO DE historial_cont======================");
        return lista;
    }

    @Override
    public boolean Reg_Temporada(String nombre, String f_i, String f_f, String id, String destino) {
        System.out.println("===============INGRESANDO A Reg_Temporada======================");
        boolean r = false;
        try {
            sql = "INSERT INTO RHTX_TEMPORADA VALUES(null,?,?,'1',?,?,?)";
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            ps = this.cnn.conex.prepareStatement(sql);
            ps.setString(1, f_i);
            ps.setString(2, f_f);
            ps.setString(3, nombre);
            ps.setString(4, id);
            ps.setString(5, destino);
            int m = ps.executeUpdate();
            if (m > 0) {
                r = true;
            }
        } catch (Exception e) {
            System.out.println("Error al registrar Temporada : " + e);
        }
        System.out.println("===============SALIENDO DE Reg_Temporada======================");
        return r;
    }

    @Override
    public ArrayList<Map<String, ?>> listTemporadas(String idDestino) {
        System.out.println("===============INGRESANDO A listTemporadas======================");
        sql = "select * from RHTX_TEMPORADA where ESTADO='1' and IDDESTINO=?";
        ArrayList<Map<String, ?>> lista = new ArrayList<>();
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            ps = this.cnn.conex.prepareStatement(sql);
            ps.setString(1, idDestino);
            rs = ps.executeQuery();
            while (rs.next()) {
                Map<String, Object> m = new HashMap<>();
                System.out.println(rs.getString("ID_TEMPORADA"));
                m.put("id_temporada", rs.getString("ID_TEMPORADA"));
                m.put("fecha_inicio", rs.getString("FECHA_INICIO"));
                m.put("fecha_fin", rs.getString("FECHA_FIN"));
                m.put("nombre_temp", rs.getString("NOMBRE_TEMP"));
                lista.add(m);
            }
        } catch (SQLException e) {
            System.out.println("Error al listar Temporadas " + e + "MÉTODO listTemporadas");
        } finally {
            this.cnn.close();
        }
        System.out.println("===============SALIENDO DE listTemporadas======================");
        return lista;
    }

    @Override
    public boolean Reg_Det_Presupuesto(Object s) {
        System.out.println("===============INGRESANDO A Reg_Det_Presupuesto======================");
        boolean r = false;
        try {
            Map<String, Object> m = (Map<String, Object>) s;
            sql = "INSERT INTO RHTD_DETALLE_PRESUPUESTO VALUES(null,?,?,?,?,'1')";
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            ps = this.cnn.conex.prepareStatement(sql);
            ps.setString(1, m.get("idP").toString());
            ps.setString(2, m.get("con").toString());
            ps.setString(3, m.get("time").toString());
            ps.setString(4, m.get("ntra").toString());
            System.out.println("Insertando nuevo registro de RHTD_DETALLE_PRESUPUESTO");
            int g = ps.executeUpdate();
            if (g > 0) {
                r = true;
            }
        } catch (Exception e) {
            System.out.println("Error al registrar Detalle Presupuesto : " + e + "MÉTODO Reg_Det_Presupuesto");
        }
        System.out.println("===============SALIENDO DE Reg_Det_Presupuesto======================");
        return r;
    }

    @Override
    public ArrayList<Map<String, ?>> listDetPresupuesto(Object s) {
        System.out.println("===============INGRESANDO A listDetPresupuesto======================");
        Map<String, Object> h = (Map<String, Object>) s;
        sql = "select r.ID_DETALLE_PRESUPUESTO,r.N_TRABAJADORES Ttotal,g.N_TRABAJADORES tra,g.ID_DETALLE_PRE_PUESTO from RHTD_DETALLE_PRESUPUESTO r, RHTH_DETALLE_PRE_PUESTO "
                + " where r.ESTADO='1' and r.ID_PRESUPUESTO=? and r.CONDICION_LABORAL=? and r.TIEMPO_TRABAJO=? "
                + "and r.ID_DETALLE_PRESUPUESTO=g.ID_DETALLE_PRESUPUESTO";
        ArrayList<Map<String, ?>> lista = new ArrayList<>();
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            ps = this.cnn.conex.prepareStatement(sql);
            ps.setString(1, h.get("idP").toString());
            ps.setString(2, h.get("con").toString());
            ps.setString(3, h.get("time").toString());
            rs = ps.executeQuery();
            while (rs.next()) {
                Map<String, Object> m = new HashMap<>();
                m.put("id_det_pres", rs.getString("ID_DETALLE_PRESUPUESTO"));
                m.put("id_det_pre_puesto", rs.getString("ID_DETALLE_PRE_PUESTO"));
                m.put("ntrabT", rs.getString("TTOTAL"));
                m.put("ntr", rs.getString("TRA"));
                lista.add(m);
            }
        } catch (SQLException e) {
            System.out.println("Error al listar DETALLE PRESUPUESTO " + e + "MÉTODO listDetPresupuesto");
        } finally {
            this.cnn.close();
        }
        System.out.println("===============SALIENDO DE listDetPresupuesto======================");
        return lista;
    }

    @Override
    public ArrayList<Map<String, ?>> compDet(String idPresupuesto, int con, int time) {
        System.out.println("===============INGRESANDO A compDet======================");
        sql = "select * from RHTD_DETALLE_PRESUPUESTO where ID_PRESUPUESTO=? and CONDICION_LABORAL=? and TIEMPO_TRABAJO=? and ESTADO=1 ";
        ArrayList<Map<String, ?>> lista = new ArrayList<>();
        this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        try {
            ps = this.cnn.conex.prepareStatement(sql);
            System.out.println(sql + " - " + idPresupuesto + " - " + con + " - " + time);
            ps.setString(1, idPresupuesto);
            ps.setInt(2, con);
            ps.setInt(3, time);
            rs = ps.executeQuery();
            while (rs.next()) {
                Map<String, Object> m = new HashMap<>();
                m.put("id_det_pres", rs.getString("ID_DETALLE_PRESUPUESTO"));
                m.put("id_presupuesto", rs.getString("ID_PRESUPUESTO"));
                m.put("ID_REQUERIMIENTO", rs.getString("ID_REQUERIMIENTO"));
                m.put("ntrabajadores", rs.getString("N_TRABAJADORES"));
                m.put("estado", rs.getString("ESTADO"));
                lista.add(m);
            }
        } catch (SQLException e) {
            //lista = new ArrayList<>();
            System.out.println("Error al listar COMPROBACION PRESUPUESTO " + e + "MÉTODO compDet");
        } finally {
            this.cnn.close();
        }
        System.out.println("===============SALIENDO DE compDet======================");
        return lista;
    }

    @Override
    public Map<String, Object> getDetPrePuesto(String idpres, String idpuesto) {
        System.out.println("===============INGRESANDO A getDetPrePuesto======================");
        sql = "select RHTR_PRESUPUESTO_PUESTO.*,RHTR_PUESTO.NO_PUESTO from RHTR_PRESUPUESTO_PUESTO,RHTR_PUESTO where "
                + "RHTR_PRESUPUESTO_PUESTO.ID_PUESTO=RHTR_PUESTO.ID_PUESTO and ID_DETALLE_PRESUPUESTO =? and RHTR_PRESUPUESTO_PUESTO.ID_PUESTO=?";
        Map<String, Object> m = new HashMap<>();
        this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        try {
            ps = this.cnn.conex.prepareStatement(sql);
            ps.setString(1, idpres);
            ps.setString(2, idpuesto);
            rs = ps.executeQuery();
            while (rs.next()) {
                m.put("ID_PRESUPUESTO_PUESTO", rs.getString("ID_PRESUPUESTO_PUESTO"));
                m.put("ID_DETALLE_PRESUPUESTO", rs.getString("ID_DETALLE_PRESUPUESTO"));
                m.put("NO_PUESTO", rs.getString("NO_PUESTO"));
                m.put("SUELDO_MIN", rs.getString("SUELDO_MIN"));
                m.put("SUELDO_MAX", rs.getString("SUELDO_MAX"));
                m.put("BONO_MIN", rs.getString("BONO_MIN"));
                m.put("BONO_MAX", rs.getString("BONO_MAX"));
                m.put("N_TRABAJADORES", rs.getString("N_TRABAJADORES"));
                m.put("BOAL_MIN", rs.getString("BOAL_MIN"));
                m.put("BOAL_MAX", rs.getString("BOAL_MAX"));
            }
        } catch (SQLException e) {
            System.out.println("Error al obtener DETALLE PRESUPUESTO TRABAJADOR " + e + " MÉTODO getDetPrePuesto");
        } finally {
            this.cnn.close();
        }
        System.out.println("===============SALIENDO DE getDetPrePuesto======================");
        return m;
    }

    @Override
    public List<Map<String, Object>> listDetPrePuesto(String idpres) {
        System.out.println("===============INGRESANDO A listDetPrePuesto======================");
        sql = "select RHTR_PRESUPUESTO_PUESTO.*,RHTR_PUESTO.NO_PUESTO from RHTR_PRESUPUESTO_PUESTO,RHTR_PUESTO where "
                + "RHTR_PRESUPUESTO_PUESTO.ID_PUESTO=RHTR_PUESTO.ID_PUESTO and ID_DETALLE_PRESUPUESTO =?";
        List<Map<String, Object>> lista = new ArrayList();
        this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        try {
            ps = this.cnn.conex.prepareStatement(sql);
            ps.setString(1, idpres);
            rs = ps.executeQuery();
            while (rs.next()) {
                Map<String, Object> m = new HashMap<>();
                m.put("ID_PRESUPUESTO_PUESTO", rs.getString("ID_PRESUPUESTO_PUESTO"));
                m.put("ID_DETALLE_PRESUPUESTO", rs.getString("ID_DETALLE_PRESUPUESTO"));
                m.put("NO_PUESTO", rs.getString("NO_PUESTO"));
                m.put("SUELDO_MIN", rs.getString("SUELDO_MIN"));
                m.put("SUELDO_MAX", rs.getString("SUELDO_MAX"));
                m.put("BONO_MIN", rs.getString("BONO_MIN"));
                m.put("BONO_MAX", rs.getString("BONO_MAX"));
                m.put("N_TRABAJADORES", rs.getString("N_TRABAJADORES"));
                m.put("BOAL_MIN", rs.getString("BOAL_MIN"));
                m.put("BOAL_MAX", rs.getString("BOAL_MAX"));
                lista.add(m);
            }
        } catch (SQLException e) {
            System.out.println("Error al listar DETALLE PRESUPUESTO TRABAJADOR " + e + " MÉTODO listDetPrePuesto");
        } finally {
            this.cnn.close();
        }
        System.out.println("===============SALIENDO DE listDetPrePuesto======================");
        return lista;
    }

    @Override
    public ArrayList<Map<String, ?>> listDetalleTra(String idDetalle) {
        System.out.println("===============INGRESANDO A listDetalleTra======================");
        sql = "";
        sql = "select * from RHTR_PRESUPUESTO_PUESTO where ID_DETALLE_PRESUPUESTO=?";
        this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        ArrayList<Map<String, ?>> lista = new ArrayList<>();
        try {
            ps = this.cnn.conex.prepareStatement(sql);
            System.out.println(sql + " - " + idDetalle);
            ps.setString(1, idDetalle);
            rs = ps.executeQuery();
            while (rs.next()) {
                Map<String, Object> m = new HashMap<>();
                m.put("id_det_pre_puesto", rs.getString("ID_PRESUPUESTO_PUESTO"));
                m.put("id_det_pres", rs.getString("ID_DETALLE_PRESUPUESTO"));
                m.put("ntrabajadores", rs.getString("N_TRABAJADORES"));
                m.put("id_puesto", rs.getString("ID_PUESTO"));
                lista.add(m);
            }
        } catch (SQLException e) {
            System.out.println("Error al listar DETALLE PRESUPUESTO TRABAJADOR " + e + " MÉTODO listDetalleTra");
        } finally {
            this.cnn.close();
        }
        System.out.println("===============SALIENDO DE listDetalleTra======================");
        return lista;
    }

    @Override
    public ArrayList<Map<String, ?>> listDetalleTraPuesto(String idPuesto, String idDet_pre_puesto) {
        System.out.println("===============INGRESANDO A listDetalleTraPuesto======================");
        sql = "";
        sql = "select * from RHTR_PRESUPUESTO_PUESTO where ID_DETALLE_PRESUPUESTO=? and ID_PUESTO=?";
        System.out.println(sql + " - " + idDet_pre_puesto + " - " + idPuesto);
        ArrayList<Map<String, ?>> lista = new ArrayList<>();
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            ps = this.cnn.conex.prepareStatement(sql);
            ps.setString(1, idDet_pre_puesto);
            ps.setString(2, idPuesto);
            rs = ps.executeQuery();
            while (rs.next()) {
                Map<String, Object> m = new HashMap<>();
                m.put("id_det_pre_puesto", rs.getString("ID_PRESUPUESTO_PUESTO"));
                m.put("id_det_pres", rs.getString("ID_DETALLE_PRESUPUESTO"));
                m.put("id_puesto", rs.getString("ID_PUESTO"));
                m.put("n_trabajadores", rs.getString("N_TRABAJADORES"));
                lista.add(m);
            }
        } catch (SQLException e) {
            System.out.println("Error al listar DETALLE PRESUPUESTO PUESTO" + e + "MÉTODO listDetalleTraPuesto");
        } finally {
            this.cnn.close();
        }
        System.out.println("===============SALIENDO DE listDetalleTraPuesto======================");
        return lista;
    }

    @Override
    public int checkNumTraDispByDetPres(String idDetPres) {
        System.out.println("===============INGRESANDO A checkNumTraDispByDetPres======================");
        int disp = 0;
        sql = "SELECT (N_TRABAJADORES-(SELECT NVL(SUM(N_TRABAJADORES),0) FROM RHTR_PRESUPUESTO_PUESTO WHERE ID_DETALLE_PRESUPUESTO=?)) AS DISPONIBLES FROM RHTD_DETALLE_PRESUPUESTO WHERE ID_DETALLE_PRESUPUESTO=?";
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            ps = this.cnn.conex.prepareStatement(sql);
            ps.setString(1, idDetPres);
            ps.setString(2, idDetPres);
            rs = ps.executeQuery();
            while (rs.next()) {
                disp = rs.getInt("DISPONIBLES");
            }
        } catch (SQLException ex) {
            Logger.getLogger(PresupuestoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            this.cnn.close();
        }
        System.out.println("==============SALIENDO DE checkNumTraDispByDetPres======================");
        return disp;
    }

    @Override
    public boolean Reg_DetTraPuesto(String idPuesto, String idDet, int ntra) {
        System.out.println("===============INGRESANDO A Reg_DetTraPuesto======================");
        boolean r = false;
        sql = "INSERT INTO RHTR_PRESUPUESTO_PUESTO (ID_PRESUPUESTO_PUESTO,ID_DETALLE_PRESUPUESTO,ID_PUESTO,N_TRABAJADORES,ESTADO) VALUES(null,?,?,?,'1')";
        this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        try {
            ps = this.cnn.conex.prepareStatement(sql);
            ps.setString(1, idDet);
            ps.setString(2, idPuesto);
            ps.setInt(3, ntra);
            int g = ps.executeUpdate();
            if (g > 0) {
                r = true;
            }
        } catch (Exception e) {
            System.out.println("Error al registrar Detalle Presupuesto Puesto : " + e + "MÉTODO Reg_DetTraPuesto");
        } finally {
            this.cnn.close();
        }
        System.out.println("===============SALIENDO DE Reg_DetTraPuesto======================");
        return r;
    }

    @Override
    public ArrayList<Map<String, ?>> infoPrePuesto(String idPuesto, String idDetPres) {
        System.out.println("===============INGRESANDO A infoPrePuesto======================");
        sql = "select * from RHTR_PRESUPUESTO_PUESTO where ID_PUESTO=? AND ID_DETALLE_PRESUPUESTO=? AND ESTADO=1";
        System.out.println(sql + " - " + idPuesto + " - " + idDetPres);
        ArrayList<Map<String, ?>> lista = new ArrayList<>();
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            ps = this.cnn.conex.prepareStatement(sql);
            ps.setString(1, idPuesto);
            ps.setString(2, idDetPres);
            rs = ps.executeQuery();
            while (rs.next()) {
                Map<String, Object> m = new HashMap<>();
                m.put("ID_PRESUPUESTO_PUESTO", rs.getString("ID_PRESUPUESTO_PUESTO"));
                m.put("ID_DETALLE_PRESUPUESTO", rs.getString("ID_DETALLE_PRESUPUESTO"));
                m.put("ID_PUESTO", rs.getString("ID_PUESTO"));
                m.put("sueldo_min", rs.getString("SUELDO_MIN"));
                m.put("sueldo_max", rs.getString("SUELDO_MAX"));
                m.put("bono_min", rs.getString("BONO_MIN"));
                m.put("bono_max", rs.getString("BONO_MAX"));
                m.put("boal_min", rs.getString("BOAL_MIN"));
                m.put("boal_max", rs.getString("BOAL_MAX"));
                m.put("n_trabajadores", rs.getString("N_TRABAJADORES"));
                lista.add(m);
            }
        } catch (SQLException e) {
            System.out.println("Error al listar DETALLE PRESUPUESTO PUESTO SUELDO" + e + "MÉTODO infoPrePuesto");
        } finally {
            this.cnn.close();
        }
        System.out.println("===============SALIENDO DE infoPrePuesto======================");
        return lista;
    }

    @Override
    public boolean UpdateDetSueldo(Object s) {
        System.out.println("===============INGRESANDO A UpdateDetSueldo======================");
        boolean p = false;
        sql = "UPDATE RHTR_PRESUPUESTO_PUESTO SET SUELDO_MIN=?,SUELDO_MAX=?,BONO_MIN=?,BONO_MAX=?,BOAL_MIN=?,BOAL_MAX=?,FECHA_MODIFICACION=sysdate WHERE ID_PRESUPUESTO_PUESTO=? ";
        Map<String, Object> m = (Map<String, Object>) s;
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            ps = this.cnn.conex.prepareStatement(sql);
            ps.setDouble(1, Double.parseDouble(m.get("sueldo_min").toString()));
            ps.setDouble(2, Double.parseDouble(m.get("sueldo_max").toString()));
            ps.setDouble(3, Double.parseDouble(m.get("bono_min").toString()));
            ps.setDouble(4, Double.parseDouble(m.get("bono_max").toString()));
            ps.setDouble(5, Double.parseDouble(m.get("boal_min").toString()));
            ps.setDouble(6, Double.parseDouble(m.get("boal_max").toString()));
            ps.setString(7, m.get("idPrePuesto").toString());
            int r = ps.executeUpdate();
            if (r > 0) {
                p = true;
            }
        } catch (SQLException | NumberFormatException e) {
            System.out.println("Error al actualizar DETPresupuestoPUESTO  con id " + m.get("idPrePuesto").toString() + " " + e + "MÉTODO UpdateDetSueldo");
            p = false;
        } finally {
            this.cnn.close();
        }
        System.out.println("===============SALIENDO DE UpdateDetSueldo======================");
        return p;
    }

    @Override
    public boolean Reg_DetSueldo(Object s) {
        System.out.println("===============INGRESANDO A Reg_DetSueldo======================");
        boolean p = false;
        sql = "INSERT INTO RHTR_PRESUPUESTO_PUESTO (ID_PRESUPUESTO_PUESTO,ID_PUESTO,SUELDO_MIN,SUELDO_MAX,BONO_MIN,BONO_MAX,BOAL_MIN,BOAL_MAX,FECHA_MODIFICACION) "
                + "VALUES (NULL,?,?,?,?,?,?,?,sysdate)";
        Map<String, Object> m = (Map<String, Object>) s;
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            ps = this.cnn.conex.prepareStatement(sql);
            ps.setString(1, m.get("idDet").toString());
            ps.setDouble(2, Double.parseDouble(m.get("sueldo_min").toString()));
            ps.setDouble(3, Double.parseDouble(m.get("sueldo_max").toString()));
            ps.setDouble(4, Double.parseDouble(m.get("bono_min").toString()));
            ps.setDouble(5, Double.parseDouble(m.get("bono_max").toString()));
            ps.setDouble(6, Double.parseDouble(m.get("boal_min").toString()));
            ps.setDouble(7, Double.parseDouble(m.get("boal_max").toString()));
            int r = ps.executeUpdate();
            if (r > 0) {
                p = true;
            }
        } catch (SQLException | NumberFormatException e) {
            System.out.println("Error al agregar DETPresupuestoPUESTO " + e + "MÉTODO Reg_DetSueldo");
            p = false;
        } finally {
            this.cnn.close();
        }
        System.out.println("===============SALIENDO DE Reg_DetSueldo======================");
        return p;
    }

}
