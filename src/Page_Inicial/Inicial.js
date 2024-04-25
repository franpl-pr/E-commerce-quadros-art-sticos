import React from "react";
import './inicial_style.css';
import Navbar from "../Components/component_Navbar/Navbar";
import Footer from "../Components/component_Footer/Footer";
import Promocoes from "../Components/component_Promocoes/Promocoes"
import image_quadro_sol from "../img/image_inicio_sol.png";
import image_quadros_artisticos from "../img/image_inicial_quadros.png";
import image_inicial_qualidade from "../img/image_inicial_qualidade.png";
import image_inicial_garantia from "../img/image_inicial_garantia.png";
import image_inicial_suporte from "../img/image_inicial_suporte.png";
import { useNavigate } from "react-router-dom";


function Inicial(){
    const navigate = useNavigate();

    return(
        <div className="inicial_container">
            <Navbar/>
            <div className="inicial_box_bemvindo">
                <div className="inicial_div_image_sol">
                    <img src={image_quadro_sol} alt="imagem_quadro_sol"/>
                </div>
                <div className="inicial_div_bemvindo">
                    <div className="inicial_bemvindo">
                        <span className="inicial_bemvindo_header">Bem-vindo</span>
                        <span className="inicial_bemvindo_span1">Novo Usuário, comece por aqui</span>
                        <span className="inicial_bemvindo_span2">Compre e venda quadros para todo o Brasil</span>
                        <div className="inicial_bemvindo_div_button">
                            <button onClick={() => navigate("/Login")} className="inicial_bemvindo_button">Sou cliente</button>
                            <button onClick={() => navigate("/Login")} className="inicial_bemvindo_button">Sou vendedor</button>
                        </div>
                    </div>
                </div>
            </div>
            <div className="inicial_box_quadros">
                <h2>Compartilhe sua arte com o mundo<div className="inicial_quadros_linha"></div></h2>
                <img src={image_quadros_artisticos} alt="imagem_quadros_artisticos"/>
            </div>
            <div className="home_div_text_quadro_descontos">
                <h2>Compre quadros exclusivos com desconto<div className="inicial_quadros_linha"></div></h2>
            </div>
            <Promocoes/>
            <div className="inicial_box_informacoes">
                <div className="inicial_div_informacoes">
                    <img src={image_inicial_qualidade} alt="imagem_qualidade"/>
                    <img src={image_inicial_garantia} alt="imagem_garantia"/>
                    <img src={image_inicial_suporte} alt="imagem_suporte"/>
                </div>
            </div>
            <Footer/>
        </div>
    )
}

export default Inicial;