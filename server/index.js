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
    const {name} = req.body;
    const {cost} = req.body;
    const {category} = req.body;
})

console.log(name)

app.listen(3001, () => {
    console.log("Rodando porta 3001");
});