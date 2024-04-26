import React, {useState} from "react";
import './navbar_style.css';
import { IoSearch } from "react-icons/io5";
import { FaRegHeart } from "react-icons/fa";
import { HiOutlineShoppingCart } from "react-icons/hi";
import { MdOutlinePerson } from "react-icons/md";
import { useNavigate } from "react-router-dom";

function Navbar(){
    const navigate = useNavigate();
    const [carrinhoAberto, setcarrinhoAberto] = useState(false);

    const abrirCarrinho = () => {
        setcarrinhoAberto(true);
    };

    const fecharCarrinho = () => {
        setcarrinhoAberto(false);
    }
    

    return(
        <div className="navbar">
            <div className="div_logo">
                <h1 className="logo">Quadrartes</h1>
            </div>
            <div className="div_navegar">
                <a href="#">Categorias</a>
                <a href="#">Artistas</a>
                <a onClick={() => navigate("/Quadros")}>Quadros</a>
                <a href="#">Oferatas</a>
            </div>
            <div className="div_icons">
                <IoSearch className="icons" size={32}/>
                <FaRegHeart className="icons" size={32}/>
                <HiOutlineShoppingCart onMouseOver={abrirCarrinho} className="icons" size={32}/>
                {carrinhoAberto && (
                        <div onMouseLeave={fecharCarrinho} className="carrinho_box">
                            <div className="carrinho_div">

                            </div>
                        </div>
                )}
                {true ? <MdOutlinePerson className="icons" size={32}/> : <button>Entrar</button>}
            </div>
        </div>
    )
}

export default Navbar;