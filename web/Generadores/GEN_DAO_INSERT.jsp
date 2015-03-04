<%-- 
   Document   : Prueba
   Created on : 07-jul-2014, 15:47:04
   Author     : Alfa.sistemas
--%>


<%@page import="pe.edu.upeu.application.factory.Conexion"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>

<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            ResultSet rs2 = null;
            ResultSet cnt2 = null;
            ResultSet cnt1 = null;
            ResultSet rs = null;
            Connection cx = Conexion.getConex();
            /*PreparedStatement ps = cx.prepareStatement("SELECT  * FROM USUARIO WHERE USUARIO=? AND CLAVE=?");
    
             ps.setString(1, "SECRE135");
             ps.setString(2, "123");
             rs=ps.executeQuery();*/
            Statement stmt2 = null;
            Statement stmt3 = null;
            Statement stmt4 = null;
            Statement stmt = null;

            stmt2 = cx.createStatement();
            rs2 = stmt2.executeQuery("select table_name, column_name,data_type,data_length,column_id from user_tab_columns order by table_name,column_id");

            stmt3 = cx.createStatement();
            cnt1 = stmt3.executeQuery("select count(*) from (select table_name ,count(column_name)from user_tab_columns group by table_name order by table_name)");

            stmt4 = cx.createStatement();
            cnt2 = stmt4.executeQuery("select  count(*) from (select table_name, column_name,data_type,data_length,column_id from user_tab_columns order by table_name,column_id)");
            cnt1.next();
            cnt2.next();
            stmt = cx.createStatement();
            rs = stmt.executeQuery("select table_name ,count(column_name)from user_tab_columns group by table_name order by table_name");

            String List1[][] = new String[cnt1.getInt(1)][2];
            String List2[][] = new String[cnt2.getInt(1)][5];
            int i = 0;
            while (rs.next()) {

                List1[i][0] = rs.getString(1);
                List1[i][1] = rs.getString(2);
                i++;
            }

            int j = 0;
            while (rs2.next()) {

                List2[j][0] = rs2.getString(1);
                List2[j][1] = rs2.getString(2);
                List2[j][2] = rs2.getString(3);
                List2[j][3] = rs2.getString(4);
                List2[j][4] = rs2.getString(5);
                j++;
            }

            int t1 = cnt1.getInt(1);
            int t2 = cnt2.getInt(1);

        %>

        <table>
            <%            for (int f = 0; f < List1.length; f++) {
                    out.print("<br>");
                    out.print("@Override");
                    out.print("<br>");
                    out.print(" public String INSERT" + List1[f][0].substring(4).toUpperCase() + " (");

                    for (int s = 0; s < List2.length; s++) {

                        if (List1[f][0].equals(List2[s][0])) {
                            if (List2[s][2].equals("NUMBER")) {
                                out.print(" double " + List2[s][1]);
                            } else {
                                out.print(" String " + List2[s][1]);
                            }

                            if (List2[s][4].equals(List1[f][1]) == false) {
                                out.println(",");

                            } else {

                                out.println("){ ");
                                out.println("<br>");
                            }

                        }

                    }

                    out.println("  String id = \"\";  try { this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);CallableStatement cst = this.conn.conex.prepareCall(\"{CALL RHSP_INSERT_" + List1[f][0] + "(");

                    for (int v = 1; v < List2.length; v++) {

                        if (List1[f][0].equals(List2[v][0])) {
                            out.print("?");
                            if (List2[v][4].equals(List1[f][1]) == false) {
                                out.println(",");
                            } else {
                                out.println(",? )} \" );");
                            }
                        }
                    }
                    int l = 0;
                    for (int h = 1; h < List2.length; h++) {

                        if (List1[f][0].equals(List2[h][0])) {
                            l++;
                            out.print("cst.setString(" + l + "," + List2[h][1] + "); ");
                            if (List2[h][4].equals(List1[f][1]) == false) {

                            } else {
                                out.print("cst.registerOutParameter(" + (l + 1) + ", Types.CHAR); ");
                                out.println(" cst.execute(); id = cst.getString(" + (l + 1) + ");");
                                out.println(" } catch (SQLException e) {throw new RuntimeException(e.getMessage());} catch (Exception e) {throw new RuntimeException(\"ERROR :\" + e.getMessage());} finally {try {this.conn.close();} catch (Exception e) {throw new RuntimeException(e.getMessage());}}return id;}");

                            }
                        }
                    }

                    out.println("<br>");

                }


            %>
        </table>
    </body>
</html>
