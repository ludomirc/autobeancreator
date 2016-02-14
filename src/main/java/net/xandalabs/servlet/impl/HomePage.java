package net.xandalabs.servlet.impl;

import net.xandalabs.model.AbstractItem;
import net.xandalabs.servlet.AbstractPage;
import net.xandalabs.servlet.util.MyXSLProc;
import org.apache.log4j.Logger;
import org.w3c.dom.Document;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class HomePage extends AbstractPage {

    protected Logger logger = Logger.getLogger(HomePage.class);

    public void doRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AbstractItem[] outItems = {};
        sessionID = request.getSession(true);
        con = getConnection();
        Document myGroupsDOM = createDom(outItems, "");
        MyXSLProc xslProc = new MyXSLProc();
        logger.info(">>>>>>>> XSLLocation: " + XSLLocation);
        xslProc.process(request, response, XSLLocation + "XANDALabs-HomePage.xsl", myGroupsDOM);

        return;
    }
}