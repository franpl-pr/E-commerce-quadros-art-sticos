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

app.post("/register", (req, res) => {
    const {email} = req.body;
    const {senha} = req.body;

    let SQL = "INSERT INTO usuarios (ID_usuarios, email, senha) VALUES ('14', ?, ?)"

    db.query(SQL, [email, senha], (err, result) => {
        console.log(err);
    })
})



app.listen(3001, () => {
    console.log("Rodando porta 3001");
});