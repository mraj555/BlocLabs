# 🚀 BlocLabs Flutter Project

[![Flutter Version](https://img.shields.io/badge/Flutter-3.x-blue.svg?style=for-the-badge&logo=flutter)](https://flutter.dev)
[![Dart Version](https://img.shields.io/badge/Dart-3.x-blue.svg?style=for-the-badge&logo=dart)](https://dart.dev)
[![Bloc Pattern](https://img.shields.io/badge/Bloc-State%20Management-blueviolet.svg?style=for-the-badge&logo=flutter)](https://bloclibrary.dev/)
[![Equatable](https://img.shields.io/badge/Equatable-Value%20Equality-orange.svg?style=for-the-badge)](https://pub.dev/packages/equatable)

Welcome to **BlocLabs**! This Flutter project serves as a practical demonstration of modern application development concepts, primarily focusing on the **BLoC pattern** for robust state management and leveraging the **Equatable** package for efficient value comparisons.

## 📂 Project Architecture & Structure

The project embraces a _feature-first_ directory organization, promoting modularity and clarity. Core logic and UI components are primarily located within the `lib` folder.

```
lib/
├── 🏁 main.dart                      # Application's main entry point
│
├── 🔢 counter_app/                   # Counter Feature Module
│   ├── 🧱 bloc/                      # BLoC components for the Counter
│   │   ├── counter_bloc.dart    # 🧠 Core business logic for the counter
│   │   ├── counter_event.dart   # ⚡ Events triggering state changes
│   │   └── counter_state.dart   # 📦 States representing counter's UI
│   └── 🖼️ ui/                       # UI components for the Counter
│       └── counter_screen.dart  # 🖥️ Screen displaying the counter
│
└── ✨ equatable_demo/                # Equatable Package Demonstration
    └── equatable_demo.dart      # 🧑‍🔬 Example usage of Equatable
```

---

## ✨ Core Components & Features

### 🔢 Counter App (BLoC Implementation)

This module showcases a fundamental counter application, meticulously built using the **BLoC (Business Logic Component)** pattern. It effectively decouples business logic from the UI, leading to a more testable and maintainable codebase.

#### 🧱 BLoC Components Deep Dive

| File                 | Purpose                                                                                                                               | Key Members (Conceptual)                                  |
| :------------------- | :------------------------------------------------------------------------------------------------------------------------------------ | :-------------------------------------------------------- |
| `counter_event.dart` | Defines the events that the `CounterBloc` can process. These typically originate from UI interactions.                                | `IncrementEvent`, `DecrementEvent`                        |
| `counter_state.dart` | Represents the different states of the counter feature. The UI rebuilds itself based on these states.                                   | `CounterInitial` (initial state), `CounterValueChanged` (holds current `count`) |
| `counter_bloc.dart`  | The heart of the counter feature. It listens to `CounterEvent`s, processes them, manages the `count` state, and emits `CounterState`s. | `on<IncrementEvent>`, `on<DecrementEvent>`, `emit()`     |

#### 🖼️ UI (`counter_screen.dart`)

*   **Displays**: Shows the current counter value, sourced 소비자를 `CounterBloc`.
*   **Interactions**: Provides "+" and "-" buttons that dispatch `IncrementEvent` and `DecrementEvent` respectively.
*   **Reactivity**: Utilizes `BlocBuilder` (or `BlocListener`) to subscribe to state changes from `CounterBloc` and update the UI accordingly.

#### 🌊 Counter App: Data Flow

1.  **🎬 UI Interaction**: User taps the `➕` or `➖` button on `CounterScreen`.
2.  **📤 Event Dispatch**: `CounterScreen` dispatches an `IncrementEvent` or `DecrementEvent` to the `CounterBloc`.
3.  **⚙️ Bloc Processing**: `CounterBloc` receives the event, updates its internal state (the `count`).
4.  **📢 State Emission**: `CounterBloc` emits a new `CounterValueChanged` state containing the updated `count`.
5.  **🔄 UI Update**: `CounterScreen`, listening via `BlocBuilder`, receives the new state and re-renders the relevant parts of the UI to display the new count.

---

### ✨ Equatable Demo (`equatable_demo.dart`)

This section demonstrates the utility of the `equatable` package.

*   **🎯 Purpose**: `Equatable` simplifies the process of comparing objects by value rather than by reference. This is crucial in Flutter (especially with BLoC/Cubit) to prevent unnecessary widget rebuilds or state notifications when the underlying data hasn't truly changed.
*   **⚙️ How it Works**: By extending `Equatable` and overriding the `props` getter, you specify which properties should be considered when determining equality. `Equatable` then handles the `==` operator and `hashCode` generation for you.

    ```dart
    // Conceptual example of an Equatable class
    // import 'package:equatable/equatable.dart';

    // class MyCustomState extends Equatable {
    //   final int id;
    //   final String data;

    //   const MyCustomState(this.id, this.data);

    //   @override
    //   List<Object?> get props => [id, data]; // Only id and data are used for equality checks
    // }
    ```

---

## 🛠️ Key Patterns & Libraries Leveraged

*   🌀 **BLoC Pattern**:
    *   Ensures a clear separation of concerns: _UI ↔ Events ↔ BLoC ↔ States ↔ UI_.
    *   Enhances testability and scalability of applications.
    *   Promotes a reactive approach to state management.
*   ⚖️ **Equatable**:
    *   Provides a simple way to achieve value equality for custom objects.
    *   Prevents common pitfalls with object comparison in Dart.
    *   Optimizes performance by avoiding unnecessary rebuilds when state objects are equivalent.
*   🐦 **Flutter**: The core UI toolkit for crafting beautiful, natively compiled applications for mobile, web, and desktop from a single codebase.
*   🎯 **Dart**: The powerful, object-oriented programming language that powers Flutter.

