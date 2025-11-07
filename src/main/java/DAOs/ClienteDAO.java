package DAOs;

import database.ConnectionFactory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import models.Cliente;

public class ClienteDAO {
    private Connection conexao;

    public ClienteDAO() {
        try{
            this.conexao = ConnectionFactory.getConnection();
        }catch(SQLException e){
            System.out.println("Erro ao abrir conexão");
        }        
    }
    //colocar os metodos para inserir os dados
    
    public void createCliente(Cliente cliente){
        try {           
            String query = "INSERT INTO clientes (nome, endereco) VALUES (?, ?)";
            
            PreparedStatement ps = conexao.prepareStatement(query);
            ps.setString(1, cliente.getNome());
            ps.setString(2, cliente.getEndereco());
            
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Erro ao criar um cliente");
        }
    }
}
