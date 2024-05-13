from flask import Flask, request, jsonify
import mysql.connector
from flask_cors import CORS



app = Flask(__name__)
CORS(app, origins="*", supports_credentials=True)

#------------------------- Cadastro ----------------------------

@app.route('/api/cadastro_usuario', methods=['POST'])
def inserir_usuario():
    # Obter os dados do corpo da requisição
    dados = request.json
    nome = dados['nome']
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

    comando_consultar_dados = "SELECT * FROM usuarios WHERE email = '{email}'"
    cursor.execute(comando_consultar_dados)
    resultado = cursor.fetchone()

    if resultado:
        return jsonify({'mensagem': 'Usuário já cadastrado tente novamente'})
    

    else:
    # Montar e executar o comando SQL para inserir o usuário
        comando_inserir_dados = f"INSERT INTO usuarios (nomeCompleto, email, senha) VALUES ('{nome}', '{email}', '{senha}')"
        cursor.execute(comando_inserir_dados)
        conexao.commit() # edita o banco de dados
        
    

    # Retornar uma resposta JSON indicando sucesso
    return jsonify({'mensagem': 'Usuário cadastrado com sucesso'})

    # Fechar o cursor e a conexão com o banco de dados
    cursor.close()
    conexao.close()



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


if __name__ == '__main__':
    app.run(debug=True)


#------------------------- Cadastro Produtos----------------------------

@app.route('/api/cadastro_produto', methods=['POST'])
def inserir_produto():
    # Obter os dados do corpo da requisição
    dados = request.json
    quadro = dados['nomeQuadro']
    imagem = request.files['imagem'].read()
    preco = dados['preco']
    estoque = dados['estoque']
    tamanho = dados['tamanho']
    cor = dados['cor']
    categoria = dados['categoria']
    descricao = dados['descricao']

    # Conectar ao banco de dados
    conexao = mysql.connector.connect(
        host='localhost',
        user='root',
        password='123456',  
        database='quadrartes',
    )
    cursor = conexao.cursor()

    comando_consultar_dados = "SELECT * FROM produtos WHERE imagem = '{imagem}'"
    cursor.execute(comando_consultar_dados, (imagem))
    resultado = cursor.fetchone()

    if resultado:
        return jsonify({'mensagem': 'Quadro já cadastrado!'})
    

    else:
    # Montar e executar o comando SQL para inserir o usuário
        comando_inserir_dados = "INSERT INTO usuarios (nomeQuadro, preco, imagem, estoque, cor, categoria_id, tamanho, descricao) VALUES ('{quadro}', '{preco}', '{imagem}', '{cor}', '{categoria_id}', '{descricao},'{tamanho}')"
        cursor.execute(comando_inserir_dados)
        conexao.commit() # edita o banco de dados
        cursor.close()
        conexao.close()
    

    # Retornar uma resposta JSON indicando sucesso
    return jsonify({'mensagem': 'Quadro cadastrado com sucesso!'})
        
    

#----------------------------Categorias------------------------------
    
    
def obter_categorias_bd():
    # Conectar ao banco de dados
    conexao = mysql.connector.connect(
        host='localhost',
        user='root',
        password='123456',  
        database='quadrartes',
    )

    cursor = conexao.cursor()

    cursor.execute("SELECT ID_categoria, tipoCategoria FROM categoriasprodutos")
        
    categorias = cursor.fetchall()

    cursor.close()
    conexao.close()

    return categorias

@app.route('/api/categorias')
def obter_categorias():
    categorias = obter_categorias_bd()
    return jsonify(categorias)