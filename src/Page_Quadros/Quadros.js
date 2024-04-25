import React from "react";
import "./quadros.css";
import Navbar from "../Components/component_Navbar/Navbar";
import image_filter from "../img/image_filter.png";
import image_pontos from "../img/imagem_pontos.png";
import image_retangulos from "../img/image_retangulos.png";
import Promocoes from "../Components/component_Promocoes/Promocoes";
import Footer from "../Components/component_Footer/Footer";

function Quadros(){
    return(
        <div className="quadros_container">
            <Navbar/>
            <div className="quadros_box_filtro">
                <div className="quadros_div_filtro">
                    <div className="quadros_div_inside_filtro">
                        <div className="quadros_filtro">
                            <img src={image_filter} alt="imagem_filtro"/>
                            <span>Filtro</span>
                        </div>
                        <img className="imagem_pontos" src={image_pontos} alt="imagem_pontos"/>
                        <img className="imagem_retangulos" src={image_retangulos} alt="imagem_reatangulos"/>
                        <div className="quadros_div"/>
                        <span>Mostrando de 1-20 de 554</span>
                    </div>
                    <div className="quadros_div_inside_mostrar">
                        <div className="quadros_mostrar">
                            <span>Mostrar</span>
                            <select>
                                <option value={10}>10</option>
                                <option value={20}>20</option>
                                <option value={30}>30</option>
                                <option value={40}>40</option>
                            </select>
                        </div>
                        <div className="quadros_ordenar">
                            <span>Ordenar por</span>
                            <select>
                                <option value={1}>Relevância</option>
                                <option value={2}>Option 2</option>
                                <option value={3}>Option 3</option>
                                <option value={4}>Option 4</option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
            <Promocoes/>
            <Promocoes/>
            <Promocoes/>
            <Promocoes/>
            <div className="quadros_box_mais">
                <div className="quadros_div_mais"><span>1</span></div>
                <div className="quadros_div_mais"><span>2</span></div>
                <div className="quadros_div_mais"><span>3</span></div>
                <div className="quadros_div_mais"><span>4</span></div>
                <div className="quadros_div_mais"><span>5</span></div>
                <button>Próximo</button>
            </div>
            <Footer/>
        </div>
    )
}

export default Quadros;