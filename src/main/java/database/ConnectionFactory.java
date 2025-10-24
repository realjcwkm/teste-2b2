/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionFactory {

    private static Connection conexao = null;

    private static Connection getInstance() throws SQLException {
        String db = "teste";
        String url = "jdbc:mysql://localhost:3306/" + db; //Nome da base de dados
        String user = "root"; //nome do usuário do MySQL
        String password = "root"; //senha do MySQL
        Connection conexao = null;
        conexao = DriverManager.getConnection(url, user, password);
        return conexao;
    }

    public static Connection getConnection() throws SQLException {
        if (conexao == null) {
            conexao = getInstance();
        }
        return conexao;
    }
}
