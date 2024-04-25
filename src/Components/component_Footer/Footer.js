import React from "react";
import './footer_style.css';
import image_inicial_icon_instagram from "../../img/image_inicial_icon_instagram.png";
import image_inicial_icon_facebook from "../../img/image_inicial_icon_facebook.png";
import image_inicial_icon_twitter from "../../img/image_inicial_icon_twitter.png";
import image_utilidade_formas_pagamentos from "../../img/image_utilidades_formas_pagamentos.png"

function Footer(){
    return(
        <div className="footer_container">
            <div className="inicial_box_utilidades">
                <div className="inicial_div_utilidades">
                    <div className="inicial_redes_sociais">
                        <h2>Quadrartes</h2>
                        <p>(11) 99984-9646</p>
                        <p>atendimento@quadrartes.com</p>
                        <div className="inicial_div_acesse_redes_sociais">
                            <span className="inicial_acesse_redes_sociais">Acesse nossas redes sociais</span>
                        </div>
                        <div className="inicial_logo_redes_sociais">
                            <img src={image_inicial_icon_twitter}/>
                            <img src={image_inicial_icon_instagram}/>
                            <img src={image_inicial_icon_facebook}/>
                        </div>
                    </div>
                    <div className="inicial_acesso_rapido">
                        <h2>Acesse rápido</h2>
                        <a href="#">Sua conta</a>
                        <a href="#">Ofertas</a>
                        <a href="#">Quadros</a>
                        <a href="#">Venda sua arte</a>
                        <a href="#">Lista de favoritos</a>
                        <a href="#">Carrinho de compras</a>
                    </div>
                    <div className="inicial_ajuda_suporte">
                        <h2>Ajuda e suporte</h2>
                        <a href="#">Sobre nós</a>
                        <a href="#">Frete e prazo de entrega</a>
                        <a href="#">Devolução e reembolso</a>
                        <a href="#">Política de Privacidade</a>
                        <a href="#">Termos e consições</a>
                        <a href="#">Ajuda</a>
                    </div>
                    <div className="inicial_cadastre-se">
                        <h2>Cadastre-se</h2>
                        <p>Escreva seu e-mail abaixo para se cadastrar e receber as novidades e ofertas</p>
                        <div className="footer_write_email">
                            <input type="email" placeholder="Digite seu e-mail"/>
                            <button>Enviar</button>
                        </div>
                    </div>
                </div>
            </div>
            <div className="inicial_div_direitos_reservados">
                <div className="inicial_inside_direitos_reservados"> 
                    <img src={image_utilidade_formas_pagamentos} alt="image_formas_pagamentos"/>
                    <p>©2024 QuadrArtes - Todos os direitos reservados</p>
                </div>
            </div>
            
        </div>
    )
}

export default Footer;