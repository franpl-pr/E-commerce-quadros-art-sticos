import React, {useEffect, useRef, useState} from "react";
import './editproduto_style.css';
import MenuLateral from "../Components/component_menulateral/MenuLateral";
import { useNavigate } from "react-router-dom";
import BarraDb from "../Components/component_barradb/BarraDb";
import axios from 'axios';
import { IoIosAdd } from "react-icons/io";
import { useLocation } from 'react-router-dom';


// Configure o withCredentials como false
// axios.defaults.withCredentials = false;



function EditProduto(){
        const[categorias, setCategorias] = useState([]);
        const inputFileRef = useRef(null);
        const labelRef = useRef(null);
        const textSpanRef = useRef(null);
        const textPadrao = "Alterar foto";
        const navigate = useNavigate();
        const location = useLocation();
        const produto = location.state?.produto || {};
        
        const [dados, setDados] = useState({
            quadro: produto.nomeQuadro || '',
            preco: produto.preco || '',
            imagem: produto.imagem || '',
            estoque: produto.estoque || '',
            categoria_id: produto.categoria_id || '',
            categoria: produto.tipoCategoria || '',
            cor: produto.cor || '',
            descricao: produto.descricao || '',
            tamanho: produto.tamanho || '',
            id: produto.ID_produtos || ''
        });
        const [notifVazio, setNotifVazio] = useState(false);
        const [notifSucesso, setNotifSucesso] = useState(false);
        const [notifEstoque, setNotifEstoque] = useState(false);
        const [notifImagem, setNotifImagem] = useState(false);

        useEffect(() => {
            axios.get('http://localhost:5000/consultar_categorias')
            .then(response => {
                setCategorias(response.data);
            })
            .catch(error => {
                console.error("Houve um erro!", error);
            });
            

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
                            label.classList.add('span-com-imagem');
                        }
                    });
                    reader.readAsDataURL(file);
                    setDados({...dados, imagem:file});
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

    const handleSubmit = async (event) => {
        event.preventDefault();
        setNotifVazio(false);
        setNotifEstoque(false);
        setNotifImagem(false);
        setNotifEstoque(false)

            try {
                const formData = new FormData();
                for (let key in dados) {
                    formData.append(key, dados[key]);
                }
    
                const response = await axios.post('http://localhost:5000/edit_produto', formData, {
                    headers: {
                        'Content-Type': 'multipart/form-data'
                    }
                });
    
                const notifica_reposta = response.data;
                console.log(notifica_reposta);
    
                if(notifica_reposta === 'Produto atualizado com sucesso'){
                    setNotifSucesso(true);
                    console.log("Produto atualizado com sucesso");
                } else {
                    console.log("Erro ao receber a resposta do servidor");
                }
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
                    <h2>Editar produto</h2>
                    <form onSubmit={handleSubmit}>
                        <div className="acoes">
                            <div className="acoes-img">
                                <div className="img-pequena-quadro">
                                    <img src={dados.imagem}/>
                                </div>
                                <div className="add-img">
                                    <label htmlFor="image-input" tabIndex={0} className="input-estilizado" ref={labelRef}>
                                        <span className="" ref={textSpanRef}></span>
                                    </label>
                                    <input type="file" id="image-input" accept="image/*" name="imagem" ref={inputFileRef} onChange={(e) =>   
                                        setDados({...dados, imagem: e.target.files[0]})}/>
                                </div>
                            </div>
                            <div className="botoes-principais">
                                <button type="reset" className="botao-no-form" onClick={() => navigate(-1)}>Cancelar</button>
                                <button type="submit" className="botao-yes-form">Salvar alteração</button>
                            </div>
                        </div>
                        <div className="campos">
                            <div className="linhas-input">
                                <div className="linha-input">
                                    <label>Nome do quadro</label>
                                    <input type="text" value = {dados.quadro} className="input-maior" name="quadro" placeholder="Digite o nome do quadro" onChange={(e) => setDados({...dados, quadro: e.target.value})}></input>
                                </div>
                                
                                <div className="linha-dois-input">
                                    <div className="linha-input">
                                        <label>Preço</label>
                                        <input type="text" value = {dados.preco} name="preco" placeholder="Digite o preço" onChange={(e) => setDados({...dados, preco: e.target.value})}></input>
                                    </div> 
                                    <div className="linha-input"> 
                                        <label>Quantidade no estoque</label>
                                        <input type="text" value = {dados.estoque} name="estoque" placeholder="Digite o número de quadros" onChange={(e) => setDados({...dados, estoque: e.target.value})}></input>
                                    </div>
                                </div>
                                <div className="linha-dois-input">                                                    
                                    <div className="linha-input">
                                        <label>Categoria</label>
                                        <select id="categoriaSelect" name="categoria" onChange={(e) => setDados({...dados, categoria: e.target.value})}>
                                            {dados.categoria != '' ? (
                                                <>
                                                    <option key={dados.categoria_id} value={dados.categoria_id}>{dados.categoria}</option>
                                                    {categorias.map((categoria, index) => {
                                                
                                                        if (dados.categoria_id !== categoria.ID_categoria) {
                                                            return <option key={index} value={categoria.ID_categoria}>{categoria.tipoCategoria}</option>;
                                                        }
                                                        
                                                    })}
                                                </>
                                            ) : (
                                                <>
                                                    <option key="default" value="">Selecione a categoria do quadro</option>
                                                    {categorias.map((categoria, index) => 
                                                        <option key={index} value={categoria.ID_categoria}>{categoria.tipoCategoria}</option>
                                                    )}
                                                </>
                                            )}
                                        </select>

                                    </div>                                
                                    <div className="linha-input">
                                        <label>Tamanho</label>
                                        <input type="text" value = {dados.tamanho} name="tamanho" placeholder="Digite a dimensáo do quadro" onChange={(e) => setDados({...dados, tamanho: e.target.value})}></input>
                                    </div>
                                </div>  
                                <div className="linha-dois-input-add">                          
                                    <div className="linha-input">
                                        <label>Cor da moldura</label>
                                        <input type="text" value = {dados.cor} name="cor" placeholder="Selecione a cor da moldura" onChange={(e) => setDados({...dados, cor: e.target.value})}></input>
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
                                <textarea value = {dados.descricao} name="descricao" maxLength={500} placeholder="Escreva uma descrição breve sobre o produto. Ela aparecerá embaixo do nome do produto." onChange={(e) => setDados({...dados, descricao: e.target.value})}>
                                </textarea>
                                <span>0/500 CARÁCTERES</span>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            {notifSucesso && (
                <div className='box_notificacao_sucesso'>
                    <div className='notificacao_sucesso'>
                        <h1>Quadro atualizado com sucesso!</h1>
                        <button onClick={() => navigate(-1)}>Continuar</button>
                    </div>
                </div>
            )}
        </div>
    );
}
    

export default EditProduto;