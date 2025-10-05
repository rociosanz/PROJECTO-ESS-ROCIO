FEATURE: Análise de sequência de reprovações, histograma com alunos que passaram de primeira, de segunda, etc.

Como desenvolvedor, quero analisar a sequência de reprovações dos estudantes para poder ver em que erram e qual parte da matéria ao longo do ano eles têm mais dificuldade.

Cenario:Visualizar histograma de aprovações por tentativa

Given que estou autenticado como desenvolvedor
And existem dados de estudantes com diferentes tentativas de aprovação
When acesso a seção de "Análise de Reprovações"
And seleciono a opção"Histograma de Aprovações"
Then devo ver um histograma com as seguintes categorias:| Categoria | Quantidade || Aprovaram na primeira | 45 || Aprovaram na segunda | 23 || Aprovaram na terceira | 12 || Aprovaram depois | 8 |
And o histograma deve mostrar barras com cores diferentes
And devo ver a porcentagem de cada categoria

Cenario: tentar visualizar histograma sem dados disponiveis

Given que estou autenticado como desenvolvedor
And não existem dados de estudantes registrados 
When acesso a seção "Análise de Reprovações"
And seleciono a opção "Histograma de Aprovações"
Then devo ver a mensagem "Não há dados disponíveis para gerar o histograma"
And devo ver um histograma vazio 

Cenario: tentar acessar sem permissões de professor

Given que estou autenticado como estudante 
When: tento acessar a seção "Análise de Reprovações" 
Then devo ver a mensagem "Você não tem permissão para acessar esta função"
And devo ser redirecionado para a página principal


Cenario: Erro ao carregar dados do servidor
Given que estou autenticado como professor 
And existe um erro de conexão com o servidor 
When acesso a seção "Análise de Reprovações"
And seleciono a opção "Histograma de Aprovações"
Then devo ver a mensagem "Erro ao carregar os dados. Tente novamente"
And devo ver um botão "Tentar novamente"


Cenário: Exportar dados do histograma para o Excel (experimental)

Given que estou autenticado como professor
And existem dados no histograma de aprovações
When clico no botão "Exportar para Excel"
Then devo baixar um arquivo Excel com os dados
And o arquivo deve conter todas as categorias do histograma


Cenário: Erro ao carregar dados do servidor

Given que estou autenticado como professor
And existe um erro de conexão com o servidor
When acesso a seção 'Análise de Reprovações'
And seleciono a opção 'Histograma de Aprovações'
Then devo ver a mensagem 'Erro ao carregar os dados. Tente novamente'
And devo ver um botão 'Tentar novamente'
And devo ver um link para 'Contatar o suporte técnico'

Cenário: Filtrar histograma por período acadêmico

Given que estou autenticado como professor
And existem dados de múltiplos períodos acadêmicos
Where seleciono o período "2024.1" no filtro
Then devo ver o histograma atualizado com dados apenas desse período
And devo ver o número total de estudantes do período selecionado

Cenário: Gerar gráfico de tendências por ano

Given que estou autenticado como professor
When solicito o gráfico de tendências
Then devo ver a evolução das aprovações por ano


