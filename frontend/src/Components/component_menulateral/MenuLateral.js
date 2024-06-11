import React, {useState} from "react";
import './menulateral_style.css';
import { IoIosHelpCircleOutline } from "react-icons/io";
import { PiGridFour } from "react-icons/pi";
import { GoHome } from "react-icons/go";
import { TbListCheck } from "react-icons/tb";
import { Navigate, useNavigate } from "react-router-dom";
import { SlChart } from "react-icons/sl";
import { IoPersonOutline } from "react-icons/io5";
import { RiShutDownLine } from "react-icons/ri";
import { IoSettingsOutline } from "react-icons/io5";

function MenuLateral(){
    const navigate = useNavigate();
    var itemMenu = document.querySelectorAll('.item-menu')
    function selectLink(){
        itemMenu.forEach((item)=>
        item.classList.remove('ativo'))
        this.classList.add('ativo')
    }
    itemMenu.forEach((item)=>
        item.addEventListener('click', selectLink)
)
    return(
        <div className="menulateral">
            <div>
                <h1 className="logo-db">QuadrArtes</h1>
            </div>
            <div className="conteudo">
                <div className="">
                    <ul>
                        <li className="item-menu">
                            <a onClick={() => navigate("/CadastroProduto")}>
                                <span><GoHome size={20}></GoHome></span>
                                <span className="text-link">Dashboard</span>
                            </a>
                        </li>
                        <li className="item-menu ativo">
                            <a onClick={() => navigate("/Produtos")}>
                                <span><PiGridFour size={20}></PiGridFour></span>
                                <span className="text-link">Produtos</span>
                            </a>
                        </li>
                        <li className="item-menu">
                            <a onClick={() => navigate("/ListaPedidos")}>
                                <span><TbListCheck size={20}></TbListCheck></span>
                                <span className="text-link">Lista de pedidos</span>
                            </a>
                        </li>
                        <li className="item-menu">
                            <a onClick={() => navigate("/RelatoriosVenda")}>
                                <span><SlChart size={20}></SlChart></span>
                                <span className="text-link">Relatórios de venda</span>
                            </a>
                        </li>
                        <li className="item-menu"><a onClick={() => navigate("/Perfil")}>
                                <span><IoPersonOutline size={20}></IoPersonOutline></span>
                                <span className="text-link">Perfil</span>
                            </a>
                        </li>
                    </ul>
                </div>
                <div className="divisor"></div>
                <div className="secao2">
                    <ul>
                        <li className="item-menu"><a onClick={() => navigate("/Perfil")}>
                                <span><IoIosHelpCircleOutline size={20}></IoIosHelpCircleOutline></span>
                                <span className="text-link">Ajuda</span>
                            </a>
                        </li>
                        <li className="item-menu"><a onClick={() => navigate("/Perfil")}>
                                <span><IoSettingsOutline size={20}></IoSettingsOutline></span>
                                <span className="text-link">Configurações</span>
                            </a>
                        </li>
                        <li className="item-menu"><a onClick={() => navigate("/Perfil")}>
                                <span><RiShutDownLine size={20}></RiShutDownLine></span>
                                <span className="text-link">Sair</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    )
}
export default MenuLateral;