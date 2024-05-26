import React, {useEffect, useRef, useState} from "react";
import './dashboard_produtos_style.css';
import MenuLateral from "../Components/component_menulateral/MenuLateral";
import { useNavigate } from "react-router-dom";
import BarraDb from "../Components/component_barradb/BarraDb";
import { LuSearch } from "react-icons/lu";
import { MdNavigateNext } from "react-icons/md";
import { MdNavigateBefore } from "react-icons/md";
import axios from 'axios';
import { LiaEdit } from "react-icons/lia";
import { FaRegTrashAlt } from "react-icons/fa";
import image_produto_bulldog from '../img/image_produto_bulldog.png';

function DashboardProdutos(){
    const [produtos, setProdutos] = useState([]);
    const [categoria, setCategoria] = useState();
    const navigate = useNavigate;
    
    const handleNovoProduto = () =>{
        navigate('/CadastroProduto');
    };
    
    const consultarCategoriaProduto = async (id) => {
        try{
            const response = await axios.get('http://localhost:5000/consultarcategoriaproduto', {
                    id: id
                });
            setCategoria(response.data);

            console.log('ID da categoria:', id);
            console.log('Categoria do quadro:', response.data)

        } catch (error) {   
            console.error('Erro ao enviar dados para o servidor:', error);
        }
    };
    useEffect (()=>{
        
        axios.get('http://localhost:5000/quadros')
        .then(response => {
            setProdutos(response.data);
        })
        .catch(error => {
            console.error("Houve um erro!", error);
        });
        console.log(produtos)
    }, []);
    
    return(
        <div className="dashboard">
                <MenuLateral/>
                <div className="container">
                    <BarraDb/>
                    <div className="conteudo-dashboard">
                        <div className="indicacao-dashboard">
                            <h2>Produtos</h2>
                            <div className="justify-right">
                                <label htmlFor="barra-pesquisa-dashboard" className="barra-pesquisa-dashboard">
                                    <LuSearch className="cursor-pointer"></LuSearch>
                                    <input type="search" id="barra-pesquisa-dashboard" placeholder="Pesquise pelo nome do quadro..."></input>
                                </label>
                                <button onClick={handleNovoProduto}>Novo produto</button>
                            </div>
                            
                        </div>
                        <div className="table-container">
                            <table>
                                <tr className="table-head">
                                    <th className="border-radius-left">Imagem</th>
                                    <th>Quadro</th>
                                    <th>Categoria</th>
                                    <th>Tamanho</th>
                                    <th>preço</th>
                                    <th>estoque</th>
                                    <th>cor da moldura</th>
                                    <th>Acoes</th>
                                </tr>
                                {produtos.slice(0, 5).map((item) => (
                                    <tr key={item.ID_produtos}>
                                        <td>{item.imagem}</td>
                                        <td>{item.nomeQuadro}</td>
                                        <td>{() =>consultarCategoriaProduto(item.categoria_id)}</td>
                                        <td>{item.tamanho}</td>
                                        <td>{item.preco}</td>
                                        <td>{item.estoque}</td>
                                        <td>{item.cor}</td>
                                        <th className="acoes">
                                            <div className="botoes-acao">
                                                <div className="botao-esquerda botao-editar">
                                                    <LiaEdit/>
                                                </div>
                                                <div className="botao-excluir">
                                                    <FaRegTrashAlt/>
                                                </div>
                                            </div>
                                        </th>
                                    </tr>
                                ))}
                                <tr>
                                    <td>
                                        <img src={image_produto_bulldog}/>
                                    </td>
                                    <td>
                                        <span>Bulldog Frances</span>
                                    </td>
                                    <td>
                                        <span>Animais</span>
                                    </td>
                                    <td>
                                        <span>A15(15 x 20cm)</span>
                                    </td>
                                    <td>
                                        <span>R$ 102,40</span>
                                    </td>
                                    <td>
                                        <span>2</span>
                                    </td>
                                    <td>
                                        <span>cor1, cor 2</span>
                                    </td>
                                    <td className="acoes">
                                            <div className="botoes-acao">
                                                <div className="botao-esquerda botao-editar">
                                                    <LiaEdit size={24}/>
                                                </div>
                                                <div className="botao-direita botao-excluir">
                                                    <FaRegTrashAlt size={18}/>
                                                </div>
                                            </div>
                                    </td>
                                    
                                </tr>
    
                            </table>
                        </div>
                        <div className="acoes">
                            <span>Mostrando 1-06 de 78</span>
                            <div className="botoes-acao">
                                <div className="botao-esquerda">
                                   <MdNavigateBefore size={24}/>
                                </div>
                                <div className="botao-direita">
                                    <MdNavigateNext size={24}/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        </div>
    )
}
export default DashboardProdutos;