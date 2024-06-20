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
import { IoClose } from "react-icons/io5";
import { useLocation } from "react-router-dom";

function DashboardProdutos(){
    const [produtos, setProdutos] = useState([]);
    const [categoria, setCategoria] = useState();
    const navigate = useNavigate();
    const [notifDelete, setNotifDelete] = useState(false);
    const [produtoSelecionado, setProdutoSelecionado] = useState(null);
    const [popUpNotifDel, setPopUpNotifDel] = useState(false);
    const location = useLocation();
    const idUsuario = location.state.idUsuario;

    const handleDelete = async () =>{
        if (produtoSelecionado) {
            try {
                await axios.delete(`http://localhost:5000/produtos/${produtoSelecionado.ID_produtos}`);
                // Atualizar a lista de produtos após a exclusão
                setProdutos(produtos.filter(p => p.ID_produtos !== produtoSelecionado.ID_produtos));
                setNotifDelete(false);
                setPopUpNotifDel(true);
                setProdutoSelecionado(null);
                
                console.log('Produto deletado com sucesso');
            } catch (error) {
                console.error('Erro ao deletar o produto:', error);
            }
        }
    }
    const yesDelete = (produto) =>{
        setProdutoSelecionado(produto);
        console.log(produtoSelecionado);
        setNotifDelete(true);
    }
    const noDelete = () =>{
        setProdutoSelecionado(null);
        console.log(produtoSelecionado);
        setNotifDelete(false);
    }
    
    
    useEffect (()=>{
        
        axios.get('http://localhost:5000/quadros')
        .then(response => {
            setProdutos(response.data);
        })
        .catch(error => {
            console.error("Houve um erro!", error);
        });
        console.log(produtos);
    }, []);
    
    return(
        <div className="dashboard">
                <MenuLateral/>
                <div className="container">
                    <BarraDb idUsuario={idUsuario}/>
                    <div className="conteudo-dashboard">
                        <div className="indicacao-dashboard">
                            <h2>Produtos</h2>
                            <div className="justify-right">
                                <label htmlFor="barra-pesquisa-dashboard" className="barra-pesquisa-dashboard">
                                    <LuSearch className="cursor-pointer"></LuSearch>
                                    <input type="search" id="barra-pesquisa-dashboard" placeholder="Pesquise pelo nome do quadro..."></input>
                                </label>
                                <button onClick={() => navigate('/CadastroProduto')}>Novo produto</button>
                            </div>
                            
                        </div>
                        <div className="table-container">
                            <table>
                                <thead>
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
                                </thead>
                                <tbody>
                                {produtos.slice(0, 5).map((item, index) => (
                                    <tr key={index}>
                                        <td><img src={item.imagem}/></td>
                                        <td><span>{item.nomeQuadro}</span></td>
                                        <td><span>{item.tipoCategoria}</span></td>
                                        <td><span>{item.tamanho}</span></td>
                                        <td><span>{item.preco}</span></td>
                                        <td><span>{item.estoque}</span></td>
                                        <td><span>{item.cor}</span></td>

                                        <td className="acoes">
                                            <div className="botoes-acao">
                                                <div className="botao-esquerda botao-editar">
                                                    <LiaEdit size={24} onClick={() => navigate("/EditProduto", {state: {produto: item}})}/>
                                                </div>
                                                <div className="botao-direita botao-excluir" onClick={() => yesDelete(item)}>
                                                    <FaRegTrashAlt size={18}/>
                                                </div>
                                            </div>
                                    </td>
                                    </tr>
                                ))}
                                </tbody>
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
                
                {/* popup para conexao real dos dados do bd */}
                {notifDelete && produtoSelecionado && (
                    <div className="box-popup">
                        <div className="close-popup">
                            <button onClick={noDelete}>
                                <IoClose/>
                            </button>
                        </div>
                        <div className="popup-excluir-produto">
                            <h4>Excluir produto</h4>
                            <p>Deseja excluir o produto abaixo?</p>
                            <span>*Você não poderá desfazer a ação depois</span>
                            <div className="align-center">
                                <div className="info-produto">
                                    <div className="bold info-text-list">
                                        <span>Quadro</span>
                                        <span>Categoria</span>
                                        <span>Tamanho</span>
                                        <span>Preço</span>
                                        <span>Estoque</span>
                                        <span>Cor da moldura</span>
                                    </div>
                                    <div className="info-text-list">
                                        <span>{produtoSelecionado.nomeQuadro}</span>
                                        <span>{produtoSelecionado.categoria}</span>
                                        <span>{produtoSelecionado.tamanho}</span>
                                        <span>{produtoSelecionado.preco}</span>
                                        <span>{produtoSelecionado.estoque}</span>
                                        <span>{produtoSelecionado.cor}</span>
                                    </div>
                                    <img src={produtoSelecionado.imagem}/>
                                </div>
                                <div className="acoes">
                                    <button className="botao-outline" onClick={handleDelete}>Sim</button>
                                    <button className="botao-color-solid" onClick={noDelete}>Não</button>
                                </div>
                            </div>
                        </div>
                    </div>
                )}
                {popUpNotifDel &&(
                <div className='box_notificacao_sucesso'>
                    <div className='notificacao_sucesso'>
                        <h1>Quadro deletado com sucesso!</h1>
                        <button onClick={setPopUpNotifDel(false)}>Fechar</button>
                    </div>
                </div>
            )}
        </div>
    )
}
export default DashboardProdutos;