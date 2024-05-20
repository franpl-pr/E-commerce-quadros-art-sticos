# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from typing import Any
from django.db import models
from django.views.generic import ListView, CreateView, DeleteView

class Artistas(models.Model):
    id_artista = models.IntegerField(db_column='ID_artista', primary_key=True)  # Field name made lowercase.
    usuario = models.OneToOneField('Usuarios', models.DO_NOTHING, blank=True, null=True)
    razao_social = models.CharField(max_length=255, blank=True, null=True)
    cnpj = models.CharField(max_length=20, blank=True, null=True)
    descricao_vendedor = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'artistas'
    
    def __init__(self, usuario, razao_social, cnpj, descricao_vendedor):
        self.usuario = usuario
        self.razao_social = razao_social
        self.cnpj = cnpj
        self.descricao_vendedor = descricao_vendedor

    def AdicionarProdutoPlataforma(self):
        return
    
    def VisualizarDashBoard(self):
        return
    
    def AdicionarProdutoEstoque(self):
        return

    def GetQntdProdEstoque(self):
        return
    
    def DespacharProduto(self):
        return

    def CadastroProduto(self):
        return
    
    def AtenderSolicitacaoProduto(self):
        return
    
class AuthGroup(models.Model):
    name = models.CharField(unique=True, max_length=150)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    id = models.BigAutoField(primary_key=True)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
    permission = models.ForeignKey('AuthPermission', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'
        unique_together = (('group', 'permission'),)


class AuthPermission(models.Model):
    name = models.CharField(max_length=255)
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING)
    codename = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'auth_permission'
        unique_together = (('content_type', 'codename'),)


class AuthUser(models.Model):
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.IntegerField()
    username = models.CharField(unique=True, max_length=150)
    first_name = models.CharField(max_length=150)
    last_name = models.CharField(max_length=150)
    email = models.CharField(max_length=254)
    is_staff = models.IntegerField()
    is_active = models.IntegerField()
    date_joined = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'auth_user'


class AuthUserGroups(models.Model):
    id = models.BigAutoField(primary_key=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_groups'
        unique_together = (('user', 'group'),)


class AuthUserUserPermissions(models.Model):
    id = models.BigAutoField(primary_key=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    permission = models.ForeignKey(AuthPermission, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_user_permissions'
        unique_together = (('user', 'permission'),)


class Avaliacoescomentarios(models.Model):
    id_avaliacaocoment = models.AutoField(db_column='ID_avaliacaoComent', primary_key=True)  # Field name made lowercase.
    produto = models.ForeignKey('Produtos', models.DO_NOTHING, blank=True, null=True)
    usuario = models.ForeignKey('Usuarios', models.DO_NOTHING, blank=True, null=True)
    avaliacao = models.DecimalField(max_digits=3, decimal_places=2)
    comentario = models.TextField(blank=True, null=True)
    data_avaliacao = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'avaliacoescomentarios'


class Carrinhodecompras(models.Model):
    id_carrinhocompras = models.IntegerField(db_column='ID_carrinhoCompras', primary_key=True)  # Field name made lowercase.
    cliente = models.ForeignKey('Clientes', models.DO_NOTHING, blank=True, null=True)
    datacriacao = models.DateTimeField(db_column='dataCriacao', blank=True, null=True)  # Field name made lowercase.
    status = models.CharField(max_length=5, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'carrinhodecompras'
    
    def __init__(self, cliente, datacriacao, status):
        self.cliente = cliente
        self.datacriacao = datacriacao
        self.status = status
    
    def adicionarProduto():
        return
    
    def removerProduto():
        return
    
    def finalizarCompra():
        return



class Categoriasprodutos(models.Model):
    id_categoria = models.IntegerField(db_column='ID_categoria', primary_key=True)  # Field name made lowercase.
    tipocategoria = models.CharField(db_column='tipoCategoria', max_length=100)  # Field name made lowercase.
    descricao = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'categoriasprodutos'

    def __init__(self, tipocategoria, descricao):
        self.tipocategoria = tipocategoria
        self.descricao = descricao

    def selecionarCategoria(self, id_categoria):
        return


class Clientes(models.Model):
    id_clientes = models.IntegerField(db_column='ID_clientes', primary_key=True)  # Field name made lowercase.
    usuario = models.OneToOneField('Usuarios', models.DO_NOTHING, blank=True, null=True)
    cpf = models.CharField(unique=True, max_length=14, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'clientes'

    def __init__(self, usuario, cpf):
        self.usuario = usuario
        self.cpf = cpf
    
    def selecionarProduto():
        return
    
    def pesquisarProduto():
        return

    def visualizarProduto():
        return
    
    def avaliarProduto():
        return
    
    def devolverProduto():
        return
    
    def trocarProduto():
        return
    
    def conversarSuporte():
        return


class Comprovante(models.Model):
    id_comprovante = models.IntegerField(db_column='ID_comprovante', primary_key=True)  # Field name made lowercase.
    pagamento = models.ForeignKey('Pagamento', models.DO_NOTHING, blank=True, null=True)
    pedido = models.ForeignKey('Pedidos', models.DO_NOTHING, blank=True, null=True)
    produto = models.ForeignKey('Produtos', models.DO_NOTHING, blank=True, null=True)
    data_emissao = models.DateField(blank=True, null=True)
    valor_total = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)
    observacoes = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'comprovante'


class Dashboardvendedores(models.Model):
    id_dashboardvendedores = models.AutoField(db_column='ID_dashboardVendedores', primary_key=True)  # Field name made lowercase.
    vendedor_id = models.IntegerField(blank=True, null=True)
    tipo = models.CharField(max_length=8, blank=True, null=True)
    faturamento = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)
    comissao = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)
    estoque = models.IntegerField(blank=True, null=True)
    pagamento_id = models.IntegerField(blank=True, null=True)
    cliente_id = models.IntegerField(blank=True, null=True)
    pedido_id = models.IntegerField(blank=True, null=True)
    produto_id = models.IntegerField(blank=True, null=True)
    devolucoestroca_id = models.IntegerField(db_column='devolucoesTroca_id', blank=True, null=True)  # Field name made lowercase.
    comprovante_id = models.IntegerField(blank=True, null=True)
    descricao = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'dashboardvendedores'


class Devolucoestroca(models.Model):
    id_devolucaotroca = models.IntegerField(db_column='ID_devolucaoTroca', primary_key=True)  # Field name made lowercase.
    pedido = models.ForeignKey('Pedidos', models.DO_NOTHING, blank=True, null=True)
    produto = models.ForeignKey('Produtos', models.DO_NOTHING, blank=True, null=True)
    data_devolucao = models.DateTimeField(blank=True, null=True)
    motivo = models.CharField(max_length=255, blank=True, null=True)
    status = models.CharField(max_length=20, blank=True, null=True)
    observacoes = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'devolucoestroca'


class DjangoAdminLog(models.Model):
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.PositiveSmallIntegerField()
    change_message = models.TextField()
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'
        unique_together = (('app_label', 'model'),)


class DjangoMigrations(models.Model):
    id = models.BigAutoField(primary_key=True)
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'


class Enderecos(models.Model):
    id_endereco = models.AutoField(db_column='ID_endereco', primary_key=True)  # Field name made lowercase.
    usuario_id = models.IntegerField(blank=True, null=True)
    logradouro = models.CharField(max_length=100)
    numero = models.IntegerField(blank=True, null=True)
    complemento = models.CharField(max_length=50, blank=True, null=True)
    bairro = models.CharField(max_length=100, blank=True, null=True)
    cidade = models.CharField(max_length=60)
    estado = models.CharField(max_length=2)
    cep = models.CharField(max_length=10)

    class Meta:
        managed = False
        db_table = 'enderecos'


class Historicoatividades(models.Model):
    id_historicoativid = models.AutoField(db_column='ID_historicoAtivid', primary_key=True)  # Field name made lowercase.
    usuario_id = models.IntegerField(blank=True, null=True)
    data_hora = models.DateTimeField(blank=True, null=True)
    descricao = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'historicoatividades'


class Itenscarrinhodecompra(models.Model):
    id_itenscarrinhocompra = models.AutoField(db_column='ID_ItensCarrinhoCompra', primary_key=True)  # Field name made lowercase.
    carrinhocompras_id = models.IntegerField(db_column='carrinhoCompras_id', blank=True, null=True)  # Field name made lowercase.
    produto_id = models.IntegerField(blank=True, null=True)
    quantidade = models.IntegerField(blank=True, null=True)
    precounitario = models.DecimalField(db_column='precoUnitario', max_digits=10, decimal_places=2, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'itenscarrinhodecompra'


class Listadesejos(models.Model):
    id_favoritos = models.AutoField(db_column='ID_favoritos', primary_key=True)  # Field name made lowercase.
    usuario_id = models.IntegerField(blank=True, null=True)
    produto_id = models.IntegerField(blank=True, null=True)
    data_adicao = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'listadesejos'


class Pagamento(models.Model):
    id_pagamento = models.IntegerField(db_column='ID_pagamento', primary_key=True)  # Field name made lowercase.
    pedido_id = models.IntegerField(blank=True, null=True)
    metodo_pagamento = models.CharField(max_length=17, blank=True, null=True)
    valor_pago = models.DecimalField(max_digits=10, decimal_places=2)
    data_pagamento = models.DateTimeField()
    status_pagamento = models.CharField(max_length=20, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'pagamento'


class Pagamentoboleto(models.Model):
    id_pagamentoboleto = models.AutoField(db_column='ID_pagamentoBoleto', primary_key=True)  # Field name made lowercase.
    pagamento_id = models.IntegerField(blank=True, null=True)
    datavencimento = models.DateField(db_column='dataVencimento')  # Field name made lowercase.
    datapagamento = models.DateField(db_column='dataPagamento')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'pagamentoboleto'


class Pagamentocartao(models.Model):
    id_pagamentocartao = models.AutoField(db_column='ID_pagamentoCartao', primary_key=True)  # Field name made lowercase.
    pagamento_id = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'pagamentocartao'


class Pagamentopix(models.Model):
    id_pagamentopix = models.AutoField(db_column='ID_pagamentoPix', primary_key=True)  # Field name made lowercase.
    pagamento_id = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'pagamentopix'


class Pedidos(models.Model):
    id_pedido = models.IntegerField(db_column='ID_pedido', primary_key=True)  # Field name made lowercase.
    cliente_id = models.IntegerField(blank=True, null=True)
    endereco_id = models.IntegerField(blank=True, null=True)
    data_estimadaentrega = models.DateField(db_column='data_estimadaEntrega', blank=True, null=True)  # Field name made lowercase.
    vendedor_id = models.IntegerField(blank=True, null=True)
    custo_frete = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)
    data_pedido = models.DateTimeField()
    total_pedido = models.DecimalField(max_digits=10, decimal_places=2)
    status = models.CharField(max_length=16)

    class Meta:
        managed = False
        db_table = 'pedidos'


class Perfilartista(models.Model):
    perfilartista_id = models.AutoField(db_column='perfilArtista_id', primary_key=True)  # Field name made lowercase. The composite primary key (perfilArtista_id, ID_artista) found, that is not supported. The first column is selected.
    tipoarte = models.TextField()
    fotoperfil = models.CharField(max_length=50)
    biografia = models.TextField()
    id_artista = models.ForeignKey(Artistas, models.DO_NOTHING, db_column='ID_artista')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'perfilartista'
        unique_together = (('perfilartista_id', 'id_artista'),)


class Produtos(models.Model):
    id_produtos = models.IntegerField(db_column='ID_produtos', primary_key=True)  # Field name made lowercase.
    vendedor_id = models.IntegerField(blank=True, null=True)
    nomequadro = models.CharField(db_column='nomeQuadro', max_length=255)  # Field name made lowercase.
    descricao = models.TextField()
    preco = models.DecimalField(max_digits=10, decimal_places=2)
    imagem = models.CharField(max_length=255, blank=True, null=True)
    estoque = models.IntegerField()
    avaliacaomedia = models.DecimalField(db_column='avaliacaoMedia', max_digits=3, decimal_places=2, blank=True, null=True)  # Field name made lowercase.
    categoria_id = models.IntegerField(blank=True, null=True)
    cor = models.CharField(max_length=50)
    tamanho = models.CharField(max_length=10)

    class Meta:
        managed = False
        db_table = 'produtos'


class Suportecliente(models.Model):
    id_suporte = models.AutoField(db_column='ID_suporte', primary_key=True)  # Field name made lowercase.
    usuario_id = models.IntegerField(blank=True, null=True)
    data_hora = models.DateTimeField(blank=True, null=True)
    assunto = models.CharField(max_length=255, blank=True, null=True)
    mensagem = models.TextField(blank=True, null=True)
    status = models.CharField(max_length=12, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'suportecliente'


class Usuarios(models.Model):
    id_usuarios = models.IntegerField(db_column='ID_usuarios', primary_key=True)  # Field name made lowercase.
    nomecompleto = models.CharField(db_column='nomeCompleto', max_length=100)  # Field name made lowercase.
    email = models.CharField(max_length=100)
    senha = models.CharField(max_length=100)
    login = models.CharField(max_length=50)
    telefone = models.CharField(max_length=20, blank=True, null=True)
    tipo = models.CharField(max_length=8)
    genero = models.CharField(max_length=9)
    data_nascimento = models.DateField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'usuarios'
