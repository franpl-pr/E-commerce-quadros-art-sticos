import React, {useState, useContext, useEffect} from "react";
import "./produto_style.css"
import Navbar from "../Components/component_Navbar/Navbar";
import { MdKeyboardArrowRight } from "react-icons/md";
import image_bulldog from "../img/image_produto_bulldog.png";
import image_star from "../img/image_star_yellow.png";
import image_star_half from "../img/image_star-half.png";
import image_moldura1 from "../img/image_produto_tipo_moldura1.png";
import image_moldura2 from "../img/image_produto_tipo_moldura2.png";
import Footer from "../Components/component_Footer/Footer";
import image_coracao_favoritar from "../img/image_coracao_favoritar.png";
import image_quadro_parede from "../img/image_produto_paisagem_quadro.png";
import Quadros_relacionados from "../Components/component_Promocoes/Promocoes";
import image_menos from "../img/image_produto_menos.png";
import image_mais from "../img/image_produto_mais.png";
import {useNavigate} from "react-router-dom";
import { HandleDataContext } from '../context/HandleContext';
import { HandleCarrinhoContext } from '../context/HandleContext';
import formatarDinheiro from "../Utilidades/formartarDinheiro";

function DetalheProduto(){
    const navigate = useNavigate()
    const {dadosProduto, setDadosProduto} = useContext(HandleDataContext)
    const {dadosCarrinho, setDadosCarrinho} = useContext(HandleCarrinhoContext)
    const [numerosQuadros, setNumerosQuadros] = useState(1)

    const diminuirNumerosQuadros = () => {
        if(numerosQuadros <= 1){
            setNumerosQuadros(1)
        }else{
            setNumerosQuadros(numerosQuadros - 1)
        }
    }

    const aumentaNumeroQuadros = () => {
        setNumerosQuadros(parseInt(numerosQuadros + 1))
    }

    const handleAddCart = () => {setDadosCarrinho([...dadosCarrinho, dadosProduto])
        console.log(dadosProduto)
    }



    return(
        <div className="produto_container">
            <Navbar/>
            <div className="produto_box_localizar">
                <div className="produto_todos_localizar">
                    <div className="produto_localizar"><a onClick={() => navigate("/Home")}>Home</a><MdKeyboardArrowRight className="produto_icon_seta"/></div>
                    <div className="produto_localizar"><a href="#">Categorias</a><MdKeyboardArrowRight className="produto_icon_seta"/></div>
                    <div className="produto_localizar"><span>Animais</span></div>
                </div>
            </div>
            <div className="produto_box_informacoes_compra">
                <div className="produto_div_informacoes_compra">
                    <img src={dadosProduto.imagem} alt={image_bulldog}/>
                    <div className="produto_informacoes">
                        <h2>{dadosProduto.nomeQuadro}</h2>
                        <div className="produto_div_avaliacoes_informacoes">
                            <div className="produto_div_star">
                                <img src={image_star} alt="estrela"/>
                                <img src={image_star} alt="estrela"/>
                                <img src={image_star} alt="estrela"/>
                                <img src={image_star} alt="estrela"/>
                                <img src={image_star_half} alt="estrela"/>
                            </div>
                            <div className="produto_div_nota_avaliacoes">
                                <span className="produto_span_nota">{dadosProduto.avaliacaoMedia}</span>
                                <span className="produto_span_avaliacoes">+ 100 avaliações</span>
                                <span className="produto_span_nome_artista">Criado por Sofia Silva</span>
                            </div>
                        </div>
                        <div className="produto_div_preco_original">
                             <span className="produto_de">De:</span>
                             <span className="produto_preco_original">R$ 320,00</span>
                        </div>
                        <div className="produto_div_preco_promocao">
                            <span className="produto_por">Por:</span>
                            <span className="produto_preco_promocao">{formatarDinheiro(dadosProduto.preco)}</span>
                        </div>
                        <p>
                        {dadosProduto.descricao}
                        </p>
                        <h3>Opções de molduras:</h3>
                        <div className="produto_tipo_molduras">
                            <button><img src={image_moldura1}/></button>
                            <button><img src={image_moldura2}/></button>
                        </div>
                        <div className="produto_div_adicionar_carrinho">
                            <div className="produto_input_numero_quadros">
                                <img onClick={diminuirNumerosQuadros} className="image_menos" src={image_menos} alt="image_menos"/>
                                <input type="number" value={numerosQuadros} onChange={(e) => setNumerosQuadros(e.target.value)}/>
                                <img onClick={aumentaNumeroQuadros} className="image_mais" src={image_mais} alt="image_mais"/>
                            </div>
                            <button onClick={handleAddCart} className="produto_adicionar_carrinho">Adicionar ao carrinho</button>
                            <button className="produto_favoritar"><img src={image_coracao_favoritar} alt="coracao"/></button>
                        </div>
                    </div>
                </div>
            </div>
            <div className="produto_box_detalhes">
                <div className="poduto_navegacao_detalhes">
                    <a href="#">Detalhes</a>
                    <a href="#">Garantia</a>
                    <a href="#">Como Cuidar</a>
                    <a href="#">Galeria</a>
                    <a href="#">Avaliações</a>  
                    <a href="#">Sobre o autor</a>
                </div>
                <div className="produto_detalhes_conteudo">
                    <h2>Prazo de produção</h2>
                    <p>Os quadros levam até 5 dias úteis para serem produzidos e após a produção eles entram em transporte 
                        para serem entregues em seu endereço. Você pode calcular o prazo de entrega diretamente na página
                        do produto informando o seu CEP.</p>

                    <h2>Papel e impressão</h2>
                    <p>As impressões são feitas com tecnologia digital de altíssima resolução, em gráfica certificada pelo 
                        selo FSC® de gestão florestal responsável. Usamos papel resistente escolhido a dedo para garantir 
                        firmeza, qualidade e cores lindas ao seu quadro.</p>

                    <h2>Molduras</h2>
                    <p>Todos os quadros acompanham molduras produzidas a partir de madeira maciça com pinturas laqueadas e 
                        acabamentos caprichados realizados por quem mais entende do assunto.</p>

                    <h2>Acabamento</h2>
                    <p>Recomendamos adicionar o vidro de acrílico ao seu quadro, além de dar mais vida e brilho, ele irá 
                        proteger a imagem e aumentará a durabilidade do quadro, evitando desgates naturais e ambientais.</p>

                    <h2>Especificações</h2>
                    <p>Tamanho: A5 ({dadosProduto.tamanho})<br/>
                    Moldura: Moldura tradicional<br/>
                    Cor da moldura: {dadosProduto.cor}</p>
                </div>
                <div className="produto_div_quadro_parede">
                    <img src={image_quadro_parede} alt="quadro_parede"/>
                </div>
            </div>
            <div className="produtos_box_produtos_relacionados">
                <div className="produtos_div_produtos_relacionados">
                    <h2>Produtos relacionados<div className="produto_linha"></div></h2>
                    <Quadros_relacionados/>
                    <button onClick={() => navigate('/Quadros')}>Ver mais</button>
                </div>
            </div>
            <Footer/>
        </div>
    )
}

export default DetalheProduto;