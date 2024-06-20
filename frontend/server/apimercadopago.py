import mercadopago

def gerar_link_pagamento(dadosCarrinho):

    sdk = mercadopago.SDK("APP_USR-4692194312027696-061914-be26f913d8c7cf6b08fdc3f83188f3d0-623516088")
    items = [
        {
            "id": item["ID_produtos"],
            "title": item['nomeQuadro'],
            "description": item['descricao'],
            "quantity": item['quantidade'],
            "currency_id": "BRL",
            "unit_price": item['preco']
        }
        for item in dadosCarrinho
    ]


    payment_data = {
        "items": [{ "id":1, "title":"camisa", "quantity":1, "currency_id":"BRL", "unit_price": 159.99 }],
        "back_urls": {
            "sucess": "http://http://localhost:3000/FinalizacaoCompra",
            "failure": "",
            "pending": ""
        },
        "auto_return": "all"
    }
    result = sdk.preference().create(payment_data)
    payment = result["response"]  
    link_iniciar_pagamento = payment["init_point"]
    return link_iniciar_pagamento

