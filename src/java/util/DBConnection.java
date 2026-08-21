package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    private static final String URL =
        "jdbc:mysql://localhost:3306/hoteldb?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";

    private static final String USER = "root";
    private static final String PASSWORD = "root";

    public static Connection getConnection() {

        Connection con = null;

        try {

           Class.forName("com.mysql.cj.jdbc.Driver");

            con = DriverManager.getConnection(URL, USER, PASSWORD);

            System.out.println("[DB] Connection established successfully.");

        } catch (ClassNotFoundException e) {

            System.err.println("[DB] MySQL Driver Not Found");
            e.printStackTrace();

        } catch (SQLException e) {

            System.err.println("[DB] Connection Failed");
            e.printStackTrace();
        }

        return con;
    }
}