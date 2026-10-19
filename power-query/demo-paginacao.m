// Demonstração autônoma, sem conexão, credenciais ou funções externas.
let
    Paginas = [
        inicio = [
            results = {[id = "DEMO-A", etapa = "Proposta"], [id = "DEMO-B", etapa = "Contrato"]},
            paging = [next = [after = "pagina-b"]]
        ],
        #"pagina-b" = [
            results = {[id = "DEMO-C", etapa = "Diagnóstico"]}
        ]
    ],
    ObterPagina = (After as text) as record =>
        Record.Field(Paginas, if After = "" then "inicio" else After),
    ProximaPagina = (After as text) as nullable text =>
        let
            Resposta = ObterPagina(After),
            Paging = Record.FieldOrDefault(Resposta, "paging", null),
            Next = if Paging = null then null else Record.FieldOrDefault(Paging, "next", null)
        in
            if Next = null then null else Text.From(Next[after]),
    Cursores = List.Generate(() => "", each _ <> null, each ProximaPagina(_)),
    Registros = List.Combine(
        List.Transform(Cursores, each ObterPagina(_)[results])
    ),
    Resultado = Table.FromRecords(Registros)
in
    Resultado
