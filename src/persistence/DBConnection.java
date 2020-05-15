package persistence;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;


public class DBConnection {
    private final static String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
    private static Connection connection;

    static {
        Properties props = new Properties();

        try  {

            String url = "jdbc:mysql://161.35.102.47:3306/GPA";
            String username = "khalil";
            String password = "GPAdmin19@/";

            Class.forName(JDBC_DRIVER);
            System.out.println("bonjour 2");
            connection = DriverManager.getConnection(url, username, password);
            System.out.println("Connection established");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            System.exit(1);
        }
    }

    private DBConnection(){

    }

    public static Connection getConnection() {
        return connection;
    }
}
