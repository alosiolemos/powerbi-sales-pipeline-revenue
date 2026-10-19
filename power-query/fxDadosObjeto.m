// Exemplo adaptado do padrão encontrado no projeto.
// pTokenHubSpot é um parâmetro de texto reservado, sem valor distribuído.
// O armazenamento seguro da credencial deve ser definido no ambiente real.
(TipoObjeto as text, After as nullable text) as record =>
let
    ParametrosBase = [
        limit = "100",
        archived = "false"
    ],
    Parametros =
        if After = null or After = "" then
            ParametrosBase
        else
            Record.AddField(ParametrosBase, "after", After),
    Resposta = Json.Document(
        Web.Contents(
            "https://api.hubapi.com",
            [
                RelativePath = "crm/v3/objects/" & TipoObjeto,
                Query = Parametros,
                Headers = [Authorization = "Bearer " & pTokenHubSpot]
            ]
        )
    )
in
    Resposta
