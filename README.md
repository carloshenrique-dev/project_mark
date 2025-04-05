# Weather App

A modern Flutter application that provides weather information with a clean and intuitive user interface.

## 🚀 Demo

![weather_app_demo](https://github.com/user-attachments/assets/c84d403b-ca5f-4aea-8298-5d3c34c5273e)


## 🚀 Features

- Clean Architecture implementation
- Dependency Injection using GetIt
- State Management with GetX
- Material Design 3
- Custom theme with Google Fonts
- HTTP-based API integration
- SVG image support
- Unit testing with Mocktail
- Flutter workflow (install dependencies, run tests, analyze project structure) 

## 🏗️ Architecture

The project follows Clean Architecture principles with the following structure:

- **data**: Data layer containing repositories and data sources
- **domain**: Business logic and entities
- **presentation**: UI components and screens
- **di**: Dependency injection setup
- **constants**: Application-wide constants

## 📋 Prerequisites

- Flutter SDK (^3.7.0)
- Dart SDK (^3.7.0)
- Android Studio / VS Code
- Android SDK (for Android development)
- Xcode (for iOS development, macOS only)

## 🔧 Installation

1. Clone the repository:
```bash
git clone [repository-url]
cd project_mark
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the application:
```bash
flutter run
```

## 🛠️ Development Setup

1. Ensure you have Flutter installed and configured:
```bash
flutter doctor
```

2. Install the required dependencies:
```bash
flutter pub get
```

3. For iOS development (macOS only):
```bash
cd ios
pod install
cd ..
```

## 🧪 Testing

Run the tests using:
```bash
flutter test
```

## 📦 Dependencies

- get: ^4.7.2 - State management
- http: ^1.2.0 - HTTP client
- get_it: ^8.0.3 - Dependency injection
- flutter_svg: ^2.0.10+1 - SVG support
- google_fonts: ^6.1.0 - Custom fonts
- json_annotation: ^4.8.1 - JSON serialization

## 🧩 Project Structure

```
lib/
├── src/
│   ├── constants/     # Application constants
│   ├── data/         # Data layer
│   ├── domain/       # Business logic
│   ├── presentation/ # UI components
│   └── di/           # Dependency injection
├── test/             # Test files
└── main.dart         # Application entry point
```
