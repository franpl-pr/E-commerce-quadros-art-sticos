import React, {createContext, useState} from "react";

export const HandleContext = createContext()
export const HandleDataContext = createContext()
export const HandleCarrinhoContext = createContext()

export const HandleProvider = ({children}) => {
    const [variavel, setVariavel] = useState(false);
    const [statusCompra, setStatusCompra] = useState('');

    const mudarVariavel = () => {
        setVariavel(variavel === false ? true : false);
    }

    return(
        <HandleContext.Provider value={{ variavel, mudarVariavel, statusCompra, setStatusCompra }}>
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

export const useHandleContext = () => useContext(HandleContext);
