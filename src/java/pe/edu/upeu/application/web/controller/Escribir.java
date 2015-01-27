//Importamos clases que se usaran
package pe.edu.upeu.application.web.controller;

import java.io.File;
import java.io.FileWriter;

public class Escribir {

    public static void main(String[] args) {

//Un texto cualquiera guardado en una variable
        String saludo = "Hola";

        try {
          // String direccion_raiz = getServletContext().getRealPath(".").substring(0, getServletContext().getRealPath(".").length() - 1);
//Crear un objeto File se encarga de crear o abrir acceso a un archivo que se especifica en su constructor
            File archivo = new File("web/Vista/Contrato/Formato_Plantilla/Formato/"+"");

//Crear objeto FileWriter que sera el que nos ayude a escribir sobre archivo
            FileWriter escribir = new FileWriter(archivo, true);

//Escribimos en el archivo con el metodo write 
            escribir.write(saludo);

//Cerramos la conexion
            escribir.close();
        } //Si existe un problema al escribir cae aqui
        catch (Exception e) {
            System.out.println("Error al escribir");
        }
    }

    private static Object getServletContext() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
