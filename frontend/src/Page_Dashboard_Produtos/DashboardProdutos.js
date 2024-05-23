import React, {useEffect, useRef, useState} from "react";
import './dashboard_produtos_style.css';
import MenuLateral from "../Components/component_menulateral/MenuLateral";
import { useNavigate } from "react-router-dom";
import BarraDb from "../Components/component_barradb/BarraDb";
import { LuSearch } from "react-icons/lu";
import axios from 'axios';

function DashboardProdutos(){
    return(
        <div className="dashboard">
                <MenuLateral/>
                <div className="container">
                    <BarraDb/>
                    <div className="conteudo-dashboard">
                        <div className="indicacao-dashboard">
                            <h2>Produtos</h2>
                            <div className="justify-right">
                                <div className="barra-pesquisa-dashboard">
                                    <LuSearch></LuSearch>
                                    <input type="search" placeholder="Pesquise pelo nome do quadro..."></input>
                                </div>
                                <button>Novo produto</button>
                            </div>
                            
                        </div>
                        <table>
                            <tr>
                                <th>Imagem</th>
                                <th>Quadro</th>
                                <th>Categoria</th>
                                <th>Tamanho</th>
                                <th>preço</th>
                                <th>estoque</th>
                                <th>cor da moldura</th>
                            </tr>
                            {produtos.map((linha_produto) => (
                                <tr id={linha_produto.ID_produtos}>
                                    <td>{linha_produto.imagem}</td>
                                    <td>{linha_produto.nomeQuadro}</td>
                                    <td>{consultarCategoriaProduto}</td>
                                    <td>{linha_produto.tamanho}</td>
                                    <td>{linha_produto.preco}</td>
                                    <td>{linha_produto.estoque}</td>
                                    <td>{linha_produto.cor}</td>
                                </tr>
                            ))}
                        </table>
                    </div>
                </div>
        </div>
    )
}
export default DashboardProdutos;