import React, {createContext, useState} from "react";

export const HandleContext = createContext()
export const HandleDataContext = createContext()
export const HandleCarrinhoContext = createContext()
export const HandleTipoUsuario = createContext()

export const HandleProvider = ({children}) => {
    const [variavel, setVariavel] = useState(false);

    return(
        <HandleContext.Provider value={{ variavel, setVariavel}}>
            {children}
        </HandleContext.Provider>
    )
}

export const HandleDataProvider = ({children}) => {
    const [dadosProduto, setDadosProduto] = useState({})

    return(
        <HandleDataContext.Provider value={{dadosProduto, setDadosProduto}}>
            {children}
        </HandleDataContext.Provider>
    )
}

export const HandleCarrinhoProvider = ({children}) => {
    const [dadosCarrinho, setDadosCarrinho] = useState([])

    return(
        <HandleCarrinhoContext.Provider value={{dadosCarrinho, setDadosCarrinho}}>
            {children}
        </HandleCarrinhoContext.Provider>
    )
}

export const HandleTipoUsuarioProvider = ({children}) => {
    const [tipoUsuario, setTipoUsuario] = useState('')

    return(
        <HandleTipoUsuario.Provider value={{tipoUsuario, setTipoUsuario}}>
            {children}
        </HandleTipoUsuario.Provider>
    )
}
