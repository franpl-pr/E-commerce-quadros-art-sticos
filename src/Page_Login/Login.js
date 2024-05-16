import React, {useState} from 'react';
import './login_style.css';
import image_google from '../img/image_google.png';
import image_email from '../img/image_email.png';
import { FaEyeSlash, FaEye } from "react-icons/fa";
import { useNavigate } from 'react-router-dom';
import axios from 'axios';
 
function Login() {
  const [alterarSenha, setAlterarSenha] = useState(true);
  const [email, setEmail] = useState('');
  const [senha, setSenha] = useState('');
  const [notificacao, setNotificacao] = useState(false);
  const [msgCampos, setMsgCampos] = useState(false);
  const navigate = useNavigate();

  const handleSubmit = async () => {

    if(email == '' || senha == ''){
      setMsgCampos(true)
    }else{
      try {
        // Faça a requisição POST para o backend
        const response = await axios.post('http://localhost:5000/api/Logar_usuario', {
        email: email,
        senha: senha
        });

        const nota = response.data.mensagem
        
        if(nota == 'Usuário encontrado'){

          navigate('/Home')
        }
        if(nota == 'Usuário não encontrado'){
          setNotificacao(true)
          setMsgCampos(false)
        }
      } catch (error) {
        console.error('Erro ao enviar dados para o servidor:', error);
      }
    }

  }

  return (
    <div className="container_login">
      <div className="box1" id='box1'></div>
      <div className="box2">
        <div className='box2_box'>
          <h1>QuadrArtes</h1>
          <h2>Entre no QuadrArtes</h2>
          <div className="atalho">
            <button type="submit"><div className='inside'>
              <img src={image_google} alt='Image google'/>
              <p>Entrar com Google</p>
            </div></button>
            <button type="submit"><div className='inside'>
              <img src={image_email} alt='Image email'/>
              <p>Entrar com Email</p>
            </div></button>
          </div>
          <div className='or'>
            <h2>OU</h2>
          </div>
          <div className='div_input'>
            <input 
              type="email"  
              placeholder='E-mail' 
              className='email'
              name="email" 
              onChange={(e) => setEmail(e.target.value)}
              autoComplete='off'
              />
            <div className='linha'></div>
            <input 
              type={alterarSenha ? 'password' : 'text'} 
              placeholder='Senha' 
              className='senha'
              id='senha'
              name="senha"
              onChange={(e) => setSenha(e.target.value)}
              autoComplete='off'
            />
            <button onClick={() => setAlterarSenha(!alterarSenha)} 
            className='olho'
            id='mostrarSenha'>
            {alterarSenha ? <FaEyeSlash size={21}/> : <FaEye size={21}/>}
            </button>
            <div className='linha'></div>
          </div>
          {notificacao && (
            <div className='login_notificacao'>
              <span>E-mail ou senha incorretos</span>
            </div>
          )}
          {msgCampos && (
            <div className='login_notificacao'>
              <span>Preencha todos os campos</span>
            </div>
          )}
          <div className="box_esqSenha_LembMim">
            <div className='lembrar_mim'>
              <input 
                type='checkbox' 
                className='Checkbox_LembMim' 
                id='Lembrar'
              />
              <label className='label_LebMim'>Lembrar login</label>
            </div>
            <a>Esqueceu a senha?</a>
          </div>
          <div className='div_button'>
            <button onClick={handleSubmit} type="submit" className='entrar'>Entrar</button>
            <div className='cadastro_div_conta'>
              <span>Ainda não possuí uma conta?</span>
              <a onClick={() => navigate("/Cadastro")}>Cadastre-se</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}

export default Login;
