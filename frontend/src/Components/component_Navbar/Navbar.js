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
    const [quadros, setQuadros] = useState([])
    const [respostaExclusao, setRespostaExclusao] = useState('')
    const {variavel, mudarVariavel} = useContext(HandleContext);
    const {dadosCarrinho, setDadosCarrinho} = useContext(HandleCarrinhoContext);
    const {dadosProduto, setDadosProduto} = useContext(HandleDataContext)


    const [numerosQuadros, setNumerosQuadros] = useState(1)

    const diminuirNumerosQuadros = () => {
        if(numerosQuadros <= 1){
            setNumerosQuadros(1)
        }else{
            setNumerosQuadros(numerosQuadros - 1)
        }
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
                {dadosCarrinho.length > 0 && <div className="notificacao_item_carrinho"><span>{dadosCarrinho.length}</span></div>}</button>
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
                                                    <button className="carrinho_diminuir_produto" onClick={diminuirNumerosQuadros}><div/></button>
                                                    <input key={item.IdQuadro} type="number" value={numerosQuadros} onChange={(e) => setNumerosQuadros(e.target.value)}/>
                                                    <button className="carrinho_aumentar_produto" onClick={() => setNumerosQuadros(numerosQuadros + 1)}><img src={sinal_mais}/></button>
                                                </div>
                                                <span>{formatarDinheiro(item.preco)}</span>
                                                <button onClick={removerProdutoCarrinho} className="carrinho_image_lixo"><img src={image_lixo}/></button>
                                            </div>
                                        </div>
                                    </div>
                                </div>))}
                                <div className="carrinho_box_total">
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
                                                <span className="carrinho_span_preco_normal">R$ 3.312.000</span>
                                            </div>
                                            <div className="carrinho_div_subtotal">
                                                <span className="carrinho_span_subtotal">Subtotal</span>
                                                <span className="carrinho_span_preco_promocao">{formatarDinheiro(precoTotal)}</span>
                                            </div>
                                        </div>
                                    </div>
                                    <button onClick={verificaCompra}>Comprar</button>
                                </div>
                            </div>
                        </div>
                )}
                {variavel ? <button className="button_icons"><MdOutlinePerson className="icons" size={32}/></button> : <button onClick={() => navigate('/Login')} className="button_entrar">Entrar</button>}
            </div>
        </div>
    )
}

export default Navbar;