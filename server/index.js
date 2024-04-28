const express = require("express");
const app = express();
const mysql = require("mysql");
const cors = require("cors");

const db = mysql.createPool({
    host: "localhost",
    user: "root",
    password: "123456",
    database: "quadrarts"
})


app.use(cors());
app.use(express.json());

app.post("/Login", (req, res) => {
    const nome = req.body.nome;
    const email = req.body.email;
    const senha = req.body.senha;
    const telefone = req.body.telefone;

    let SQL = "INSERT INTO usuarios (ID_usuarios ,nomeCompleto, email, senha, telefone) VALUES ('20' , ?, ?, ?, ?)"

    db.query(SQL, [nome, email, senha, telefone], (err, result) => {
        console.log(err);
    })


})

app.get("/", (req, res) => {
    res.send("Servidor Quadrarts está rodando!");
});

app.listen(3001, () => {
    console.log("Rodando porta 3001");

});