import React, {useEffect, useRef, useState} from "react";
import './cadastroproduto_style.css';
import MenuLateral from "../Components/component_menulateral/MenuLateral";
import { useNavigate } from "react-router-dom";
import BarraDb from "../Components/component_barradb/BarraDb";
import axios from 'axios';
import { IoIosAdd } from "react-icons/io";


// Configure o withCredentials como false
// axios.defaults.withCredentials = false;



function CadastroProduto(){
        const[categorias, setCategorias] = useState([]);
        const inputFileRef = useRef(null);
        const labelRef = useRef(null);
        const textSpanRef = useRef(null);
        const textPadrao = "Adicionar foto do quadro";
        const navigate = useNavigate();
        const [dados, setDados] = useState({
            quadro: '',
            preco: '',
            imagem: '',
            estoque: '',
            categoria: '',
            cor: '',
            descricao: '',
            tamanho: ''
        });

        const [notifVazio, setNotifVazio] = useState(false);
        const [notifSucesso, setNotifSucesso] = useState(false);
        const [notifEstoque, setNotifEstoque] = useState(false);
        const [notifImagem, setNotifImagem] = useState(false);

        useEffect(() => {
            const fetchCategorias = async () => {
                try {
                    const response = await axios.get('http://localhost:5000/api/consultar_categorias');
                    console.log('Resposta recebida:', response);
                    setCategorias(response.data); 
                } catch (error) {
                    console.error('Erro ao buscar categorias:', error);
                }
            };
    
            fetchCategorias();
        }, []);

        useEffect(() => {
            

            const inputFile = inputFileRef.current;
            const textSpan = textSpanRef.current;
            textSpan.innerHTML = textPadrao;
            const label = labelRef.current;
            

            const handleChange = (e) => {
                const inputTarget = e.target;
                const file = inputTarget.files[0];
    
                if (file) {
                    const reader = new FileReader();
                    reader.addEventListener("load", (e) => {
                        const readerTarget = e.target;
                        const img = document.createElement('img');
                        img.src = readerTarget.result;
                        img.classList.add('image');
                        textSpan.innerHTML = '';
                        textSpan.appendChild(img);
                        
                        if (label) {
                            console.log('label encontrada')
                            label.classList.add('span-com-imagem');
                        }
                    });
                    reader.readAsDataURL(file);
                } else {
                    textSpan.innerHTML = textPadrao;
                    
                    if (label) {
                    label.classList.remove('span-com-imagem');
                    }
                }
            };
    
            inputFile.addEventListener('change', handleChange);
    
            return () => {
                inputFile.removeEventListener('change', handleChange);
            };
        }, 
        []);



    const handleAddColor = async () =>{

    }

    const handleSubmit = async () => {
        setNotifVazio(false);
        setNotifEstoque(false);
        setNotifImagem(false);
        setNotifEstoque(false)

        for(let valor in dados){
            if(dados[valor] == ''){
                setNotifVazio(true)
                return;
            }
        }
        if(dados.estoque <= 0 ) { 
            setNotifEstoque(true)
            return;
        }
        
            try {
                const response = await axios.post('http://localhost:5000/api/cadastro_produto',{
                    quadro: dados.quadro,
                    descricao: dados.descricao,
                    preco: dados.preco,
                    imagem: dados.imagem,
                    estoque: dados.estoque,
                    categoria: dados.categoria,
                    tamanho: dados.tamanho,
                    cor: dados.cor
                });
    
                const notifica_reposta = response.data.mensagem// Exiba a resposta do servidor no console se necessário
                console.log(notifica_reposta)
            
                
                // if(notifica_reposta == 'Quadro cadastrado com sucesso'){
                //     setNotifSucesso(true)
                // }if(notifica_reposta == 'Quadro já cadastrado tente novamente'){
                //     setNotifImagem(true)
                // }
            } catch (error) {
                console.error('Erro ao enviar dados para o servidor:', error);
            }
    };
    return(
        <div className="dashboard">
            <MenuLateral/>
            <div className="container">
                <BarraDb/>
                <div className="conteudo-dashboard">
                    <h2>Novo Produto</h2>
                    <form>
                        <div className="acoes">
                            <div className="add-img">
                                <label htmlFor="image-input" tabIndex={0} className="input-estilizado" ref={labelRef}>
                                    <span className="" ref={textSpanRef}></span>
                                </label>
                                <input type="file" id="image-input" accept="image/*" name="imagem" ref={inputFileRef} onChange={(e) =>   
                                    setDados({...dados, imagem: e.target.files[0]})}/>
                            </div>
                            <div className="botoes-principais">
                                <button type="reset" className="botao-no-form">Cancelar</button>
                                <button onClick={handleSubmit} type="submit" className="botao-yes-form">Cadastrar produto</button>
                            </div>
                        </div>
                        <div className="campos">
                            <div className="linhas-input">
                                <div className="linha-input">
                                    <label>Nome do quadro</label>
                                    <input type="text" className="input-maior" name="quadro" placeholder="Digite o nome do quadro" onChange={(e) => setDados({...dados, quadro: e.target.value})}></input>
                                </div>
                                
                                <div className="linha-dois-input">
                                    <div className="linha-input">
                                        <label>Preço</label>
                                        <input type="text" name="preco" placeholder="Digite o preço" onChange={(e) => setDados({...dados, preco: e.target.value})}></input>
                                    </div> 
                                    <div className="linha-input"> 
                                        <label>Quantidade no estoque</label>
                                        <input type="text" name="estoque" placeholder="Digite o número de quadros" onChange={(e) => setDados({...dados, estoque: e.target.value})}></input>
                                    </div>
                                </div>
                                <div className="linha-dois-input">                                                    
                                    <div className="linha-input">
                                        <label>Categoria</label>
                                        <select id="categoriaSelect"  name="categoria" value={dados.categoria} onChange={(e) => setDados({...dados, categoria: e.target.value})}>
                                        <option value="">Selecione a categoria do quadro</option>
                                            {/* {categorias.map((categoria) => (
                                                <option key={categoria.ID_categoria} value={categoria.ID_categoria}>{categoria.tipoCategoria}</option>
                                            ))} */}
                                        </select>
                                    </div>                                
                                    <div className="linha-input">
                                        <label>Tamanho</label>
                                        <input type="text" name="tamanho" placeholder="Digite a dimensáo do quadro" onChange={(e) => setDados({...dados, tamanho: e.target.value})}></input>
                                    </div>
                                </div>  
                                <div className="linha-dois-input-add">                          
                                    <div className="linha-input">
                                        <label>Cor da moldura</label>
                                        <input type="text" name="cor" placeholder="Selecione a cor da moldura" onChange={(e) => setDados({...dados, cor: e.target.value})}></input>
                                    </div>                                
                                    <div className="div-add-cor">
                                        <button className="add-cor" onClick={handleAddColor}>
                                            <IoIosAdd size={35}></IoIosAdd>
                                        </button>
                                        <label>Adicionar outra cor</label>
                                    </div>
                                </div>  
                                {notifEstoque && (
                                    <div className='notificacao'>
                                        <span>O estoque deve ser maior que 0!</span>
                                    </div>
                                )}
                                {/* {notifVazio && (
                                    <div className='notificacao'>
                                        <span>Todos os campos devem ser obrigatoriamente preenchidos!</span>
                                    </div>
                                )} */}
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
                            <div className="div-textarea">
                                <label>Descrição</label>
                                <textarea name="descricao" placeholder="Escreva uma descrição breve sobre o produto. Ela aparecerá embaixo do nome do produto." onChange={(e) => setDados({...dados, descricao: e.target.value})}>
                                </textarea>
                                <span>0/500 CARÁCTERES</span>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            
            
        </div>
    )
    
}

export default CadastroProduto;