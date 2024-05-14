import React, {useState} from "react";
import './cadastroproduto_style.css';
import MenuLateral from "../Components/component_menulateral/MenuLateral";
import { useNavigate } from "react-router-dom";
import BarraDb from "../Components/component_barradb/BarraDb";
import axios from 'axios';

// Configure o withCredentials como false
axios.defaults.withCredentials = false;



function CadastroProduto(){
    
    const navigate = useNavigate();
    const [dados, setDados] = useState({
        quadro: '',
        preco: '',
        imagem: '',
        estoque: '',
        // categoria: '',
        cor: '',
        descricao: '',
        tamanho: ''
    });

    const [notifVazio, setNotifVazio] = useState(false);
    const [notifSucesso, setNotifSucesso] = useState(false);
    const [notifEstoque, setNotifEstoque] = useState(false);
    const [notifImagem, setNotifImagem] = useState(false);

    const handleSubmit = async () => {
        setNotifVazio(false);
        setNotifEstoque(false);
        setNotifImagem(false);

        for(let valor in dados){
            if(dados[valor] == ''){
                setNotifVazio(true)
                return;
            }
        }
        if(dados.estoque <= 0 ) { 
            setNotifEstoque(true)} 
        else {
                setNotifEstoque(false)}
        
        if(notifEstoque == false && notifVazio == false){
            try {
                const response = await axios.post('http://localhost:5000/api/cadastro_produto',{
                quadro: dados.quadro,
                descricao: dados.descricao,
                preco: dados.preco,
                imagem: dados.imagem,
                estoque: dados.estoque,
                // categoria: dados.categoria,
                tamanho: dados.tamanho,
                cor: dados.cor
                });
    
                const notifica_reposta = response.data.mensagem// Exiba a resposta do servidor no console se necessário
                console.log(notifica_reposta)
            
                
                if(notifica_reposta == 'Quadro cadastrado com sucesso'){
                    setNotifSucesso(true)
                }if(notifica_reposta == 'Quadro já cadastrado tente novamente'){
                    setNotifImagem(true)
                }
            } catch (error) {
                console.error('Erro ao enviar dados para o servidor:', error);
            }
          }
    };
    return(
        <div className="dashboard">
            <MenuLateral/>
            <div className="container">
                <BarraDb/>
                <div className="conteudo-dashboard">
                    <h1>Novo Produto</h1>
                    <div className="form-cad-prod">
                        <div className="acoes">
                            <label>Adicionar foto do quadro</label>
                            <input type="file" accept=".jpg, .jpeg, .png" name="imagem" onChange={(e) => setDados({...dados, imagem: e.target.files[0]})}/>
                            <div className="botoes-principais">
                                <button type="reset" className="botao-no-form">Cancelar</button>
                                <button onClick={handleSubmit} type="submit" className="botao-yes-form">Cadastrar produto</button>
                            </div>
                        </div>
                        <div>
                            <div>
                                <div>
                                    <label>Nome do quadro</label>
                                    <input type="text" name="quadro" placeholder="Digite o nome do quadro" onChange={(e) => setDados({...dados, quadro: e.target.value})}></input>
                                </div>
                                <div>
                                    <label>Preço</label>
                                    <input type="text" name="preco" placeholder="Digite o preço" onChange={(e) => setDados({...dados, preco: e.target.value})}></input>
                                </div>                                
                                <div>
                                    <label>Quantidade no estoque</label>
                                    <input type="text" name="estoque" placeholder="Digite o número de quadros" onChange={(e) => setDados({...dados, estoque: e.target.value})}></input>
                                </div>                                
                                {/* <div>
                                    <label>Categoria</label>
                                    <select id="categoriaSelect"  name="categoria" onChange={(e) => setDados({...dados, categoria: e.target.value})}>
                                        <option value="1">Selecione a categoria do quadro</option>
                    
                                    </select>
                                </div>                                 */}
                                <div>
                                    <label>Tamanho</label>
                                    <input type="text" name="tamanho" placeholder="Digite a dimensáo do quadro" onChange={(e) => setDados({...dados, tamanho: e.target.value})}></input>
                                </div>                                
                                <div>
                                    <label>Cor da moldura</label>
                                    <input type="text" name="cor" placeholder="Selecione a cor da moldura" onChange={(e) => setDados({...dados, cor: e.target.value})}></input>
                                </div>                                
                                {/* <div className="div-add-cor">
                                    <label>Adicionar outra cor</label>
                                    <input type="text" name="cor" onChange={(e) => setDados({...dados, cor: e.target.value})}></input>
                                </div> */}
                                {notifEstoque && (
                                    <div className='notificacao'>
                                        <span>O estoque deve ser maior que 0!</span>
                                    </div>
                                )}
                                {notifVazio && (
                                    <div className='notificacao'>
                                        <span>Todos os campos devem ser obrigatoriamente preenchidos!</span>
                                    </div>
                                )}
                                {notifImagem && (
                                    <div className='notificacao'>
                                        <span>Quadro já cadastrado! <a onClick={()=> navigate=('./DashboardProdutos')}>Clique aqui para ver o produto</a></span>
                                    </div>
                                )}
                                {notifSucesso && (
                                    <div className='notificacao'>
                                        <span>Quadro cadastrado!</span>
                                    </div>
                                )}
                            </div>
                            <div>
                                <label>Descrição</label>
                                <textarea name="descricao" onChange={(e) => setDados({...dados, descricao: e.target.value})}></textarea>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            
        </div>
    )
    
}
export default CadastroProduto;