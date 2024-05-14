import React, {useState} from 'react';
import './cadastro_style.css';
import image_google from '../img/image_google.png';
import image_email from '../img/image_email.png';
import { useNavigate } from 'react-router-dom';
import axios from "axios";

function Cadastro(){
    const navigate = useNavigate();
    
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
    
    const [termos, setTermos] = useState(false)
    const [notificacao, setNotificacao] = useState(false);
    const [notifSenha, setNotifSenha] = useState(false);
    const [notifSucesso, setNotifSucesso] = useState(false);
    const [notifEmail, setNotfEmail] = useState(false);
    const [notifTermos, setNotifTermos] = useState(false)
    
    const handleSubmit = async () => {
        setNotifTermos(false);
        setNotificacao(false);
        setNotifSenha(false);

        let Array_email = dados.email.split('');

        for(let i = 0; i < Array_email.length; i++){
            if(Array_email[i] == '@'){
                console.log('Achei um @');
            }
        }
        if(dados.email.indexOf())

        for(let valor in dados){
            if(dados[valor] == ''){
                setNotificacao(true)
                return;
            }
        }

        if(dados.senha != dados.confSenha){
            setNotifSenha(true)
            return;
        }

        if(termos == false){
            setNotifTermos(true)
            return;
        }
        

        try {
            // Faça a requisição POST para o backend
            const response = await axios.post('http://localhost:5000/api/cadastro_usuario', {
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

            const notifica_reposta = response.data.mensagem// Exiba a resposta do servidor no console se necessário
            console.log(notifica_reposta)
        
            if(notifica_reposta == 'Usuário já cadastrado, tente novamente'){
                setNotfEmail(true)
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
                    <div className='cadastro_input'>
                        <input  
                            type='text' 
                            placeholder='Nome Completo'
                            name='nome'
                            onChange={(e) => setDados({...dados, nome: e.target.value})}
                            autoComplete='off'
                            />
                    </div>
                    <div className='cadastro_input'>
                        <input 
                            type='text' 
                            placeholder='E-mail'
                            name='email'
                            onChange={(e) => setDados({...dados, email: e.target.value})}
                            autoComplete='off'
                            />
                    </div>
                    <div className='cadastro_input'>
                        <input 
                            type='text' 
                            placeholder='CPF'
                            name='CPF'
                            onChange={(e) => setDados({...dados, CPF: e.target.value})}
                            autoComplete='off'
                            />
                    </div>
                    <div className='cadastro_input'>
                        <input 
                            type='text' 
                            placeholder='Telefone'
                            name='telefone'
                            onChange={(e) => setDados({...dados, telefone: e.target.value})}
                            autoComplete='off'
                            />
                    </div>
                    <div className='cadastro_input_menor'>
                        <input 
                            type='text' 
                            placeholder='CEP'
                            name='CEP'
                            onChange={(e) => setDados({...dados, CEP: e.target.value})}
                            autoComplete='off'
                            />
                    </div>
                    <div className='cadastro_input_menor'>
                        <input 
                            type='text' 
                            placeholder='Número'
                            name='numero'
                            onChange={(e) => setDados({...dados, numero: e.target.value})}
                            autoComplete='off'
                            />
                    </div>
                    <div className='cadastro_input'>
                        <input 
                            type='text' 
                            placeholder='Endereço'
                            name='endereco'
                            onChange={(e) => setDados({...dados, endereco: e.target.value})}
                            autoComplete='off'
                            />
                    </div>
                    <div className='cadastro_input_menor'>
                        <input 
                            type='text' 
                            placeholder='País'
                            name='pais'
                            onChange={(e) => setDados({...dados, pais: e.target.value})}
                            autoComplete='off'
                            />
                    </div>
                    <div className='cadastro_input_menor'>
                        <input 
                            type='text' 
                            placeholder='Estado'
                            name='estado'
                            onChange={(e) => setDados({...dados, estado: e.target.value})}
                            autoComplete='off'
                            />
                    </div>
                    <div className='cadastro_input_menor'>
                        <input 
                            type='text'
                            placeholder='Cidade'
                            name='cidade'
                            onChange={(e) => setDados({...dados, cidade: e.target.value})}
                            autoComplete='off'
                            />
                    </div>
                    <div className='cadastro_input_menor'>
                        <input 
                            type='text' 
                            placeholder='Bairro, Avenida...'
                            name='bairro'
                            onChange={(e) => setDados({...dados, bairro: e.target.value})}
                            autoComplete='off'
                            />
                    </div>
                    <div className='cadastro_input'>
                        <input 
                            type='password' 
                            placeholder='Senha'
                            name='senha'
                            onChange={(e) => setDados({...dados, senha: e.target.value})}
                            autoComplete='off'
                            />
                    </div>
                    <div className='cadastro_input'>
                        <input 
                            type='password' 
                            placeholder='Confirme a senha'
                            name='confirma_senha'
                            onChange={(e) => setDados({...dados, confSenha: e.target.value})} 
                            autoComplete='off'
                            />
                    </div>
                </div>
                {notificacao && (
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