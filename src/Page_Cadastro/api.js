import axios from "axios";

//01310930/json/

const api = axios.create({
    baseURL: "https://viacep.com.br/ws/"
})

export default api;