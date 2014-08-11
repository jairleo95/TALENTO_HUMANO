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
import java.util.List;
import pe.edu.upeu.application.dao_imp.InterfaceEmpleadoDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;
import pe.edu.upeu.application.model.V_List_Empleado;

/**
 *
 * @author Alfa.sistemas
 */
public class EmpleadoDAO implements InterfaceEmpleadoDAO {

    ConexionBD conn;

    @Override
    public String Id_Puesto_Personal(String ide) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select id_puesto from RHVD_EMP_PU_DIR_DEP WHERE ID_EMPLEADO='" + ide + "'";
        String id = null;
        try {
            ResultSet rs = this.conn.query(sql);
            rs.next();
            id = rs.getString("id_puesto");
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }
        return id;
    }

    @Override
    public void VALIDAR_EMPLEADO(String id_tra) {

        CallableStatement cst;
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            cst = conn.conex.prepareCall("{CALL RHSP_VAL_EMP ( ? )}");
            cst.setString(1, id_tra);
            cst.execute();
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }

    }

    @Override
    public List<V_List_Empleado> Listar_Empleado(String id_departamento) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "SELECT * FROM RHVD_LIST_EMPLEADO WHERE ID_departamento='"+id_departamento+"'  order by id_contrato desc";
        List<V_List_Empleado> list = new ArrayList<V_List_Empleado>();
        try {
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                V_List_Empleado em = new V_List_Empleado();
                em.setId_contrato(rs.getString("id_contrato"));
                em.setId_trabajador(rs.getString("id_trabajador"));
                em.setAp_paterno(rs.getString("ap_paterno"));
                em.setAp_materno(rs.getString("ap_materno"));
                em.setNo_trabajador(rs.getString("no_trabajador"));
                em.setNo_puesto(rs.getString("no_puesto"));
                em.setNo_seccion(rs.getString("no_seccion"));
                em.setNo_area(rs.getString("no_area"));
                em.setId_direccion(rs.getString("id_direccion"));
                em.setNo_dep(rs.getString("no_dep"));
                em.setId_departamento(rs.getString("id_departamento"));
                em.setId_area(rs.getString("id_area"));
                em.setId_seccion(rs.getString("id_seccion"));
                em.setId_puesto(rs.getString("id_puesto"));
                em.setId_empleado(rs.getString("id_empleado"));
                em.setFe_creacion(rs.getString("fe_creacion"));
                em.setCa_sueldo(rs.getDouble("ca_sueldo"));
                em.setFe_desde(rs.getString("fe_desde"));
                em.setFe_hasta(rs.getString("fe_hasta"));   
                list.add(em);
            }
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }
        return list;
    }

}
