<%-- 
    Document   : Pruebas_jair
    Created on : 22/07/2014, 05:15:39 PM
    Author     : Admin
--%>


<%@page import="java.sql.SQLException"%>
<%@page import="pe.edu.upeu.application.factory.Conexion"%>
<%@page import="java.sql.Connection"%>
<%@page import="pe.edu.upeu.application.factory.ConexionBD"%>
<%@page import="java.sql.CallableStatement"%>
<%@page import="pe.edu.upeu.application.model.V_Privilegio"%>
<%@page import="pe.edu.upeu.application.dao.RolDAO"%>
<%@page import="pe.edu.upeu.application.dao_imp.InterfaceRolDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
      
            Connection cnn = Conexion.getConex();
        
                CallableStatement  cst = cnn.prepareCall("{CALL RHSP_INSERT_DGP( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}");
         cst.setString(1, null);
            cst.setString(2, "23/05/14");
            cst.setString(3, "23/05/14");
            cst.setDouble(4, 1000);
            cst.setString(5, null);
            cst.setString(6, "PUT-000137");
            cst.setString(7, "REQ-0001");
            cst.setString(8, "TRB-000701");
            cst.setString(9, null);
            cst.setString(10, null);
            cst.setString(11, null);
            cst.setString(12, null);
            cst.setString(13, null);
            cst.setString(14, null);
            cst.setString(15, null);
            cst.setString(16, null);
            cst.setString(17,null);
            cst.setString(18, "1");
            cst.setString(19, "USR-000057");
            cst.setString(20, "23/05/14");
            cst.setString(21, "23/05/14");
            cst.setString(22, "1");
            cst.setString(23, "1");
            cst.setDouble(24, 0.0);
            cst.setDouble(25, 0.0);
            cst.setDouble(26, 0.0);
            cst.setString(27, "1");
            cst.setString(28, "1");
            cst.setString(29, "1");
            cst.execute();
            
          /*  
           CallableStatement  cst = cnn.prepareCall("{CALL SP_INSERT_RHTM_TRABAJADOR( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}");
            cst.setString(1, null);
            cst.setString(2, null);
            cst.setString(3, null);
            cst.setString(4, null);
            cst.setString(5, null);
            cst.setString(6, null);
            cst.setString(7, null);
            cst.setString(8, null);
            cst.setString(9, null);
            cst.setString(10, null);
            cst.setString(11, null);
            cst.setString(12, null);
            cst.setString(13, null);
            cst.setString(14, null);
            cst.setString(15, null);
            cst.setString(16, null);
            cst.setString(17, null);
            cst.setString(18, null);
            cst.setString(19, null);
            cst.setString(20, null);
            cst.setString(21, null);
            cst.setString(22, null);
            cst.setString(23, null);
            cst.setString(24, null);
            cst.setString(25, null);
            cst.setString(26, null);
            cst.setString(27, null);
            cst.setString(28, null);
            cst.setString(29, null);
            cst.setString(30, null);
            cst.setString(31, null);
            cst.setString(32, null);
            cst.setString(33, null);
            cst.setString(34, null);
            cst.setString(35, null);
            cst.setString(36, null);
            cst.setString(37, null);
            cst.setString(38, null);
            cst.setString(39, null);
            cst.setString(40, null);
            cst.setString(41, null);
            cst.setString(42, null);
            cst.setString(43, null);
            cst.setString(44, null);
            cst.setString(45, null);
            cst.setString(46, null);
            cst.setString(47, null);
            cst.setString(48, null);
            cst.setString(49, null);
            cst.setString(50, null);
            cst.setString(51, null);
            cst.setString(52, null);
            cst.setString(53, null);
            cst.setString(54, null);
            cst.setString(55, null);
            cst.setString(56, null);
            cst.setString(57, null);
            cst.setString(58, null);
            cst.setString(59, null);
            cst.setString(60, null);
            cst.setString(61, null);
            cst.execute();*/
        %>
    </body>
</html>