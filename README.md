# 🚀 BlocLabs Flutter Project

[![Flutter Version](https://img.shields.io/badge/Flutter-3.x-blue.svg?style=for-the-badge&logo=flutter)](https://flutter.dev)
[![Dart Version](https://img.shields.io/badge/Dart-3.x-blue.svg?style=for-the-badge&logo=dart)](https://dart.dev)
[![Bloc Pattern](https://img.shields.io/badge/Bloc-State%20Management-blueviolet.svg?style=for-the-badge&logo=flutter)](https://bloclibrary.dev/)
[![Equatable](https://img.shields.io/badge/Equatable-Value%20Equality-orange.svg?style=for-the-badge)](https://pub.dev/packages/equatable)

A Flutter project demonstrating various concepts, including the BLoC pattern for state management and the use of the Equatable package for efficient state comparisons.

## 📂 Project Structure

The project follows a feature-first directory structure, primarily within the `lib` folder:

```
lib/
├── main.dart             # 🏁 Main entry point of the application
├── counter_app/          # 🔢 Counter feature module
│   ├── bloc/             # 🧱 BLoC components for the Counter
│   │   ├── counter_bloc.dart   # 🧠 Business logic for the counter
│   │   ├── counter_event.dart  # ⚡ Events that trigger state changes
│   │   └── counter_state.dart  # 📦 State representing the counter's UI
│   └── ui/               # 🖼️ UI components for the Counter
│       └── counter_screen.dart # 🖥️ Screen displaying the counter
└── equatable_demo/       # ✨ Demonstration of the Equatable package
    └── equatable_demo.dart # 🧑‍🔬 Example usage of Equatable
```

## ✨ Core Components

### <picture><source media="(prefers-color-scheme: dark)" srcset="https://fonts.gstatic.com/s/e/notoemoji/latest/1f522/512.webp"><source media="(prefers-color-scheme: light)" srcset="https://fonts.gstatic.com/s/e/notoemoji/latest/1f522/512.webp"><img src="https://fonts.gstatic.com/s/e/notoemoji/latest/1f522/512.webp" alt="🔢" width="32" height="32"></picture> Counter App (BLoC Implementation)

This module demonstrates a simple counter application using the BLoC (Business Logic Component) pattern for state management.

#### <picture><source media="(prefers-color-scheme: dark)" srcset="https://fonts.gstatic.com/s/e/notoemoji/latest/1f9f1/512.webp"><source media="(prefers-color-scheme: light)" srcset="https://fonts.gstatic.com/s/e/notoemoji/latest/1f9f1/512.webp"><img src="https://fonts.gstatic.com/s/e/notoemoji/latest/1f9f1/512.webp" alt="🧱" width="32" height="32"></picture> BLoC Components:

*   **`counter_event.dart`**: Defines the events that can be dispatched to the `CounterBloc`.
    *   `IncrementEvent`: Signals the intention to increment the counter.
    *   `DecrementEvent`: Signals the intention to decrement the counter.
*   **`counter_state.dart`**: Defines the `CounterState` for the `CounterBloc`.
    *   The `CounterState` class (extending `Equatable`) holds the current `counter` value.
    *   It has a default initial value for the counter (e.g., 0).
    *   The use of `Equatable` ensures that state changes are handled efficiently by comparing the `counter` property.
*   **`counter_bloc.dart`**: The core of the counter feature.
    *   It listens to `CounterEvent`s (like `IncrementEvent`, `DecrementEvent`).
    *   Manages the `count` state.
    *   Emits new `CounterState`s in response to events, leveraging `Equatable` to ensure UI updates only when the count actually changes.

#### <picture><source media="(prefers-color-scheme: dark)" srcset="https://fonts.gstatic.com/s/e/notoemoji/latest/1f5bc/512.webp"><source media="(prefers-color-scheme: light)" srcset="https://fonts.gstatic.com/s/e/notoemoji/latest/1f5bc/512.webp"><img src="https://fonts.gstatic.com/s/e/notoemoji/latest/1f5bc/512.webp" alt="🖼️" width="32" height="32"></picture> UI:

*   **`counter_screen.dart`**: The user interface for the counter.
    *   Displays the current counter value from `CounterBloc`.
    *   Provides buttons to dispatch `IncrementEvent` and `DecrementEvent` to the `CounterBloc`.
    *   Uses `BlocBuilder` or `BlocListener` to react to state changes from `CounterBloc` and update the UI.

#### <picture><source media="(prefers-color-scheme: dark)" srcset="https://fonts.gstatic.com/s/e/notoemoji/latest/1f30a/512.webp"><source media="(prefers-color-scheme: light)" srcset="https://fonts.gstatic.com/s/e/notoemoji/latest/1f30a/512.webp"><img src="https://fonts.gstatic.com/s/e/notoemoji/latest/1f30a/512.webp" alt="🌊" width="32" height="32"></picture> Data Flow:

1.  **UI Interaction**: User taps the "+" or "-" button on `CounterScreen`.
2.  **Event Dispatch**: `CounterScreen` dispatches an `IncrementEvent` or `DecrementEvent` to the `CounterBloc`.
3.  **Bloc Processing**: `CounterBloc` receives the event, updates its internal state (the count).
4.  **State Emission**: `CounterBloc` emits a new `CounterState` with the updated count.
5.  **UI Update**: `CounterScreen` (listening via `BlocBuilder`) receives the new state and re-renders the UI to display the new count.

---

### <picture><source media="(prefers-color-scheme: dark)" srcset="https://fonts.gstatic.com/s/e/notoemoji/latest/2728/512.webp"><source media="(prefers-color-scheme: light)" srcset="https://fonts.gstatic.com/s/e/notoemoji/latest/2728/512.webp"><img src="https://fonts.gstatic.com/s/e/notoemoji/latest/2728/512.webp" alt="✨" width="32" height="32"></picture> Equatable Usage Example

The `equatable` package is utilized within the project, particularly in BLoC states, to enable value-based equality. This prevents unnecessary widget rebuilds or state emissions if the underlying data has not changed.

The `counter_app/bloc/counter_state.dart` file provides a clear example of this:

```dart
import 'package:equatable/equatable.dart';

class CounterState extends Equatable {
  final int counter;

  const CounterState({this.counter = 0});

  CounterState copyWith({int? counter}) {
    return CounterState(counter: counter ?? this.counter);
  }

  @override
  List<Object?> get props => [counter];
}
```
*   **Purpose**: By extending `Equatable` and overriding the `props` getter with `[counter]`, `CounterState` objects are considered equal if their `counter` values are the same. This is crucial for the BLoC pattern to correctly determine when to rebuild UI components or trigger other reactions to state changes.
*   The `equatable_demo/equatable_demo.dart` file further illustrates practical applications and examples of using the `equatable` package within the project.

---

## <picture><source media="(prefers-color-scheme: dark)" srcset="https://fonts.gstatic.com/s/e/notoemoji/latest/1f6e0/512.webp"><source media="(prefers-color-scheme: light)" srcset="https://fonts.gstatic.com/s/e/notoemoji/latest/1f6e0/512.webp"><img src="https://fonts.gstatic.com/s/e/notoemoji/latest/1f6e0/512.webp" alt="🛠️" width="32" height="32"></picture> Key Patterns & Libraries Used

*   **BLoC Pattern**: For robust and scalable state management.
    *   Separates business logic from the UI.
    *   Uses Events to signify user actions or system occurrences.
    *   Uses States to represent the condition of the UI at any given time.
*   **Equatable**: To simplify value comparisons of objects, especially for BLoC states and events, ensuring that UI rebuilds or bloc state changes occur only when actual data values change.
*   **Flutter**: The UI toolkit for building natively compiled applications for mobile, web, and desktop from a single codebase.
*   **Dart**: The programming language used for Flutter development.

---
