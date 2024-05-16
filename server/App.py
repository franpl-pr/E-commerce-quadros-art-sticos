from pickle import FALSE
from flask import Flask, request, jsonify
import mysql.connector
from flask_cors import CORS;


app = Flask(__name__)
CORS(app, origins="*", supports_credentials=True)

#------------------------- Cadastro ----------------------------

@app.route('/api/cadastro_usuario', methods=['POST'])
def inserir_usuario():
    # Obter os dados do corpo da requisição
    dados = request.json
    nome = dados['nome']
    email = dados['email']
    cpf = dados['CPF']
    telefone = dados['telefone']
    cep = dados['CEP']
    numero = dados['numero']
    endereco = dados['endereco']
    pais = dados['pais']
    estado = dados['estado']
    cidade = dados['cidade']
    bairro = dados['bairro']
    senha = dados['senha']
    confSenha = dados['confSenha']
    
    # Conectar ao banco de dados
    conexao = mysql.connector.connect(
    host='localhost',
    user='root',
    password='123456',  
    database='quadrartes',
    )
    cursor = conexao.cursor()

    comando_consultar_dados = f"SELECT * FROM usuarios WHERE email = '{email}'"
    cursor.execute(comando_consultar_dados)
    resultado = cursor.fetchone()

    if resultado:
        return jsonify({'mensagem': 'Usuário já cadastrado, tente novamente'})

    else:
        # Montar e executar o comando SQL para inserir o usuário
        comando_inserir_dados = f"INSERT INTO usuarios (nomeCompleto, email, senha) VALUES ('{nome}', '{email}', '{senha}')"
        cursor.execute(comando_inserir_dados)
        conexao.commit() # edita o banco de dados
            
        cursor.close()
        conexao.close()

        # Retornar uma resposta JSON indicando sucesso
        return jsonify({'mensagem': 'Usuário cadastrado com sucesso'})

        # Fechar o cursor e a conexão com o banco de dados


#------------------------- Login ----------------------------

@app.route('/api/Logar_usuario', methods=['POST'])
def consultar_usuario():
    # Obter os dados do corpo da requisição
    dados = request.json
    email = dados['email']
    senha = dados['senha']

    # Conectar ao banco de dados
    conexao = mysql.connector.connect(
        host='localhost',
        user='root',
        password='123456',  
        database='quadrartes',
    )
    cursor = conexao.cursor()

    # Montar e executar o comando SQL para consultar o usuário
    comando_consultar_dados = f"SELECT * FROM usuarios WHERE email = '{email}' AND senha = '{senha}';"
    cursor.execute(comando_consultar_dados)
    resultado = cursor.fetchall()  # Recupera o primeiro resultado encontrado

    cursor.close()
    conexao.close()

    # Verifica se o usuário foi encontrado
    if resultado:
        return jsonify({'mensagem': 'Usuário encontrado'})
    else:
        return jsonify({'mensagem': 'Usuário não encontrado'})


#------------------------- Cadastro Produtos----------------------------


@app.route('/api/cadastro_produto', methods=['POST'])
def inserir_produto():
    # Obter os dados do corpo da requisição
    dados = request.json
    quadro = dados['quadro']
    imagem = dados['imagem']
    preco = dados['preco']
    estoque = dados['estoque']
    tamanho = dados['tamanho']
    cor = dados['cor']
    # categoria = dados['categoria']
    descricao = dados['descricao']

     # Conectar ao banco de dados
    conexao = mysql.connector.connect(
        host='localhost',
        user='root',
        password='123456',  
        database='quadrartes',
    )

    cursor = conexao.cursor()

    # Montar e executar o comando SQL para inserir o usuário
    comando_inserir_dados = f"INSERT INTO produtos (nomeQuadro, preco, imagem, estoque, cor, tamanho, descricao) VALUES ('{quadro}', '{preco}', '{imagem}', {estoque}, '{cor}', '{tamanho}', '{descricao}')"
    cursor.execute(comando_inserir_dados)
    conexao.commit() # edita o banco de dados

    cursor.close()
    conexao.close()
    
    # Retornar uma resposta JSON indicando sucesso
    return jsonify({'mensagem': 'Quadro cadastrado com sucesso'})

if __name__ == '__main__':
    app.run(debug=True)
       


