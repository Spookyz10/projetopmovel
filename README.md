# CineBrasil

Aplicativo Flutter acadêmico com consumo de APIs usando `FutureBuilder`.

## APIs desta implementação

- **API pública real:** TMDB, utilizada em `DetalhesPage` para consultar dados
  de O Auto da Compadecida.
- **API Fake individual do Álvaro:** My JSON Server, utilizada em
  `ProfilePage`. A estrutura está em `fake_api_alvaro/db.json` e deve ser
  publicada em um repositório separado.

## Configuração local, uma única vez

O projeto não salva tokens no Git. Cada integrante deve copiar
`config/local.example.json` para `config/local.json` e preencher o token longo
chamado **API Read Access Token**:

```json
{
  "TMDB_ACCESS_TOKEN": "SEU_API_READ_ACCESS_TOKEN",
  "FAKE_API_BASE_URL": "https://my-json-server.typicode.com/Spookyz10/fake_api_alvaro"
}
```

O arquivo `config/local.json` está no `.gitignore`. A chave curta `API Key (v3
auth)` não é usada.

No VS Code, abra **Executar e Depurar**, selecione **CineBrasil (com APIs)**,
escolha o computador, emulador ou telefone conectado e pressione `F5`. A
configuração em `.vscode/launch.json` passa o arquivo automaticamente.

Pelo terminal, o comando equivalente é:

```powershell
flutter run --dart-define-from-file=config/local.json
```

## Publicar a API Fake individual

1. Crie no GitHub um repositório **público** chamado `fake_api_alvaro`.
2. Envie os arquivos que estão na pasta `fake_api_alvaro`, deixando o
   `db.json` na raiz desse novo repositório.
3. Confirme que a branch padrão é `main`.
4. Teste no navegador:

```text
https://my-json-server.typicode.com/Spookyz10/fake_api_alvaro/profiles/1
```

O endereço é HTTPS público, portanto funciona no Windows, navegador, emulador
Android e telefone físico. Não use `localhost` no aplicativo.

Se o nome do repositório ou usuário for diferente, basta alterar
`FAKE_API_BASE_URL` em `config/local.json`; não é necessário alterar o Dart.

## Organização

```text
config/
  local.example.json       # Modelo compartilhado, sem segredo
  local.json               # Configuração privada, ignorada pelo Git
fake_api_alvaro/
  db.json                  # Banco da API fake individual
lib/
  api/
    profile_api.dart       # Cliente da API Fake
    tmdb_api.dart          # Cliente da TMDB
  domain/
    movie_details.dart
    user_profile.dart
  pages/
    detalhes_page.dart     # FutureBuilder da API real
    profile_page.dart      # FutureBuilder da API fake
```

## Validação

```powershell
flutter pub get
flutter analyze
flutter test
flutter build web
```
