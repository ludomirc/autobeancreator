package net.xanda.autobeancreator.api;

import org.w3c.dom.Document;
import org.w3c.dom.Element;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class BeanLoadType extends AbstractItem {

	private int bltID = 0;
	private String bltName = "";
	
	public final static BeanLoadType Null = new BeanLoadType(0, "");

	private BeanLoadType(int bltID, String bltName) {
		
		this.bltID = bltID;
		this.bltName = bltName;
		
	}
	
	public static int createNew(String bltName, Connection con) {
        try {
            Statement stmt = con.createStatement();
            int updater = stmt.executeUpdate("INSERT INTO beanloadtype VALUES('', '"+ bltName + "');");
            ResultSet res = stmt.executeQuery("SELECT bltID FROM beanloadtype WHERE bltName='"+bltName+"';");
            res.next();
            return res.getInt(1);
        }
        catch(Exception e) {
            System.err.println("Error in creating new beanloadtype from Xanda Labs Database: "+e);
            e.printStackTrace(System.err);
            return 0;
        }
    }

	public static BeanLoadType loadByID(int bltID, Connection con) {
		try {
			Statement stmt = con.createStatement();
			ResultSet res = stmt.executeQuery("SELECT * FROM beanloadtype WHERE bltID = '" + bltID + "';");
			if (res.next()) {
				return new BeanLoadType(res.getInt("bltID"), res.getString("bltName"));
			} else {
				return BeanLoadType.Null;
			}
		} catch (Exception e) {
			System.err.println("Failed to load beanloadtype from Xanda Labs Database: "+e);
			e.printStackTrace(System.err);
			return BeanLoadType.Null;
		}
	}
	
	public static BeanLoadType[] loadAll(Connection con) {
		try {
			Statement stmt = con.createStatement();
			ResultSet res2 = stmt.executeQuery("SELECT COUNT(*) FROM beanloadtype;");
			res2.next();
			int count = res2.getInt(1);
			BeanLoadType[] AllCategories = new BeanLoadType[count];
			ResultSet res = stmt.executeQuery("SELECT * FROM beanloadtype ORDER BY bltName;");
			for (int i = 0; i < count; i++) {
				res.next();
				AllCategories[i] = new BeanLoadType(res.getInt("bltID"), res.getString("bltName"));
			}
			return AllCategories;
		} catch (Exception e) {
			System.err.println("Failed to load beanloadtypes from Xanda Labs Database: "+e);
			e.printStackTrace(System.err);
			BeanLoadType[] empty = new BeanLoadType[0];
			return empty;
		}
	}		
	
	public boolean save(Connection con) {
		try {
			Statement stmt = con.createStatement();
			int updater = stmt.executeUpdate("UPDATE beanloadtype SET bltName  =  '" +bltName +"' WHERE bltID  =  '"	+ bltID + "';");
			return true;
		} catch (Exception e) {
			System.err.println("Error in saving updates to beanloadtype from Xanda Labs Database: "+e);
			e.printStackTrace(System.err);			
		}
		return false;
	}	
		
	public boolean delete(int bltID, Connection con) {
		try {
			Statement stmt = con.createStatement();
			int updater = stmt.executeUpdate("DELETE FROM beanloadtype WHERE bltID  =  '" + bltID + "';");
			return true;
		} catch (Exception e) {
			System.err.println("Error in deleting beanloadtype from Xanda Labs Database: "+e);
			e.printStackTrace(System.err);			
		}
		return false;
	}
		
	/**
	 * Get and set methods for the attributes of beanloadtype
	 */

	public int getBltID() {
		return bltID;
	}

	public void setBltID(int bltID) {
		this.bltID = bltID;
	}

	public String getBltName() {
		return bltName;
	}

	public void setBltName(String bltName) {
		this.bltName = bltName;
	}
	
	public boolean ok() {
		return ok(new Validatable[] {
		});
	}

	/**
	 * Creates the Category nodes for the XML document
	 */
	
	public Element getElement(Document doc) {

		Element userEl = doc.createElement("BeanLoadType");

		Element userIDEl = doc.createElement("bltID");
		userIDEl.appendChild(doc.createTextNode(bltID+""));
		userEl.appendChild(userIDEl);

		Element nameEl = doc.createElement("bltName");
		nameEl.appendChild(doc.createTextNode(bltName));
		userEl.appendChild(nameEl);

		return userEl;
		
	}

}
