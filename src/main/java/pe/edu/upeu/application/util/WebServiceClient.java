package pe.edu.upeu.application.util;

import java.io.ByteArrayOutputStream;
import java.util.Calendar;
import java.util.GregorianCalendar;
import javax.xml.soap.*;
import org.json.JSONArray;
import org.json.JSONObject;
import org.json.XML;
import pe.edu.upeu.application.properties.globalProperties;

public class WebServiceClient {

    public static JSONArray getRequest(String semestre, String methodProperties[]) throws Exception {
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
            soapResponse = soapConnection.call(createSOAPRequest(semestre, methodProperties), globalProperties.service + keyPub);
            // print SOAP Response
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            soapResponse.writeTo(out);
            String strMsg = new String(out.toByteArray());
            jsonObject = XML.toJSONObject(strMsg);
        } catch (SOAPException e) {
            System.out.println(e);
            System.out.println("Error de conexion, intentelo nuevamente");
        }
        //System.out.println(jsonObject);
        JSONArray arr = jsonObject.getJSONObject("SOAP-ENV:Envelope").
                getJSONObject("SOAP-ENV:Body").getJSONObject(methodProperties[2]).
                getJSONObject("return").
                getJSONArray("item");
        soapConnection.close();
        System.out.println("tamaño arr:" + arr.length());
        return arr;
    }

    public static SOAPMessage createSOAPRequest(String semestre, String methodProperties[]) {
        try {
            MessageFactory messageFactory = MessageFactory.newInstance();
            SOAPMessage soapMessage = messageFactory.createMessage();
            SOAPPart soapPart = soapMessage.getSOAPPart();
            // SOAP Envelope
            SOAPEnvelope envelope = soapPart.getEnvelope();
            envelope.addNamespaceDeclaration(methodProperties[1], globalProperties.serverURI);
            // SOAP Body
            SOAPBody soapBody = envelope.getBody();
            SOAPElement soapBodyElem = soapBody.addChildElement(methodProperties[0], methodProperties[1]);
            SOAPElement soapBodyElem1 = soapBodyElem.addChildElement("key", methodProperties[1]);
            soapBodyElem1.addTextNode(globalProperties.keyID);
            SOAPElement soapBodyElem2 = soapBodyElem.addChildElement("semestre", methodProperties[1]);
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
