import React from "react";
import './cadastroproduto_style.css';
import MenuLateral from "../Components/component_menulateral/MenuLateral";
import { useNavigate } from "react-router-dom";
import BarraDb from "../Components/component_barradb/BarraDb";

function CadastroProduto(){
    return(
        <div className="dashboard">
            <MenuLateral/>
            <BarraDb/>
            
        </div>
    )
}
export default CadastroProduto;