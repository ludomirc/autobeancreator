package net.xanda.autobeancreator.api;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import org.w3c.dom.Document;
import org.w3c.dom.Element;

public class BeanLoad extends AbstractItem {

	private int blID = 0;
	private String blName = "";
	private int beanID = 0;
	private int bltID = 0;	
		
	public final static BeanLoad Null = new BeanLoad(0, "", 0, 0);

	private BeanLoad(int blID, String blName, int beanID, int bltID) {
		
		this.blID = blID;
		this.blName = blName;
		this.beanID=beanID;
		this.bltID=bltID;
		
	}
	
	public static int createNew(String blName, int beanID, int bltID, Connection con) {
        try {
            Statement stmt = con.createStatement();
            int updater = stmt.executeUpdate("INSERT INTO beanload VALUES('', '"+ blName + "', '"+ beanID + "', '"+ bltID + "');");
            ResultSet res = stmt.executeQuery("SELECT blID FROM beanload WHERE blName='"+blName+"' AND beanID='"+beanID+"' AND bltID='"+bltID+"';");
            res.next();
            return res.getInt(1);
        }
        catch(Exception e) {
            System.err.println("Error in creating new beanload from Xanda Labs Database: "+e);
            e.printStackTrace(System.err);
            return 0;
        }
    }

	public static BeanLoad loadByID(int blID, Connection con) {
		try {
			Statement stmt = con.createStatement();
			ResultSet res = stmt.executeQuery("SELECT * FROM beanload WHERE blID = '" + blID + "';");
			if (res.next()) {
				return new BeanLoad(res.getInt("blID"), res.getString("blName"), res.getInt("beanID"), res.getInt("bltID"));
			} else {
				return BeanLoad.Null;
			}
		} catch (Exception e) {
			System.err.println("Failed to load beanload from Xanda Labs Database: "+e);
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
			for (int i = 0; i < count; i++) {
				res.next();
				AllCategories[i] = new BeanLoad(res.getInt("blID"), res.getString("blName"), res.getInt("beanID"), res.getInt("bltID"));
			}
			return AllCategories;
		} catch (Exception e) {
			System.err.println("Failed to load beanloads from Xanda Labs Database: "+e);
			e.printStackTrace(System.err);
			BeanLoad[] empty = new BeanLoad[0];
			return empty;
		}
	}	
	
	public static BeanLoad[] loadByBeanID(int beanID, Connection con) {
		try {
			Statement stmt = con.createStatement();
			ResultSet res2 = stmt.executeQuery("SELECT COUNT(*) FROM beanload WHERE beanID='"+beanID+"';");
			res2.next();
			int count = res2.getInt(1);
			BeanLoad[] AllCategories = new BeanLoad[count];
			ResultSet res = stmt.executeQuery("SELECT * FROM beanload WHERE beanID='"+beanID+"';");
			for (int i = 0; i < count; i++) {
				res.next();
				AllCategories[i] = new BeanLoad(res.getInt("blID"), res.getString("blName"), res.getInt("beanID"), res.getInt("bltID"));
			}
			return AllCategories;
		} catch (Exception e) {
			System.err.println("Failed to load beanloads by beanID from Xanda Labs Database: "+e);
			e.printStackTrace(System.err);
			BeanLoad[] empty = new BeanLoad[0];
			return empty;
		}
	}	
	
	public boolean save(Connection con) {
		try {
			Statement stmt = con.createStatement();
			int updater = stmt.executeUpdate("UPDATE beanload SET blName  =  '" +blName +"', beanID  =  '" +beanID +"', bltID  =  '" +bltID +"' WHERE blID  =  '"	+ blID + "';");
			return true;
		} catch (Exception e) {
			System.err.println("Error in saving updates to beanload from Xanda Labs Database: "+e);
			e.printStackTrace(System.err);			
		}
		return false;
	}	
		
	public boolean delete(int blID, Connection con) {
		try {
			Statement stmt = con.createStatement();
			int updater = stmt.executeUpdate("DELETE FROM beanload WHERE blID  =  '" + blID + "';");
			return true;
		} catch (Exception e) {
			System.err.println("Error in deleting beanload from Xanda Labs Database: "+e);
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
		return ok(new Validatable[] {
		});
	}

	/**
	 * Creates the Category nodes for the XML document
	 */
	public Element getElement(Document doc) {

		Element userEl = doc.createElement("BeanLoad");

		Element userIDEl = doc.createElement("blID");
		userIDEl.appendChild(doc.createTextNode(blID+""));
		userEl.appendChild(userIDEl);

		Element nameEl = doc.createElement("blName");
		nameEl.appendChild(doc.createTextNode(blName));
		userEl.appendChild(nameEl);

		Element beanIDEl = doc.createElement("beanID");
		beanIDEl.appendChild(doc.createTextNode(beanID+""));
		userEl.appendChild(beanIDEl);
		
		Element bltIDEl = doc.createElement("bltID");
		bltIDEl.appendChild(doc.createTextNode(bltID+""));
		userEl.appendChild(bltIDEl);
		
		return userEl;
		
	}

}
