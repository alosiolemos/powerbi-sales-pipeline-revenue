# Indicadores e DAX

Três expressões foram selecionadas a partir das definições do modelo. Identificadores internos de pipeline foram substituídos por marcadores distintos; a lógica foi preservada e a indentação organizada.

[Código selecionado](../dax/medidas-selecionadas.dax).

| Medida | Regra observada |
| --- | --- |
| Qtd de diagnósticos realizados | COUNT do id, restrição a dois pipelines, data do diagnóstico preenchida e USERELATIONSHIP com o calendário |
| Qtd de contratos assinados | COUNT do id, restrição a dois pipelines, data da assinatura preenchida e USERELATIONSHIP com o calendário |
| Conversão realizado x assinado | Contratos assinados divididos por diagnósticos realizados, retornando zero quando o denominador é zero |

## Por que destacar USERELATIONSHIP

O modelo tem datas de eventos ligadas ao calendário por relações inativas. A medida seleciona o vínculo da etapa analisada: diagnóstico ou assinatura. O cálculo depende também das demais relações e dos filtros da página.

## COUNT não é DISTINCTCOUNT

As expressões selecionadas contam valores não vazios da coluna id. Elas não eliminam duplicidades por si mesmas. A granularidade e a ausência de duplicações exigem conferência dos dados; esta edição não as pressupõe.

## Conversão de período e coorte

O numerador usa a data de assinatura e o denominador usa a data de diagnóstico. Uma assinatura no mês pode pertencer a um diagnóstico de mês anterior. Essa razão é um indicador por período, não necessariamente a conversão de um grupo fixo de negócios acompanhado no tempo.

## Ciclo de vendas

As referências visuais mostram uma medida de ciclo com valor negativo. Sua regra, ordem das datas e contexto de filtros precisam de validação. O portfólio apresenta a funcionalidade de acompanhamento do ciclo, sem afirmar que esse valor esteja correto.

## Como validar

No modelo adequado, configure os pipelines e selecione um período conhecido. Confira cada etapa com a fonte, observando datas, linhas duplicadas e filtros. Nenhuma execução no Power BI Desktop foi realizada nesta edição.
