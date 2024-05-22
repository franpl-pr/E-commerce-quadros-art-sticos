import React, {useState} from 'react';
import './cadastro_style.css';
import image_google from '../img/image_google.png';
import image_email from '../img/image_email.png';
import { useNavigate } from 'react-router-dom';
import { FaEyeSlash, FaEye } from "react-icons/fa";
import { IoSearch } from "react-icons/io5";
import api from './api';
import axios from "axios";

function Cadastro(){
    const navigate = useNavigate();
    const [alterarSenha, setAlterarSenha] = useState(true);
    const [cep, setCep] = useState({});

    // Criando um objeto useState(), para os inputs    

    const [dados, setDados] = useState({
        nome: '',
        email: '',
        CPF: '',
        telefone: '',
        CEP: '',
        numero: '',
        endereco: '',
        pais: '',
        estado: '',
        cidade: '',
        bairro: '',
        senha: '',
        confSenha: ''
    })

    // Criando as variáveis de notficação useState()

    const [notifEmail, setNotifEmail] = useState(false)
    const [notifSenha, setNotifSenha] = useState(false)
    const [notifTermos, setNotifTermos] = useState(false)
    const [notifSucesso, setNotifSucesso] = useState(false)
    const [notifCampos, setNotifCampos] = useState(false)
    const [termos, setTermos] = useState(false)
    const [EmailValido, setEmailValido] = useState(false)

    const [arroba, setArroba] = useState('')

    const handleSearch = async () => {
        try {
          const response = await api.get(`${dados.CEP}/json`);
          const cepData = response.data;
          
          console.log('Cidade:' + cepData.localidade);
          console.log('Complemento:' + cepData.complemento);
          console.log('Bairro:' + cepData.bairro);
          console.log('Logradouro:' + cepData.logradouro);
          console.log('UF:' + cepData.uf);
    
          setCep(cepData);
    
          if (cepData.localidade) {
            setDados({
              ...dados,
              endereco: cepData.logradouro || '',
              estado: cepData.uf || '',
              bairro: cepData.bairro || '',
              cidade: cepData.localidade || '',
              pais: 'Brasil' || ''
            });
          }
        } catch (error) {
          console.log('Erro ao se comunicar com a API: ' + error);
        }
    };

    // Criando o método handleSubmite (Lidando com o envio), para fazer as restrições e integração com o BD

    const handleSubmit = async () => {
        setNotifEmail(false)
        setNotifSenha(false)
        setNotifTermos(false)
        setNotifCampos(false)    
        setEmailValido(false)    

        //Vendo se tem algum input vazio, e se sim mostrar uma notificação

        for(let valor in dados){
            if(dados[valor] == ''){
                setNotifCampos(true)
                console.log('Dados não inseridos')
                return;
            }
        }
        
        //Tranformando o campo email em vetor

        let Array_email = dados.email.split('');

        //Percorrendo o vetor do email para poder ver se tem algum "@"

        for(let i = 0; i < Array_email.length; i++){
            if(Array_email[i] == '@'){
                setArroba('Arroba encontrado')
                console.log('Tem um arroba')
            }else{
                console.log('não tem arroba')
            }
        }

        //Procurando na String digitada se tem algum ".com" ou ".br" para validar o email

        if(dados.email.indexOf(".com") !== -1 || dados.email.indexOf(".br") !== -1 && arroba == 'Arroba encontrado'){
            console.log('Email Válido')
        }else{
            setEmailValido(true)                //Informando se o email é valido
            console.log('Email Invalido')
            return;
        }

        //Conferindo se a senha é igual ao confirmar senha

        if(dados.senha != dados.confSenha){
            setNotifSenha(true)
            console.log('Senhas não identicas')
            return;
        }

        //Conferindo se o checkbox "termos" está selecionado

        if(termos == false){
            setNotifTermos(true)
            console.log('Termos não aceitos')
            return;
        }
        
        //Tendo fazer a integração com o banco de dados enviando os dados preenchidos 

        try {
            // Faça a requisição POST para o backend
            const response = await axios.post('http://localhost:5000/cadastro_usuario', {
                nome: dados.nome,
                email: dados.email,
                CPF: dados.CPF,
                telefone: dados.telefone,
                CEP: dados.CEP,
                numero: dados.numero,
                endereco: dados.endereco,
                pais: dados.pais,
                estado: dados.estado,
                cidade: dados.cidade,
                bairro: dados.bairro,
                senha: dados.senha,
                confSenha: dados.confSenha
            });

            const notifica_reposta = response.data.mensagem
            console.log(notifica_reposta)
        
            if(notifica_reposta == 'Usuário já cadastrado, tente novamente'){
                setNotifEmail(true) 
            }else if(notifica_reposta == 'Usuário cadastrado com sucesso'){
                setNotifSucesso(true)
            }
    
        } catch (error) {   
            console.error('Erro ao enviar dados para o servidor:', error);
        }
    };

    return( 
        <div className='cadastro_Container'>
            <div className='cadastro_box'>
                <h1>QuadrArtes</h1>
                <h2>Entre no QuadrArtes</h2>
                <div className="cadastro_atalho">
                    <button type="submit">
                        <div className='cadastro_atalho_inside'>
                            <img src={image_google} alt='Image google'/>
                            <p>Cadastrar com o Google</p>
                        </div>
                    </button>
                    <button type="submit">
                        <div className='cadastro_atalho_inside'>
                            <img src={image_email} alt='Image email'/>
                            <p>Cadastrar com o Email</p>
                        </div>
                    </button>
                </div>
                <div className='cadastro_div_or'>
                    <h2>OU</h2>
                </div>
                <div className='cadastro_divs_inputs'>
                    <div className='cadastro_input_maior'>
                        <input  
                            type='text' 
                            placeholder='Nome Completo'
                            name='nome'
                            onChange={(e) => setDados({...dados, nome: e.target.value})}
                            autoComplete='off'
                            />
                    </div>
                    <div className='cadastro_input_maior'>
                        <input 
                            type='email'
                            placeholder='E-mail'
                            name='email'
                            onChange={(e) => setDados({...dados, email: e.target.value})}
                            autoComplete='off'
                            />
                    </div>
                    <div className='cadastro_input_maior'>
                        <input 
                            type='number' 
                            placeholder='CPF'
                            name='CPF'
                            onChange={(e) => setDados({...dados, CPF: e.target.value})}
                            autoComplete='off'
                            />
                    </div>
                    <div className='cadastro_input_maior'>
                        <input 
                            type='number' 
                            placeholder='Telefone'
                            name='telefone'
                            onChange={(e) => setDados({...dados, telefone: e.target.value})}
                            autoComplete='off'
                            />
                    </div>
                    <div className='cadastro_input_menor_personalizado'>
                        <input 
                            type='number' 
                            placeholder='CEP'
                            value={dados.CEP}
                            name='CEP'
                            onChange={(e) => setDados({...dados, CEP: e.target.value})}
                            autoComplete='off'
                        />
                        <button
                            className='icon_pesquisar_cep'
                            onClick={handleSearch}
                            >
                            <IoSearch size={26}/>
                        </button>
                    </div>
                    <div className='cadastro_input_menor'>
                        <input 
                            type='number' 
                            placeholder='Número'
                            name='numero'
                            onChange={(e) => setDados({...dados, numero: e.target.value})}
                            autoComplete='off'
                        />
                    </div>
                    <div className='cadastro_input_maior'>
                        <input 
                            type='text' 
                            placeholder='Endereço'
                            name='endereco'
                            value={dados.endereco}
                            onChange={(e) => setDados({...dados, endereco: e.target.value})}
                            autoComplete='off'
                        />
                    </div>
                    <div className='cadastro_input_menor'>
                        <input 
                            type='text' 
                            placeholder='País'
                            name='pais'
                            value={dados.pais}
                            onChange={(e) => setDados({...dados, pais: e.target.value})}
                            autoComplete='off'
                        />
                    </div>
                    <div className='cadastro_input_menor'>
                        <input 
                            type='text' 
                            placeholder='Estado'
                            value={dados.estado}
                            name='estado'
                            onChange={(e) => setDados({...dados, estado: e.target.value})}
                            autoComplete='off'
                        />
                    </div>
                    <div className='cadastro_input_menor'>
                        <input 
                            type='text'
                            placeholder='Cidade'
                            value={dados.cidade}
                            name='cidade'
                            onChange={(e) => setDados({...dados, cidade: e.target.value})}
                            autoComplete='off'
                        />
                    </div>
                    <div className='cadastro_input_menor'>
                        <input 
                            type='text' 
                            placeholder='Bairro, Avenida...'
                            value={dados.bairro}
                            name='bairro'
                            onChange={(e) => setDados({...dados, bairro: e.target.value})}
                            autoComplete='off'
                        />
                    </div>
                    <div className='cadastro_input_personalizado'>
                        <input 
                            type={alterarSenha ? 'password' : 'text'}  
                            placeholder='Senha'
                            name='senha'
                            onChange={(e) => setDados({...dados, senha: e.target.value})}
                            autoComplete='off'
                            maxLength={8}
                        />
                        <button onClick={() => setAlterarSenha(!alterarSenha)} 
                            className='olho'
                            id='mostrarSenha'>
                            {alterarSenha ? <FaEyeSlash size={21}/> : <FaEye size={21}/>}
                        </button>
                    </div>
                    <div className='cadastro_input_personalizado'>
                        <input 
                            type={alterarSenha ? 'password' : 'text'}  
                            placeholder='Confirme a senha'
                            name='confirma_senha'
                            onChange={(e) => setDados({...dados, confSenha: e.target.value})} 
                            autoComplete='off'
                            maxLength={8}
                        />
                        <button onClick={() => setAlterarSenha(!alterarSenha)} 
                            className='olho'
                            id='mostrarSenha'>
                            {alterarSenha ? <FaEyeSlash size={21}/> : <FaEye size={21}/>}
                        </button>
                    </div>
                </div>
                {notifCampos && (
                    <div className='notificacao'>
                        <span>Todos os dados precisam ser obrigatóriamente preenchidos !</span>
                    </div>
                )}
                {notifSenha && (
                    <div className='notificacao_senhas'>
                        <span>As senhas inseridas não são idênticas. Tente novamente</span>
                    </div>
                )}
                {notifEmail && (
                    <div className='notificacao'>
                        <span>Email já cadastrado. Tente novamente !</span>
                    </div>
                )}
                {EmailValido && (
                    <div className='notificacao'>
                        <span>Email inválido, Insira um email válido !</span>
                    </div>
                )}
                <div className='cadastro_termos'>
                    <input 
                        type='checkbox' 
                        className='cadastro_checkbox_termos' 
                        id='Lembrar'
                        onClick={() => setTermos(!termos)}
                    />
                    <label>Eu concordo com os termos e condições</label>
                </div>
                {notifTermos && (
                    <div className='notificacao_termos'>
                        <span>Obrigatório aceitar termos e condições</span>
                    </div>
                )}
                <div className='cadastro_div_button'>
                    <button onClick={handleSubmit} type="submit" className='cadastro_cadastrar'>Cadastrar</button>
                </div>
                <div className='cadastro_div_conta'>
                    <span>Já possui uma conta?</span>
                    <a onClick={() => navigate("/Login")}>Faça login</a>
                </div>
            </div>
            <div className='cadastro_box_2'></div>
            {notifSucesso && (
                <div className='box_notificacao_sucesso'>
                    <div className='notificacao_sucesso'>
                        <h1>Cadastro realizado com sucesso !</h1>
                        <button onClick={() => navigate("/Login")}>Continuar</button>
                    </div>
                </div>
            )}
        </div>
    );
}

export default Cadastro;