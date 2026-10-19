// Retorna o cursor da próxima página. null encerra o loop.
// A chamada à API fica centralizada em fxDadosObjeto.
(TipoObjeto as text, After as nullable text) as nullable text =>
let
    Resposta = fxDadosObjeto(TipoObjeto, After),
    Paging = Record.FieldOrDefault(Resposta, "paging", null),
    Next = if Paging = null then null else Record.FieldOrDefault(Paging, "next", null),
    Cursor = if Next = null then null else Record.FieldOrDefault(Next, "after", null)
in
    if Cursor = null then null else Text.From(Cursor)
