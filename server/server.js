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
    res.send("hello word")
})

app.listen(3001, () => {
    console.log("Rodando porta 3001")
});