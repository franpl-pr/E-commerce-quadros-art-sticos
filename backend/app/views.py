from django.shortcuts import render
from .models import Artistas, Carrinhodecompras, Categoriasprodutos
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