package pe.edu.upeu.application.factory;

import java.io.ByteArrayInputStream;
import java.sql.CallableStatement;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.swing.text.Document;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.soap.*;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpression;
import javax.xml.xpath.XPathFactory;
import oracle.sql.ARRAY;
import oracle.sql.ArrayDescriptor;
import org.w3c.dom.NodeList;

public class WSClienteAcademico {

    public static final String keyApp = "4a7c88ee0791cad24a15d43a525982f8";
    public static final String keyID = "d57d9c1cd0cfdec68805a5055388177b";
    public static final String serverURI = "https://webapp.upeu.edu.pe/";
    public static final String service = "https://webapp.upeu.edu.pe/webservices/wsdl4rrhh/";

    public static void main(String args[]) throws Exception {
        WSClienteAcademico.getRequest("2015-2");
        

        String[] campus = {"lima"};
        String[] tipo_doc = {"dni"};
        String[] nu_doc = {"123"};
        String[] app = {"123"};
        String[] apm = {"123"};
        String[] nombre = {"123"};
        String[] facu = {"123"};
        String[] eap = {"123"};
        String[] de_carga = {"123"};
        String[] curso = {"123"};
        String[] grupo = {"1"};
        String[] horario = {"123"};
        double [] hb_lab = {5.54};
        String[] hb_de_condicion = {"123"};
        String[] hb_ti_curso = {"123"};

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
        CallableStatement st = conn.conex.prepareCall("call rhsp_ws_carga_academica(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
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
        //st.execute();
        
        
          final String pXML = "<root><x>1</x><x>2</x><x>3</x><x>4</x></root>";
    final org.w3c.dom.Document document = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(new ByteArrayInputStream(pXML.getBytes()));
    final XPathExpression xPathExpression = XPathFactory.newInstance().newXPath().compile("//x/text()");
    final NodeList nodeList = (NodeList) xPathExpression.evaluate(document, XPathConstants.NODESET);
    final List<String> values = new ArrayList<String>();
    for (int i = 0; i < nodeList.getLength(); ++i) {
        values.add(nodeList.item(i).getNodeValue());
    }
    System.out.println(values);
        
    }

    public static void getRequest(String semestre) throws SOAPException, Exception {
        Calendar calendario = new GregorianCalendar();
        int hour = calendario.get(Calendar.HOUR_OF_DAY);
        // Create SOAP Connection
        SOAPConnectionFactory soapConnectionFactory = SOAPConnectionFactory.newInstance();
        SOAPConnection soapConnection = soapConnectionFactory.createConnection();
        // Send SOAP Message to SOAP Server
        String keyPub = StringMD.getStringMessageDigest(keyApp + hour, StringMD.MD5);
        System.out.println(service + keyPub);
        System.out.println(keyApp + hour);
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
