import React, {useState, useEffect, useContext} from "react";
import './promocoes_style.css';
import axios from "axios";
import { useNavigate } from "react-router-dom";
import { HandleDataContext } from "../../context/HandleContext";
import formatarDinheiro from "../../Utilidades/formartarDinheiro";

function Promocoes(){
    const navigate = useNavigate();

    const [quadros, setQuadros] = useState([]);
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
        console.log(quadros)
    }, []);


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
        <div className="promocoes_container">
            <div className="inicial_box_promocoes">
                <div className="inicial_promocoes">
                    {quadros.slice(0, 4).map((item) => (<div key={item.ID_produtos} onClick={() => clicarQuadro(item)} className="inicial_promocoes_elementos">
                        <div className="inicial_imagem_promocoes">
                            <img src={item.imagem} alt="Algum quadro"/>
                        </div>
                        <div className="inicial_informacoes_promocoes">
                            <span className="inicial_promocoes_titulos">{item.nomeQuadro}</span><br/>
                            <span className="inicial_promocoes_autores">Criado por Algum autor</span><br/>
                            <div className="inicial_promocoes_div_precos">
                                <span className="inicial_promocoes_precos">{formatarDinheiro(item.preco)}</span>
                                <span className="inicial_promocoes_descontos">R$ 300,00</span>
                            </div>
                        </div>
                    </div>))}
                </div>
            </div>
        </div>
    )
}

export default Promocoes;