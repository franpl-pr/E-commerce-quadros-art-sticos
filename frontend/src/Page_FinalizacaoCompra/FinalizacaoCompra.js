import React from "react";
import "./finalizacaocompra_style.css";
import Navbar from "../Components/component_Navbar/Navbar"
import Footer from "../Components/component_Footer/Footer"
import SessaoCheckout from "../Components/component_sessaoCheckout/SessaoCheckout";
import { useNavigate } from "react-router-dom";


function FinalizacaoCompra(){
    const navigate = useNavigate();
    return(
        <div className="checkout_container">
            <Navbar/>
            <SessaoCheckout/>
                <div className="finalizacao_box_informacoes">
                    <div className="conteudo_finalizacao_informacoes">
                        <h1 className="h1_status_pedido">Pedido finalizado!</h1>
                        <div className="div_dados_pedido">
                            <div className="box_pedido">
                                <div className="info_pedido">
                                    <div className="linha_pedido">
                                        <div className="titulo">
                                            <p>Itens</p>
                                        </div> 
                                        <div className="coluna2">
                                            <p>Quadro Bulldog Fränces</p>
                                            <p className="sub">A5 (15 x 20cm)</p>
                                            <p className="sub">Moldura: Tradicional</p>
                                            <p className="sub">Cor da moldura: Preto</p>
                                        </div>
                                    </div>
                                    <div className="linha_pedido">
                                        <div className="titulo">
                                            <p>Endereco de entrega</p> 
                                        </div>
                                        <div className="coluna2">
                                            <p>Av. Conego Antonio Rocatto, 980 - Jardim Santa Monica</p>
                                        </div>
                                    </div>
                                    <div className="linha_pedido">
                                        <div className="titulo">
                                            <p>Prazo de entrega</p> 
                                        </div>
                                        <div className="coluna coluna2">
                                            <p>8 dias úteis - entre os dias 03 e 08 de setembro</p>
                                        </div>
                                    </div>
                                </div>
                                <div className="subtotal">
                                    <div className="subtotal_left">
                                        <p className="bold">Subtotal (2 items)</p>
                                        <p>Desconto</p>
                                    </div>
                                    <div className="subtotal_right">
                                        <p className="preco_bold">R$ 204,80</p>
                                        <p className="desconto_vermelho">R$ 51,20</p>
                                    </div>
                                </div>
                                <div className="total">
                                    <span className="bold">Total</span>
                                    <span className="preco bold">R$ 204,80</span>
                                </div>
                            </div>
                            <p className="info">Seu pedido foi concluído. Aguarde e acompanhe o status da entrega.</p>
                            <div className="acoes_checkout">
                                <button>Acompanhar entrega</button>
                                <span onClick={() => navigate('/Quadros')}>Comprar mais quadros</span>
                            </div>
                        </div>
                    </div>
                </div>
            <Footer/>
        </div>
    )
}
export default FinalizacaoCompra;
