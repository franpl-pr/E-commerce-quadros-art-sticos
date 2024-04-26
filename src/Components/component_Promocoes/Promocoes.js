import React from "react";
import './promocoes_style.css';
import image_inicial_wiscky from "../../img/image_inicial_wiscky.png";
import image_inicial_maos from "../../img/image_incial_maos.png";
import image_inicial_animais from "../../img/image_inicial_animais.png";
import image_inicial_torre from "../../img/image_inicial_torre.png";
import { useNavigate } from "react-router-dom";

function Promocoes(){
    const navigete = useNavigate();

    const itens = [
    {tilulo: "Quadro Jogo de Feras", autor: "Sofia Silva", precoNomal: 277.80, precoPromo: 277.90}
]

    return(
        <div className="promocoes_container">
            <div className="inicial_box_promocoes">
                <div className="inicial_promocoes">
                    {itens.map(item => (<div onClick={() => navigete("/Produto")} className="inicial_promocoes_elementos">
                        <div className="inicial_imagem_promocoes">
                            <img src={image_inicial_animais}/>
                        </div>
                        <div className="inicial_informacoes_promocoes">
                            <span className="inicial_promocoes_titulos">{item.tilulo}</span><br/>
                            <span className="inicial_promocoes_autores">Criado por {item.autor}</span><br/>
                            <div className="inicial_promocoes_div_precos">
                                <span className="inicial_promocoes_precos">R$ {item.precoNomal}</span>
                                <span className="inicial_promocoes_descontos">R$ {item.precoPromo}</span>
                            </div>
                        </div>
                    </div>))}
                    <div onClick={() => navigete("/Produto")} className="inicial_promocoes_elementos">
                        <div className="inicial_imagem_promocoes">
                            <img src={image_inicial_wiscky}/>
                        </div>
                        <div className="inicial_informacoes_promocoes">
                            <span className="inicial_promocoes_titulos">Quadro Wiscky Gelado</span><br/>
                            <span className="inicial_promocoes_autores">Criado por Sofia Silva</span><br/>
                            <div className="inicial_promocoes_div_precos">   
                                <span className="inicial_promocoes_precos">R$ 277,80</span>
                                <span className="inicial_promocoes_descontos">R$ 277,80</span>
                            </div>
                        </div>
                    </div>
                    <div onClick={() => navigete("/Produto")} className="inicial_promocoes_elementos">
                        <div className="inicial_imagem_promocoes">
                            <img src={image_inicial_maos}/>
                        </div>
                        <div className="inicial_informacoes_promocoes">
                            <span className="inicial_promocoes_titulos">Quadro Sempre Unidos</span><br/>
                            <span className="inicial_promocoes_autores">Criado por Sofia Silva</span><br/>
                            <div className="inicial_promocoes_div_precos">
                                <span className="inicial_promocoes_precos">R$ 277,80</span>
                                <span className="inicial_promocoes_descontos">R$ 277,80</span>
                            </div>
                        </div>    
                    </div>
                    <div onClick={() => navigete("/Produto")} className="inicial_promocoes_elementos">
                        <div className="inicial_imagem_promocoes">  
                            <img src={image_inicial_torre}/>
                        </div>
                        <div className="inicial_informacoes_promocoes">
                            <span className="inicial_promocoes_titulos">Quadro Chrysler Building</span><br/>
                            <span className="inicial_promocoes_autores">Criado por Sofia Silva</span><br/>
                            <div className="inicial_promocoes_div_precos">
                                <span className="inicial_promocoes_precos">R$ 277,80</span>
                                <span className="inicial_promocoes_descontos">R$ 277,80</span>
                            </div>
                        </div>   
                    </div>
                </div>
            </div>
        </div>
    )
}

export default Promocoes;