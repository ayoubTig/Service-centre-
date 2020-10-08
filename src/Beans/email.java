package Beans;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.mysql.jdbc.PreparedStatement;

import Beans.connect;


public class email {
	
	
	final String username = "hicham.dandan@gmail.com";
	final String password = "zineb123";
	
	
	
	public void sendEmail(String toEmail,String subject,String messageTo) {
		try {
			Properties props = new Properties();
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.smtp.host", "smtp.gmail.com");
			props.put("mail.smtp.port", "587");
		
			Session session = Session.getInstance(props,
			  new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(username, password);
				}
			  });
		
			try {
		
				Message message = new MimeMessage(session);
				message.setFrom(new InternetAddress("hicham.dandan@gmail.com"));
				message.setRecipients(Message.RecipientType.TO,
					InternetAddress.parse(toEmail));
				message.setSubject(subject);
				message.setText(messageTo);
		
				Transport.send(message);
		
				System.out.println("Message envoyer avec succés");
		
			} catch (MessagingException e) {
				throw new RuntimeException(e);
			}
		}catch(Exception mex) {
			mex.printStackTrace();
		}
	}
	
	public void ajouter(String name,String toEmail,String subject,String messageTo) {
		
			try{
			
			String sql = "INSERT INTO contact(name, email, sujet, commentaire) VALUES (?,?,?,?);";
			Connection con = (Connection) connect.loadDatabase();
			PreparedStatement preparedStatement = (PreparedStatement) con.prepareStatement(sql);
			preparedStatement.setString(1, name );
			preparedStatement.setString(2,toEmail );
			preparedStatement.setString(3,subject );
			preparedStatement.setString(4, messageTo);
			
			preparedStatement.executeUpdate();
			con.close();
			
		}catch(SQLException e1){
			e1.printStackTrace();
		}
		
	}
	
}
