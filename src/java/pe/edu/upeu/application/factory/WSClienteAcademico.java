package pe.edu.upeu.application.factory;

import java.sql.CallableStatement;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.xml.soap.*;
import oracle.sql.ARRAY;
import oracle.sql.ArrayDescriptor;

public class WSClienteAcademico {

    public static final String keyApp = "4a7c88ee0791cad24a15d43a525982f8";
    public static final String keyID = "d57d9c1cd0cfdec68805a5055388177b";
    public static final String serverURI = "https://webapp.upeu.edu.pe/";
    public static final String service = "https://webapp.upeu.edu.pe/webservices/wsdl4rrhh/";

    public static void main(String args[]) throws Exception {
        // WSClienteAcademico.getRequest("2015-2");
        List<Map<String, ?>> lista = new ArrayList<Map<String, ?>>();
        Map<String, Object> map1 = new HashMap<String, Object>();
        Map<String, Object> map2 = new HashMap<String, Object>();

        map1.put("id", map2);
        
        ConexionBD conn;
        conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        ArrayDescriptor des = ArrayDescriptor.createDescriptor("ARRAY_ID_DGP", conn.conex);
        ARRAY array_to_pass = new ARRAY(des, conn.conex, "");
        CallableStatement st = conn.conex.prepareCall("call actualizar_dgps(?)");
        st.setArray(1, array_to_pass);
        st.execute();
    }

    public static void getRequest(String semestre) throws SOAPException, Exception {
        Calendar calendario = new GregorianCalendar();
        int hour = calendario.get(Calendar.HOUR_OF_DAY);
        // Create SOAP Connection
        SOAPConnectionFactory soapConnectionFactory = SOAPConnectionFactory.newInstance();
        SOAPConnection soapConnection = soapConnectionFactory.createConnection();
        // Send SOAP Message to SOAP Server
        String keyPub = StringMD.getStringMessageDigest(keyApp + hour, StringMD.MD5);
        System.out.print(service + keyPub);
        SOAPMessage soapResponse = soapConnection.call(createSOAPRequest(semestre), service + keyPub);

        // print SOAP Response
        System.out.print("Response SOAP Message:");
        soapResponse.writeTo(System.out);
        soapConnection.close();
    }

    public static SOAPMessage createSOAPRequest(String semestre) throws Exception {
        MessageFactory messageFactory = MessageFactory.newInstance();
        SOAPMessage soapMessage = messageFactory.createMessage();
        SOAPPart soapPart = soapMessage.getSOAPPart();

        // SOAP Envelope
        SOAPEnvelope envelope = soapPart.getEnvelope();
        envelope.addNamespaceDeclaration("ns1", serverURI);

        // SOAP Body
        SOAPBody soapBody = envelope.getBody();
        SOAPElement soapBodyElem = soapBody.addChildElement("DocenteXCurso", "ns1");
        SOAPElement soapBodyElem1 = soapBodyElem.addChildElement("key", "ns1");
        soapBodyElem1.addTextNode(keyID);

        SOAPElement soapBodyElem2 = soapBodyElem.addChildElement("semestre", "ns1");
        soapBodyElem2.addTextNode(semestre);
        /*MimeHeaders headers = soapMessage.getMimeHeaders();
         headers.addHeader("SOAPAction", serverURI  + "VerifyEmail");
         */
        soapMessage.saveChanges();

        /* Print the request message */
        System.out.print("Request SOAP Message:");
        soapMessage.writeTo(System.out);
        System.out.println();
        return soapMessage;
    }

}
