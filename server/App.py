from pickle import FALSE
from flask import Flask, request, jsonify
import mysql.connector
from flask_cors import CORS
from werkzeug.utils import secure_filename
import os


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
    password='1234',  
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
        password='YES',  
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

UPLOAD_FOLDER = 'D:/Projetos/projetos-react/E-commerce-quadros-art-sticos/src/img'
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER


@app.route('/api/cadastro_produto', methods=['POST'])

def inserir_produto():
    # Obter os dados do corpo da requisição
    dados = request.json
    quadro = dados['quadro']
    imagem = request.files['imagem']
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
        password='1234',  
        database='quadrartes',
    )
    # Verifique se a imagem foi enviada
    if 'imagem' not in request.files:
        return jsonify({'mensagem': 'Nenhuma imagem enviada!'})
    
    # Verifique se o arquivo de imagem tem um nome
    if imagem.filename == '':
        return jsonify({'mensagem': 'Nome de arquivo de imagem inválido!'}), 400
    
    # Verifique se a extensão do arquivo de imagem é válida
    if '.' not in imagem.filename or imagem.filename.split('.')[-1].lower() not in {'jpg', 'jpeg', 'png', 'gif'}:
        return jsonify({'mensagem': 'Formato de arquivo de imagem inválido!'}), 400

    # Salve o arquivo de imagem no servidor
    filename = secure_filename(imagem.filename)
    filepath = os.path.join(app.config['UPLOAD_FOLDER'], filename)
    imagem.save(filepath)

   
    cursor = conexao.cursor()

    comando_consultar_dados = f"SELECT * FROM produtos WHERE imagem = '{imagem}'"
    cursor.execute(comando_consultar_dados, (imagem))
    resultado = cursor.fetchone()

    if resultado:
        return jsonify({'mensagem': 'Quadro já cadastrado!'})
    

    else:
    # Montar e executar o comando SQL para inserir o usuário
        comando_inserir_dados = "INSERT INTO produtos (nomeQuadro, preco, imagem, estoque, cor, categoria_id, tamanho, descricao) VALUES (%s, %s, %s, %s, %s, %s, %s, %s)"
        valores = (quadro, preco, imagem, estoque, cor, 1, tamanho, descricao)
        cursor.execute(comando_inserir_dados, valores)
        conexao.commit() # edita o banco de dados
        cursor.close()
        conexao.close()
    

    # Retornar uma resposta JSON indicando sucesso
    return jsonify({'mensagem': 'Quadro cadastrado com sucesso'})

if __name__ == '__main__':
    app.run(debug=True)
       

#----------------------------Categorias------------------------------
    
    
# def obter_categorias_bd():
#     # Conectar ao banco de dados
#     conexao = mysql.connector.connect(
#         host='localhost',
#         user='root',
#         password='123456',  
#         database='quadrartes',
#     )

#     cursor = conexao.cursor()

#     cursor.execute("SELECT ID_categoria, tipoCategoria FROM categoriasprodutos")
        
#     categorias = cursor.fetchall()

    

#     return categorias

# @app.route('/api/categorias')
# def obter_categorias():
#     categorias = obter_categorias_bd()
#     return jsonify(categorias)
