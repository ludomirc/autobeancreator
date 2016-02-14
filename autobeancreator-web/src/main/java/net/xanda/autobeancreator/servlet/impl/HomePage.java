package net.xanda.autobeancreator.servlet.impl;

import net.xanda.autobeancreator.api.AbstractItem;
import net.xanda.autobeancreator.servlet.AbstractPage;
import net.xanda.autobeancreator.servlet.MyXSLProc;
import org.apache.log4j.Logger;
import org.w3c.dom.Document;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/HomePage")
public class HomePage extends AbstractPage {

    protected Logger logger = Logger.getLogger(HomePage.class);

    public void doRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AbstractItem[] outItems = {};
        sessionID = request.getSession(true);
        con = getConnection();
        Document myGroupsDOM = createDom(outItems, "");

        MyXSLProc xslProc = new MyXSLProc();

        logger.info(">>>>>>>> XSLLocation: " + XSLLocation);
        xslProc.process(request,response, XSLLocation + "XANDALabs-HomePage.xsl", myGroupsDOM);

        return;
    }
}