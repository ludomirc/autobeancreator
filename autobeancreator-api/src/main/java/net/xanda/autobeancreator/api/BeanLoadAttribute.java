package net.xanda.autobeancreator.api;

import org.w3c.dom.Document;
import org.w3c.dom.Element;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class BeanLoadAttribute extends AbstractItem {

    public final static BeanLoadAttribute Null = new BeanLoadAttribute(0, 0, 0);
    private int blattID = 0;
    private int beanAttID = 0;
    private int blID = 0;

    private BeanLoadAttribute(int blattID, int beanAttID, int blID) {

        this.blattID = blattID;
        this.beanAttID = beanAttID;
        this.blID = blID;

    }

    public static int createNew(int beanAttID, int blID, Connection con) {
        try {
            Statement stmt = con.createStatement();
            int updater = stmt.executeUpdate("INSERT INTO beanloadattribute VALUES('', '" + beanAttID + "', '" + blID + "');");
            ResultSet res = stmt.executeQuery("SELECT blatt_id FROM beanloadattribute WHERE bean_att_id='" + beanAttID + "' AND bl_id='" + blID + "';");
            res.next();
            return res.getInt(1);
        } catch (Exception e) {
            System.err.println("Error in creating new beanloadattribute from Xanda Labs Database: " + e);
            e.printStackTrace(System.err);
            return 0;
        }
    }

    public static BeanLoadAttribute loadByID(int blattID, Connection con) {
        try {
            Statement stmt = con.createStatement();
            ResultSet res = stmt.executeQuery("SELECT * FROM beanloadattribute WHERE blattID = '" + blattID + "';");
            if (res.next()) {
                return new BeanLoadAttribute(res.getInt("blattID"), res.getInt("beanAttID"), res.getInt("blID"));
            } else {
                return BeanLoadAttribute.Null;
            }
        } catch (Exception e) {
            System.err.println("Failed to load beanloadattribute from Xanda Labs Database: " + e);
            e.printStackTrace(System.err);
            return BeanLoadAttribute.Null;
        }
    }

    public static BeanLoadAttribute[] loadAll(Connection con) {
        try {
            Statement stmt = con.createStatement();
            ResultSet res2 = stmt.executeQuery("SELECT COUNT(*) FROM beanloadattribute;");
            res2.next();
            int count = res2.getInt(1);
            BeanLoadAttribute[] AllCategories = new BeanLoadAttribute[count];
            ResultSet res = stmt.executeQuery("SELECT * FROM beanloadattribute;");
            return getBeanLoadAttributes(count, AllCategories, res);
        } catch (Exception e) {
            System.err.println("Failed to load beanloadattributes from Xanda Labs Database: " + e);
            e.printStackTrace(System.err);
            BeanLoadAttribute[] empty = new BeanLoadAttribute[0];
            return empty;
        }
    }

    private static BeanLoadAttribute[] getBeanLoadAttributes(int count, BeanLoadAttribute[] allCategories, ResultSet res) throws SQLException {
        for (int i = 0; i < count; i++) {
            res.next();
            allCategories[i] = new BeanLoadAttribute(res.getInt("blattID"), res.getInt("beanAttID"), res.getInt("blID"));
        }
        return allCategories;
    }

    public static BeanLoadAttribute[] loadByBeanLoadID(int blID, Connection con) {
        try {
            Statement stmt = con.createStatement();
            ResultSet res2 = stmt.executeQuery("SELECT COUNT(*) FROM beanloadattribute WHERE blID='" + blID + "';");
            res2.next();
            int count = res2.getInt(1);
            BeanLoadAttribute[] AllCategories = new BeanLoadAttribute[count];
            ResultSet res = stmt.executeQuery("SELECT * FROM beanloadattribute WHERE blID='" + blID + "';");
            return getBeanLoadAttributes(count, AllCategories, res);
        } catch (Exception e) {
            System.err.println("Failed to load beanloadattributes by blID from Xanda Labs Database: " + e);
            e.printStackTrace(System.err);
            BeanLoadAttribute[] empty = new BeanLoadAttribute[0];
            return empty;
        }
    }

    public boolean save(Connection con) {
        try {
            Statement stmt = con.createStatement();
            int updater = stmt.executeUpdate("UPDATE beanloadattribute SET beanAttID  =  '" + beanAttID + "', blID  =  '" + blID + "' WHERE blattID  =  '" + blattID + "';");
            return true;
        } catch (Exception e) {
            System.err.println("Error in saving updates to beanloadattribute from Xanda Labs Database: " + e);
            e.printStackTrace(System.err);
        }
        return false;
    }

    public boolean delete(int blattID, Connection con) {
        try {
            Statement stmt = con.createStatement();
            int updater = stmt.executeUpdate("DELETE FROM beanloadattribute WHERE blattID  =  '" + blattID + "';");
            return true;
        } catch (Exception e) {
            System.err.println("Error in deleting beanloadattribute from Xanda Labs Database: " + e);
            e.printStackTrace(System.err);
        }
        return false;
    }

    /**
     * Get and set methods for the attributes of beanloadattribute
     */

    public int getBlattID() {
        return blattID;
    }

    public void setBlattID(int blattID) {
        this.blattID = blattID;
    }

    public int getBeanAttID() {
        return beanAttID;
    }

    public void setBeanAttID(int beanAttID) {
        this.beanAttID = beanAttID;
    }

    public int getBlID() {
        return blID;
    }

    public void setBlID(int blID) {
        this.blID = blID;
    }

    public boolean ok() {
        return ok(new Validatable[]{
        });
    }

    /**
     * Creates the Category nodes for the XML document
     */
    public Element getElement(Document doc) {

        Element userEl = doc.createElement("BeanLoadAttribute");

        Element userIDEl = doc.createElement("blattID");
        userIDEl.appendChild(doc.createTextNode(blattID + ""));
        userEl.appendChild(userIDEl);

        Element beanAttIDEl = doc.createElement("beanAttID");
        beanAttIDEl.appendChild(doc.createTextNode(beanAttID + ""));
        userEl.appendChild(beanAttIDEl);

        Element blIDEl = doc.createElement("blID");
        blIDEl.appendChild(doc.createTextNode(blID + ""));
        userEl.appendChild(blIDEl);

        return userEl;

    }


}
