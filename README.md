# 🧪 Pickle Rick - Flutter App

Flutter application inspired by the **Rick and Morty** universe, consuming the [Rick and Morty API](https://rickandmortyapi.com/api), built using **Clean Architecture** with the **MVVM** pattern and **Provider** for state management.

---

## 🧠 Architecture

This project follows the **Clean Architecture** approach with a **MVVM (Model - View - ViewModel)** pattern, organized into layers:

```
lib/
├── core/              # Shared resources (DI, network, reusable widgets)
├── data/              # Implementations (datasources, DTOs, repositories)
├── domain/            # Models, abstract repositories, and use cases
├── presentation/      # UI (pages, providers/ViewModels, and widgets)
├── main.dart          # Entry point
```

---

## ⚙️ Technologies

- **Flutter 3.8.1**
- **Dio** for HTTP requests
- **GetIt** for dependency injection
- **Provider** with **ChangeNotifier** for state management
- **Flutter Dotenv** for environment variable management
- **Rick and Morty API** as the data source

---

## 📦 Dependencies

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

## 🧪 Running the App

1. Clone this repository:

```bash
git clone https://github.com/your-username/pickle_rick.git
cd pickle_rick
```

2. Create a `.env` file at the root directory with the following content (adjust if needed):

```env
base_url=https://rickandmortyapi.com/api
```

3. Install dependencies:

```bash
flutter pub get
```

4. Run the app:

```bash
flutter run
```

---

## 🧱 Layer Organization

| Layer           | Description                                                                  |
|-----------------|------------------------------------------------------------------------------|
| `domain`        | Contains models, interfaces, and use cases                                   |
| `data`          | Implements repositories and datasources with API calls                       |
| `presentation`  | User interface, widgets, pages, and providers (ViewModels)                   |
| `core`          | Reusable resources, routes, DI setup, utilities, network, and common widgets |

---

## 📡 API

This app consumes the [Rick and Morty API](https://rickandmortyapi.com/documentation).

Example endpoint used:

```
GET https://rickandmortyapi.com/api/character
```

Returns a paginated list of characters.

---

## 📽️ Demo

<img src="assets/gif/pickle_rick.gif" alt="Pickle Rick App Demo" width="400"/>

---

## 🧑‍💻 Author

Developed by **Marcos Baker**  
[marcos.baker@hotmail.com](mailto:marcos.baker@hotmail.com)  
[LinkedIn](https://www.linkedin.com/in/marcosbaker)

---

## 📄 License

This project is open source and licensed under the terms of the [MIT License](LICENSE).
