package Beans;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import model.connect;

import com.mysql.jdbc.PreparedStatement;

/**
 * A utility class for sending e-mail messages
 * @author www.codejava.net
 *
 */
public class email1 {
	
	
	
	  public static void sendEmail(String host, String port,final String userName, final String password, String toAddress,String subject, String message) 
			  throws AddressException, MessagingException {
 
 
			 Properties properties = new Properties();
			 properties.put("mail.smtp.host", host);
			 properties.put("mail.smtp.port", port);
			 properties.put("mail.smtp.auth", "true");
			 properties.put("mail.smtp.starttls.enable", "true");
			 
			 // creates a new session with an authenticator
			 Authenticator auth = new Authenticator() {
			 public PasswordAuthentication getPasswordAuthentication() {
			 return new PasswordAuthentication(userName, password);
 }

 
 
 };
 
			 Session session = Session.getInstance(properties, auth);
			 
			 // creates a new e-mail message
			 Message msg = new MimeMessage(session);

			 msg.setFrom(new InternetAddress(userName));
			InternetAddress[] toAddresses = { new InternetAddress(toAddress) };
			msg.setRecipients(Message.RecipientType.TO, toAddresses);
			msg.setSubject(subject);
			msg.setSentDate(new Date());
			msg.setText(message);
			
			// sends the e-mail
			Transport.send(msg);
	  }
	  public static void ajouter(String name,String toEmail,String subject,String messageTo) {
			
			try{
			
			String sql = "INSERT INTO contact(name, email, sujet, commentaire) VALUES (?,?,?,?);";
			Connection con = connect.loadDatabase();
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

