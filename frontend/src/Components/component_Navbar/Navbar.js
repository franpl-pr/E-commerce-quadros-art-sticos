import React, {useState} from "react";
import './navbar_style.css';
import { IoSearch } from "react-icons/io5";
import { FaRegHeart } from "react-icons/fa";
import { HiOutlineShoppingCart } from "react-icons/hi";
import { MdOutlinePerson } from "react-icons/md";
import { useNavigate } from "react-router-dom";
import quadro_bulldog from "../../img/image_produto_bulldog.png";
import sinal_mais from "../../img/Vector 5.png";
import image_lixo from "../../img/trash.png";

function Navbar(){
    const navigate = useNavigate();
    const [carrinhoAberto, setcarrinhoAberto] = useState(false);


    const abrirCarrinho = () => {
        setcarrinhoAberto(true);
    };

    const fecharCarrinho = () => {
        setcarrinhoAberto(false);
    };
    
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
                <IoSearch className="icons" size={32}/>
                <FaRegHeart className="icons" size={32}/>
                <HiOutlineShoppingCart onMouseLeave={fecharCarrinho} onMouseOver={abrirCarrinho} className="icons" size={32}/>
                {carrinhoAberto && (
                        <div onMouseLeave={fecharCarrinho} onMouseOver={abrirCarrinho} className="carrinho_box">
                            <div className="carrinho_div">
                                <div className="carrinho_inside_box">
                                    <div className="carrinho_inside_div">
                                        <div className="carrinho_detalhes_quadro">
                                            <div className="carrinho_fundo_img">
                                                <img src={quadro_bulldog} alt="quadro_bulldog"/>
                                            </div>
                                            <div className="carrinho_informacoes">
                                                <h2>Quadro Bulldog Francês</h2>
                                                <span className="carrinho_informacoes_preco_normal">R$ 1.280.000</  span>
                                                <span className="carrinho_informacoes_preco_promocao">R$ 1.024.000</span>
                                                <span className="carrinho_tipo_moldura">Moldura Tradicional</span>
                                                <span className="carrinho_tipo_categoria">Animais | Quadros Decorativos | Bulldog</span>
                                            </div>
                                        </div>
                                        <div className="carrinho_quadro_precos">
                                            <div className="carrinho_div_cupom">
                                                <span>Selecione o cupom</span>
                                                <select className="carrinho_select">
                                                    <option value={1}>Cupom (R$ 50.00)</option>
                                                    <option value={2}>Option 2</option>
                                                    <option value={3}>Option 3</option>
                                                    <option value={4}>Option 4</option>
                                                </select>
                                            </div>
                                            <div className="carrinho_div_adicionar_remover">
                                                <button className="carrinho_diminuir_produto"><div/></button>
                                                <input type="number"/>
                                                <button className="carrinho_aumentar_produto"><img src={sinal_mais}/></button>
                                                <span>R$ 2.048.000</span>
                                                <button className="carrinho_image_lixo"><img src={image_lixo}/></button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
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
                                                <span className="carrinho_span_preco_promocao">R$ 2.152.000</span>
                                            </div>
                                        </div>
                                    </div>
                                    <button onClick={() => navigate("/Checkout")}>Comprar</button>
                                </div>
                            </div>
                        </div>
                )}
                {true ? <MdOutlinePerson className="icons" size={32}/> : <button onClick={() => navigate('/Login')} className="button_entrar">Entrar</button>}
            </div>
        </div>
    )
}

export default Navbar;