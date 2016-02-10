package net.xanda.autobeancreator.servlet;

/**
 * This class is our method of removing special characters that can acuse SQL errors during saving.
 **/

public class InputSyntaxCheck {

 /* Replace all instances of a String in a String.
 *   @param  s  String to alter.
 *   @param  f  String to look for.
 *   @param  r  String to replace it with, or null to just remove it.
 */  

	public static String replace( String s, String f, String r ){
		if (s == null)  return s;
		if (f == null)  return s;
		if (r == null)  r = "";

		int index01 = s.indexOf( f );
		while (index01 != -1)
		{

      s = s.substring(0,index01) + r + s.substring(index01+f.length());

      index01 += r.length();
 
      index01 = s.indexOf( f, index01 );

	   }
			
	  return s;
	
	}
	

	public static String dbTextClean(String s){
		  s = replace(s,"\n", " ");
		  s = replace(s,"\\n", " ");
		  s = replace(s,"\\r", "");
		  s = replace(s,"\r", "");
		  s = replace(s,"\\f", "");
		  s = replace(s,"\\f", "");		
		  s = replace(s,"\\", "\\\\");	
		  s = replace(s, "\"", "''");
		  s = replace(s, "'", "''");
		  s = replace(s, "  ", " ");

		  return s;
	}
	
	public static String stripGarbage(String s) {  
	    String allowedCharacters =
	      "abcdefghijklmnopqrstuvwxyz"+
	      "ABCDEFGHIJKLMNOPQRSTUVWXYZ"+
	      "0123456789"+
	      " !�$%^&*()_+-=[]{};'#/.,<>\\";
	    String result = "";
	    String lastChar = "";
	    String thisChar = "";
	    for ( int i = 0; i < s.length(); i++ ) {
	    	thisChar = s.charAt(i)+"";
	    	if (thisChar.equalsIgnoreCase(" ")&& lastChar.equalsIgnoreCase(" ")){
	    		//clear white space
	    	} else {
		        if ( allowedCharacters.indexOf(s.charAt(i)) >= 0 ){
		           result += s.charAt(i);
		        }
	    	}
	        lastChar = thisChar;
	        }
	    return result;
	    }

	
	 
}



       



