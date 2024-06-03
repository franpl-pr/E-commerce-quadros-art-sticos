import React, {useState, useContext, useEffect} from "react";
import './navbar_style.css';
import { IoSearch } from "react-icons/io5";
import { FaRegHeart } from "react-icons/fa";
import { HiOutlineShoppingCart } from "react-icons/hi";
import { MdOutlinePerson } from "react-icons/md";
import { useNavigate } from "react-router-dom";
import quadro_bulldog from "../../img/image_produto_bulldog.png";
import sinal_mais from "../../img/Vector 5.png";
import image_lixo from "../../img/trash.png";
import { HandleContext } from '../../context/HandleContext';
import { HandleCarrinhoContext } from "../../context/HandleContext";
import { HandleDataContext } from '../../context/HandleContext';
import formatarDinheiro from "../../Utilidades/formartarDinheiro";

function Navbar(){
    const navigate = useNavigate();
    const [carrinhoAberto, setcarrinhoAberto] = useState(false);
    const {variavel, mudarVariavel} = useContext(HandleContext);
    const {dadosCarrinho, setDadosCarrinho} = useContext(HandleCarrinhoContext);
    const {dadosProduto, setDadosProduto} = useContext(HandleDataContext)
    const [quantidade, setQuantidade] = useState(dadosProduto.quantidade)

    const diminuirNumerosQuadros = (item) => {
        if(item.quantidade <= 1){   
            setQuantidade(1)
            item.quantidade = quantidade
            console.log('quantidade menor ou igual a 1')
            return;
        }
        item.quantidade = quantidade
        setQuantidade(quantidade - 1)
    }

    const aumentaNumeroQuadros = (item) => {
        setQuantidade(quantidade + 1)
        item.quantidade = quantidade
    }
    
    const precoTotal = dadosCarrinho.reduce((acumulador, item) => {
        return Number(item.preco) + acumulador;
    }, 0)

    const removerProdutoCarrinho = () => {
        const index = dadosCarrinho.findIndex(item => item.Id_produtos === dadosProduto.Id_produtos);
        if (index !== -1) {
            const novoArray = [...dadosCarrinho];
            console.log(novoArray)
            novoArray.splice(index, 1);
            setDadosCarrinho(novoArray);
        }
    };

    const abrirCarrinho = () => {
        setcarrinhoAberto(true);
    };

    const fecharCarrinho = () => {
        setcarrinhoAberto(false);
    };
    
    const verificaCompra = () => {
        if(dadosCarrinho.length < 1){
            alert('O carrinho está vazio ! Coloque algum produto no carrinho para prosseguir com a compra.')
            return;
        }
        else{
            navigate('/Checkout')
        }
    }


    return(
        <div className="navbar">
            <div className="div_logo">
                <h1 className="logo">Quadrartes</h1>
            </div>
            <div className="div_navegar">
                <a href="#">Categorias</a>
                <a href="#">Artistas</a>
                <a onClick={() => navigate("/Quadros")}>Quadros</a>
                <a href="#">Oferatas</a>
            </div>  
            <div className="div_icons">
                <button className="button_icons"><IoSearch className="icons" size={32}/></button>
                <button className="button_icons"><FaRegHeart className="icons" size={32}/></button>
                <button className="button_icons"><HiOutlineShoppingCart onMouseLeave={fecharCarrinho} onMouseOver={abrirCarrinho} className="icons" size={32}/>
                {dadosCarrinho.length > 0 && <div className="notificacao_item_carrinho"><span>{dadosCarrinho.length}</span></div>}
                {carrinhoAberto && (    
                        <div onMouseLeave={fecharCarrinho} onMouseOver={abrirCarrinho} className="carrinho_box">
                            <div className="carrinho_div">
                            {dadosCarrinho.map((item) => (<div key={item.Id_produtos} className="carrinho_inside_box">
                                    <div className="carrinho_inside_div">
                                        <div className="carrinho_detalhes_quadro">
                                            <div className="carrinho_fundo_img">
                                                <img src={item.imagem} alt={quadro_bulldog}/>
                                            </div>
                                            <div className="carrinho_informacoes">
                                                <h2>{item.nomeQuadro}</h2>

                                                <span className="carrinho_informacoes_preco_normal">R$ 1.280.000</span>
                                                <span className="carrinho_informacoes_preco_promocao">{formatarDinheiro(item.preco)}</span>

                                                <span className="carrinho_tipo_moldura">Moldura {item.molduraQuadro}</span>
                                                <span className="carrinho_tipo_categoria">Animais | Quadros Decorativos | Bulldog</span>
                                            </div>
                                        </div>
                                        <div className="carrinho_quadro_precos">
                                            <div className="carrinho_div_adicionar_remover">
                                                <div className="carrinho_numeros_quadros">
                                                    <button className="carrinho_diminuir_produto" onClick={() => diminuirNumerosQuadros(item)}><div/></button>
                                                    <span>{item.quantidade}</span>
                                                    <button className="carrinho_aumentar_produto" onClick={() => aumentaNumeroQuadros(item)}><img src={sinal_mais}/></button>
                                                </div>
                                                <span>{formatarDinheiro(item.preco)}</span>
                                                <button onClick={removerProdutoCarrinho} className="carrinho_image_lixo"><img src={image_lixo}/></button>

                                            </div>
                                        </div>
                                    </div>
                                </div>))}
                                {dadosCarrinho.length > 0 ? <div className="carrinho_box_total">
                                    <div className="carrinho_box_cupom_subtotal">
                                        <div className="carrinho_div_cupom_brasil">
                                            <span>Cupom</span>
                                            <div className="carrinho_div_brasil">
                                                <input type="text"/>
                                                <span>35% OFF</span>
                                            </div>
                                        </div>
                                        <div className="carrinho_div_desconto_subtotal">
                                            <div className="carrinho_div_desconto">
                                                <span className="carrinho_span_desconto">Desconto</span>
                                                <span className="carrinho_span_preco_normal">R$ 331,20</span>
                                            </div>
                                            <div className="carrinho_div_subtotal">
                                                <span className="carrinho_span_subtotal">Subtotal</span>
                                                <span className="carrinho_span_preco_promocao">{formatarDinheiro(precoTotal)}</span>
                                            </div>
                                        </div>
                                    </div>
                                    <button onClick={verificaCompra}>Comprar</button>
                                </div> : null}
                            </div>
                        </div>
                )}</button>
                {variavel ? <button className="button_icons"><MdOutlinePerson className="icons" size={32}/></button> : <button onClick={() => navigate('/Login')} className="button_entrar">Entrar</button>}
            </div>
        </div>
    )
}

export default Navbar;