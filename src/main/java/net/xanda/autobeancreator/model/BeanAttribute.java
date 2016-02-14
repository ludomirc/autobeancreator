package net.xanda.autobeancreator.model;

import org.w3c.dom.Document;
import org.w3c.dom.Element;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class BeanAttribute extends AbstractItem {

    public final static BeanAttribute Null = new BeanAttribute(0, "", 0, 0, 0, 0, 0, "", 0);
    private int beanAttID = 0;
    private String beanAttName = "";
    private int beanID = 0;
    private int attTypeID = 0;
    private int formHidden = 0;
    private int primaryKey = 0;
    private int compolsoryField = 0;
    private String friendlyName = "";
    private int order = 0;

    private BeanAttribute(int beanAttID, String beanAttName, int beanID, int attTypeID, int formHidden, int primaryKey, int compolsoryField, String friendlyName, int order) {

        this.beanAttID = beanAttID;
        this.beanAttName = beanAttName;
        this.beanID = beanID;
        this.attTypeID = attTypeID;
        this.formHidden = formHidden;
        this.primaryKey = primaryKey;
        this.compolsoryField = compolsoryField;
        this.friendlyName = friendlyName;
        this.order = order;

    }

    public static int createNew(String beanAttName, int beanID, int attTypeID, int formHidden, int primaryKey, int compolsoryField, String friendlyName, int order, Connection con) {
        try {
            Statement stmt = con.createStatement();
            int updater = stmt.executeUpdate("INSERT INTO beanattribute VALUES('', '" + beanAttName + "', '" + beanID + "', '" + attTypeID + "', '" + formHidden + "', '" + primaryKey + "', '" + compolsoryField + "', '" + friendlyName + "', '" + order + "');");
            ResultSet res = stmt.executeQuery("SELECT bean_att_id FROM beanattribute WHERE bean_att_name='" + beanAttName + "' AND bean_id='" + beanID + "' AND att_type_id='" + attTypeID + "' AND form_hidden='" + formHidden + "' AND primary_key='" + primaryKey + "' AND compolsory_field='" + compolsoryField + "' AND friendly_name='" + friendlyName + "' AND order='" + order + "';");
            res.next();
            return res.getInt(1);
        } catch (Exception e) {
            System.err.println("Error in creating new beanattribute from Xanda Labs Database: " + e);
            e.printStackTrace(System.err);
            return 0;
        }
    }

    public static BeanAttribute loadByID(int beanAttID, Connection con) {
        try {
            Statement stmt = con.createStatement();
            ResultSet res = stmt.executeQuery("SELECT * FROM beanattribute WHERE bean_att_id = '" + beanAttID + "';");
            if (res.next()) {
                return new BeanAttribute(res.getInt("bean_att_id"), res.getString("bean_att_name"), res.getInt("bean_id"), res.getInt("att_type_id"), res.getInt("form_hidden"), res.getInt("primary_key"), res.getInt("compolsory_field"), res.getString("friendly_name"), res.getInt("order"));
            } else {
                return BeanAttribute.Null;
            }
        } catch (Exception e) {
            System.err.println("Failed to load beanattribute from Xanda Labs Database: " + e);
            e.printStackTrace(System.err);
            return BeanAttribute.Null;
        }
    }

    public static BeanAttribute[] loadAll(Connection con) {
        try {
            Statement stmt = con.createStatement();
            ResultSet res2 = stmt.executeQuery("SELECT COUNT(*) FROM beanattribute;");
            res2.next();
            int count = res2.getInt(1);
            BeanAttribute[] AllCategories = new BeanAttribute[count];
            ResultSet res = stmt.executeQuery("SELECT * FROM beanattribute;");
            return getBeanAttributes(count, AllCategories, res);
        } catch (Exception e) {
            System.err.println("Failed to load beanattributes from Xanda Labs Database: " + e);
            e.printStackTrace(System.err);
            BeanAttribute[] empty = new BeanAttribute[0];
            return empty;
        }
    }

    private static BeanAttribute[] getBeanAttributes(int count, BeanAttribute[] allCategories, ResultSet res) throws SQLException {
        for (int i = 0; i < count; i++) {
            res.next();
            allCategories[i] = new BeanAttribute(res.getInt("bean_att_id"), res.getString("bean_att_name"), res.getInt("bean_id"), res.getInt("att_type_id"), res.getInt("form_hidden"), res.getInt("primary_key"), res.getInt("compolsory_field"), res.getString("friendly_name"), res.getInt("order"));
        }
        return allCategories;
    }

    public static BeanAttribute[] loadByBeanID(int beanID, Connection con) {
        try {
            Statement stmt = con.createStatement();
            ResultSet res2 = stmt.executeQuery("SELECT COUNT(*) FROM beanattribute WHERE bean_id='" + beanID + "';");
            res2.next();
            int count = res2.getInt(1);
            BeanAttribute[] AllCategories = new BeanAttribute[count];
            ResultSet res = stmt.executeQuery("SELECT * FROM beanattribute WHERE bean_id='" + beanID + "';");
            return getBeanAttributes(count, AllCategories, res);
        } catch (Exception e) {
            System.err.println("Failed to load beanattributes from Xanda Labs Database: " + e);
            e.printStackTrace(System.err);
            BeanAttribute[] empty = new BeanAttribute[0];
            return empty;
        }
    }

    public boolean save(Connection con) {
        try {
            Statement stmt = con.createStatement();
            int updater = stmt.executeUpdate("UPDATE beanattribute SET beanAttName  =  '" + beanAttName + "', bean_id  =  '" + beanID + "', att_type_id  =  '" + attTypeID + "', form_hidden  =  '" + formHidden + "', primary_key  =  '" + primaryKey + "', compolsory_field  =  '" + compolsoryField + "', friendly_name  =  '" + friendlyName + "' , order  =  '" + order + "' WHERE bean_att_id  =  '" + beanAttID + "';");
            return true;
        } catch (Exception e) {
            System.err.println("Error in saving updates to beanattribute from Xanda Labs Database: " + e);
            e.printStackTrace(System.err);
        }
        return false;
    }

    public boolean delete(int beanAttID, Connection con) {
        try {
            Statement stmt = con.createStatement();
            int updater = stmt.executeUpdate("DELETE FROM beanattribute WHERE beanAttID  =  '" + beanAttID + "';");
            return true;
        } catch (Exception e) {
            System.err.println("Error in deleting beanattribute from Xanda Labs Database: " + e);
            e.printStackTrace(System.err);
        }
        return false;
    }

    /**
     * Get and set methods for the attributes of beanattribute
     */

    public int getBeanAttID() {
        return beanAttID;
    }

    public void setBeanAttID(int beanAttID) {
        this.beanAttID = beanAttID;
    }

    public String getBeanAttName() {
        return beanAttName;
    }

    public void setBeanAttName(String beanAttName) {
        this.beanAttName = beanAttName;
    }

    public int getBeanID() {
        return beanID;
    }

    public void setBeanID(int beanID) {
        this.beanID = beanID;
    }

    public int getAttTypeID() {
        return attTypeID;
    }

    public void setAttTypeID(int attTypeID) {
        this.attTypeID = attTypeID;
    }

    public int getFormHidden() {
        return formHidden;
    }

    public void setFormHidden(int formHidden) {
        this.formHidden = formHidden;
    }

    public int getPrimaryKey() {
        return primaryKey;
    }

    public void setPrimaryKey(int primaryKey) {
        this.primaryKey = primaryKey;
    }

    public int getCompolsoryField() {
        return compolsoryField;
    }

    public void setCompolsoryField(int compolsoryField) {
        this.compolsoryField = compolsoryField;
    }

    public String getFriendlyName() {
        return friendlyName;
    }

    public void setFriendlyName(String friendlyName) {
        this.friendlyName = friendlyName;
    }

    public int getOrder() {
        return order;
    }

    public void setOrder(int order) {
        this.order = order;
    }

    public boolean ok() {
        return ok(new Validatable[]{
        });
    }

    /**
     * Creates the Category nodes for the XML document
     */
    public Element getElement(Document doc) {

        Element userEl = doc.createElement("BeanAttribute");

        Element userIDEl = doc.createElement("beanAttID");
        userIDEl.appendChild(doc.createTextNode(beanAttID + ""));
        userEl.appendChild(userIDEl);

        Element nameEl = doc.createElement("beanAttName");
        nameEl.appendChild(doc.createTextNode(beanAttName));
        userEl.appendChild(nameEl);

        Element beanIDEl = doc.createElement("beanID");
        beanIDEl.appendChild(doc.createTextNode(beanID + ""));
        userEl.appendChild(beanIDEl);

        Element attTypeIDEl = doc.createElement("attTypeID");
        attTypeIDEl.appendChild(doc.createTextNode(attTypeID + ""));
        userEl.appendChild(attTypeIDEl);

        Element formHiddenEl = doc.createElement("formHidden");
        formHiddenEl.appendChild(doc.createTextNode(formHidden + ""));
        userEl.appendChild(formHiddenEl);

        Element primaryKeyEl = doc.createElement("primaryKey");
        primaryKeyEl.appendChild(doc.createTextNode(primaryKey + ""));
        userEl.appendChild(primaryKeyEl);

        Element compolsoryFieldEl = doc.createElement("compolsoryField");
        compolsoryFieldEl.appendChild(doc.createTextNode(compolsoryField + ""));
        userEl.appendChild(compolsoryFieldEl);

        Element friendlyNameEl = doc.createElement("friendlyName");
        friendlyNameEl.appendChild(doc.createTextNode(friendlyName + ""));
        userEl.appendChild(friendlyNameEl);

        Element orderEl = doc.createElement("order");
        orderEl.appendChild(doc.createTextNode(order + ""));
        userEl.appendChild(orderEl);

        return userEl;

    }


}
