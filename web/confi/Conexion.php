<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

class Conexion {
     public static function conex()
    {
         $conn = oci_connect('sys_dgp', 'alex');
        if (!$conn) {
            $m = oci_error();
            echo $m['message'], "\n";
            exit;  
        } 
        return $conn;
	}	
     public static function conex_blob()
    {
         $user = "sys_dgp";
            $pass = "jair";
            $tsnames = "orcl";/* si es oracle Express cambiar a "XE" y si es Enterprise cambiar a "ORCL" */
            $Conn = OciLogon($user, $pass, $tsnames);
        if (!$Conn) {
            $m = oci_error();
            echo $m['message'], "\n";
            exit;  
        } 
        return $Conn;
	}	
       
}

?>
