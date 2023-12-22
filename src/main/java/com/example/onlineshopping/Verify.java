//package com.example.onlineshopping;
//
//import com.twilio.Twilio;
//import com.twilio.rest.verify.v2.service.Verification;
//
//public class Example {
//    // Find your Account SID and Auth Token at twilio.com/console
//    // and set the environment variables. See http://twil.io/secure
//    public static final String ACCOUNT_SID = System.getenv("TWILIO_ACCOUNT_SID");
//    public static final String AUTH_TOKEN = System.getenv("TWILIO_AUTH_TOKEN");
//
//    public static void main(String[] args) {
//        Twilio.init(ACCOUNT_SID, AUTH_TOKEN);
//        Verification verification = Verification.creator(
//                        "VAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
//                        "recipient@foo.com",
//                        "email")
//                .create();
//
//        System.out.println(verification.getSid());
//    }
//}