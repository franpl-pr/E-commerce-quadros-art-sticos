import React, {createContext, useState} from "react";

export const HandleContext = createContext()
export const HandleDataContext = createContext()

export const HandleProvider = ({children}) => {
    const [variavel, setVariavel] = useState(false)

    return(
        <HandleContext.Provider value={{ variavel, setVariavel }}>
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
