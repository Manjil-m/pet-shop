package com.example.onlineshopping.config;



import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider {
    public static Connection getCon() {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shop_db", "root", "");

        } catch (Exception e) {
            System.out.println(e);
        }
        return con;

    }
}
