package net.xanda.autobeancreator.api;

import org.w3c.dom.Document;
import org.w3c.dom.Element;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class BeanAttribute extends AbstractItem {

	private int beanAttID = 0;
	private String beanAttName = "";
	private int beanID = 0;
	private int attTypeID = 0;
	private int formHidden = 0;
	private int primaryKey = 0;
	private int compolsoryField = 0;
	private String friendlyName = "";
	private int order = 0;
		
	public final static BeanAttribute Null = new BeanAttribute(0, "", 0, 0, 0, 0, 0, "", 0);

	private BeanAttribute(int beanAttID, String beanAttName, int beanID, int attTypeID, int formHidden, int primaryKey, int compolsoryField, String friendlyName, int order) {
		
		this.beanAttID = beanAttID;
		this.beanAttName = beanAttName;
		this.beanID=beanID;
		this.attTypeID=attTypeID;
		this.formHidden=formHidden;
		this.primaryKey=primaryKey;
		this.compolsoryField=compolsoryField;
		this.friendlyName=friendlyName;
		this.order=order;
		
	}
	
	public static int createNew(String beanAttName, int beanID, int attTypeID, int formHidden, int primaryKey, int compolsoryField, String friendlyName, int order, Connection con) {
        try {
            Statement stmt = con.createStatement();
            int updater = stmt.executeUpdate("INSERT INTO beanattribute VALUES('', '"+ beanAttName + "', '"+ beanID + "', '"+ attTypeID + "', '"+ formHidden + "', '"+ primaryKey + "', '"+ compolsoryField + "', '"+ friendlyName + "', '"+ order + "');");
            ResultSet res = stmt.executeQuery("SELECT beanAttID FROM beanattribute WHERE beanAttName='"+beanAttName+"' AND beanID='"+beanID+"' AND attTypeID='"+attTypeID+"' AND formHidden='"+formHidden+"' AND primaryKey='"+primaryKey+"' AND compolsoryField='"+compolsoryField+"' AND friendlyName='"+friendlyName+"' AND order='"+order+"';");
            res.next();
            return res.getInt(1);
        }
        catch(Exception e) {
            System.err.println("Error in creating new beanattribute from Xanda Labs Database: "+e);
            e.printStackTrace(System.err);
            return 0;
        }
    }

	public static BeanAttribute loadByID(int beanAttID, Connection con) {
		try {
			Statement stmt = con.createStatement();
			ResultSet res = stmt.executeQuery("SELECT * FROM beanattribute WHERE beanAttID = '" + beanAttID + "';");
			if (res.next()) {
				return new BeanAttribute(res.getInt("beanAttID"), res.getString("beanAttName"), res.getInt("beanID"), res.getInt("attTypeID"), res.getInt("formHidden"), res.getInt("primaryKey"), res.getInt("compolsoryField"), res.getString("friendlyName"), res.getInt("order"));
			} else {
				return BeanAttribute.Null;
			}
		} catch (Exception e) {
			System.err.println("Failed to load beanattribute from Xanda Labs Database: "+e);
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
			for (int i = 0; i < count; i++) {
				res.next();
				AllCategories[i] = new BeanAttribute(res.getInt("beanAttID"), res.getString("beanAttName"), res.getInt("beanID"), res.getInt("attTypeID"), res.getInt("formHidden"), res.getInt("primaryKey"), res.getInt("compolsoryField"), res.getString("friendlyName"), res.getInt("order"));
			}
			return AllCategories;
		} catch (Exception e) {
			System.err.println("Failed to load beanattributes from Xanda Labs Database: "+e);
			e.printStackTrace(System.err);
			BeanAttribute[] empty = new BeanAttribute[0];
			return empty;
		}
	}	
	
	public static BeanAttribute[] loadByBeanID(int beanID, Connection con) {
		try {
			Statement stmt = con.createStatement();
			ResultSet res2 = stmt.executeQuery("SELECT COUNT(*) FROM beanattribute WHERE beanID='"+beanID+"';");
			res2.next();
			int count = res2.getInt(1);
			BeanAttribute[] AllCategories = new BeanAttribute[count];
			ResultSet res = stmt.executeQuery("SELECT * FROM beanattribute WHERE beanID='"+beanID+"';");
			for (int i = 0; i < count; i++) {
				res.next();
				AllCategories[i] = new BeanAttribute(res.getInt("beanAttID"), res.getString("beanAttName"), res.getInt("beanID"), res.getInt("attTypeID"), res.getInt("formHidden"), res.getInt("primaryKey"), res.getInt("compolsoryField"), res.getString("friendlyName"), res.getInt("order"));
			}
			return AllCategories;
		} catch (Exception e) {
			System.err.println("Failed to load beanattributes from Xanda Labs Database: "+e);
			e.printStackTrace(System.err);
			BeanAttribute[] empty = new BeanAttribute[0];
			return empty;
		}
	}	
	
	public boolean save(Connection con) {
		try {
			Statement stmt = con.createStatement();
			int updater = stmt.executeUpdate("UPDATE beanattribute SET beanAttName  =  '" +beanAttName +"', beanID  =  '" +beanID +"', attTypeID  =  '" +attTypeID +"', formHidden  =  '" +formHidden +"', primaryKey  =  '" +primaryKey +"', compolsoryField  =  '" +compolsoryField +"', friendlyName  =  '" +friendlyName +"' , order  =  '" +order +"' WHERE beanAttID  =  '"	+ beanAttID + "';");
			return true;
		} catch (Exception e) {
			System.err.println("Error in saving updates to beanattribute from Xanda Labs Database: "+e);
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
			System.err.println("Error in deleting beanattribute from Xanda Labs Database: "+e);
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
		return ok(new Validatable[] {
		});
	}

	/**
	 * Creates the Category nodes for the XML document
	 */
	public Element getElement(Document doc) {

		Element userEl = doc.createElement("BeanAttribute");

		Element userIDEl = doc.createElement("beanAttID");
		userIDEl.appendChild(doc.createTextNode(beanAttID+""));
		userEl.appendChild(userIDEl);

		Element nameEl = doc.createElement("beanAttName");
		nameEl.appendChild(doc.createTextNode(beanAttName));
		userEl.appendChild(nameEl);

		Element beanIDEl = doc.createElement("beanID");
		beanIDEl.appendChild(doc.createTextNode(beanID+""));
		userEl.appendChild(beanIDEl);
		
		Element attTypeIDEl = doc.createElement("attTypeID");
		attTypeIDEl.appendChild(doc.createTextNode(attTypeID+""));
		userEl.appendChild(attTypeIDEl);
		
		Element formHiddenEl = doc.createElement("formHidden");
		formHiddenEl.appendChild(doc.createTextNode(formHidden+""));
		userEl.appendChild(formHiddenEl);
		
		Element primaryKeyEl = doc.createElement("primaryKey");
		primaryKeyEl.appendChild(doc.createTextNode(primaryKey+""));
		userEl.appendChild(primaryKeyEl);
		
		Element compolsoryFieldEl = doc.createElement("compolsoryField");
		compolsoryFieldEl.appendChild(doc.createTextNode(compolsoryField+""));
		userEl.appendChild(compolsoryFieldEl);
		
		Element friendlyNameEl = doc.createElement("friendlyName");
		friendlyNameEl.appendChild(doc.createTextNode(friendlyName+""));
		userEl.appendChild(friendlyNameEl);
		
		Element orderEl = doc.createElement("order");
		orderEl.appendChild(doc.createTextNode(order+""));
		userEl.appendChild(orderEl);
		
		return userEl;
		
	}

	

}
