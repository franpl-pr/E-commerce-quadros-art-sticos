import React, {useState, useEffect} from "react";
import './barradb_style.css';
import { LuSearch } from "react-icons/lu";
import axios from "axios";


function BarraDb({idUsuario}){
    const [usuario, setUsuario] = useState('');
    const [nome, setNome] = useState('');
    useEffect(() => {
        
                axios.get(`http://localhost:5000/procurar_usuario/${idUsuario}`)
                .then(response => {
                    setUsuario(response.data);
                    
                    setNome(response.data.nomeCompleto);
                    
                })
                .catch(error => {
                    console.error("Erro ao procurar usuario!", error);
                });
                console.log(usuario);
                console.log(nome);
                console.log(usuario.nomeCompleto);
    }, [idUsuario]); 
    return(
        <div className="barraDb">
            <div className="pesquisa">
                <LuSearch size={25}></LuSearch>
            </div>
                <div className="perfil-completo">
                    <div className="img-perfil"></div>
                    <div className="texto-perfil">
                        <span className="nome">{usuario.nomeCompleto}</span>
                        <span className="tipo">{usuario.genero === 'Masculino' ? 'Vendedor' : 'Vendedora'}</span>
                    </div>
                </div>
            
        </div>
    )
}

export default BarraDb;

