/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.dao_imp;

import java.util.List;
import java.util.Map;
import pe.edu.upeu.application.model.Empleado;
import pe.edu.upeu.application.model.Evaluacion_Emp;
import pe.edu.upeu.application.model.V_List_Empleado;
import pe.edu.upeu.application.model.page.Datatable;

/**
 *
 * @author Alfa.sistemas
 */
public interface InterfaceEmpleadoDAO {

    public String Id_Puesto_Personal(String ide);

    public int val_cod_aps_empleado(String idtr);

    public int val_cod_huella(String idtr);

    public List<Empleado> id_empleadox_ide(String ide);

    public void VALIDAR_EMPLEADO(String id_tra);

    public Datatable getAllEmployees(Datatable datatable, String direccion, String departamento, String area, String seccion);

    public List<V_List_Empleado> Listar_Emp();

    public void Insert_Evaluacion_Emp(String ID_EVALUACION_EMP, String ES_EVALUACION, String RE_EVALUACION, String ID_EMPLEADO);

    public String ID_Empleado(String idtr);

    public String ES_Empleado(String idemp);

    public List<Evaluacion_Emp> Listar_Evaluacion_Emp(String id_emp);

    public void Mod_Evaluacion_emp(String RE_EVALUACION, String ID_EMPLEADO);

    public boolean Reg_aps(String idtr, int aps);

    public void Reg_cod_huella(String idtr, int cod_huella);

    public int val_aps(String co_aps);

    public int val_huella(String co_hue);

    public List<Map<String, ?>> List_co_huella(String idtr);

    public List<Map<String, ?>> List_co_aps(String idtr);

    public List<Map<String, ?>> getAllEmployeesWithOutUserAccount();
}
