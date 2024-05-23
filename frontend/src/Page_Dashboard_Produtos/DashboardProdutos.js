import React, {useEffect, useRef, useState} from "react";
import './dashboard_produtos_style.css';
import MenuLateral from "../Components/component_menulateral/MenuLateral";
import { useNavigate } from "react-router-dom";
import BarraDb from "../Components/component_barradb/BarraDb";
import axios from 'axios';

function DashboardProdutos(){
    return(
        <div className="dashboard">
                <MenuLateral/>
                <div className="container">
                    <BarraDb/>
                    <div className="conteudo-dashboard">
                        <h2>Produtos</h2>
                        <table>

                        </table>
                    </div>
                </div>
        </div>
    )
}
export default DashboardProdutos;