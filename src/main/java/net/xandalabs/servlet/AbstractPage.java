package net.xandalabs.servlet;

import net.xandalabs.model.AbstractItem;
import org.w3c.dom.Document;
import org.w3c.dom.Element;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;

public abstract class AbstractPage extends HttpServlet {

    protected String function = null;
    protected Connection con = null;
    protected HttpSession sessionID = null;
    protected boolean nosessionID = false;
    protected String XSLLocation = "/WEB-INF/classes/xsl/";

    public boolean handlesessionID(HttpServletRequest request,
                                   HttpServletResponse response) throws IOException, ServletException {
        sessionID = request.getSession(true);

        String function = request.getParameter("function");

        if (sessionID.isNew() && !function.equals("LogIn")) {
            return false;
        }

        if (function.equals("LogIn")) {
            sessionID.invalidate();
            sessionID = request.getSession(true);
            return true;
        }

        /**
         * Checks the time that the sessionID was last accessed against the
         * current system time. If this is greater than 600,000 millisecond (10
         * minutes), the sessionID is deemed "expired" and user is returned to
         * login again
         */
        else {
            long current = System.currentTimeMillis();
            long lastAccess = sessionID.getLastAccessedTime();
            long inactiveTime = current - lastAccess;
            if (inactiveTime > 600000) {
                sessionID.invalidate();
                return false;
            }
        }
        return true;
    }

    /**
     * The following methods, doGet and doPost, pass their request and response
     * parameters onto the doRequest method
     */
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        doRequest(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        doRequest(request, response);
    }
    public abstract void doRequest(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException;
    /**
     * The doRequest method checks that the function is NOT null, if it is the
     * user is taken to the login page. It then checks the validity of the
     * sessionID (see handlesessionID method) and if the sessionID is valid the
     * methods gets a connection to the database and returns, allowing page
     * classes which extend the AbstractPage class to complete requests
     */
    /*public void doRequest(HttpServletRequest request,
                          HttpServletResponse response) throws IOException, ServletException { //HttpsessionID
        // sessionID
        // =
        // request.getsessionID(true);
        function = request.getParameter("function");
        if (function == null) {

            new HomePage().doRequest(request, response);
            nosessionID = true;
            return;
        }
        if (!handlesessionID(request, response)) {
            nosessionID = true;
            return;
        }
        con = getConnection();
        nosessionID = false;
        return;
    }*/

    /**
     * The getConnection method initialsies a connection to the SQL database
     */
    public Connection getConnection() {
        Connection out = null;
        try {
   /*         Class.forName("org.gjt.mm.mysql.Driver").newInstance();
            out = DriverManager
                    .getConnection("jdbc:mysql://localhost/xandalabs?user=xandalabs&&password=xandalabs");
            System.out.println(">> Connected to XANDAlabs Database");*/

            Context initContext = new InitialContext();
            Context envContext  = (Context)initContext.lookup("java:/comp/env");
            DataSource ds = (DataSource)envContext.lookup("jdbc/XandaLabs");
            out = ds.getConnection();

        } catch (Exception e) {
            System.out.println("Connection error: " + e.toString());
        }
        return out;
    }


    /**
     * createDom creates the XML document for use with all classes that extend
     * AbstractPage with the basic functions for the Generic XSL stylesheet.
     */
    public Document createDom(AbstractItem[] inItem, String title)
            throws ServletException {
        Document doc = null;
        try {
            DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
            DocumentBuilder docBuilder = dbf.newDocumentBuilder();
            doc = docBuilder.newDocument();
        } catch (Exception e) {
            throw new ServletException(e.toString());
        }
        Element root = doc.createElement("page");
        doc.appendChild(root);
        Element titleElement = doc.createElement("title");
        titleElement.appendChild(doc.createTextNode(title));
        root.appendChild(titleElement);
        for (int i = 0; i < inItem.length; i++) {
            Element itemElement = inItem[i].getElement(doc);
            root.appendChild(itemElement);
        }
        Element elementMainPage = doc.createElement("mainpage");
        root.appendChild(elementMainPage);

        try {
            con.close();
            System.err.println("<< Disconnected from XANDAlabs Database");
        } catch (Exception e) {
            e.printStackTrace(System.err);
        }
        return doc;
    }
}