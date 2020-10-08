package Beans;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

import Beans.connect;

public class Client {
	private int id;
	private String nom;
	private String prenom;
	private String email;
	private String password;
	private String phone;
	private String image;
	private String genre;
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getPrenom() {
		return prenom;
	}
	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void ajouter() 
    {
		Connection con = (Connection) connect.loadDatabase();
        
        try {
            PreparedStatement preparedStatement = (PreparedStatement) con.prepareStatement("INSERT INTO client(nom, prenom,email,password,phone,genre) VALUES(?,?,?,?,?,?);");
            preparedStatement.setString(1, this.getNom());
            preparedStatement.setString(2, this.getPrenom());
            preparedStatement.setString(3, this.getEmail());
            preparedStatement.setString(4, this.getPassword());
            preparedStatement.setString(5, this.getPhone());
            preparedStatement.setString(6, this.getGenre());
        
            
            preparedStatement.executeUpdate();
        } catch (SQLException es) {
            es.printStackTrace();
        }
    }
	
	
	public ArrayList<Client> AllC()throws SQLException
	{
		Connection con = (Connection) connect.loadDatabase();
		
		
		ArrayList<Client> et=new ArrayList<>();
		
		
		Client p;
		
		 PreparedStatement st=(PreparedStatement) con.prepareStatement("select * from `client` ");
		 
		 ResultSet rs=st.executeQuery();
				 //
		
		try {
			while(rs.next())
			{
				p=new Client();
				p.setId(rs.getInt(1));
				p.setNom(rs.getString(2));
		p.setPrenom(rs.getString(3));
		p.setEmail(rs.getString(4));
			p.setPhone(rs.getString(6));
				p.setPassword(rs.getString(5));
				p.setGenre(rs.getString(7));
				p.setImage(rs.getString(8));
				et.add(p);
				
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
	   
	return et;
	}
	
	
	
	
	
	public void deleteClient(int id)
	{
		Connection con = (Connection) connect.loadDatabase();
		 try {
	            PreparedStatement preparedStatement = (PreparedStatement)con.prepareStatement("delete from `client` where ID_Client='"+id+"'");
	            
	            preparedStatement.executeUpdate();
	        } catch (SQLException es) {
	            es.printStackTrace();
	        }
		
	
	}
	
	
	public void updateClinet (int id ,Client e)
	{
		Connection con = (Connection) connect.loadDatabase();
		 try {
	            PreparedStatement preparedStatement = (PreparedStatement)con.prepareStatement("update client set nom='"+e.getNom()+"',prenom='"+e.getPrenom()+"',email='"+e.getEmail()+"',phone='"+e.getPhone()+"',password='"+e.getPassword()+"',genre='"+e.getGenre()+"' where ID_Client="+id);
	            
	            
	            preparedStatement.executeUpdate();
	        } catch (SQLException es) {
	            es.printStackTrace();
	        }
	}
	
	
	public static Client findClient(int id) throws SQLException
	{
		Connection con = (Connection) connect.loadDatabase();
		
		Client o=null;
		
		 PreparedStatement st=(PreparedStatement)con.prepareStatement("SELECT * FROM `client` WHERE `ID_Client`="+id);
		 ResultSet rs=st.executeQuery();
		try {
			if(rs.next())
			{
				o=new Client();
				o.setId(rs.getInt(1));
				o.setNom(rs.getString(2));
				o.setPrenom(rs.getString(3));
				o.setEmail(rs.getString(4));
				o.setPhone(rs.getString(5));
	            o.setPassword(rs.getString(6));
	            o.setGenre(rs.getString(7));
	            o.setImage(rs.getString(8));
	            
				
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	return o;
	}
	public static int compterNombreClient()
	{
		int nbr=0;
         try{
			
			String sql = "SELECT COUNT(	ID_Client) FROM `client`";
			
			Connection con = (Connection) connect.loadDatabase();
			Statement statement = (Statement) con.createStatement();
			
			ResultSet res = statement.executeQuery(sql);
			while(res.next())
			{
			nbr=res.getInt(1);
			}
			
			con.close();
			
		}catch(SQLException e1){
			e1.printStackTrace();
		}
         return nbr;
	}
	
	
}
