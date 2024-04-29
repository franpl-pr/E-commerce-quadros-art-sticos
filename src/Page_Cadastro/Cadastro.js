import React, {useState} from 'react';
import './cadastro_style.css';
import image_google from '../img/image_google.png';
import image_email from '../img/image_email.png';
import { useNavigate } from 'react-router-dom';
import Axios from "axios";

function Cadastro(){
    const navigate = useNavigate();
    const [values, setValues] = useState()

    const lidarMudancaValores = (value) => {
        setValues((prevValue) => ({
          ...prevValue,
          [value.target.name]: value.target.value,
        }))
      } 
    
      const clickButton = () =>{
        Axios.post("http://localhost:3001/Registro", {
            nome: values.nome,
            email: values.email,
            senha: values.senha,
            telefone: values.telefone,       
        }).then((response) => {
          console.log(response);
        })
      }

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
                            name="nome"
                            onChange={lidarMudancaValores}
                            />
                    </div>
                    <div className='cadastro_input'>
                        <input 
                            type='text' 
                            placeholder='E-mail'
                            name='email'
                            onChange={lidarMudancaValores} 
                            />
                    </div>
                    <div className='cadastro_input'>
                        <input 
                            type='text' 
                            placeholder='CPF'
                            name='CPF'
                            onChange={lidarMudancaValores}
                            />
                    </div>
                    <div className='cadastro_input'>
                        <input 
                            type='text' 
                            placeholder='Telefone'
                            name='telefone'
                            onChange={lidarMudancaValores}
                            />
                    </div>
                    <div className='cadastro_input_menor'>
                        <input 
                            type='text' 
                            placeholder='CEP'
                            name='CEP'
                            onChange={lidarMudancaValores}
                            />
                    </div>
                    <div className='cadastro_input_menor'>
                        <input 
                            type='text' 
                            placeholder='Número'
                            name='numero'
                            onChange={lidarMudancaValores}
                            />
                    </div>
                    <div className='cadastro_input'>
                        <input 
                            type='text' 
                            placeholder='Endereço'
                            name='endereco'
                            onChange={lidarMudancaValores}
                            />
                    </div>
                    <div className='cadastro_input_menor'>
                        <input 
                            type='text' 
                            placeholder='País'
                            name='pais'
                            onChange={lidarMudancaValores}
                            />
                    </div>
                    <div className='cadastro_input_menor'>
                        <input 
                            type='text' 
                            placeholder='Estado'
                            name='estado'
                            onChange={lidarMudancaValores}
                            />'
                    </div>
                    <div className='cadastro_input_menor'>
                        <input 
                            type='text'
                            placeholder='Cidade'
                            name='cidade'
                            onChange={lidarMudancaValores}
                            />
                    </div>
                    <div className='cadastro_input_menor'>
                        <input 
                            type='text' 
                            placeholder='Bairro, Avenida...'
                            name='bairro'
                            onChange={lidarMudancaValores}
                            />
                    </div>
                    <div className='cadastro_input'>
                        <input 
                            type='password' 
                            placeholder='Senha'
                            name='senha'
                            onChange={lidarMudancaValores}
                            />
                    </div>
                    <div className='cadastro_input'>
                        <input 
                            type='password' 
                            placeholder='Confirme a senha'
                            name='confirma_senha'
                            onChange={lidarMudancaValores}
                            />
                    </div>
                </div>
                <div className='cadastro_termos'>
                    <input type='checkbox' className='cadastro_checkbox_termos' id='Lembrar'/>
                    <label>Eu concordo com os termos e condições</label>
                </div>
                <div className='cadastro_div_button'>
                    <button onClick={clickButton} type="submit" className='cadastro_cadastrar'>Cadastrar</button>
                </div>
                <div className='cadastro_div_conta'>
                    <span>Já possui uma conta?</span>
                    <a onClick={() => navigate("/Login")}>Faça login</a>
                </div>
            </div>
            <div className='cadastro_box_2'></div>
        </div>
    );
}

export default Cadastro;