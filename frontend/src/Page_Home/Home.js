import React from "react";
import './home_style.css';
import Promocoes from '../Components/component_Promocoes/Promocoes';
import Navbar from "../Components/component_Navbar/Navbar";
import Footer from "../Components/component_Footer/Footer";
import image_home_quadro from "../img/image_home_quadro.png";
import image_home_compra_segura from '../img/image_home_compra_segura.png';
import image_home_frete_gratis from '../img/image_home_frete_gratis.png';
import image_home_sem_juros from '../img/image_home_sem_juros.png';
import image_home_quadro_artista_semana from '../img/image_home_quadro_artista_semana.png';
import image_home_artista_destaque from '../img/image_home_artista_destaque.png';
import image_animais from '../img/image_home_categorias_animais.png';
import image_lugares from '../img/image-home_categorias_lugares.png';
import image_fashion from '../img/image_home_categorias_fashion.png';
import image_comidas from '../img/image-home_categorias_comidas.png';
import image_frases from '../img/image_home_categorias_frases.png';
import image_plantas from '../img/image_home_categorias_plantas.png';
import image_musicas from '../img/image_home_categorias_musicas.png';
import image_natureza from '../img/image_home_categorias_natureza.png';
import image_pessoa from '../img/image_home_pessoa_comentario.png';

    
function Home(){
    return(
        <div className="home_container">
            <Navbar/>
            <div className="home_box_vamos_decorar">
                <div className="home_div1_vamos_decorar">
                    <img src={image_home_quadro}/>
                </div>
                <div className="home_div2_vamos_decorar">
                    <div className="home_div2_inside_div">
                        <h1 className="home_vamos_decorar_primeiro_h1">Vamos</h1> 
                        <h1 className="home_vamos_decorar_segundo_h1">decorar hoje?</h1>
                        <div className="home_vamos_decorar_linha1"></div>
                        <p>Explore a loja de quadros Abstratos</p>
                        <div className="home_vamos_decorar_linha2"></div>
                        <button>Confira</button>
                    </div>
                </div>
            </div>
            <div className="home_div_seguranca">
                <img className="home_img_frete_gratis" src={image_home_frete_gratis}/>
                <img className="home_img_compra_segura" src={image_home_compra_segura}/>
                <img className="home_img_sem_juros" src={image_home_sem_juros}/>
            </div>
            <div className="home_div_text_quadro_descontos">
                <h2>Descontos exclusivos<div className="home_quadros_linha"></div></h2>
                <Promocoes/>
            </div>
            <div className="home_box_artista_semana">
                <div className="home_div_artista_semana">
                    <div className="home_informacoes_artista_semana">
                        <h2>Artista da semana<div className="home_quadros_linha"></div></h2>
                        <div className="home_foto_artista_semana">
                            <img src={image_home_artista_destaque} alt="image_artista_destaque"/>
                            <h2>Federich Gomes</h2>
                            <p>Conheça mais sobre o incrível trabalho do artista da semana</p>
                            <button>Confira</button>
                        </div>
                    </div>
                    <img src={image_home_quadro_artista_semana} alt="image_quadro_artista"/>
                </div>
            </div>
            <div className="home_box_navegue_categorias">
                <h2>Navegue pelas categorias<div className="home_quadros_linha"></div></h2>
                <div className="home_div_navegue_categorias">
                    <div className="home_navegue_categorias">
                        <h3>Animais<div className="home_categorias_linha"></div></h3>
                        <div className="home_molde_quadro_escuro">
                            <img src={image_animais} alt="image_animais"/>
                        </div>
                    </div>
                    <div className="home_navegue_categorias">
                        <h3>Lugares<div className="home_categorias_linha"></div></h3>
                        <div className="home_molde_quadro_claro">
                            <img src={image_lugares} alt="image_lugares"/>
                        </div>
                    </div>
                    <div className="home_navegue_categorias">
                        <h3>Fashion<div className="home_categorias_linha"></div></h3>
                        <div className="home_molde_quadro_claro">
                            <img src={image_fashion} alt="image_fashion"/>
                        </div>
                    </div>
                    <div className="home_navegue_categorias">
                        <h3 className="home_categorias_comidas">Comidas<div className="home_categorias_linha"></div></h3>
                        <div className="home_molde_quadro_claro">
                            <img src={image_comidas} alt="image_comidas"/>
                        </div>
                    </div>
                    <div className="home_navegue_categorias">
                        <h3>Frases<div className="home_categorias_linha"></div></h3>
                        <div className="home_molde_quadro_escuro">
                            <img src={image_frases} alt="image_frases"/>
                        </div>
                    </div>
                    <div className="home_navegue_categorias">
                        <h3>Plantas<div className="home_categorias_linha"></div></h3>
                        <div className="home_molde_quadro_escuro">
                            <img src={image_plantas} alt="image_plantas"/>
                        </div>
                    </div>
                    <div className="home_navegue_categorias">
                        <h3>Músicas<div className="home_categorias_linha"></div></h3>
                        <div className="home_molde_quadro_claro">
                            <img src={image_musicas} alt="image_musicas"/>
                        </div>
                    </div>
                    <div className="home_navegue_categorias">
                        <h3>Romântico<div className="home_categorias_linha"></div></h3>
                        <div className="home_molde_quadro_escuro">
                            <img src={image_frases} alt="image_romantico"/>
                        </div>
                    </div>
                    <div className="home_navegue_categorias">
                        <h3>Natureza<div className="home_categorias_linha"></div></h3>
                        <div className="home_molde_quadro_claro">
                            <img src={image_natureza} alt="image_natureza"/>
                        </div>
                    </div>
                    <div className="home_navegue_categorias">
                        <h3>Abstrato<div className="home_categorias_linha"></div></h3>
                        <div className="home_molde_quadro_claro">
                            <img src={image_natureza} alt="image_natureza"/>
                        </div>
                    </div>
                </div>
                <button>Ver mais</button>
            </div>
            <div className="home_box_comentarios_clientes">
                <div className="home_div_comentarios_clientes">  
                        <h2>O que os clientes dizem sobre nós<div className="home_quadros_linha"></div></h2>
                    <div className="home_div_inside_comentarios">
                        <div className="home_div_comentario">
                            <div className="home_image1_comentarios_clientes"></div>
                            <div className="home_text1_comentario_clientes">
                                <div className="home_comentario_nome_dia">
                                    <h3>Jacque Harban</h3>
                                    <span>27/04/2022</span>
                                </div>
                                <img src={image_pessoa} alt="image_pessoa_comentario"/>
                                <p>O Quadrartes transforou minha casa! Comprei um quadro geométrico para o meu escritório.</p>
                            </div>
                        </div>
                        <div className="home_div_comentario">
                            <div className="home_image2_comentarios_clientes"></div>
                            <div className="home_text2_comentario_clientes">
                                <div className="home_comentario_nome_dia">
                                    <h3>Jacque Harban</h3>
                                    <span>27/04/2022</span>
                                </div>
                                <img src={image_pessoa} alt="image_pessoa_comentario"/>
                                <p>O Quadrartes transforou minha casa! Comprei um quadro geométrico para o meu escritório.</p>
                            </div>
                        </div>
                        <div className="home_div_comentario">
                            <div className="home_image3_comentarios_clientes"></div>
                            <div className="home_text3_comentario_clientes">
                                <div className="home_comentario_nome_dia">
                                    <h3>Jacque Harban</h3>
                                    <span>27/04/2022</span>
                                </div>
                                <img src={image_pessoa} alt="image_pessoa_comentario"/>
                                <p>O Quadrartes transforou minha casa! Comprei um quadro geométrico para o meu escritório.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <Footer/>
        </div>
    )
}

export default Home;