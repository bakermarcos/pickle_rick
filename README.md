# 🧪 Pickle Rick - Flutter App

Aplicativo Flutter baseado no universo de **Rick and Morty**, consumindo a [Rick and Morty API](https://rickandmortyapi.com/api), utilizando **Clean Architecture** com padrão **MVVM** e **Provider** como gerência de estado.

---

## 🧠 Arquitetura

Este projeto utiliza a abordagem **Clean Architecture** com separação em camadas e padrão **MVVM (Model - View - ViewModel)**:

```
lib/
├── core/              # Recursos compartilhados (DI, network, widgets reutilizáveis)
├── data/              # Implementações (datasources, dtos, repositórios)
├── domain/            # Models, repositórios abstratos e casos de uso
├── presentation/      # UI (páginas, providers/ViewModels e widgets)
├── main.dart          # main
```

---

## ⚙️ Tecnologias

- **Flutter 3.8.1**
- **Dio** para requisições HTTP
- **GetIt** para injeção de dependências
- **Provider** com **ChangeNotifier** para gerência de estado
- **Flutter Dotenv** para gerenciar variáveis de ambiente
- **Rick and Morty API** como fonte de dados

---

## 📦 Dependências

```yaml
dependencies:
  flutter:
    sdk: flutter
  dio: ^5.7.0
  flutter_dotenv: ^5.2.1
  flutter_spinkit: ^5.2.1
  get_it: ^8.0.2
  intl: ^0.20.0
  provider: ^6.1.5
```

---

## 🧪 Execução

1. Clone este repositório:

```bash
git clone https://github.com/seu-usuario/pickle_rick.git
cd pickle_rick
```

2. Crie um arquivo `.env` na raiz com o seguinte conteúdo (ajustável conforme necessidade):

```env
base_url=https://rickandmortyapi.com/api
```

3. Instale as dependências:

```bash
flutter pub get
```

4. Rode o app:

```bash
flutter run
```

---

## 🧱 Organização por Camadas

| Camada          | Descrição                                                                 |
|-----------------|---------------------------------------------------------------------------|
| `domain`        | Contém as entidades, interfaces e usecases                                |
| `data`          | Implementa os repositórios e datasources com chamadas à API               |
| `presentation`  | Interface do usuário, widgets, páginas e providers (viewmodels)           |
| `core`          | Recursos reutilizáveis, rotas, di, utilitários, network e widgets comuns  |
| `app`           | Inicialização da aplicação (main, routes, DI setup)                       |

---

## 📡 API

Este app consome a [Rick and Morty API](https://rickandmortyapi.com/documentation).

Exemplo de endpoint utilizado:

```
GET https://rickandmortyapi.com/api/character
```

Retorna a lista de personagens com paginação.

---

## 📽️ Demonstração

![Pickle Rick App Demo](assets/gif/demo.gif)

---

## 🧑‍💻 Autor

Desenvolvido por **Marcos Baker**  
[marcos.baker@hotmail.com](mailto:marcos.baker@hotmail.com)  
[LinkedIn](https://www.linkedin.com/in/marcosbaker)

---

## 📄 Licença

Este projeto é open source e está licenciado sob os termos da [MIT License](LICENSE).
