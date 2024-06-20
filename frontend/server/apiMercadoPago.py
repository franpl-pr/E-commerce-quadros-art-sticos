import mercadopago

sdk = mercadopago.SDK("TEST-4212789368948772-061314-1e26cba03822f0578786ce2b715f2796-623516088")

def gerar_link_pagamento(dadosCarrinho):
	item = []
	for produto in dadosCarrinho:
		item.append({
			"id": produto.ID_produtos,
			"title": produto.nomeQuadro,
             "description": produto.descricao,
             "picture_url": produto.imagem,
             "category_id": produto.categoria_id,
             "quantity": produto.quantidade,
             "currency_id": "BRL",
             "unit_price": produto.precoTotal,
		})

	payment_data = {
		"items": item,
		"back_urls": {
			"sucess": "Alguma url",
			"failure": "Alguma url",
			"pending": "Alguma url"
		},
		"auto_return": "all"
	}
        
	result = sdk.preference().create(payment_data)
	payment = result["response"]
	link_iniciar_pagamento = payment["init_point"]
	return link_iniciar_pagamento