import { BrowserRouter as Router, Routes, Route} from "react-router-dom";
import React from "react";

import Inicial from "./Page_Inicial/Inicial";
import Login from "./Page_Login/Login";
import Home from "./Page_Home/Home";
import Quadros from "./Page_Quadros/Quadros";

function App(){
    return(
        <Router>
            <Routes>
                <Route path="/Inicial" element={<Inicial/>}/>
                <Route path="/" element={<Home/>}/>
                <Route path="/Login" element={<Login/>}/>
                <Route path="/Quadros" element={<Quadros/>}/>
            </Routes>
        </Router>
    )
}

export default App;