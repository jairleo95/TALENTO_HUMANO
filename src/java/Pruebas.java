
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Alfa.sistemas
 */
public class Pruebas {

    ConexionBD cx;

    public void writeCountryMenu(Connection connection, javax.servlet.jsp.JspWriter out, int currentValue) {
        try {
            this.cx = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sqlString = "select *  from rht ";
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(sqlString);
            while (rs.next()) {
                String selected = "";
                int countryId = rs.getInt("id");
                if (countryId == currentValue) {
                    selected = "SELECTED";
                }
                out.print("<option value=\"" + countryId + "\" " + selected + ">" + rs.getString("Name") + "</option>");
            }
            rs.close();
            stmt.close();

        } catch (Exception e) {
            System.out.println(e);
        }
    }

}
