// Consulta adaptada para deals. Depende das duas funções e da autenticação.
// Para objeto personalizado, o tipo deve ser um parâmetro reservado validado no ambiente.
let
    TipoObjeto = "deals",
    Cursores = List.Generate(
        () => "",
        each _ <> null,
        each fxProximaPagina(TipoObjeto, _)
    ),
    TabelaCursores = Table.FromList(
        Cursores,
        Splitter.SplitByNothing(),
        {"After"}
    ),
    FuncaoAplicada = Table.AddColumn(
        TabelaCursores,
        "Resposta",
        each fxDadosObjeto(TipoObjeto, [After]),
        type record
    ),
    ListasResultados = List.Transform(
        FuncaoAplicada[Resposta],
        each Record.Field(_, "results")
    ),
    Registros = List.Combine(ListasResultados),
    Tabela = Table.FromRecords(
        Registros,
        {"id", "properties"},
        MissingField.UseNull
    )
in
    Tabela
