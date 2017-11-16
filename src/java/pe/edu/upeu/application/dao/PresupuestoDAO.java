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
import java.util.Map;
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
            cs.execute();
            p = cs.getString(6);
        } catch (SQLException | NumberFormatException e) {
            System.out.println("Error al agregar Presupuesto " + e);
        } finally {
            this.cnn.close();
        }
        return p;
    }

    @Override
    public boolean Reg_DetPresupuesto(Object s) {
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
            System.out.println("Error al agregar DETPresupuesto " + e);
            p = false;
        } finally {
            this.cnn.close();
        }
        return p;
    }

    @Override
    public ArrayList<Map<String, ?>> comprobar(String idDestino) { //cambiar esta consulta
        sql = "select count(dgp.ID_TRABAJADOR) ntr,sum(dgp.CA_SUELDO*12) nsu "
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
                m.put("ntrabajadores", rs.getInt("ntr"));
                m.put("monto", rs.getDouble("nsu"));
                lista.add(m);
            }
        } catch (Exception e) {
            System.out.println("Error al listar Condiciones Presupuestado " + e);
        } finally {
            this.cnn.close();
        }
        return lista;
    }

    @Override
    public ArrayList<Map<String, ?>> dataPresupuesto(String idDestino) {
        sql = "select * from PRESUPUESTO where  sysdate BETWEEN FE_DESDE  and FE_HASTA and IDDESTINO=? and ESTADO=1";
        ArrayList<Map<String, ?>> lista = new ArrayList<>();
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            ps = this.cnn.conex.prepareStatement(sql);
            ps.setString(1, idDestino);
            rs = ps.executeQuery();
            while (rs.next()) {
                Map<String, Object> m = new HashMap<>();
                m.put("ntrabajadores", rs.getInt("n_trabajadores"));
                m.put("sbasico", rs.getDouble("SBASICO"));
                m.put("afamiliar", rs.getDouble("AFAMILIAR"));
                m.put("bonoal", rs.getDouble("BONOAL"));
                m.put("bonificacion", rs.getDouble("BONIFICACION"));
                lista.add(m);
            }
        } catch (Exception e) {
            System.out.println("Error al listar Condiciones Presupuestado " + e);
        } finally {
            this.cnn.close();
        }
        return lista;
    }

    @Override
    public ArrayList<Map<String, ?>> pActual(String id) {
        sql = "select * from PRESUPUESTO p,DET_PRESUPUESTO d "
                + "where p.IDPRESUPUESTO=d.IDPRESUPUESTO  "
                + "and p.IDDESTINO=? "
                + "and sysdate BETWEEN p.FE_DESDE and p.FE_HASTA "
                + "and p.ESTADO='1' ";
        ArrayList<Map<String, ?>> lista = new ArrayList<>();
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            ps = this.cnn.conex.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Map<String, Object> m = new HashMap<>();
                m.put("idpresupuesto", rs.getString("IDPRESUPUESTO"));
                m.put("iddestino", rs.getString("IDDESTINO"));
                m.put("idccosto", rs.getString("ID_CENTRO_COSTO"));
                m.put("fe_desde", rs.getString("FE_DESDE"));
                m.put("fe_hasta", rs.getString("FE_HASTA"));
                m.put("n_trabajadores", rs.getString("N_TRABAJADORES"));
                m.put("iddet_presupuesto", rs.getString("IDDET_PRESUPUESTO"));
                m.put("f_modif", rs.getString("F_MODIF"));
                m.put("operacion", rs.getString("OPERACION"));
                m.put("ctrabajador", rs.getString("CTRABAJADOR"));
                m.put("tipo", rs.getString("TIPO"));

                m.put("sbgeneral", rs.getString("SBASICO"));
                m.put("afgeneral", rs.getString("AFAMILIAR"));
                m.put("bageneral", rs.getString("BONOAL"));
                m.put("bogeneral", rs.getString("BONIFICACION"));

                /*m.put("sbdet", rs.getString(19));
                 m.put("afdet", rs.getString(20));
                 m.put("badet", rs.getString(21));
                 m.put("bodet", rs.getString(22));*/
                lista.add(m);
            }
        } catch (SQLException e) {
            System.out.println("Error al listar Presupuestado " + e);
        } finally {
            this.cnn.close();
        }
        return lista;
    }

    @Override
    public String statusPresupuesto(String idDestino) {
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
            System.out.println("Error al listar Estado de Presupuestado " + e);
        } finally {
            this.cnn.close();
        }
        return s;
    }

    @Override
    public ArrayList<Map<String, ?>> CCostos(String id, int tipo) {
        String sr = "";
        if (tipo == 2) {
            sr = "where ID_DEPARTAMENTO=?";
        }
        if (tipo == 1) {
            sr = "where ID_AREA=?";
        }
        sql = "select * from RHVD_CENTRO_COSTO " + sr;
        System.out.println(sql);
        System.out.println(id);
        ArrayList<Map<String, ?>> lista = new ArrayList<>();
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            ps = this.cnn.conex.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
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
        return lista;
    }

    @Override
    public ArrayList<Map<String, ?>> historial_cont(String idDestino) {
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
        return lista;
    }

    @Override
    public boolean Reg_Temporada(String nombre, String f_i, String f_f, String id, String destino) {
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
        return r;
    }

    @Override
    public ArrayList<Map<String, ?>> listTemporadas(String idDestino) {
        sql = "select * from RHTX_TEMPORADA where ESTADO='1' and IDDESTINO=?";
        ArrayList<Map<String, ?>> lista = new ArrayList<>();
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            ps = this.cnn.conex.prepareStatement(sql);
            ps.setString(1, idDestino);
            rs = ps.executeQuery();
            while (rs.next()) {
                Map<String, Object> m = new HashMap<>();
                m.put("id_temporada", rs.getString("ID_TEMPORADA"));
                m.put("fecha_inicio", rs.getString("FECHA_INICIO"));
                m.put("fecha_fin", rs.getString("FECHA_FIN"));
                m.put("nombre_temp", rs.getString("NOMBRE_TEMP"));
                lista.add(m);
            }
        } catch (SQLException e) {
            System.out.println("Error al listar Temporadas " + e);
        } finally {
            this.cnn.close();
        }
        return lista;
    }

    @Override
    public boolean Reg_Det_Presupuesto(Object s) {
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
            int g = ps.executeUpdate();
            if (g > 0) {
                r = true;
            }
        } catch (Exception e) {
            System.out.println("Error al registrar Detalle Presupuesto : " + e);
        }
        return r;
    }

    @Override
    public ArrayList<Map<String, ?>> listDetPresupuesto(Object s) {
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
            System.out.println("Error al listar DETALLE PRESUPUESTO " + e);
        } finally {
            this.cnn.close();
        }
        return lista;
    }

    @Override
    public ArrayList<Map<String, ?>> compDet(String idPresupuesto, int con, int time) {
        sql = "select * from RHTD_DETALLE_PRESUPUESTO "
                + "where ID_PRESUPUESTO=? "
                + "and CONDICION_LABORAL=? "
                + "and TIEMPO_TRABAJO=? "
                + "and ESTADO=1 ";
        ArrayList<Map<String, ?>> lista = new ArrayList<>();
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            ps = this.cnn.conex.prepareStatement(sql);
            ps.setString(1, idPresupuesto);
            ps.setInt(2, con);
            ps.setInt(3, time);
            rs = ps.executeQuery();
            while (rs.next()) {
                Map<String, Object> m = new HashMap<>();
                m.put("id_det_pres", rs.getString("ID_DETALLE_PRESUPUESTO"));
                m.put("id_presupuesto", rs.getString("ID_PRESUPUESTO"));
                m.put("condocion_laboral", rs.getString("CONDICION_LABORAL"));
                m.put("tiempo_trabajo", rs.getString("TIEMPO_TRABAJO"));
                m.put("ntrabajadores", rs.getString("N_TRABAJADORES"));
                m.put("estado", rs.getString("ESTADO"));
                lista.add(m);
            }
        } catch (SQLException e) {
            System.out.println("Error al listar COMPROBACION PRESUPUESTO " + e);
        } finally {
            this.cnn.close();
        }
        return lista;
    }

    @Override
    public ArrayList<Map<String, ?>> listDetalleTra(String idDetalle) {
        sql = "select * from RHTH_DETALLE_PRE_PUESTO where ID_DETALLE_PRESUPUESTO=?";
        ArrayList<Map<String, ?>> lista = new ArrayList<>();
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            ps = this.cnn.conex.prepareStatement(sql);
            ps.setString(1, idDetalle);
            rs = ps.executeQuery();
            while (rs.next()) {
                Map<String, Object> m = new HashMap<>();
                m.put("id_det_pre_puesto", rs.getString("ID_DETALLE_PRE_PUESTO"));
                m.put("id_det_pres", rs.getString("ID_DETALLE_PRESUPUESTO"));
                m.put("ntrabajadores", rs.getString("N_TRABAJADORES"));
                m.put("id_puesto", rs.getString("ID_PUESTO"));
                lista.add(m);
            }
        } catch (SQLException e) {
            System.out.println("Error al listar DETALLE PRESUPUESTO TRABAJADOR " + e);
        } finally {
            this.cnn.close();
        }
        return lista;
    }

    @Override
    public ArrayList<Map<String, ?>> listDetalleTraPuesto(String idPuesto, String idDet_pre_puesto) {
        sql = "select * from RHTH_DETALLE_PRE_PUESTO where ID_DETALLE_PRESUPUESTO=? and ID_PUESTO=?";
        ArrayList<Map<String, ?>> lista = new ArrayList<>();
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            ps = this.cnn.conex.prepareStatement(sql);
            ps.setString(1, idDet_pre_puesto);
            ps.setString(2, idPuesto);
            rs = ps.executeQuery();
            while (rs.next()) {
                Map<String, Object> m = new HashMap<>();
                m.put("id_det_pre_puesto", rs.getString("ID_DETALLE_PRE_PUESTO"));
                m.put("id_det_pres", rs.getString("ID_DETALLE_PRESUPUESTO"));
                m.put("id_puesto", rs.getString("ID_PUESTO"));
                m.put("n_trabajadores", rs.getString("N_TRABAJADORES"));
                lista.add(m);
            }
        } catch (SQLException e) {
            System.out.println("Error al listar DETALLE PRESUPUESTO PUESTO" + e);
        } finally {
            this.cnn.close();
        }
        return lista;
    }

    @Override
    public boolean Reg_DetTraPuesto(String idPuesto, String idDet, int ntra) {
        boolean r = false;
        try {
            sql = "INSERT INTO RHTH_DETALLE_PRE_PUESTO VALUES(null,?,?,?)";
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            ps = this.cnn.conex.prepareStatement(sql);
            ps.setString(1, idDet);
            ps.setString(2, idPuesto);
            ps.setInt(3, ntra);
            int g = ps.executeUpdate();
            if (g > 0) {
                r = true;
            }
        } catch (Exception e) {
            System.out.println("Error al registrar Detalle Presupuesto Puesto : " + e);
        }
        return r;
    }

    @Override
    public ArrayList<Map<String, ?>> infoPrePuesto(String idDetPuesto) {
        sql = "select * from RHTR_PRESUPUESTO_PUESTO where ID_PUESTO=? AND ESTADO=1";
        ArrayList<Map<String, ?>> lista = new ArrayList<>();
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            ps = this.cnn.conex.prepareStatement(sql);
            ps.setString(1, idDetPuesto);
            rs = ps.executeQuery();
            while (rs.next()) {
                Map<String, Object> m = new HashMap<>();
                m.put("id_pres_puesto", rs.getString("ID_PRESUPUESTO_PUESTO"));
                m.put("id_det_pre_puesto", rs.getString("ID_DETALLE_PRE_PUESTO"));
                m.put("sueldo_min", rs.getDouble("SUELDO_MIN"));
                m.put("sueldo_max", rs.getDouble("SUELDO_MAX"));
                m.put("bono_min", rs.getDouble("BONO_MIN"));
                m.put("bono_max", rs.getDouble("BONO_MAX"));
                m.put("boal_min", rs.getDouble("BOAL_MIN"));
                m.put("boal_max", rs.getDouble("BOAL_MAX"));
                m.put("n_trabajadores", rs.getString("N_TRABAJADORES"));
                lista.add(m);
            }
        } catch (SQLException e) {
            System.out.println("Error al listar DETALLE PRESUPUESTO PUESTO SUELDO" + e);
        } finally {
            this.cnn.close();
        }
        return lista;
    }

    @Override
    public boolean Reg_DetSueldo(Object s) {
        boolean p = false;
        sql = "INSERT INTO RHTR_PRESUPUESTO_PUESTO (ID_PRESUPUESTO_PUESTO,ID_PUESTO,SUELDO_MIN,SUELDO_MAX,BONO_MIN,BONO_MAX,BOAL_MIN,BOAL_MAX,ESTADO,FECHA_MODIFICACION) "
                + "VALUES (NULL,?,?,?,?,?,?,?,'1',sysdate)";
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
            System.out.println("Error al agregar DETPresupuestoPUESTO " + e);
            p = false;
        } finally {
            this.cnn.close();
        }
        return p;
    }

}
