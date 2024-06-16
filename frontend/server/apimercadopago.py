import mercadopago

def gerar_link_pagamento():

    sdk = mercadopago.SDK("TEST-2558284894951529-052219-50351c0fab25a3249c4e6f55fdd0f33a-205750426")

    #REQUISIÇÃO - intesn que vão ser incluídos na requisição
    request = {
        "items": [
            {
                "id": "1",  # id_produto
                "title": "Bauhaus Geométrico – Vermelho",
                "quantity": 1,
                "currency_id": "BRL",
                "unit_price": 259.99
            }
        ],
        "back_urls": {
        "success": "http://127.0.0.1:5000/compracerta",
        "pending": "http:/http:/127.0.0.1:5000/comprapendente",
        "failure": "http:/http:/127.0.0.1:5000/compraerrada"
    },
    "auto_return": "all"
    }

    resultado = sdk.preference().create(request)
    pagamento = resultado["response"]
    link_iniciar_pagamento = pagamento["init_point"]

    return link_iniciar_pagamento
