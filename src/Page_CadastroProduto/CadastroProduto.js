import React, {useState} from "react";
import './cadastroproduto_style.css';
import MenuLateral from "../Components/component_menulateral/MenuLateral";
import { useNavigate } from "react-router-dom";
import BarraDb from "../Components/component_barradb/BarraDb";
import axios from "axios";

function carregarOpcoes() {
    // Fazer uma requisição AJAX para a rota no servidor que retorna os dados
    fetch('/api/categorias')
        .then(response => response.json())
        .then(data => {
            // Limpar as opções existentes
            const select = document.getElementById('categoriaSelect');
            select.innerHTML = '';
            
            // Adicionar as novas opções baseadas nos dados recebidos
            data.forEach(categoria => {
                const option = document.createElement('option');
                option.value = categoria.id;
                option.textContent = categoria.nome;
                select.appendChild(option);
            });
        })
        .catch(error => console.error('Erro ao carregar categorias:', error));
}

// Chamar a função para carregar as opções assim que a página for carregada


function CadastroProduto(){
    document.addEventListener('DOMContentLoaded', carregarOpcoes);
    const navigate = useNavigate();
    const [quadro, setQuadro] = useState('');
    const [preco, setPreco] = useState('');
    const [imagem, setImagem] = useState('');
    const [estoque, setEstoque] = useState('');
    const [categoria, setCategoria] = useState('');
    const [cor, setCor] = useState([]);
    const [descricao,setDescricao] = useState('')
    const [tamanho, setTamanho] = useState('');
    const [notifVazio, setNotifVazio] = useState(false);
    const [notifSucesso, setNotifSucesso] = useState(false);
    const [notifEstoque, setNotifEstoque] = useState(false);
    const [notifImagem, setNotfImagem] = useState(false);

    const handleSubmit = async () => {{
        (quadro === '' || preco === '' || imagem === '' || estoque === ''
            || categoria === '' || cor === '' || tamanho === '' || descricao === ''
        )? setNotifVazio(true) : setNotifVazio(false)}
        {(estoque === 0) ? setNotifEstoque(true) : setNotifEstoque(false)}
        
        if(notifEstoque == false && notifVazio == false){
            try {
                const response = await axios.post('http://localhost:5000/api/cadastro_produto', {
                nomeQuadro: nome,
                descricao: descricao,
                preco: preco,
                imagem: imagem,
                estoque: estoque,
                categoria_id: categoria,
                tamanho: tamanho
                });
    
                const notifica_reposta = response.data.mensagem// Exiba a resposta do servidor no console se necessário
                console.log(notifica_reposta)
            
                
                if(notifica_reposta == 'Quadro cadastrado com sucesso'){
                    setNotifSucesso(true)
                }if(notifica_reposta == 'Quadro já cadastrado tente novamente'){
                    setNotfImagem(true)
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
                    <form>
                        <div className="acoes">
                            <label htmlFor="foto-quadro-input">Adicionar foto do quadro</label>
                            <input type="file" accept=".jpg, .jpeg, .png" onChange={(e) => setImagem(e.target.files[0])}/>
                            <div className="botoes-principais">
                                <button type="reset" className="botao-no-form">Cancelar</button>
                                <button onClick={handleSubmit} type="submit" className="botao-yes-form">Cadastrar produto</button>
                            </div>
                        </div>
                        <div>
                            <div>
                                <div>
                                    <label>Nome do quadro</label>
                                    <input type="text" placeholder="Digite o nome do quadro" onChange={(e) => setQuadro(e.target.value)}></input>
                                </div>
                                <div>
                                    <label>Preço</label>
                                    <input type="text" placeholder="Digite o preço" onChange={(e) => setPreco(e.target.value)}></input>
                                </div>                                
                                <div>
                                    <label>Quantidade no estoque</label>
                                    <input type="text" placeholder="Digite o número de quadros" onChange={(e) => setEstoque(e.target.value)}></input>
                                </div>                                
                                <div>
                                    <label>Categoria</label>
                                    <input type="number" placeholder="Selecione a categoria do quadro" onChange={(e) => setCategoria(e.target.value)}></input>
                                </div>                                
                                <div>
                                    <label>Tamanho</label>
                                    <input type="text" placeholder="Digite a dimensáo do quadro" onChange={(e) => setTamanho(e.target.value)}></input>
                                </div>                                
                                <div>
                                    <label>Cor da moldura</label>
                                    <input type="select" placeholder="Selecione a cor da moldura" onChange={(e) => setCor(e.target.value)}></input>
                                </div>                                
                                <div className="div-add-cor">
                                    <label>Adicionar outra cor</label>
                                    <input type="text" onChange={(e) => setCor(e.target.value)}></input>
                                </div>
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
                            </div>
                            <div>
                                <label>Descrição</label>
                                <textarea onChange={(e) => setDescricao(e.target.value)}></textarea>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            
            
        </div>
    )
}
export default CadastroProduto;