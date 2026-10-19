# Indicadores comerciais, financeiros e de acompanhamento

Esta edição apresenta **33 medidas selecionadas** das 210 definições identificadas no projeto. O objetivo é demonstrar a variedade das análises sem distribuir o modelo completo.

[Catálogo das 33 medidas e regras](catalogo-medidas.md) · [Código DAX](../dax/medidas-selecionadas.dax)

## Visão do conjunto

| Grupo | Quantidade | Conteúdo |
| --- | --- | --- |
| Volume comercial | 8 | Agendamentos, diagnósticos, propostas, negociação, contratos e faturamento |
| Valores e receita | 6 | Valores de propostas, negociação, contratos enviados, assinados, faturados e pagos |
| Ticket médio | 6 | Valor por registro em cada etapa selecionada |
| Conversão | 2 | Diagnóstico para negociação e diagnóstico para assinatura |
| Carteira e acompanhamento | 3 | Novos clientes, etapas abertas e ausência de atividade |
| Período, perdas e valores em aberto | 8 | Recorte temporal, perdas e valor por etapa |

## Vendas, faturamento e pagamento: três leituras

**Vendas / assinatura:** a medida de valor assinado soma `hs_Negócios[amount_v2]` dos negócios com assinatura preenchida, nos pipelines selecionados, e utiliza a data de assinatura no calendário.

**Faturamento:** as medidas selecionadas usam `hs_Contas`, extraída do objeto personalizado. Filtram o pipeline dessa frente, o tipo `Novo Contrato` e a data de conclusão do faturamento.

**Pagamento:** a medida de valor pago soma `amount_v2` dos negócios com data de pagamento preenchida. Isso representa o valor atribuído a esses negócios; o código não soma lançamentos bancários nem demonstra, por si só, uma conciliação financeira.

Os três conceitos não são intercambiáveis. Também não se deve chamar todos esses valores automaticamente de MRR ou receita contábil reconhecida: é necessário validar o significado e a periodicidade dos campos de origem.

### Exemplo: faturamento

```dax
R$ | Contratos Faturamentos =
CALCULATE(
CALCULATE(
SUM(hs_Contas[valor]),
hs_Contas[hs_pipeline]in {"<PIPELINE_CONTAS>"},
hs_Contas[tipo_de_contrato]="Novo Contrato",
hs_Contas[data_de_faturamento_concluido]<>BLANK()),
USERELATIONSHIP(dCalendario[Date],hs_Contas  [data_de_faturamento_concluido]))+0
```

`SUM` agrega valores; os filtros delimitam as contas consideradas; `USERELATIONSHIP` seleciona o vínculo da data do evento.

O campo `amount_v2` utilizado nas medidas comerciais é um campo tratado no modelo. Sua transformação integral permanece reservada; os exemplos não afirmam equivalência direta com o campo bruto amount da API.

## Ticket médio

As seis medidas AVG usam **valor dividido por quantidade**. Não são médias calculadas com AVERAGE sobre cada linha.

```dax
AVG | Contrato Assinado =
DIVIDE([R$ | Contratos Assinados],[Qtd | Contratos Assinados],0)
```

No caso do faturamento, numerador e denominador vêm de contas; nos exemplos de assinatura e pagamento, vêm de negócios. Se uma entidade puder aparecer em mais de uma linha, a granularidade deve ser conferida.

`DIVIDE(..., ..., 0)` retorna zero quando o denominador é zero ou branco. Isso é uma escolha de apresentação; não comprova que houve atividade com ticket igual a zero.

## Conversões

```dax
TX.CV | Realizado x Assinado =
DIVIDE([Qtd | Contratos Assinados],[Qtd | Diagnósticos Realizados],0)
```

A seleção também inclui conversão de diagnóstico realizado para negociação. As quantidades por evento usam datas diferentes. Portanto, a razão entre etapas num mês não representa automaticamente a conversão de um mesmo grupo de negócios.

## Comparação: data do evento e recorte pela relação ativa

As medidas `Qtd | Contratos Assinados` e `Qtd Período | Contratos Assinados` exigem assinatura preenchida, mas tratam o calendário de maneira diferente:

| Medida | Comportamento observado |
| --- | --- |
| Qtd de contratos assinados | Ativa o relacionamento com a data de assinatura |
| Qtd Período de contratos assinados | Não ativa a data de assinatura; depende da relação ativa e dos demais filtros |

O mesmo contraste aparece nos diagnósticos realizados. Não foi inferida uma intenção de coorte apenas pelos nomes; a documentação descreve o que está na expressão. A interação com relações bidirecionais precisa ser considerada na validação.

## Perdas e valor em aberto

As medidas de perdas contam id ou somam amount_v2 quando a etapa atual é `Negócio perdido`. Elas não ativam um relacionamento com a data de perda; não devem ser descritas automaticamente como perdas ocorridas no mês. A distribuição por motivo depende do campo no visual e do contexto de filtros.

O valor de negócios na mesa soma três medidas: proposta, negociação e contrato enviado. As três dependências foram incluídas. A medida de proposta usa somente o pipeline A; as outras duas usam A e B. Essa diferença existe no código e não foi silenciosamente corrigida.

## Carteira e acompanhamento: o nome não substitui a regra

- **Qtd de novos clientes da carteira:** conta registros de contas numa etapa específica. Não faz contagem distinta de clientes nem define sozinho uma data de aquisição.
- **Qtd de negócios parados:** filtra etapas e pipelines, sem aplicar condição mínima de dias sem avanço.
- **Dias Abero AVG Stpo S/Atv30D:** apesar do nome, faz COUNT de negócios em etapas selecionadas com a classificação de atividade igual a Não. Não calcula média de dias. A classificação de atividade é uma dependência do modelo reservada.
- **Diagnósticos agendados:** a expressão selecionada conta id dos pipelines; não contém teste explícito de data de agendamento.

Essas observações preservam a fidelidade ao projeto histórico. Mudanças de regra exigem validação do processo de negócio antes de alterar as expressões.

## COUNT e granularidade

As contagens selecionadas usam COUNT do id, que conta valores não vazios; não eliminam duplicidades como DISTINCTCOUNT. Quantidade de registros, negócios e clientes só coincidem quando a granularidade da tabela permite essa interpretação.

## Como interpretar e validar

1. Identifique a entidade: negócio ou conta.
2. Confira a data de referência e os filtros de pipeline/etapa.
3. Confira a granularidade e possíveis duplicidades.
4. Compare o total com um período conhecido da fonte.
5. Para taxas e tickets, confira separadamente numerador e denominador.

Os marcadores `<PIPELINE_A>`, `<PIPELINE_B>`, `<PIPELINE_CONTAS>` e `<ETAPA_NOVO_CLIENTE>` substituem identificadores internos distintos. Nomes e lógica das expressões foram preservados, com indentação organizada.

Houve revisão textual e das dependências entre as medidas selecionadas. Não houve execução no Power BI Desktop. O indicador histórico de ciclo negativo continua pendente de validação e não foi acrescentado à seleção de código.
