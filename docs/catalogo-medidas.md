# Catálogo de 33 medidas

Os nomes originais foram mantidos, inclusive grafias históricas. As unidades abaixo descrevem a expressão, não apenas o nome. Identificadores internos foram substituídos; nenhum resultado comercial real é publicado.

[Código das medidas](../dax/medidas-selecionadas.dax) · [Guia de interpretação](indicadores-dax.md)

## Volume comercial

| Medida original | Regra observada | Unidade | Referência temporal |
| --- | --- | --- | --- |
| `Qtd \| Diagnósticos Agendados` | Contagem de id nos dois pipelines selecionados; não há condição explícita de data de agendamento. | Quantidade | Relação ativa/contexto |
| `Qtd \| Diagnósticos Realizados` | Conta id com data de diagnóstico preenchida, nos dois pipelines. | Quantidade | Diagnóstico |
| `Qtd \| Propostas Apresentadas` | Conta id com data de apresentação da proposta preenchida. | Quantidade | Apresentação da proposta |
| `Qtd \| Negociação de Contrato` | Conta id com data de aceite formal preenchida. | Quantidade | Aceite formal |
| `Qtd \| Contratos Enviados` | Conta id com data de envio preenchida. | Quantidade | Envio do contrato |
| `Qtd \| Contratos Assinados` | Conta id com data de assinatura preenchida. | Quantidade | Assinatura |
| `Qtd \| Contratos Pagos` | Conta id com data de pagamento preenchida. | Quantidade | Pagamento |
| `Qtd \| Contratos Faturamentos` | Conta id de contas no pipeline reservado, com tipo Novo Contrato e faturamento preenchido. | Quantidade | Conclusão do faturamento |

## Valores e receita

| Medida original | Regra observada | Unidade | Referência temporal |
| --- | --- | --- | --- |
| `R$ \| Propostas Apresentadas` | Soma amount_v2 de negócios com data de proposta preenchida. | Valor monetário | Apresentação da proposta |
| `R$ \| Negociação de Contrato` | Soma amount_v2 de negócios com aceite formal preenchido. | Valor monetário | Aceite formal |
| `R$ \| Contratos Enviados` | Soma amount_v2 de negócios com data de envio preenchida. | Valor monetário | Envio do contrato |
| `R$ \| Contratos Assinados` | Soma amount_v2 de negócios com data de assinatura preenchida. | Valor monetário | Assinatura |
| `R$ \| Contratos Faturamentos` | Soma valor de contas do tipo Novo Contrato, no pipeline reservado, com faturamento concluído. | Valor monetário | Conclusão do faturamento |
| `R$ \| Contratos Pagos` | Soma amount_v2 de negócios com data de pagamento preenchida. | Valor monetário | Pagamento |

## Ticket médio

| Medida original | Regra observada | Unidade | Referência temporal |
| --- | --- | --- | --- |
| `AVG \| Propostas Apresentadas` | Valor de propostas dividido pela quantidade de propostas. | Valor por registro | Herda as medidas-base |
| `AVG \| Negociação de Contrato` | Valor em negociação dividido pela quantidade na etapa. | Valor por registro | Herda as medidas-base |
| `AVG \| Contrato Enviado` | Valor de contratos enviados dividido pela quantidade enviada. | Valor por registro | Herda as medidas-base |
| `AVG \| Contrato Assinado` | Valor assinado dividido pela quantidade de contratos assinados. | Valor por registro | Herda as medidas-base |
| `AVG \| Faturamentos` | Valor faturado de contas dividido pela quantidade faturada de contas. | Valor por registro | Herda as medidas-base |
| `AVG \| Pagamentos` | Valor associado aos negócios pagos dividido pela quantidade desses negócios. | Valor por registro | Herda as medidas-base |

## Conversão

| Medida original | Regra observada | Unidade | Referência temporal |
| --- | --- | --- | --- |
| `TX.CV \| Realizado x Negociação de Contrato` | Quantidade em negociação dividida pelos diagnósticos realizados. | Razão | Datas das medidas-base |
| `TX.CV \| Realizado x Assinado` | Quantidade de contratos assinados dividida pelos diagnósticos realizados. | Razão | Datas das medidas-base |

## Carteira e acompanhamento

| Medida original | Regra observada | Unidade | Referência temporal |
| --- | --- | --- | --- |
| `Qtd \| Novos Clientes da Carteira` | Conta id de contas em uma etapa específica, substituída por marcador. | Quantidade | Relação ativa/contexto |
| `Dias Abero AVG Stpo S/Atv30D` | Conta negócios em seis etapas com Atividades Ult. 30D igual a Não; não calcula média de dias. | Quantidade | Relação ativa/contexto |
| `Qtd \| Negócios Parados` | Conta negócios em sete etapas e dois pipelines; não testa tempo parado. | Quantidade | Relação ativa/contexto |

## Período, perdas e valores em aberto

| Medida original | Regra observada | Unidade | Referência temporal |
| --- | --- | --- | --- |
| `Qtd Período \| Diagnósticos Realizados` | Conta negócios com diagnóstico preenchido, sem ativar a relação da data de diagnóstico. | Quantidade | Relação ativa/contexto |
| `Qtd Período \| Contratos Assinados` | Conta negócios com assinatura preenchida, sem ativar a relação da data de assinatura. | Quantidade | Relação ativa/contexto |
| `Qtd Período \| Motivos de Perda` | Conta negócios na etapa Negócio perdido; o motivo detalhado depende do filtro/visual. | Quantidade | Relação ativa/contexto |
| `R$ \| Período Negócios Parados na Mesa` | Soma três medidas de valor por etapa: proposta, negociação e contrato enviado. | Valor monetário | Herda as medidas por etapa |
| `R$ Período \| Motivos de Perda` | Soma amount_v2 dos negócios na etapa Negócio perdido. | Valor monetário | Relação ativa/contexto |
| `R$ Período_Etapa \| Proposta` | Soma amount_v2 na etapa Proposta apresentada, apenas no pipeline A. | Valor monetário | Relação ativa/contexto |
| `R$ Período_Etapa \| Negociação de Contrato` | Soma amount_v2 na etapa Negociação de Contrato, nos pipelines A e B. | Valor monetário | Relação ativa/contexto |
| `R$ Período_Etapa \| Contrato Enviado` | Soma amount_v2 na etapa Contrato Enviado, nos pipelines A e B. | Valor monetário | Relação ativa/contexto |

## Como ler a referência temporal

As medidas com USERELATIONSHIP utilizam a relação indicada durante o cálculo. As que não ativam uma relação adicional dependem da relação ativa, das interações e dos demais filtros. No modelo de negócios, a relação ativa com o calendário é pela criação. Isso não elimina a necessidade de considerar outros filtros da página e o comportamento bidirecional.

## Dependências

A seleção inclui as medidas-base usadas pelos tickets, conversões e valor em aberto. Ainda depende de tabelas, colunas calculadas, transformações e relações reservadas. A presença de todas as medidas referenciadas não a torna um painel executável independente.
