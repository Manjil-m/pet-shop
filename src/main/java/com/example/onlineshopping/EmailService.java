//package com.example.onlineshopping;
//import com.google.protobuf.Message;
//
//import javax.mail.*;
//import javax.mail.internet.InternetAddress;
//import javax.mail.internet.MimeMessage;
//import java.util.Properties;
//import java.util.Random;
//
//public class EmailService {
//    public String generateOTP() {
//        int length = 6; // OTP length
//        String numbers = "0123456789";
//        Random random = new Random();
//        StringBuilder otp = new StringBuilder();
//
//        for (int i = 0; i < length; i++) {
//            int index = random.nextInt(numbers.length());
//            otp.append(numbers.charAt(index));
//        }
//
//        return otp.toString();
//    }
//
//    public void sendOTPEmail(String userEmail, String generatedOTP) {
//        final String username = "YOUR_EMAIL@gmail.com"; // Replace with your email
//        final String password = "YOUR_PASSWORD"; // Replace with your password
//
//        Properties props = new Properties();
//        props.put("mail.smtp.auth", "true");
//        props.put("mail.smtp.starttls.enable", "true");
//        props.put("mail.smtp.host", "smtp.gmail.com");
//        props.put("mail.smtp.port", "587");
//
//        Session session = Session.getInstance(props,
//                new javax.mail.Authenticator() {
//                    protected PasswordAuthentication getPasswordAuthentication() {
//                        return new PasswordAuthentication(username, password);
//                    }
//                });
//
//        try {
//            Message message = (Message) new MimeMessage(session);
//            ((MimeMessage) message).setFrom(new InternetAddress(username));
//            ((MimeMessage) message).setRecipients(Message.RecipientType.TO, InternetAddress.parse(userEmail));
//            ((MimeMessage) message).setSubject("Your OTP for Signup");
//            ((MimeMessage) message).setText("Your OTP for signup is: " + generatedOTP);
//
//            Transport.send((javax.mail.Message) message);
//            System.out.println("Email sent successfully!");
//
//        } catch (MessagingException e) {
//            throw new RuntimeException(e);
//        }
//    }
//}