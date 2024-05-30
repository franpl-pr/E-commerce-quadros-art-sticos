import React, {useState, useEffect, useContext} from "react";
import "./quadros.css";
import Navbar from "../Components/component_Navbar/Navbar";
import image_filter from "../img/image_filter.png";
import image_pontos from "../img/imagem_pontos.png";
import image_retangulos from "../img/image_retangulos.png";
import axios from "axios";
import { useNavigate } from "react-router-dom";
import Footer from "../Components/component_Footer/Footer";
import { HandleDataContext } from "../context/HandleContext";


function Quadros(){
    const navigate = useNavigate();

    const [quadros, setQuadros] = useState([]);
    const [numQuadros, setNumQuadros] = useState(10)
    const [produto, setProduto] = useState(null)
    const {dadosProduto, setDadosProduto} = useContext(HandleDataContext);


    useEffect(() => {
        axios.get('http://localhost:5000/quadros')
        .then(response => {
            setQuadros(response.data);
        })
        .catch(error => {
            console.error("Houve um erro!", error);
        });
    }, []);

    const handleSelectChange = (event) => {
        setNumQuadros(parseInt(event.target.value, 10)); // Garante que o valor seja interpretado como decimal
    };


    const clicarQuadro = async (item) => {
        try {
            // Faça a requisição POST para o backend
            const response = await axios.post('http://localhost:5000/produto', {
                id: item.ID_produtos
            });

            setProduto(response.data);
            setDadosProduto(response.data);

            console.log('Produto recebido:', response.data);
            console.log('ID do produto clicado:', item.ID_produtos);

            window.scrollTo(0, 2)
    
            navigate('/Produto')
        } catch (error) {   
            console.error('Erro ao enviar dados para o servidor:', error);
        }
    }


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
                            <select onChange={handleSelectChange}>
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
            <div className="quadro_container">
                <div className="inicial_box_quadro">
                    <div className="inicial_quadro">
                        {quadros.slice(0, numQuadros).map((item) => (<div key={item.ID_produtos} onClick={() => clicarQuadro(item)} className="inicial_quadro_elementos">
                            <div className="inicial_imagem_quadro">
                                <img src={item.imagem} alt="Algum quadro"/>
                            </div>
                            <div className="inicial_informacoes_quadro">
                                <span className="inicial_quadro_titulos">{item.nomeQuadro}</span><br/>
                                <span className="inicial_quadro_autores">Criado por Algum autor</span><br/>
                                <div className="inicial_quadro_div_precos">
                                    <span className="inicial_quadro_precos">R$ {item.preco}</span>
                                    <span className="inicial_quadro_descontos">R$ 300,00</span>
                                </div>
                            </div>
                        </div>))}
                    </div>
                </div>
            </div>
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