/////////////////EMAIL MAIN/////////////////////////////////
// Simple E-mail Checking    
// This code requires the Java mail library
// smtp.jar, pop3.jar, mailapi.jar, imap.jar, activation.jar
// Download:// <a href="http://java.sun.com/products/javamail/" target="_blank" rel="nofollow">http://java.sun.com/products/javamail/</a>
 
import javax.mail.*;
import javax.mail.internet.*;
 
// void setup() {
//   size(200,200);
 
//   sendMail();
//   println("Finished.");
//   noLoop();
// }
/////////////////AUTH///////////////////////////////////////
// Simple Authenticator      
// Careful, this is terribly unsecure!!
 
import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
 
public class Auth extends Authenticator {
 
  public Auth() {
    super();
  }
 
  public PasswordAuthentication getPasswordAuthentication() {
    String username, password;
    username = "yyyeeeeeyyy@gmail.com";
    password = "itpWinter2017!";
    System.out.println("authenticating... ");
    return new PasswordAuthentication(username, password);
  }
}
/////////////////MAIL STUFF/////////////////////////////////
// Example functions that send mail (smtp)
// You can also do imap, but that's not included here
 
// A function to check a mail account
import java.util.*;
import java.io.*;
import javax.activation.*;
 
// A function to send mail
void sendMail(String userEmail) {
  // Create a session
  String host="smtp.gmail.com";
  Properties props=new Properties();
 
  // SMTP Session
  props.put("mail.transport.protocol", "smtp");
  props.put("mail.smtp.host", host);
  props.put("mail.smtp.port", "587");
  props.put("mail.smtp.auth", "true");
  // We need TTLS, which gmail requires
  props.put("mail.smtp.starttls.enable","true");
 
  // Create a session
  Session session = Session.getDefaultInstance(props, new Auth());
 
  try
  {
    MimeMessage msg=new MimeMessage(session);
    msg.setFrom(new InternetAddress("yyyeeeeeyyy@gmail.com", "HappyHolidayNYC"));
    msg.addRecipient(Message.RecipientType.TO,new InternetAddress(userEmail));//"a@google.com"
    msg.setSubject("Email with Processing");
    BodyPart messageBodyPart = new MimeBodyPart();
 // Fill the message
    messageBodyPart.setText("Email sent with Processing");
    Multipart multipart = new MimeMultipart();
    multipart.addBodyPart(messageBodyPart);
   // Part two is attachment
    messageBodyPart = new MimeBodyPart();
    DataSource source = new FileDataSource("/Users/EUGENE/Documents/SelebFaceGame3/finalPrint/"+userCount+userSel+userPost+".jpg");
    messageBodyPart.setDataHandler(new DataHandler(source));
    messageBodyPart.setFileName("image.jpg");
    multipart.addBodyPart(messageBodyPart);
    msg.setContent(multipart);
    msg.setSentDate(new Date());
    Transport.send(msg);
    println("Mail sent!");
  }
  catch(Exception e)
  {
    e.printStackTrace();
  }
 
}