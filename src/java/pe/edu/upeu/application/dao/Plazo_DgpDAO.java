/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.dao;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import pe.edu.upeu.application.dao_imp.InterfacePlazo_DgpDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;
import pe.edu.upeu.application.model.V_Dgp_Plazo;
import pe.edu.upeu.application.web.controller.CConversion;

/**
 *
 * @author JAIR
 */
public class Plazo_DgpDAO implements InterfacePlazo_DgpDAO {

    ConexionBD conn;
    CConversion c = new CConversion();

    @Override
    public List<Map<String, ?>> List_Plazo(String t_List) {

        List<Map<String, ?>> lista = new ArrayList<Map<String, ?>>();
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "select id_plazo,no_plazo,det_alerta ,to_char(fe_desde,'yyyy-mm-dd')  as fe_desde ,to_char(fe_hasta,'yyyy-mm-dd')  as fe_hasta,TO_CHAR(fe_hasta,'MONTH','nls_date_language=spanish')  as mes   from rhtr_plazo where es_plazo ='1' and id_requerimiento='0' and SYSDATE BETWEEN FE_DESDE AND FE_HASTA and ti_plazo='1'";
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {

                Map<String, Object> rec = new HashMap<String, Object>();
                rec.put("id", rs.getString("id_plazo"));
                rec.put("nom", rs.getString("no_plazo"));
                rec.put("det", rs.getString("DET_ALERTA"));
                rec.put("desde", rs.getString("FE_DESDE"));
                rec.put("hasta", rs.getString("FE_HASTA"));
                rec.put("mes", rs.getString("mes"));
                lista.add(rec);
            }
            rs.close();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR");
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
            }
        }
        return lista;

    }

    @Override
    public List<Map<String, ?>> Listar_Plazo(String tipo, String req, int dias, String dep) {

        List<Map<String, ?>> lista = new ArrayList<Map<String, ?>>();
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = " select *  from rhvd_plazo where no_plazo is not null";

            sql += (!tipo.equals("")) ? " AND  ti_plazo  = '" + tipo.trim() + "'" : "";
            sql += (!tipo.equals("")) ? " AND  id_requerimiento  = '" + req.trim() + "'" : "";
            sql += (!dep.equals("")) ? " AND  ID_DEPARTAMENTO_TOLERANCIA  = '" + dep.trim() + "'" : "";

            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {

                Map<String, Object> rec = new HashMap<String, Object>();
                rec.put("id", rs.getString("id_plazo"));
                rec.put("nom", rs.getString("no_plazo"));
                rec.put("det", rs.getString("DET_ALERTA"));
                rec.put("desde", rs.getString("FE_DESDE"));
                rec.put("hasta", rs.getString("FE_HASTA"));
                rec.put("id_req", rs.getString("id_requerimiento"));
                rec.put("req", rs.getString("no_req"));
                rec.put("planilla", rs.getString("ti_planilla"));
                rec.put("estado", rs.getString("es_plazo"));
                rec.put("tipo", rs.getString("ti_plazo"));
                rec.put("dep", rs.getString("ID_DEPARTAMENTO_TOLERANCIA"));
                rec.put("dias", rs.getString("CA_DIAS_TOLERANCIA"));
                lista.add(rec);
            }
            rs.close();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR");
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
            }
        }
        return lista;

    }

    @Override
    public String INSERT_PLAZO(String ID_PLAZO, String NO_PLAZO, String DET_ALERTA, String FE_DESDE, String FE_HASTA, String ES_PLAZO, String ID_REQUERIMIENTO, String TI_PLAZO, int CA_DIAS_TOLERANCIA, String ID_DEPARTAMENTO_TOLERANCIA) {
        String id = "";
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.conn.conex.prepareCall("{CALL RHSP_INSERT_PLAZO( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,? )} ");
            cst.setString(1, null);
            cst.setString(2, NO_PLAZO);
            cst.setString(3, DET_ALERTA);
            cst.setString(4, c.convertFecha(FE_DESDE));
            cst.setString(5, c.convertFecha(FE_HASTA));
            cst.setString(6, ES_PLAZO);
            cst.setString(7, ID_REQUERIMIENTO);
            cst.setString(8, TI_PLAZO);
            cst.setInt(9, CA_DIAS_TOLERANCIA);
            cst.setString(10, ID_DEPARTAMENTO_TOLERANCIA);
            cst.registerOutParameter(11, Types.CHAR);
            cst.execute();
            id = cst.getString(11);
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR :" + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
        return id;
    }

    @Override
    public void UPDATE_PLAZO(String ID_PLAZO, String NO_PLAZO, String DET_ALERTA, String FE_DESDE, String FE_HASTA, String ES_PLAZO) {
        try {

            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.conn.conex.prepareCall("{CALL RHSP_UPDATE_PLAZO( ?, ?, ?, ?, ?, ?)}");
            cst.setString(1, ID_PLAZO);
            cst.setString(2, NO_PLAZO);
            cst.setString(3, DET_ALERTA);
            cst.setString(4, c.convertFecha(FE_DESDE));
            cst.setString(5, c.convertFecha(FE_HASTA));
            cst.setString(6, "1");
            cst.execute();
        } catch (SQLException ex) {
        } catch (ParseException ex) {
            Logger.getLogger(Plazo_DgpDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            this.conn.close();
        }
    }

    @Override
    public void REMOVE_PLAZO(String ID_PLAZO) {

        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = " DELETE FROM RHTR_PLAZO WHERE ID_PLAZO='" + ID_PLAZO.trim() + "'";
            this.conn.ejecutar(sql);
        } catch (Exception e) {
            this.conn.close();
        }

    }

    @Override
    public List<V_Dgp_Plazo> Lista_detalle_plazo(String id) {

        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select * from rhvd_dgp_plazo_1 where id_dgp='" + id.trim() + "'";
        List<V_Dgp_Plazo> list = new ArrayList<V_Dgp_Plazo>();
        try {
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                V_Dgp_Plazo v = new V_Dgp_Plazo();

                v.setNo_trabajador(rs.getString("no_trabajador"));
                v.setAp_paterno(rs.getString("ap_paterno"));
                v.setAp_materno(rs.getString("ap_materno"));
                v.setNo_puesto(rs.getString("no_puesto"));
                v.setId_plazo(rs.getString("id_plazo"));
                v.setNo_plazo(rs.getString("no_plazo"));
                v.setFe_desde(rs.getString("fe_desde"));
                v.setFe_hasta(rs.getString("fe_hasta"));
                v.setId_requerimiento(rs.getString("id_requerimiento"));
                v.setId_dgp(rs.getString("id_dgp"));
                v.setId_trabajador(rs.getString("id_trabajador"));
                v.setFe_creacion(rs.getString("fe_creacion"));
                v.setEs_plazo_cumplido(rs.getString("es_plazo_cumplido"));
                v.setNo_req(rs.getString("no_req"));
                v.setDet_alerta(rs.getString("det_alerta"));
                list.add(v);
            }
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }
        return list;

    }

    @Override
    public String fecha_maxima_plazo() {
        String fecha = "";
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "select TO_CHAR(sysdate+CA_DIAS_TOLERANCIA ,'yyyy-mm-dd','nls_date_language=spanish') from RHTR_PLAZO where TI_PLAZO='2' and ES_PLAZO ='1'";
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                fecha = rs.getString(1);
            }
            rs.close();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR");
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
            }
        }
        return fecha;
    }

    @Override
    public List<Map<String, ?>> Listar_Plazo_id(String id_tipo, String iddgp) {

        List<Map<String, ?>> lista = new ArrayList<Map<String, ?>>();
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "select  *  from rhtr_plazo where ti_plazo='" + id_tipo.trim() + "' and id_plazo not in (select  id_plazo  from RHTD_SOLICITUD_DGP where ID_DGP='" + iddgp + "')";
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {

                Map<String, Object> rec = new HashMap<String, Object>();
                rec.put("id", rs.getString("id_plazo"));
                rec.put("nombre", rs.getString("no_plazo"));
                lista.add(rec);
            }
            rs.close();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR");
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
            }
        }
        return lista;

    }

    @Override
    public void validar_Vig_plazos() {
        String id = "";
        Double dia = 0.0;
        Double mes = 0.0;
        Double ano = 0.0;
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "SELECT id_plazo,(extract (month from FE_HASTA) -  extract(month from sysdate))as meses_con,(extract (day from FE_HASTA) -  extract(day from sysdate))as dia_con,(extract (year from FE_HASTA) -  extract(year from sysdate))as anno_con FROM RHTR_PLAZO";
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                id = rs.getString("id_plazo");
                mes = rs.getDouble("meses_con");
                dia = rs.getDouble("dia_con");
                ano = rs.getDouble("anno_con");
                if (ano < 0) {
                    this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
                    CallableStatement cst = this.conn.conex.prepareCall("{CALL RHSP_DESHABI_PLAZO( ?)}");
                    cst.setString(1, id);
                    cst.execute();
                } else if (ano == 0) {
                    if (mes < 0) {
                        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
                        CallableStatement cst = this.conn.conex.prepareCall("{CALL RHSP_DESHABI_PLAZO( ?)}");
                        cst.setString(1, id);
                        cst.execute();
                    } else if (mes == 0) {
                        if (dia < 0) {
                            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
                            CallableStatement cst = this.conn.conex.prepareCall("{CALL RHSP_DESHABI_PLAZO( ?)}");
                            cst.setString(1, id);
                            cst.execute();
                        } else if (dia == 0 || dia > 0) {
                        }
                    } else if (mes > 0) {
                    }
                } else if (ano > 0) {
                }
            }
            rs.close();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR");
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
            }
        }
    }

    @Override
    public String HABILITAR_FECHA(String tipo, String req, String dia, String dep) {
        String fecha = "";
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cs = this.conn.conex.prepareCall("begin   ? :=rhfu_fecha_habilitada(?,?,?,?);end;");
            cs.registerOutParameter(1, Types.CHAR);
            cs.setString(2, tipo);
            cs.setString(3, req);
            cs.setString(4, dia);
            cs.setString(5, dep);
            cs.execute();
            fecha = cs.getString(1);
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR");
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
            }
        }
        return fecha;
    }

    @Override
    public void Validar_Cumplimiento_plazo_t2() {
        String id_plazo = "";
        String id_cum_plazo = "";
        String id_dgp = "";
        String estado = "";
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "SELECT pl.ID_PLAZO,cp.ID_CUMPLIMIENTO_PLAZO ,cp.ID_DGP,pl.FE_DESDE,pl.FE_HASTA,cp.ES_CUMPLE_PLAZO FROM RHTR_CUMPLIMIENTO_PLAZO cp, RHTR_PLAZO pl WHERE pl.ID_PLAZO = cp.ID_PLAZO and pl.TI_PLAZO='2'";
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                id_plazo = rs.getString("ID_PLAZO");
                id_cum_plazo = rs.getString("ID_CUMPLIMIENTO_PLAZO");
                id_dgp = rs.getString("ID_DGP");
                estado = rs.getString("ES_CUMPLE_PLAZO");
                if (estado.trim().equals("0")) {
                } else if (estado.trim().equals("1")) {
                    String dep = "";
                    int cont = 0;
                    int cont2 = 0;
                    String Sqlcont = "SELECT COUNT(*) FROM RHVD_USER_AUT u ,RHTC_PASOS p , RHVD_USUARIO du WHERE u.ID_EMPLEADO   =du.ID_EMPLEADO AND u.ID_PASOS = p.ID_PASOS AND u.ID_DGP ='" + id_dgp.trim() + "'AND TRIM(u.ID_PUESTO)<>'0'";
                    ResultSet rscon = this.conn.query(Sqlcont);
                    while (rscon.next()) {
                        cont = rscon.getInt(1);
                    }
                    String sql2 = "SELECT u.ID_TRABAJADOR, u.ID_ROL, u.ID_DEPARTAMENTO, du.NO_TRABAJADOR ,du.AP_PATERNO,du.AP_MATERNO, p.DE_PASOS AS paso FROM RHVD_USER_AUT u ,RHTC_PASOS p , RHVD_USUARIO du WHERE u.ID_EMPLEADO   =du.ID_EMPLEADO AND u.ID_PASOS = p.ID_PASOS AND u.ID_DGP ='" + id_dgp.trim() + "'AND TRIM(u.ID_PUESTO)<>'0'";
                    ResultSet rs1 = this.conn.query(sql2);
                    while (rs1.next()) {
                        dep = rs1.getString("ID_DEPARTAMENTO");
                        if (dep.trim().equals("DPT-0019")) {
                            cont2++;
                        }
                    }
                    if (cont == cont2) {
                        int Estado_usu = 1;
                        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
                        CallableStatement cst = this.conn.conex.prepareCall("{CALL VAL_CUMPLE_PLAZO( ?, ?, ?)}");
                        cst.setInt(1, Estado_usu);
                        cst.setString(2, id_plazo);
                        cst.setString(3, id_cum_plazo);
                        cst.execute();
                    } else if (cont2 == 0) {
                        int Estado_usu = 0;
                        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
                        CallableStatement cst = this.conn.conex.prepareCall("{CALL VAL_CUMPLE_PLAZO( ?, ?, ?)}");
                        cst.setInt(1, Estado_usu);
                        cst.setString(2, id_plazo);
                        cst.setString(3, id_cum_plazo);
                        cst.execute();
                    }
                } else if (estado.trim().equals("2")) {
                }
            }
            rs.close();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR");
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
            }
        }
    }

    @Override
    public void Validar_Cumplimiento_plazo_t1() {
        String id = "";
        String id_cumplimiento_plazo = "";
        String es_cumple_plazo = "";
        Double dia = 0.0;
        Double mes = 0.0;
        Double ano = 0.0;
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "SELECT pl.ID_PLAZO,cp.ID_CUMPLIMIENTO_PLAZO ,cp.ID_DGP,pl.FE_DESDE,(extract (month from pl.FE_HASTA) -  extract(month from sysdate))as meses_con,(extract (day from pl.FE_HASTA) -  extract(day from sysdate))as dia_con,(extract (year from pl.FE_HASTA) -  extract(year from sysdate))as anno_con ,cp.ES_CUMPLE_PLAZO FROM RHTR_CUMPLIMIENTO_PLAZO cp, RHTR_PLAZO pl WHERE pl.ID_PLAZO = cp.ID_PLAZO and pl.TI_PLAZO='1'";
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                id = rs.getString("ID_PLAZO");
                id_cumplimiento_plazo = rs.getString("ID_CUMPLIMIENTO_PLAZO");
                mes = rs.getDouble("MESES_CON");
                dia = rs.getDouble("DIA_CON");
                ano = rs.getDouble("ANNO_CON");
                es_cumple_plazo = rs.getString("ES_CUMPLE_PLAZO");
                if (es_cumple_plazo.equals("1")) {
                    if (ano < 0) {
                        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
                        CallableStatement cst = this.conn.conex.prepareCall("{CALL RHSP_DESHABI_CUMPL_PLAZO( ?)}");
                        cst.setString(1, id_cumplimiento_plazo);
                        cst.execute();
                    } else if (ano == 0) {
                        if (mes < 0) {
                            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
                            CallableStatement cst = this.conn.conex.prepareCall("{CALL RHSP_DESHABI_CUMPL_PLAZO( ?)}");
                            cst.setString(1, id_cumplimiento_plazo);
                            cst.execute();
                        } else if (mes == 0) {
                            if (dia < 0) {
                                this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
                                CallableStatement cst = this.conn.conex.prepareCall("{CALL RHSP_DESHABI_CUMPL_PLAZO( ?)}");
                                cst.setString(1, id_cumplimiento_plazo);
                                cst.execute();
                            } else if (dia == 0 || dia > 0) {
                            }
                        } else if (mes > 0) {
                        }
                    } else if (ano > 0) {
                    }
                } else if (es_cumple_plazo.equals("0")) {

                }
            }
            rs.close();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR");
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
            }
        }
    }

}
