package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.jdbc.Statement;
public class trai_client {

	public trai_client(){}
	
	
	public void ajouter(client e) 
    {
	 Connection connexion=connect.loadDatabase();
        
        try {
            PreparedStatement preparedStatement = connexion.prepareStatement("INSERT INTO client(nom, prenom,email,phone,password,genre) VALUES(?,?,?,?,?,?);");
            preparedStatement.setString(1, e.getNom());
            preparedStatement.setString(2, e.getPrenom());
            preparedStatement.setString(3, e.getEmail());
            preparedStatement.setString(4, e.getPhone());
            preparedStatement.setString(5, e.getPassword());
            preparedStatement.setString(6, e.getGenre());
        
            
            preparedStatement.executeUpdate();
        } catch (SQLException es) {
            es.printStackTrace();
        }
    }
	
	
	public ArrayList<client> AllC()throws SQLException
	{
		Connection connexion=connect.loadDatabase();
		
		
		ArrayList<client> et=new ArrayList<client>();
		
		
		client p;
		
		 PreparedStatement st=connexion.prepareStatement("select * from `client` ");
		 
		 ResultSet rs=st.executeQuery();
				 //
		
		try {
			while(rs.next())
			{
				p=new client();
				p.setId(rs.getInt(1));
				p.setNom(rs.getString(2));
		p.setPrenom(rs.getString(3));
		p.setEmail(rs.getString(4));
			p.setPhone(rs.getString(6));
				p.setPassword(rs.getString(5));
				p.setGenre(rs.getString(7));
				et.add(p);
				
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
	   
	return et;
	}
	
	
	
	
	
	public void deleteClient(int id)
	{
		Connection connexion=connect.loadDatabase();
		 try {
	            PreparedStatement preparedStatement = connexion.prepareStatement("delete from `client` where ID_Client='"+id+"'");
	            
	            preparedStatement.executeUpdate();
	        } catch (SQLException es) {
	            es.printStackTrace();
	        }
		
	
	}
	
	
	public void updateClinet (int id ,String nom,String prenom,String email,String phone, String pass)
	{
		Connection connexion=connect.loadDatabase();
		 try {
	            PreparedStatement preparedStatement = connexion.prepareStatement("update client set nom='"+nom+"',prenom='"+prenom+"',email='"+email+"',phone='"+phone+"',password='"+pass+"' where ID_Client="+id);
	            
	            
	            preparedStatement.executeUpdate();
	        } catch (SQLException es) {
	            es.printStackTrace();
	        }
	}
	
	
	public client findOffreur(int id) throws SQLException
	{
		Connection connexion=connect.loadDatabase();
		
		client o=null;
		
		 PreparedStatement st=connexion.prepareStatement("SELECT * FROM `client` WHERE `ID_Client`="+id);
		 ResultSet rs=st.executeQuery();
		try {
			if(rs.next())
			{
				o=new client();
				o.setId(rs.getInt(1));
				o.setNom(rs.getString(2));
				o.setPrenom(rs.getString(3));
				o.setEmail(rs.getString(4));
				o.setPhone(rs.getString(5));
	            o.setPassword(rs.getString(6));
	            o.setGenre(rs.getString(7));
	            
				
				
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
	return o;
	}
	public static int compterNombreClient()
	{
		int nbr=0;
         try{
			
			String sql = "SELECT COUNT(	ID_Client) FROM `client`";
			Connection con = null;
			con=(Connection) connect.loadDatabase();
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
