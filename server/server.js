const express = require("express");
const app = express();
const mysql = require("mysql");

//Dados da conexão do banco de dados
const db = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: "quadrarts"
});

app.get('/', (req, res) => {
    // Realiza a inserção no banco de dados
    db.query(
        "INSERT INTO `usuarios` (`ID_usuarios`, `nome`, `email`, `senha`, `confirmarSenha`, `login`, `telefone`, `tipo`, `genero`, `data_nascimento`) VALUES (12 , 'Diogene', 'gabriel@gmail.com, '1234', '1234', 'diogene01', '190834023', 'masculino', '')"
    );
});

app.listen(3001, () => {
    console.log("Rodando porta 3001")
});