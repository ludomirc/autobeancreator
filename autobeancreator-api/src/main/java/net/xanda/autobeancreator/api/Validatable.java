package net.xanda.autobeancreator.api;//import FieldFault;

import java.io.Serializable;
import java.lang.String;

/**
 * \file Validatable.java
 * 
 * \brief Validatable defines the protocol for validating input from a user.
 * 
 * $Id: Validatable.java,v 1.1 2005/10/20 10:01:09 alexh Exp $
 * 
 * \author Brad Cox <bcox@virtualschool.edu>\date Sun Nov 11 11:04:05 EST 2001
 */
public interface Validatable extends Serializable {

	/**
	 * Return an instance with the same value as the receiver.
	 * 
	 * @param Object
	 *            s: the instance's value
	 * @return Validatable
	 */
	Validatable replica(String v);

	/**
	 * Return the error message for this field. Returns "" if null.
	 * 
	 * @return String
	 */
	String getMessage();

	/**
	 * Returns true if this field's value meets the syntactic requirements of
	 * this type. The getMessage() call can be used to retrieve a string that
	 * explains the problem in the user's terms.
	 * 
	 * @return boolean
	 */
	boolean ok();

	/**
	 * Mark this instance as invalid.
	 * 
	 * @param Object
	 *            s: message text
	 */
	void notOK(String s);
}