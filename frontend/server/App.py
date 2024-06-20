from flask import Flask, request, jsonify
import mysql.connector
from flask_cors import CORS
# from apimercadopago import gerar_link_pagamento
import mercadopago


app = Flask(__name__)
# CORS(app, resources={r"/api/*": {"origins": "http://localhost:3000"}})
CORS(app, origins="*", supports_credentials=True)

db_config = {
    'host':'localhost',
    'user':'root',
    'password':'',  
    'database':'dbquadrartes',

}

#------------------------- Cadastro ----------------------------

@app.route('/cadastro_usuario', methods=['POST'])
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
    tipo = dados['tipo']
    
    # Conectar ao banco de dados
    conexao = mysql.connector.connect(**db_config)

    cursor = conexao.cursor()

    comando_consultar_dados = f"SELECT * FROM usuarios WHERE email = '{email}'"
    cursor.execute(comando_consultar_dados)
    resultado = cursor.fetchone()

    if resultado:
        return jsonify({'mensagem': 'Usuário já cadastrado, tente novamente'})

    else:
        # Montar e executar o comando SQL para inserir o usuário
        comando_inserir_dados = f"INSERT INTO usuarios (nomeCompleto, email, senha, telefone, tipo) VALUES ('{nome}', '{email}', '{senha}', '{telefone}', '{tipo}')"
        cursor.execute(comando_inserir_dados)
        conexao.commit() # edita o banco de dados
            
        # Fechar o cursor e a conexão com o banco de dados
        cursor.close()
        conexao.close()

        # Retornar uma resposta JSON indicando sucesso
        return jsonify({'mensagem': 'Usuário cadastrado com sucesso'})



#------------------------- Login ----------------------------

@app.route('/api/Logar_usuario', methods=['POST'])
def consultar_usuario():
    # Obter os dados do corpo da requisição
    dados = request.json
    email = dados['email']
    senha = dados['senha']

    # Conectar ao banco de dados
    conexao = mysql.connector.connect(**db_config)

    cursor = conexao.cursor()

    # Montar e executar o comando SQL para consultar o usuário
    comando_consultar_dados = f"SELECT * FROM usuarios WHERE email = '{email}' AND senha = '{senha}';"
    cursor.execute(comando_consultar_dados)
    resultado = cursor.fetchall()  # Recupera o primeiro resultado encontrado
    print(resultado)

    cursor.close()
    conexao.close()

    # Verifica se o usuário foi encontrado
    if resultado:
        tipo_usuario = resultado[0][6]
        if tipo_usuario == 'Cliente':
            return jsonify({'mensagem': 'Usuário cliente encontrado'})
        elif tipo_usuario == 'Vendedor':
            return jsonify({'mensagem': 'Usuário vendedor encontrado'})
        else:
            return jsonify({'mensagem': 'Tipo de usuário desconhecido'})
    else:
        return jsonify({'mensagem': 'Usuário não encontrado'})



#------------------------- Cadastro Produtos----------------------------

@app.route('/cadastro_produto', methods=['POST'])
def inserir_produto():
    # print('Entrado no app.py')
    # # Verifique se a imagem foi enviada
    # if 'imagem' not in request.files:
    #     return jsonify({'mensagem': 'Nenhuma imagem enviada!'})

    # imagem = request.files['imagem']

    # # Verifique se o arquivo de imagem tem um nome
    # if imagem.filename == '':
    #     return jsonify({'mensagem': 'Nome de arquivo de imagem inválido!'})

    # # Verifique se a extensão do arquivo de imagem é válida
    # if '.' not in imagem.filename or imagem.filename.split('.')[-1].lower() not in {'jpg', 'jpeg', 'png', 'gif'}:
    #     return jsonify({'mensagem': 'Formato de arquivo de imagem inválido!'})

    # # Salve o arquivo de imagem no servidor
    # filename = secure_filename(imagem.filename)
    # filepath = os.path.join(app.config['UPLOAD_FOLDER'], filename)
    # imagem.save(filepath)

    dados = request.json
    quadro = dados['quadro']
    imagem = dados['imagem']
    preco = dados['preco']
    estoque = dados['estoque']
    tamanho = dados['tamanho']
    cor = dados['cor']
    descricao = dados ['descricao']
    categoria = dados['categoria']

    try:
        # Conectar ao banco de dados
        conexao = mysql.connector.connect(**db_config)


        cursor = conexao.cursor()

        # Montar e executar o comando SQL para inserir o usuário
        comando_inserir_dados = f"INSERT INTO produtos (nomeQuadro, preco, estoque, cor, tamanho, descricao, imagem, categoria_id) VALUES ('{quadro}', '{preco}', {estoque}, '{cor}', '{tamanho}', '{descricao}', '{imagem}', '{categoria}')"
        cursor.execute(comando_inserir_dados)
        conexao.commit() # edita o banco de dados

        resposta = {'mensagem': 'Quadro cadastrado com sucesso'}
    except mysql.connector.Error as err:
        print(f"Erro: {err}")
        resposta = {'mensagem': 'Erro ao cadastrar quadro'}
    finally:
        cursor.close()
        conexao.close()
    
    # Retornar uma resposta JSON 
    return jsonify(resposta)
    

#----------------- Consultar categorias ------------+

@app.route('/consultar_categorias', methods=['GET'])
def consultar_categorias():
    conexao = mysql.connector.connect(**db_config) 
    cursor = conexao.cursor()
    cursor.execute("SELECT ID_categoria, tipoCategoria FROM categoriasprodutos")
    result = cursor.fetchall()
    categorias = [{'Id_categoria': row[0],'tipoCategoria': row[1]} for row in result]
    cursor.close()
    conexao.close()
    return jsonify(categorias)

#----------------- Consultar categoria produto --------

@app.route('/consultarcategoriaproduto', methods=['GET'])
def consultar_categoria_produto():
    dados = request.json
    id_categoria = dados['id']
    conexao = mysql.connector.connect(**db_config)
    cursor = conexao.cursor()
    cursor.execute(f"SELECT tipoCategoria FROM categoriasProdutos WHERE ID_categoria = '{id_categoria}'")
    result = cursor.fetchall()
    
    cursor.close()
    conexao.close()
    return jsonify(result)


#-------------------- Quadros ----------------------

@app.route('/quadros', methods=['GET'])
def get_quadros():
    conexao = mysql.connector.connect(**db_config)
    cursor = conexao.cursor()
    cursor.execute("SELECT p.ID_produtos, p.nomeQuadro, p.descricao, p.preco, p.imagem, p.estoque, p.avaliacaoMedia, p.categoria_id, p.cor, c.tipoCategoria, p.tamanho FROM produtos p INNER JOIN categoriasprodutos c ON p.categoria_id = c.ID_categoria")
    result = cursor.fetchall()
    quadros = [{'ID_produtos': row[0],'nomeQuadro': row[1], 'descricao': row[2], 'preco': row[3], 'imagem': row[4], 'estoque': row[5], 'avaliacaoMedia': row[6], 'categoria_id': row[7],  'cor': row[8], 'tipoCategoria': row[9], 'tamanho': row[10]} for row in result]
    cursor.close()
    conexao.close()
    return jsonify(quadros)



#------------------ Produto -------------------------

@app.route('/produto', methods=['POST'])
def get_produto():
    dados = request.json
    id_produto = dados['id']

    conexao = mysql.connector.connect(**db_config)
    cursor = conexao.cursor()

    # Corrigindo a consulta SQL para usar o nome correto da coluna
    cursor.execute(f"SELECT ID_produtos, nomeQuadro, descricao, preco, imagem, estoque, avaliacaoMedia, categoria_id, cor, tamanho FROM produtos WHERE ID_produtos = '{id_produto}'")

    result = cursor.fetchone()

    if result:
        response = {
            'ID_produtos': result[0],
            'nomeQuadro': result[1],
            'descricao': result[2],
            'preco': result[3],
            'imagem': result[4],
            'estoque': result[5],
            'avaliacaoMedia': result[6],
            'categoria_id': result[7],
            'cor': result[8],
            'tamanho': result[9]
        }
    else:
        response = {'mensagem': 'Não existe o quadro'}

    cursor.close()
    conexao.close()
    return jsonify(response)



#------------------- Carrinho ---------------------

@app.route('/carrinhoProdutos', methods=['POST'])
def inserir_produtoCarrinho():
    # Obter os dados do corpo da requisição
    dados = request.json
    idQuadro = dados['idQuadro']
    nomeQuadro = dados['nomeQuadro']
    precoQuadro = dados['precoQuadro']
    imagemQuadro = dados['imagemQuadro']
    molduraQuadro = dados['molduraQuadro']

    # Conectar ao banco de dados
    conexao = mysql.connector.connect(**db_config)
    cursor = conexao.cursor()

    comando_consultar_dados = f"SELECT * FROM carrinho WHERE IdQuadro = '{idQuadro}'"
    cursor.execute(comando_consultar_dados)
    resultado = cursor.fetchone()

    if resultado:
        return jsonify({'mensagem': 'Quadro já está no carrinho'})

    else:
        # Montar e executar o comando SQL para inserir o usuário
        comando_inserir_dados = f"INSERT INTO carrinho (IdQuadro, nomeQuadro, imagemQuadro, precoQuadro, molduraQuadro) VALUES ('{idQuadro}', '{nomeQuadro}', '{imagemQuadro}', '{precoQuadro}', '{molduraQuadro}')"
        cursor.execute(comando_inserir_dados)
        conexao.commit() # edita o banco de dados
            
        # Fechar o cursor e a conexão com o banco de dados
        cursor.close()
        conexao.close()

        # Retornar uma resposta JSON indicando sucesso
        return jsonify({'mensagem': 'Dados do quadro inserido no carrinho'})



# --------------------- Mostrar Dados Carriho --------------------

@app.route('/carrinhoQuadros', methods=['GET'])
def get_carrinhoQuadros():
    conexao = mysql.connector.connect(**db_config)
    cursor = conexao.cursor()
    cursor.execute("SELECT IdQuadro, nomeQuadro, imagemQuadro, precoQuadro, molduraQuadro FROM carrinho")
    result = cursor.fetchall()
    quadros = [{'IdQuadro': row[0],'nomeQuadro': row[1], 'imagem': row[2], 'precoQuadro': row[3], 'molduraQuadro': row[4]} for row in result]
    cursor.close()
    conexao.close()
    return jsonify(quadros)


# -------------------- Excluir Quadro Carrinho ----------------------

@app.route('/excluirQuadro', methods=['POST'])
def excluir_quadro_carrinho():
    dados = request.json
    IdQuadro = dados['IdQuadro']

    conexao = mysql.connector.connect(**db_config)
    cursor = conexao.cursor()

    # Corrigindo a consulta SQL para usar o nome correto da coluna
    cursor.execute(f"DELETE FROM carrinho WHERE IdQuadro = '{IdQuadro}'")

    result = cursor.fetchone()

    if result:
        response = {'mensagem': 'Quadro excluido com sucesso'}
    else:
        response = {'mensagem': 'Erro ao excluir o quadro'}

    cursor.close()
    conexao.close()
    return jsonify(response)


#-------------------- Excluir produto -----------------------------

@app.route('/produtos/<int:id>', methods=['DELETE'])
def delete_produto(id):
    conexao = mysql.connector.connect(**db_config)
    cursor = conexao.cursor()
    cursor.execute(f"DELETE FROM produtos WHERE ID_produtos = {id}")
    conexao.commit()

    cursor.close()
    conexao.close()
    return jsonify({"message": "Produto deletado com sucesso"})



#--------------------- Pagamento --------------------------

# # @app.route("/api/link_pagamento", methods = ['GET'])
# # def get_link_pagamento():
# #     link_iniciar_pagamento = gerar_link_pagamento()
# #     return jsonify({"link_pagamento": link_iniciar_pagamento})
# def get_link_pagamento():
#     link_iniciar_pagamento = gerar_link_pagamento()
#     return jsonify({"link_pagamento": link_iniciar_pagamento, "status": "success"})

# @app.route("/compracerta")
# def compra_certa():
#     return render_template("FinalizacaoCompra.js")

# @app.route("/compraerrada")
# def compra_errada():
#     return render_template("FinalizacaoCompra.js")

# @app.route('/api/pagamentos', methods=['POST'])
# def pagamento_apimercadoPago():
#     dados = request.json
#     dadosCarrinho = dados['dadosCarrinho']

#     try:
#         link = gerar_link_pagamento(dadosCarrinho)
#         return jsonify({'link': link}), 200
#     except KeyError as e:
#         return jsonify({'error': f"KeyError: {str(e)}", 'response': e.response}), 500
#     except Exception as e:
#         return jsonify({'error': str(e)}), 500

# def gerar_link_pagamento(dadosCarrinho):

#     sdk = mercadopago.SDK("APP_USR-4692194312027696-061914-be26f913d8c7cf6b08fdc3f83188f3d0-623516088")

#     for item in dadosCarrinho:
#         "id": item.ID_produtos,
#         "title": item.nomeQuadro,
#         "description": item.descricao,
#         "quantity": item.quantidade,
#         "currency_id": "BRL",
#         "unit_price": item.precoTotal
        
    

#     payment_data = {
#         "items": items,
#         "back_urls": {
#             "success": "http://localhost:3000/FinalizacaoCompra",
#             "failure": "",
#             "pending": ""
#         },
#         "auto_return": "all"
#     }

#     result = sdk.preference().create(payment_data)
#     payment = result["response"]

#     # Adicione log para verificar a resposta completa
#     print(f"Resposta da API Mercado Pago: {payment}")

#     if "init_point" in payment:
#         return payment["init_point"]
#     else:
#         raise KeyError("'init_point' não encontrado na resposta da API")    

if __name__ == '__main__':
    print("Iniciando o servidor Flask...")
    app.run(debug=True)