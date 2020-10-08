package Beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;








public class Gerer_off 
{
	
		public Gerer_off()
		{
			super();
		}
		
		 
		  
		   
		 public void ajouter(offreur e) 
		    {
			 Connection connexion=connect.loadDatabase();
		        
		        try {
		            PreparedStatement preparedStatement = connexion.prepareStatement("INSERT INTO offreur_service(nom, prenom,email,phone,password,nom_service,descreption,ville,genre) VALUES(?,?,?,?,?,?,?,?,?);");
		            preparedStatement.setString(1, e.getNom());
		            preparedStatement.setString(2, e.getPrenom());
		            preparedStatement.setString(3, e.getEmail());
		            preparedStatement.setString(4, e.getPhone());
		            preparedStatement.setString(5, e.getPassword());
		            preparedStatement.setString(6, e.getService());
		            preparedStatement.setString(7, e.getDescreption());
		            preparedStatement.setString(8, e.getVille());
		            preparedStatement.setString(9, e.getGenre());
		            preparedStatement.executeUpdate();
		        } catch (SQLException es) {
		            es.printStackTrace();
		        }
		    }
		 
		 public ArrayList<offreur> AllOffreur() throws SQLException
			{
				ArrayList<offreur> et=new ArrayList<offreur>();
				Connection connexion=connect.loadDatabase();
				 PreparedStatement st=connexion.prepareStatement("select * from offreur_service");
				ResultSet rs=st.executeQuery();
				try {
					while(rs.next())
					{
						offreur p=new offreur();
						p.setId(rs.getInt(1));
						p.setNom(rs.getString(2));
						p.setPrenom(rs.getString(3));
						p.setEmail(rs.getString(4));
						p.setPassword(rs.getString(5));
						
						p.setPhone(rs.getString(6));
			           
			            p.setService(rs.getString(7));
			            p.setDescreption(rs.getString(8));
			            p. setVille(rs.getString(9));
			            p. setGenre(rs.getString(10));
			            
						et.add(p);
						
						
					}
				} catch (SQLException e) {
					
					e.printStackTrace();
				}
			
				return et ;
				
			}
		 public void updateOffreur (String email ,offreur e)
			{
				Connection connexion=connect.loadDatabase();
				 try {
			            PreparedStatement preparedStatement = connexion.prepareStatement("update offreur_service set nom='"+e.getNom()+"',prenom='"+e.getPrenom()+"',email='"+e.getEmail()+"',phone='"+e.getPhone()+"',nom_service='"+e.getService()+"',descreption='"+e.getDescreption()+"',ville='"+e.getVille()+"',genre='"+e.getGenre()+"' where email='"+email+"'");
			            
			            
			            preparedStatement.executeUpdate();
			        } catch (SQLException es) {
			            es.printStackTrace();
			        }
			}

		 public offreur findOffreur(String email) throws SQLException
			{
				Connection connexion=connect.loadDatabase();
				
				offreur o=null;
				
				 PreparedStatement st=connexion.prepareStatement("select * from offreur_service where 	email="+email+"'");
				 ResultSet rs=st.executeQuery();
				try {
					if(rs.next())
					{
						o=new offreur();
						o.setId(rs.getInt(1));
						o.setNom(rs.getString(2));
						o.setPrenom(rs.getString(3));
						
						o.setEmail(rs.getString(4));
						 o.setPassword(rs.getString(5));
						o.setPhone(rs.getString(6));
			           
			            o.setService(rs.getString(7));
			            o.setDescreption(rs.getString(8));
			            o. setVille(rs.getString(9));
			            o.setDescreption(rs.getString(10));
						
						
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			return o;
			}
		 public void deleteOffreur(int id)
			{
				Connection connexion=connect.loadDatabase();
				 try {
			            PreparedStatement preparedStatement = connexion.prepareStatement("delete from `offreur_service` where ID_off='"+id+"'");
			            
			            preparedStatement.executeUpdate();
			        } catch (SQLException es) {
			            es.printStackTrace();
			        }
				
			
			}
		 public void updateOffreur (int id ,offreur e)
			{
				Connection connexion=connect.loadDatabase();
				 try {
			            PreparedStatement preparedStatement = connexion.prepareStatement("update offreur_service set nom='"+e.getNom()+"',prenom='"+e.getPrenom()+"',email='"+e.getEmail()+"',phone='"+e.getPhone()+"',nom_service='"+e.getService()+"',descreption='"+e.getDescreption()+"',ville='"+e.getVille()+"',genre='"+e.getGenre()+"' where ID_off='"+id+"'");
			            
			            
			            preparedStatement.executeUpdate();
			        } catch (SQLException es) {
			            es.printStackTrace();
			        }
			}
		 

}
