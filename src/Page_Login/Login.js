import React, {useState} from 'react';
import './login_style.css';
import image_google from '../img/image_google.png';
import image_email from '../img/image_email.png';
import { FaEyeSlash, FaEye } from "react-icons/fa";
import { useNavigate } from 'react-router-dom';
 
function Login() {
  const [alterarSenha, setAlterarSenha] = useState(true);
  const navigate = useNavigate();

  return (
    <div className="container">
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
            <input type="email"  placeholder='E-mail' className='email'></input>
            <div className='linha'></div>
            <input type={alterarSenha ? 'password' : 'text'} 
            placeholder='Senha' 
            className='senha'
            id='senha'>
            </input>
            <button onClick={() => setAlterarSenha(!alterarSenha)} 
            className='olho'
            id='mostrarSenha'>
              {alterarSenha ? <FaEyeSlash size={21}/> : <FaEye size={21}/>}
              </button>
            <div className='linha'></div>
          </div>
          <div className="box_esqSenha_LembMim">
            <div className='lembrar_mim'>
              <input type='checkbox' className='Checkbox_LembMim' id='Lembrar'/>
              <label className='label_LebMim'>Lembrar login</label>
            </div>
            <a>Esqueceu a senha?</a>
          </div>
          <div className='div_button'>
            <button onClick={() => navigate("/Home")} type="submit" className='entrar'>Entrar</button>
            <button onClick={() => navigate("/Cadastro")} id='cadastrar' type="submit" className='cadastrar'>Cadastrar agora</button>
          </div>
        </div>
      </div>
    </div>
  );
}

export default Login;
