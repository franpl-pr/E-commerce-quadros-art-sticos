import React, {useState} from 'react';
import './cadastro_style.css';
import image_google from '../img/image_google.png';
import image_email from '../img/image_email.png';
import { useNavigate } from 'react-router-dom';
import axios from "axios";

function Cadastro(){
    const navigate = useNavigate();
    const [nome, setNome] = useState('');
    const [email, setEmail] = useState('');
    const [CPF, setCPF] = useState('');
    const [telefone, setTelefone] = useState('');
    const [CEP, setCEP] = useState('');
    const [numero, setNumero] = useState('');
    const [endereco, setEndereco] = useState('');
    const [pais, setPais] = useState('');
    const [estado, setEstado] = useState('');
    const [cidade, setCidade] = useState('');
    const [bairro, setBairro] = useState('');
    const [senha, setSenha] = useState('');
    const [confSenha, setConfSenha] = useState('');
    const [termos, setTermos] = useState(false)
    const [notificacao, setNotificacao] = useState(false);
    const [notifSenha, setNotifSenha] = useState(false);
    const [notifSucesso, setNotifSucesso] = useState(false);
    const [notifEmail, setNotfEmail] = useState(false);
    const [notifTermos, setNotifTermos] = useState(false)
  
    const handleSubmit = async () => {
    {(nome == '' || email == '' || CPF == '' || telefone == ''|| CEP == ''|| numero == ''|| 
    endereco == ''|| pais == '' || estado == '' || cidade == '' || bairro == '' || senha == '' || confSenha == '') ? setNotificacao(true) 
    : setNotificacao(false)}

    {(senha != confSenha) ? setNotifSenha(true) : setNotifSenha(false)}

    {(termos == false) ? setNotifTermos(true) : setNotifTermos(false)}
        
    if(notificacao == false && notifSenha == false){
        try {
            // Faça a requisição POST para o backend
            const response = await axios.post('http://localhost:5000/api/cadastro_usuario', {
            nome: nome,
            email: email,
            senha: senha
            });

            const notifica_reposta = response.data.mensagem// Exiba a resposta do servidor no console se necessário
            console.log(notifica_reposta)
        
            
            if(notifica_reposta == 'Usuário cadastrado com sucesso'){
                setNotifSucesso(true)
            }if(notifica_reposta == 'Usuário já cadastrado tente novamente'){
                setNotfEmail(true)
            }
        } catch (error) {
            console.error('Erro ao enviar dados para o servidor:', error);
        }
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
                            onChange={(e) => setNome(e.target.value)}
                            autoComplete='off'
                            />
                    </div>
                    <div className='cadastro_input'>
                        <input 
                            type='text' 
                            placeholder='E-mail'
                            name='email'
                            onChange={(e) => setEmail(e.target.value)} 
                            autoComplete='off'
                            />
                    </div>
                    <div className='cadastro_input'>
                        <input 
                            type='text' 
                            placeholder='CPF'
                            name='CPF'
                            onChange={(e) => setCPF(e.target.value)} 
                            autoComplete='off'
                            />
                    </div>
                    <div className='cadastro_input'>
                        <input 
                            type='text' 
                            placeholder='Telefone'
                            name='telefone'
                            onChange={(e) => setTelefone(e.target.value)} 
                            autoComplete='off'
                            />
                    </div>
                    <div className='cadastro_input_menor'>
                        <input 
                            type='text' 
                            placeholder='CEP'
                            name='CEP'
                            onChange={(e) => setCEP(e.target.value)} 
                            autoComplete='off'
                            />
                    </div>
                    <div className='cadastro_input_menor'>
                        <input 
                            type='text' 
                            placeholder='Número'
                            name='numero'
                            onChange={(e) => setNumero(e.target.value)} 
                            autoComplete='off'
                            />
                    </div>
                    <div className='cadastro_input'>
                        <input 
                            type='text' 
                            placeholder='Endereço'
                            name='endereco'
                            onChange={(e) => setEndereco(e.target.value)} 
                            autoComplete='off'
                            />
                    </div>
                    <div className='cadastro_input_menor'>
                        <input 
                            type='text' 
                            placeholder='País'
                            name='pais'
                            onChange={(e) => setPais(e.target.value)} 
                            autoComplete='off'
                            />
                    </div>
                    <div className='cadastro_input_menor'>
                        <input 
                            type='text' 
                            placeholder='Estado'
                            name='estado'
                            onChange={(e) => setEstado(e.target.value)} 
                            autoComplete='off'
                            />
                    </div>
                    <div className='cadastro_input_menor'>
                        <input 
                            type='text'
                            placeholder='Cidade'
                            name='cidade'
                            onChange={(e) => setCidade(e.target.value)} 
                            autoComplete='off'
                            />
                    </div>
                    <div className='cadastro_input_menor'>
                        <input 
                            type='text' 
                            placeholder='Bairro, Avenida...'
                            name='bairro'
                            onChange={(e) => setBairro(e.target.value)} 
                            autoComplete='off'
                            />
                    </div>
                    <div className='cadastro_input'>
                        <input 
                            type='password' 
                            placeholder='Senha'
                            name='senha'
                            onChange={(e) => setSenha(e.target.value)}
                            autoComplete='off'
                            />
                    </div>
                    <div className='cadastro_input'>
                        <input 
                            type='password' 
                            placeholder='Confirme a senha'
                            name='confirma_senha'
                            onChange={(e) => setConfSenha(e.target.value)} 
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