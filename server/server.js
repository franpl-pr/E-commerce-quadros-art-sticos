const express = require("express");
const app = express();
const mysql = require("mysql");

 const bd = mysql.createPool({
    host: "localhost",
    user: "root",
    password: "",
    database: "quadrarts"
 })


app.get('/', (req, res) => {
    db.query("INSERT INTO usuarios (`ID_usuarios`, `nome`, `email`, `senha`, `confirmarSenha`, `login`, `telefone`, `tipo`) VALUES ('12', 'diogene', 'gabriel@gmail.com', '123456', '123456', 'diogene01', '9873459812', 'Cliente')")
})

app.listen(3001, () => {
    console.log("Rodando porta 3001")
});