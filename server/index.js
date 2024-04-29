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

app.post("/Registro", (req, res) => {
    const nome = req.body.nome;
    const email = req.body.email;
    const senha = req.body.senha;
    const telefone = req.body.telefone;

    let consultSQL = "SELECT * FROM usuarios WHERE email = ?"
    let ultimoID = "SELECT COUNT(*) FROM usuarios"

    db.query(ultimoID, (err, result) => {
        if(err){
            res.send(err)
        }else{
            res.send({msg: "Ultimo ID"}, result)
        }
    })

    db.query(consultSQL, [email], (err, result) => {
        if(err){
            res.send(err)
        }
        if(result.length == 0){
            let SQL = "INSERT INTO usuarios (ID_usuarios, nomeCompleto, email, senha, telefone) VALUES ('23' ,?, ?, ?, ?)";

            db.query(SQL, [nome, email, senha, telefone], (err, result) => {
                if(err){
                    res.send(err);
                }
                res.send({msg: "Email cadastrado com sucesso"})
            })
        }
        else{
            res.send({msg: "Email já cadastrado, tente novamente"})
        }
    })
})


app.get("/", (req, res) => {
    res.send("Servidor Quadrarts está rodando!");
});

app.listen(3001, () => {
    console.log("Rodando porta 3001");

});