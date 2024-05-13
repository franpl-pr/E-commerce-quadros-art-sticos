import { BrowserRouter as Router, Routes, Route} from "react-router-dom";
import React from "react";

import Inicial from "./Page_Inicial/Inicial";
import Login from "./Page_Login/Login";
import Home from "./Page_Home/Home";
import Quadros from "./Page_Quadros/Quadros";
import Cadastro from "./Page_Cadastro/Cadastro";
import Produto from "./Page_Produto/Produto";
import Checkout from "./Page_Checkout/Checkout"
import CadastroProduto from "./Page_CadastroProduto/CadastroProduto";

function App(){
    return(
        <Router>
            <Routes>
                <Route path="/Inicial" element={<Inicial/>}/>
                <Route path="/Home" element={<Home/>}/>
                <Route path="/Login" element={<Login/>}/>
                <Route path="/Quadros" element={<Quadros/>}/>
                <Route path="/Cadastro" element={<Cadastro/>}/>
                <Route path="/Produto" element={<Produto/>}/>
                <Route path="/Checkout" element={<Checkout/>}/>
                <Route path="/" element={<CadastroProduto/>}/>
            </Routes>
        </Router>
    )
}

export default App;