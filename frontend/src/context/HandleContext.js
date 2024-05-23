import React, {createContext, useState} from "react";

export const HandleContext = createContext()

export const HandleProvider = ({children}) => {
    const [variavel, setVariavel] = useState(false)

    const mudarVariavel = () => {
        setVariavel(variavel == false ? true : false);
    }

    return(
        <HandleContext.Provider value={{ variavel, mudarVariavel }}>
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
