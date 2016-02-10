package net.xanda.autobeancreator.api;

import org.w3c.dom.Document;
import org.w3c.dom.Element;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class AttributeType extends AbstractItem {

	private int attTypeID = 0;
	private String attName = "";
	
	public final static AttributeType Null = new AttributeType(0, "");

	private AttributeType(int attTypeID, String attName) {
		
		this.attTypeID = attTypeID;
		this.attName = attName;
		
	}
	
	public static int createNew(String attName, Connection con) {
        try {
            Statement stmt = con.createStatement();
            int updater = stmt.executeUpdate("INSERT INTO attributetype VALUES('', '"+ attName + "');");
            ResultSet res = stmt.executeQuery("SELECT attTypeID FROM attributetype WHERE attName='"+attName+"';");
            res.next();
            return res.getInt(1);
        }
        catch(Exception e) {
            System.err.println("Error in creating new attributetype from Xanda Labs Database: "+e);
            e.printStackTrace(System.err);
            return 0;
        }
    }

	public static AttributeType loadByID(int attTypeID, Connection con) {
		try {
			Statement stmt = con.createStatement();
			ResultSet res = stmt.executeQuery("SELECT * FROM attributetype WHERE attTypeID = '" + attTypeID + "';");
			if (res.next()) {
				return new AttributeType(res.getInt("attTypeID"), res.getString("attName"));
			} else {
				return AttributeType.Null;
			}
		} catch (Exception e) {
			System.err.println("Failed to load attributetype from Xanda Labs Database: "+e);
			e.printStackTrace(System.err);
			return AttributeType.Null;
		}
	}
	
	public static AttributeType[] loadAll(Connection con) {
		try {
			Statement stmt = con.createStatement();
			ResultSet res2 = stmt.executeQuery("SELECT COUNT(*) FROM attributetype;");
			res2.next();
			int count = res2.getInt(1);
			AttributeType[] AllCategories = new AttributeType[count];
			ResultSet res = stmt.executeQuery("SELECT * FROM attributetype ORDER BY attName;");
			for (int i = 0; i < count; i++) {
				res.next();
				AllCategories[i] = new AttributeType(res.getInt("attTypeID"), res.getString("attName"));
			}
			return AllCategories;
		} catch (Exception e) {
			System.err.println("Failed to load attributetypes from Xanda Labs Database: "+e);
			e.printStackTrace(System.err);
			AttributeType[] empty = new AttributeType[0];
			return empty;
		}
	}		
	
	public boolean save(Connection con) {
		try {
			Statement stmt = con.createStatement();
			int updater = stmt.executeUpdate("UPDATE attributetype SET attName  =  '" +attName +"' WHERE attTypeID  =  '"	+ attTypeID + "';");
			return true;
		} catch (Exception e) {
			System.err.println("Error in saving updates to attributetype from Xanda Labs Database: "+e);
			e.printStackTrace(System.err);			
		}
		return false;
	}	
		
	public boolean delete(int attTypeID, Connection con) {
		try {
			Statement stmt = con.createStatement();
			int updater = stmt.executeUpdate("DELETE FROM attributetype WHERE attTypeID  =  '" + attTypeID + "';");
			return true;
		} catch (Exception e) {
			System.err.println("Error in deleting attributetype from Xanda Labs Database: "+e);
			e.printStackTrace(System.err);			
		}
		return false;
	}
		
	/**
	 * Get and set methods for the attributes of attributetype
	 */

	public int getAttTypeID() {
		return attTypeID;
	}

	public void setAttTypeID(int attTypeID) {
		this.attTypeID = attTypeID;
	}

	public String getAttName() {
		return attName;
	}

	public void setAttName(String attName) {
		this.attName = attName;
	}
	
	public boolean ok() {
		return ok(new Validatable[] {
		});
	}

	/**
	 * Creates the Category nodes for the XML document
	 */
	public Element getElement(Document doc) {

		Element userEl = doc.createElement("AttributeType");

		Element userIDEl = doc.createElement("attTypeID");
		userIDEl.appendChild(doc.createTextNode(attTypeID+""));
		userEl.appendChild(userIDEl);

		Element nameEl = doc.createElement("attName");
		nameEl.appendChild(doc.createTextNode(attName));
		userEl.appendChild(nameEl);

		return userEl;
		
	}

}
