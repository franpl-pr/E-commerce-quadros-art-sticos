import React from 'react';
import './cadastro_style.css';
import image_google from '../img/image_google.png';
import image_email from '../img/image_email.png';
import { useNavigate } from 'react-router-dom';
import conectar from '../Backend/server';

function Cadastro(){
    const navigate = useNavigate();

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
                        <input type='text' placeholder='Nome Completo'/>
                    </div>
                    <div className='cadastro_input'>
                        <input type='text' placeholder='E-mail'/>
                    </div>
                    <div className='cadastro_input'>
                        <input type='text' placeholder='CPF'/>
                    </div>
                    <div className='cadastro_input'>
                        <input type='text' placeholder='Telefone'/>
                    </div>
                    <div className='cadastro_input_menor'>
                        <input type='text' placeholder='CEP'/>
                    </div>
                    <div className='cadastro_input_menor'>
                        <input type='text' placeholder='Número'/>
                    </div>
                    <div className='cadastro_input'>
                        <input type='text' placeholder='Endereço'/>
                    </div>
                    <div className='cadastro_input_menor'>
                        <input type='text' placeholder='País'/>
                    </div>
                    <div className='cadastro_input_menor'>
                        <input type='text' placeholder='Estado'/>
                    </div>
                    <div className='cadastro_input_menor'>
                        <input type='text' placeholder='Cidade'/>
                    </div>
                    <div className='cadastro_input_menor'>
                        <input type='text' placeholder='Bairro, Avenida...'/>
                    </div>
                    <div className='cadastro_input'>
                        <input type='password' placeholder='Senha'/>
                    </div>
                    <div className='cadastro_input'>
                        <input type='password' placeholder='Confirme a senha'/>
                    </div>
                </div>
                <div className='cadastro_termos'>
                    <input type='checkbox' className='cadastro_checkbox_termos' id='Lembrar'/>
                    <label>Eu concordo com os termos e condições</label>
                </div>
                <div className='cadastro_div_button'>
                    <button type="submit" className='cadastro_cadastrar'>Cadastrar</button>
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