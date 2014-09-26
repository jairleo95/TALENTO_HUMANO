/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.model;

import java.io.File;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.tomcat.util.http.fileupload.FileItem;

/**
 *
 * @author ALFA 3
 */
public class Renombrar implements Runnable {

    private String nombre, ubicacion;
    private FileItem item;

    public Renombrar(FileItem Item, String Ubicacion, String Nombre) {
        this.nombre = Nombre;
        this.item = Item;
        this.ubicacion = Ubicacion;
    }

    public String getNombre() {
        return this.nombre;
    }

    public FileItem getItem() {
        return this.item;
    }

    public String getUbicacion() {
        return this.ubicacion;
    }

    public void run() {

        try {
            Thread.sleep(1000);
            File files = new File(getUbicacion(), getNombre());
            getItem().write(files);

        } catch (Exception ex) {
            Logger.getLogger(Renombrar.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
