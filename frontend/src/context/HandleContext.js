import React, {createContext, useState} from "react";

export const HandleContext = createContext()

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

export const HandleData = ({children}) => {
    const [dadosProduto, setDadosProduto] = useState({})

    return(
        <HandleContext.Provider value={{dadosProduto, setDadosProduto}}>
            {children}
        </HandleContext.Provider>
    )
}

export const useHandleContext = () => useContext(HandleContext);
