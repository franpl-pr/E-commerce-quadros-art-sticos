import React, {useState} from "react";
import './barradb_style.css';
import { LuSearch } from "react-icons/lu";

function BarraDb(){
    return(
        <div className="barraDb">
            <div className="conteudo-perfil">
                <LuSearch size={25}></LuSearch>
                <div className="perfil">
                    <div className="img-perfil"></div>
                    <div className="texto-perfil">
                        <span className="nome">Ingrid</span>
                        <span className="tipo">Vendedora</span>
                    </div>
                </div>
            </div>
        </div>
    )
}
export default BarraDb