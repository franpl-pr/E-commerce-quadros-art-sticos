import React from "react";
import "./checkout_style.css";
import Navbar from "../Components/component_Navbar/Navbar"
import Footer from "../Components/component_Footer/Footer"

function Checkout(){
    return(
        <div className="checkout_container">
            <Navbar/>
            <div className="checkout_box_sessoes">
                <div className="checkout_div_sessoes">
                    <div className="checkout_sessoes_div1">
                        <span className="checkout_sessoes_span1">Checkout</span>
                        <span className="checkout_sessoes_span2">Pagamento</span>
                        <span className="checkout_sessoes_span3">Finalização da compra</span>
                    </div>
                    <div className="checkout_sessoes_div2">
                        <div className="checkout_div_bolinha_preta"/>
                        <div className="checkout_div_linha_menor"/>
                        <div className="checkout_div_bolinha_cinza"/>
                        <div className="checkout_div_linha_maior"/>
                        <div className="checkout_div_bolinha_cinza"/>
                    </div>
                </div>
            </div>
            <div className="checkout_box_informacoes">
                <div className="checkout_div_cadastro_entrega">
                    <h2>Informações de cadastro<div className="checkout_linha"/></h2>
                    <div className="checkout_div_contato">
                        <input 
                            type="text" 
                            name="nome_completo" 
                            placeholder="Nome completo"
                        />
                        <input 
                            type="email" 
                            name="email" 
                            placeholder="E-mail"
                        />
                        <input 
                            type="text" 
                            name="CPF" 
                            placeholder="CPF"
                        />
                        <input 
                            type="text" 
                            name="Celular" 
                            placeholder="Telefone celular"
                        />
                    </div>
                    <h2>Endereço de entrega<div className="checkout_linha"/></h2>
                    <div className="checkout_div_endereco">
                        <p>Escolha uma opção:</p>
                        <input 
                            className="checkout_input_maior" 
                            type="text" 
                            name="endereco" 
                            placeholder="Nome do endereco"
                        />
                        <select className="checkout_tipo_endereco">
                            <option value={1}>casa</option>
                            <option value={2}>apartamento</option>
                        </select>
                        <input 
                            className="checkout_input_menor" 
                            type="text" 
                            name="CEP"
                            placeholder="CEP"
                        />
                        <input 
                            className="checkout_input_menor" 
                            type="text" 
                            name="numero" 
                            placeholder="Número"
                        />
                        <select className="checkout_endereco_select">
                            <option value={1}>País</option>
                            <option value={2}>Option...</option>
                        </select>
                        <select className="checkout_endereco_select">
                            <option value={1}>Estado</option>
                            <option value={2}>Option...</option>
                        </select>
                        <select className="checkout_endereco_select">
                            <option value={1}>Cidade</option>
                            <option value={2}>Option...</option>
                        </select>
                        <input 
                            className="checkout_input_maior" 
                            type="text" 
                            name="bairro" 
                            placeholder="Bairro, Avenida..."
                        />
                        <input 
                            className="checkout_input_maior" 
                            type="text" 
                            name="rua" 
                            placeholder="Rua"
                        />
                        <input 
                            className="checkout_input_maior" 
                            type="text" 
                            name="complemento" 
                            placeholder="Complemento"
                        />
                        <div className="checkout_novo_endereco">
                            <div className="checkout_div_novo_endereco">
                                <input type="radio" name="novo_endereco" id="novo_endereco"/>
                                <span>Cadastrar novo endereço</span>
                            </div>
                            <div className="checkout_div_novo_endereco">
                                <input type="radio" name="novo_endereco" id="endereco_cadastrado"/> 
                                <span>Usar endereço cadastrado</span>
                            </div>
                        </div>
                    </div>   
                </div>
                <div className="checkout_div_carrinho_compra">
                </div>
            </div>
            <Footer/>
        </div>
    )
}
export default Checkout;