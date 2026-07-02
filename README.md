# bank_app

Bank App Flutter project.

Video: https://drive.google.com/drive/folders/1vPBOObZBbYMdupHiMiOThoDqZgmvqABO?usp=sharing

API for login: https://dummyjson.com/auth/login

Credentials for testing:
username: "emilys",
password: "emilyspass"

__________________________________________________


Technical Decision Document
1. Architecture Choice: Clean Architecture

The project follows Clean Architecture to separate responsibilities into three layers:

- Domain Layer: Business logic (entities, repositories, use cases)
- Data Layer: Data sources (API / mock / local storage)
- Presentation Layer: UI and state management
Use it for:
- Improves scalability
- Makes code testable
- Separates UI from business logic

2. State Management: Riverpod

Riverpod was chosen as the state management solution.

Use it for:
- No BuildContext dependency
- Better testability
- Works well with Clean Architecture
- Prevents widget rebuild issues

3. Local Storage: SharedPreferences

SharedPreferences is used to store cached data (mocked products)
Use it for:
- Simple key-value storage
- Lightweight solution

4. UI State Design

Dashboard state is managed using Riverpod StateNotifier.
States:
loading
loaded
error
Why?
Prevents inconsistent UI states
Centralized state management

5. Trade-offs
Prioritized:
- Clean architecture
- Readability
- Maintainability

6. Future Improvements
- Replace mock API with real backend
- Add secure storage for authentication
- Add unit and widget tests

_______________________________________________

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
