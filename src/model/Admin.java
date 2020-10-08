package model;

import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

public class Admin {
private int id;
private String username;
private String password;
public Admin() {
	super();
}
public Admin(int id, String username, String password) {
	super();
	this.id = id;
	this.username = username;
	this.password = password;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getUsername() {
	return username;
}
public void setUsername(String username) {
	this.username = username;
}
public static void add(Admin a)
{
	try{
		
		String sql = "INSERT INTO `admin`(`username`, `password`) VALUES (?,?);";
		Connection con = (Connection) connect.loadDatabase();
		PreparedStatement preparedStatement = (PreparedStatement) con.prepareStatement(sql);
		
		//preparedStatement.setInt(1,a.getId());
		preparedStatement.setString(1, a.getUsername());
		preparedStatement.setString(2, a.getPassword());
		preparedStatement.executeUpdate();
		con.close();	
	}catch(SQLException e1){
		e1.printStackTrace();
	}
}
}
