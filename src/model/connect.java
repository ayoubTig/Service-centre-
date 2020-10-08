package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class connect {
	 public  static Connection loadDatabase() {

		 Connection connection=null;
	        // Chargement du driver
	        try {
	            Class.forName("com.mysql.jdbc.Driver");
	        } catch (ClassNotFoundException e) {
	        }

	        try {
	        	 connection = DriverManager.getConnection("jdbc:mysql://localhost/centre_service", "root", "");
	        } catch (SQLException e) {
	        	 e.printStackTrace();
	        }
	        return   connection;
	    }
	 
}
