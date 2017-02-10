package pe.edu.upeu.application.util;

import java.io.ByteArrayOutputStream;
import java.sql.CallableStatement;
import java.sql.Types;
import java.util.Calendar;
import java.util.GregorianCalendar;
import javax.xml.soap.*;
import oracle.sql.ARRAY;
import oracle.sql.ArrayDescriptor;
import org.json.JSONArray;
import org.json.JSONObject;
import org.json.XML;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;
import pe.edu.upeu.application.properties.globalProperties;

public class WSClienteAcademico {

    public static String startWsAcademico(String semestre) throws Exception {
        JSONArray arr = WSClienteAcademico.getRequest(semestre);
        int length = arr.length();
        String[] campus = new String[length];
        String[] tipo_doc = new String[length];
        String[] nu_doc = new String[length];
        String[] app = new String[length];
        String[] apm = new String[length];
        String[] nombre = new String[length];
        String[] facu = new String[length];
        String[] eap = new String[length];
        String[] de_carga = new String[length];
        String[] curso = new String[length];
        String[] grupo = new String[length];
        String[] horario = new String[length];
        double[] hb_lab = new double[length];
        String[] hb_de_condicion = new String[length];
        String[] hb_ti_curso = new String[length];
        System.out.println("registros aceptados:" + length);

        for (int i = 0; i < arr.length(); i++) {
            hb_ti_curso[i] = (arr.getJSONObject(i).getJSONObject("tipocurso").has("content")) ? String.valueOf(arr.getJSONObject(i).getJSONObject("tipocurso").get("content")) : "";
            horario[i] = (arr.getJSONObject(i).getJSONObject("horario").has("content")) ? String.valueOf(arr.getJSONObject(i).getJSONObject("horario").get("content")) : "";
            campus[i] = String.valueOf(arr.getJSONObject(i).getJSONObject("campus").get("content"));
            grupo[i] = String.valueOf(arr.getJSONObject(i).getJSONObject("grupo").get("content"));
            nu_doc[i] = (arr.getJSONObject(i).getJSONObject("numerodocumento").has("content")) ? String.valueOf(arr.getJSONObject(i).getJSONObject("numerodocumento").get("content")) : "";
            nombre[i] = String.valueOf(arr.getJSONObject(i).getJSONObject("nombre").get("content"));
            //System.out.println(nombre[i]);
            hb_de_condicion[i] = (arr.getJSONObject(i).getJSONObject("condicion").has("content")) ? String.valueOf(arr.getJSONObject(i).getJSONObject("condicion").get("content")) : "";
            de_carga[i] = String.valueOf(arr.getJSONObject(i).getJSONObject("carga").get("content"));
            curso[i] = String.valueOf(arr.getJSONObject(i).getJSONObject("nombrecurso").get("content"));
            app[i] = String.valueOf(arr.getJSONObject(i).getJSONObject("apepat").get("content"));
            apm[i] = String.valueOf(arr.getJSONObject(i).getJSONObject("apemat").get("content"));
            eap[i] = String.valueOf(arr.getJSONObject(i).getJSONObject("eap").get("content"));
            hb_lab[i] = (arr.getJSONObject(i).getJSONObject("hlab").has("content")) ? Double.parseDouble(String.valueOf(arr.getJSONObject(i).getJSONObject("hlab").get("content"))) : 0.0;
            tipo_doc[i] = String.valueOf(arr.getJSONObject(i).getJSONObject("tipodocumento").get("content"));
            facu[i] = String.valueOf(arr.getJSONObject(i).getJSONObject("facultad").get("content"));
            //  eapId=...
        }

        ConexionBD conn;
        conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        ArrayDescriptor des = ArrayDescriptor.createDescriptor("ARR_WS_CAMPUS", conn.conex);
        ArrayDescriptor des2 = ArrayDescriptor.createDescriptor("ARR_WS_ES_TIPO_DOC", conn.conex);
        ArrayDescriptor des3 = ArrayDescriptor.createDescriptor("ARR_WS_NU_DOC", conn.conex);
        ArrayDescriptor des4 = ArrayDescriptor.createDescriptor("ARR_WS_AP_PATERNO", conn.conex);
        ArrayDescriptor des5 = ArrayDescriptor.createDescriptor("ARR_WS_AP_MATERNO", conn.conex);
        ArrayDescriptor des6 = ArrayDescriptor.createDescriptor("ARR_WS_NO_TRABAJADOR", conn.conex);
        ArrayDescriptor des7 = ArrayDescriptor.createDescriptor("ARR_WS_NO_FACULTAD", conn.conex);
        ArrayDescriptor des8 = ArrayDescriptor.createDescriptor("ARR_WS_NO_EAP", conn.conex);
        ArrayDescriptor des9 = ArrayDescriptor.createDescriptor("ARR_WS_DE_CARGA", conn.conex);
        ArrayDescriptor des10 = ArrayDescriptor.createDescriptor("ARR_WS_NO_CURSO", conn.conex);
        ArrayDescriptor des11 = ArrayDescriptor.createDescriptor("ARR_WS_NU_GRUPO", conn.conex);
        ArrayDescriptor des12 = ArrayDescriptor.createDescriptor("ARR_WS_DE_HORARIO", conn.conex);
        ArrayDescriptor des13 = ArrayDescriptor.createDescriptor("ARR_WS_CA_HLAB", conn.conex);
        ArrayDescriptor des14 = ArrayDescriptor.createDescriptor("ARR_WS_DE_CONDICION", conn.conex);
        ArrayDescriptor des15 = ArrayDescriptor.createDescriptor("ARR_WS_DE_TIPO_CURSO", conn.conex);

        ARRAY array_to_pass1 = new ARRAY(des, conn.conex, campus);
        ARRAY array_to_pass2 = new ARRAY(des2, conn.conex, tipo_doc);
        ARRAY array_to_pass3 = new ARRAY(des3, conn.conex, nu_doc);
        ARRAY array_to_pass4 = new ARRAY(des4, conn.conex, app);
        ARRAY array_to_pass5 = new ARRAY(des5, conn.conex, apm);
        ARRAY array_to_pass6 = new ARRAY(des6, conn.conex, nombre);
        ARRAY array_to_pass7 = new ARRAY(des7, conn.conex, facu);
        ARRAY array_to_pass8 = new ARRAY(des8, conn.conex, eap);
        ARRAY array_to_pass9 = new ARRAY(des9, conn.conex, de_carga);
        ARRAY array_to_pass10 = new ARRAY(des10, conn.conex, curso);
        ARRAY array_to_pass11 = new ARRAY(des11, conn.conex, grupo);
        ARRAY array_to_pass12 = new ARRAY(des12, conn.conex, horario);
        ARRAY array_to_pass13 = new ARRAY(des13, conn.conex, hb_lab);
        ARRAY array_to_pass14 = new ARRAY(des14, conn.conex, hb_de_condicion);
        ARRAY array_to_pass15 = new ARRAY(des15, conn.conex, hb_ti_curso);
        System.out.println(":::register in BD... ");
        CallableStatement st = conn.conex.prepareCall("{CALL rhsp_ws_carga_academica(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
        st.setArray(1, array_to_pass1);
        st.setArray(2, array_to_pass2);
        st.setArray(3, array_to_pass3);
        st.setArray(4, array_to_pass4);
        st.setArray(5, array_to_pass5);
        st.setArray(6, array_to_pass6);
        st.setArray(7, array_to_pass7);
        st.setArray(8, array_to_pass8);
        st.setArray(9, array_to_pass9);
        st.setArray(10, array_to_pass10);
        st.setArray(11, array_to_pass11);
        st.setArray(12, array_to_pass12);
        st.setArray(13, array_to_pass13);
        st.setArray(14, array_to_pass14);
        st.setArray(15, array_to_pass15);
        st.registerOutParameter(16, Types.VARCHAR);

        st.executeUpdate();
        System.out.println(st.getString(16));
        conn.conex.close();

        return arr.toString();

    }

    public static JSONArray getRequest(String semestre) throws Exception {
        Calendar calendario = new GregorianCalendar();
        String hour = String.format("%02d", calendario.get(Calendar.HOUR_OF_DAY));

        // Create SOAP Connection
        SOAPConnectionFactory soapConnectionFactory = SOAPConnectionFactory.newInstance();
        SOAPConnection soapConnection = soapConnectionFactory.createConnection();
        // Send SOAP Message to SOAP Server
        String keyPub = StringMD.getStringMessageDigest(globalProperties.keyApp + hour, StringMD.MD5);

        System.out.println("Hora:" + hour);
        System.out.println(globalProperties.service + keyPub);
        System.out.println(globalProperties.keyApp + hour);
        SOAPMessage soapResponse = null;
        JSONObject jsonObject = null;
        try {
            soapResponse = soapConnection.call(createSOAPRequest(semestre), globalProperties.service + keyPub);

            // print SOAP Response
            //  System.out.println("Response SOAP Message:");
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            soapResponse.writeTo(out);
            String strMsg = new String(out.toByteArray());
            jsonObject = XML.toJSONObject(strMsg);
        } catch (SOAPException e) {
            System.out.println(e);
            System.out.println("Error deS conexion, intentelo nuevamente");
        }
        //System.out.println(jsonObject);
        JSONArray arr = jsonObject.getJSONObject("SOAP-ENV:Envelope").
                getJSONObject("SOAP-ENV:Body").getJSONObject("ns1:DocenteXCursoResponse").
                getJSONObject("return").
                getJSONArray("item");
        soapConnection.close();
        System.out.println("tamaño arr:" + arr.length());
        return arr;
    }

    public static SOAPMessage createSOAPRequest(String semestre) {
        try {
            MessageFactory messageFactory = MessageFactory.newInstance();
            //  String proxyAuth = System.getProperty("https.proxyAuth");
            //System.out.println("Puerto :" + proxyAuth);
            SOAPMessage soapMessage = messageFactory.createMessage();
            SOAPPart soapPart = soapMessage.getSOAPPart();
            // SOAP Envelope
            SOAPEnvelope envelope = soapPart.getEnvelope();
            envelope.addNamespaceDeclaration("ns1", globalProperties.serverURI);
            // SOAP Body
            SOAPBody soapBody = envelope.getBody();
            SOAPElement soapBodyElem = soapBody.addChildElement("DocenteXCurso", "ns1");
            SOAPElement soapBodyElem1 = soapBodyElem.addChildElement("key", "ns1");
            soapBodyElem1.addTextNode(globalProperties.keyID);
            SOAPElement soapBodyElem2 = soapBodyElem.addChildElement("semestre", "ns1");
            soapBodyElem2.addTextNode(semestre);
            /*MimeHeaders headers = soapMessage.getMimeHeaders();
             headers.addHeader("SOAPAction", serverURI  + "VerifyEmail");
             */
            soapMessage.saveChanges();

            /* Print the request message */
            System.out.println("Request SOAP Message:");
            soapMessage.writeTo(System.out);
            System.out.println();
            return soapMessage;
        } catch (Exception e) {
            System.out.println("------------------------------MESSAGE");
            e.printStackTrace();
            return null;
        }
    }

}
