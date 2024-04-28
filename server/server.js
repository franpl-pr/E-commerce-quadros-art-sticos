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

db.connect();

app.get('/', (req, res) => {
    const email = 'vitormendes@gmail.com';
    const password = '123456';

    // Realiza a inserção no banco de dados
    db.query(
        "INSERT INTO usuarios (email, password) VALUES ('vitormendes@gmail.com', '1233456')",
        [email, password],
        (err, result) => {
            if (err) {
                // Em caso de erro, envia uma resposta de erro para o cliente
                console.error("Erro ao inserir usuário no banco de dados:", err);
                return res.status(500).send("Erro ao inserir usuário no banco de dados");
            }

            // Se a inserção for bem-sucedida, envia uma resposta de sucesso para o cliente
            console.log("Usuário inserido com sucesso no banco de dados");
            res.send("Usuário inserido com sucesso no banco de dados");
        }
    );
});


db.end()

app.listen(3001, () => {
    console.log("Rodando porta 3001")
});