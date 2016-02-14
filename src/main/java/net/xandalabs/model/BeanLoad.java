package net.xandalabs.model;

import org.w3c.dom.Document;
import org.w3c.dom.Element;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class BeanLoad extends AbstractItem {

    public final static BeanLoad Null = new BeanLoad(0, "", 0, 0);
    private int blID = 0;
    private String blName = "";
    private int beanID = 0;
    private int bltID = 0;

    private BeanLoad(int blID, String blName, int beanID, int bltID) {

        this.blID = blID;
        this.blName = blName;
        this.beanID = beanID;
        this.bltID = bltID;

    }

    public static int createNew(String blName, int beanID, int bltID, Connection con) {
        try {
            Statement stmt = con.createStatement();
            int updater = stmt.executeUpdate("INSERT INTO beanload VALUES('', '" + blName + "', '" + beanID + "', '" + bltID + "');");
            ResultSet res = stmt.executeQuery("SELECT bl_id FROM beanload WHERE bl_name='" + blName + "' AND bean_id='" + beanID + "' AND blt_id='" + bltID + "';");
            res.next();
            return res.getInt(1);
        } catch (Exception e) {
            System.err.println("Error in creating new beanload from Xanda Labs Database: " + e);
            e.printStackTrace(System.err);
            return 0;
        }
    }

    public static BeanLoad loadByID(int blID, Connection con) {
        try {
            Statement stmt = con.createStatement();
            ResultSet res = stmt.executeQuery("SELECT * FROM beanload WHERE bl_id = '" + blID + "';");
            if (res.next()) {
                return new BeanLoad(res.getInt("bl_id"), res.getString("bl_name"), res.getInt("bean_id"), res.getInt("blt_id"));
            } else {
                return BeanLoad.Null;
            }
        } catch (Exception e) {
            System.err.println("Failed to load beanload from Xanda Labs Database: " + e);
            e.printStackTrace(System.err);
            return BeanLoad.Null;
        }
    }

    public static BeanLoad[] loadAll(Connection con) {
        try {
            Statement stmt = con.createStatement();
            ResultSet res2 = stmt.executeQuery("SELECT COUNT(*) FROM beanload;");
            res2.next();
            int count = res2.getInt(1);
            BeanLoad[] AllCategories = new BeanLoad[count];
            ResultSet res = stmt.executeQuery("SELECT * FROM beanload;");
            return getBeanLoads(count, AllCategories, res);
        } catch (Exception e) {
            System.err.println("Failed to load beanloads from Xanda Labs Database: " + e);
            e.printStackTrace(System.err);
            BeanLoad[] empty = new BeanLoad[0];
            return empty;
        }
    }

    private static BeanLoad[] getBeanLoads(int count, BeanLoad[] allCategories, ResultSet res) throws SQLException {
        for (int i = 0; i < count; i++) {
            res.next();
            allCategories[i] = new BeanLoad(res.getInt("bl_id"), res.getString("bl_name"), res.getInt("bean_id"), res.getInt("blt_id"));
        }
        return allCategories;
    }

    public static BeanLoad[] loadByBeanID(int beanID, Connection con) {
        try {
            Statement stmt = con.createStatement();
            ResultSet res2 = stmt.executeQuery("SELECT COUNT(*) FROM beanload WHERE bean_id='" + beanID + "';");
            res2.next();
            int count = res2.getInt(1);
            BeanLoad[] AllCategories = new BeanLoad[count];
            ResultSet res = stmt.executeQuery("SELECT * FROM beanload WHERE bean_id='" + beanID + "';");
            return getBeanLoads(count, AllCategories, res);
        } catch (Exception e) {
            System.err.println("Failed to load beanloads by beanID from Xanda Labs Database: " + e);
            e.printStackTrace(System.err);
            BeanLoad[] empty = new BeanLoad[0];
            return empty;
        }
    }

    public boolean save(Connection con) {
        try {
            Statement stmt = con.createStatement();
            int updater = stmt.executeUpdate("UPDATE beanload SET bl_name  =  '" + blName + "', bean_id  =  '" + beanID + "', blt_id  =  '" + bltID + "' WHERE bl_id  =  '" + blID + "';");
            return true;
        } catch (Exception e) {
            System.err.println("Error in saving updates to beanload from Xanda Labs Database: " + e);
            e.printStackTrace(System.err);
        }
        return false;
    }

    public boolean delete(int blID, Connection con) {
        try {
            Statement stmt = con.createStatement();
            int updater = stmt.executeUpdate("DELETE FROM beanload WHERE bl_id  =  '" + blID + "';");
            return true;
        } catch (Exception e) {
            System.err.println("Error in deleting beanload from Xanda Labs Database: " + e);
            e.printStackTrace(System.err);
        }
        return false;
    }

    /**
     * Get and set methods for the attributes of beanload
     */

    public int getBlID() {
        return blID;
    }

    public void setBlID(int blID) {
        this.blID = blID;
    }

    public String getBlName() {
        return blName;
    }

    public void setBlName(String blName) {
        this.blName = blName;
    }

    public int getBeanID() {
        return beanID;
    }

    public void setBeanID(int beanID) {
        this.beanID = beanID;
    }

    public int getBltID() {
        return bltID;
    }

    public void setBltID(int bltID) {
        this.bltID = bltID;
    }

    public boolean ok() {
        return ok(new Validatable[]{
        });
    }

    /**
     * Creates the Category nodes for the XML document
     */
    public Element getElement(Document doc) {

        Element userEl = doc.createElement("BeanLoad");

        Element userIDEl = doc.createElement("blID");
        userIDEl.appendChild(doc.createTextNode(blID + ""));
        userEl.appendChild(userIDEl);

        Element nameEl = doc.createElement("blName");
        nameEl.appendChild(doc.createTextNode(blName));
        userEl.appendChild(nameEl);

        Element beanIDEl = doc.createElement("beanID");
        beanIDEl.appendChild(doc.createTextNode(beanID + ""));
        userEl.appendChild(beanIDEl);

        Element bltIDEl = doc.createElement("bltID");
        bltIDEl.appendChild(doc.createTextNode(bltID + ""));
        userEl.appendChild(bltIDEl);

        return userEl;

    }

}
