function formatarDinheiro(valor) {
    // Converte o valor para um número
    const numero = Number(valor);
    
    // Verifica se a conversão resultou em um número válido
    if (isNaN(numero)) {
        return "Valor inválido";
    }

    // Formata o número como moeda brasileira
    return numero.toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' });
}


export default formatarDinheiro;