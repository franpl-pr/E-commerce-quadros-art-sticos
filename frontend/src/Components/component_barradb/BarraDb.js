import React, {useState} from "react";
import './barradb_style.css';
import { LuSearch } from "react-icons/lu";

function BarraDb(){
    return(
        <div className="barraDb">
            <div className="pesquisa">
                <LuSearch size={25}></LuSearch>
            </div>
                <div className="perfil-completo">
                    <div className="img-perfil"></div>
                    <div className="texto-perfil">
                        <span className="nome">Ingrid</span>
                        <span className="tipo">Vendedora</span>
                    </div>
                </div>
            
        </div>
    )
}
export default BarraDb