# Inventário dos relacionamentos

Leitura do arquivo relationships.tmdl: 24 vínculos, sem identificadores técnicos de linhagem. Os nomes de colunas são metadados, não valores de registros.

A coluna Origem/Destino segue a definição do arquivo e não é uma seta de fluxo de dados. Onde o filtro está como padrão, não há declaração explícita de bidirecionalidade.

| Origem | Destino | Estado | Filtro | Cardinalidade |
| --- | --- | --- | --- | --- |
| `hs_Negócios.data_agendada_para_o_diagnostico` | `dCalendario.Date` | Inativo | Bidirecional | Muitos-para-um (padrão do formato) |
| `hs_Negócios.data_da_apresentacao_de_proposta` | `dCalendario.Date` | Inativo | Bidirecional | Muitos-para-um (padrão do formato) |
| `hs_Negócios.data_da_demo` | `dCalendario.Date` | Inativo | Bidirecional | Muitos-para-um (padrão do formato) |
| `hs_Negócios.data_de_contrato_assinado` | `dCalendario.Date` | Inativo | Bidirecional | Muitos-para-um (padrão do formato) |
| `hs_Negócios.data_de_contrato_enviado` | `dCalendario.Date` | Inativo | Bidirecional | Muitos-para-um (padrão do formato) |
| `hs_Negócios.data_do_diagnostico` | `dCalendario.Date` | Inativo | Bidirecional | Muitos-para-um (padrão do formato) |
| `hs_Negócios.data_do_aceite_formal` | `dCalendario.Date` | Inativo | Bidirecional | Muitos-para-um (padrão do formato) |
| `hs_Negócios.data_do_pagamento_efetuado` | `dCalendario.Date` | Inativo | Bidirecional | Muitos-para-um (padrão do formato) |
| `hs_Contas.data_de_faturamento_concluido` | `dCalendario.Date` | Inativo | Padrão do modelo | Muitos-para-um (padrão do formato) |
| `hs_Negócios.createdate` | `dCalendario.Date` | Ativo | Bidirecional | Muitos-para-um (padrão do formato) |
| `hs_Negócios.tamanho_da_empresa_oficial` | `'filtro_Tamanho de Empresa'.'tamanho_da_empresa.value'` | Ativo | Padrão do modelo | Muitos-para-um (padrão do formato) |
| `hs_Negócios.origem` | `filtro_Origem.'origem.versions.value'` | Ativo | Padrão do modelo | Muitos-para-muitos |
| `hs_Negócios.hs_analytics_source` | `'filtro_Fonte Original'.'hs_analytics_source.versions.value'` | Ativo | Padrão do modelo | Muitos-para-um (padrão do formato) |
| `hs_Negócios.data_de_faturamento_concluido` | `dCalendario.Date` | Inativo | Padrão do modelo | Muitos-para-um (padrão do formato) |
| `hs_Contas.hs_createdate` | `dCalendario.Date` | Ativo | Padrão do modelo | Muitos-para-um (padrão do formato) |
| `hs_Contas.tamanho_da_empresa` | `'filtro_Tamanho de Empresa'.'tamanho_da_empresa.value'` | Ativo | Padrão do modelo | Muitos-para-um (padrão do formato) |
| `hs_Negócios.qual_o_segmento_de_atuacao_da_sua_empresa_` | `filtro_Segmento.'Segmento - Original'` | Ativo | Padrão do modelo | Muitos-para-um (padrão do formato) |
| `hs_Contas.qual_o_segmento_de_atuacao_da_sua_empresa_` | `filtro_Segmento.'Segmento - Original'` | Ativo | Padrão do modelo | Muitos-para-um (padrão do formato) |
| `hs_Contas.origem_do_canal_de_vendas` | `filtro_Origem.'origem.versions.value'` | Ativo | Padrão do modelo | Muitos-para-um (padrão do formato) |
| `hs_Negócios.Dealstage-Hub` | `filtro_etapas.Stage` | Ativo | Bidirecional | Muitos-para-um (padrão do formato) |
| `hs_Negócios.'Etapa da Perda'` | `filtro_etapas.Stage` | Inativo | Padrão do modelo | Muitos-para-um (padrão do formato) |
| `hs_Negócios.'data_da_demo.v2'` | `dCalendario.Date` | Inativo | Padrão do modelo | Muitos-para-um (padrão do formato) |
| `hs_Negócios.qual_diretor_indicou_este_lead_` | `filtro_diretor.'options.value'` | Ativo | Padrão do modelo | Muitos-para-um (padrão do formato) |
| `hs_Contas.qual_diretor_indicou_este_lead_` | `filtro_diretor.'options.value'` | Inativo | Padrão do modelo | Muitos-para-um (padrão do formato) |

As cardinalidades refletem configuração do modelo, não uma verificação de unicidade dos dados. Consulte [a interpretação dos vínculos](modelo-relacionamentos.md).
