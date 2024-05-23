from django.shortcuts import render
from .models import Artistas, Carrinhodecompras, Categoriasprodutos, Clientes, Comprovante, Dashboardvendedores, Devolucoestroca
from django.views.generic import ListView, CreateView, DeleteView, UpdateView, View
from django.urls import reverse_lazy

# Views de Artistas.
class ArtistaListView(ListView):
    model = Artistas

class ArtistasCreateView(CreateView):
    model = Artistas
    fields = ["usuario", "razao_social", "cnpj", "descricao_vendedor"]
    success_url = reverse_lazy("#CONFIG_URL#")

class ArtistasDeleteView(DeleteView):
    model = Artistas
    success_url = reverse_lazy("#CONFIG_URL#")

class ArtistasUpdateView(UpdateView):
    model = Artistas
    fields = ["usuario", "razao_social", "cnpj", "descricao_vendedor"]
    success_url = reverse_lazy("#CONFIG_URL#")

# View de Carrinho de compras
class CarrinhodecompraListView(ListView):
    model = Carrinhodecompras

class CarrinhodecompraCreateView(CreateView):
    model = Carrinhodecompras
    fields = ["cliente", "datacriacao", "status"]
    success_url = reverse_lazy("#CONFIG_URL#")

class CarrinhodecompraDeleteView(DeleteView):
    model = Carrinhodecompras
    success_url = reverse_lazy("#CONFIG_URL#")

class CarrinhodecompraUpdateView(UpdateView):
    model = Carrinhodecompras
    fields = ["cliente", "datacriacao", "status"]
    success_url = reverse_lazy("#CONFIG_URL#")

# View de Categoriasprodutos
class CategoriasprodutosListView(ListView):
    model = Categoriasprodutos

class CategoriasprodutosCreateView(CreateView):
    model = Categoriasprodutos
    fields = ["tipocategoria", "descricao"]
    success_url = reverse_lazy("#CONGIF_URL#")

class CategoriasprodutosUpdateView(UpdateView):
    model = Categoriasprodutos
    fields = ["tipocategoria", "descricao"]
    success_url = reverse_lazy("#CONGIF_URL#")

class CategoriasprodutosDeleteView(DeleteView):
    model = Categoriasprodutos
    success_url = reverse_lazy("#CONGIF_URL#")

# View de Cliente
class ClientesListView(ListView):
    model = Clientes

class ClientesCreateView(CreateView):
    model = Clientes
    fields = ["usuario", "cpf"]
    success_url = reverse_lazy("#CONGIF_URL#")

class ClientesUpdateView(UpdateView):
    model = Clientes
    fields = ["usuario", "cpf"]
    success_url = reverse_lazy("#CONGIF_URL#")

class ClientesDeleteView(DeleteView):
    model = Clientes
    success_url = reverse_lazy("#CONGIF_URL#")

# View de Comprovante
class ComprovanteListView(ListView):
    model = Comprovante

class ComprovanteCreateView(CreateView):
    model = Comprovante
    fields = ["pagamento", "pedido", "produto", "data_emissao", "valor_total", "observacoes"]
    success_url = reverse_lazy("#CONGIF_URL#")

class ComprovanteUpdateView(UpdateView):
    model = Comprovante
    fields = ["pagamento", "pedido", "produto", "data_emissao", "valor_total", "observacoes"]
    success_url = reverse_lazy("#CONGIF_URL#")

class ComprovanteDeleteView(DeleteView):
    model = Comprovante
    success_url = reverse_lazy("#CONGIF_URL#")

# View de Dashboardvendedores
class DashboardvendedoresListView(ListView):
    model = Dashboardvendedores

class DashboardvendedoresCreateView(CreateView):
    model = Dashboardvendedores
    fields = ["vendedor_id", "tipo", "faturamento", "comissao", "estoque", "pagamento_id", "cliente_id", "pedido_id", "produto_id", "devolucoeetrocas_id", "comprovante_id", "descricao"]
    success_url = reverse_lazy("#CONGIF_URL#")

class DashboardvendedoresUpdateView(UpdateView):
    model = Dashboardvendedores
    fields = ["vendedor_id", "tipo", "faturamento", "comissao", "estoque", "pagamento_id", "cliente_id", "pedido_id", "produto_id", "devolucoeetrocas_id", "comprovante_id", "descricao"]
    success_url = reverse_lazy("#CONGIF_URL#")

class DashboardvendedoresDeleteView(DeleteView):
    model = Dashboardvendedores
    success_url = reverse_lazy("#CONGIF_URL#")

# View de Devolucoestroca
class DevolucoestrocaListView(ListView):
    model = Devolucoestroca

class DevolucoestrocaCreateView(CreateView):
    model = Devolucoestroca
    fields = ["pedido", "produto", "data_devolucao", "motivo", "status", "observacoes"]
    success_url = reverse_lazy("#CONGIF_URL#")

class DevolucoestrocaUpdateView(UpdateView):
    model = Devolucoestroca
    fields = ["pedido", "produto", "data_devolucao", "motivo", "status", "observacoes"]
    success_url = reverse_lazy("#CONGIF_URL#")

class DevolucoestrocaDeleteView(DeleteView):
    model = Devolucoestroca
    success_url = reverse_lazy("#CONGIF_URL#")