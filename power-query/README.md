# Exemplos Power Query

| Arquivo | Finalidade |
| --- | --- |
| [fxDadosObjeto.m](fxDadosObjeto.m) | Requisição parametrizada à API pública do HubSpot |
| [fxProximaPagina.m](fxProximaPagina.m) | Leitura do cursor da próxima página |
| [Negocios.m](Negocios.m) | List.Generate, aplicação da função e consolidação |
| [demo-paginacao.m](demo-paginacao.m) | Demonstração sem rede com três registros fictícios |

Os três primeiros arquivos são adaptações explicativas da abordagem histórica. Não são a integração completa nem foram executados contra o CRM nesta edição.

## Como experimentar a demonstração

No Power BI Desktop, abra Transformar dados, crie uma Consulta Nula e use o Editor Avançado para colar demo-paginacao.m. O resultado esperado é uma tabela com DEMO-A, DEMO-B e DEMO-C, reunidos de duas páginas. Essa execução ainda precisa de confirmação no Power BI Desktop.

## Como ler o exemplo com conexão

Crie consultas de função com os nomes fxDadosObjeto e fxProximaPagina, na ordem indicada. Negocios.m exemplifica a aplicação delas. O parâmetro reservado pTokenHubSpot não tem valor neste pacote.

Para um objeto personalizado, o tipo do objeto seria fornecido por um parâmetro privado no lugar de deals. As propriedades solicitadas e a expansão devem respeitar o esquema daquele objeto. Os exemplos não incluem as propriedades específicas do ambiente original.

Consulte o [passo a passo](../docs/integracao-hubspot.md) para diferenças em relação ao código histórico, limitações e contexto da API.
