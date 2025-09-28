# 🚀 BlocLabs Flutter Project

[![Flutter Version](https://img.shields.io/badge/Flutter-3.x-blue.svg?style=for-the-badge&logo=flutter)](https://flutter.dev)
[![Dart Version](https://img.shields.io/badge/Dart-3.x-blue.svg?style=for-the-badge&logo=dart)](https://dart.dev)
[![Bloc Pattern](https://img.shields.io/badge/Bloc-State%20Management-blueviolet.svg?style=for-the-badge&logo=flutter)](https://bloclibrary.dev/)
[![Equatable](https://img.shields.io/badge/Equatable-Value%20Equality-orange.svg?style=for-the-badge)](https://pub.dev/packages/equatable)

A Flutter project demonstrating various concepts, including the BLoC pattern for state management and the use of the Equatable package.

## 📂 Project Structure

The project follows a feature-first directory structure, primarily within the `lib` folder:

```
lib/
├── main.dart             # 🏁 Main entry point of the application
├── counter_app/          # 🔢 Counter feature module
│   ├── bloc/             # 🧱 BLoC components for the Counter
│   │   ├── counter_bloc.dart   # 🧠 Business logic for the counter
│   │   ├── counter_event.dart  # ⚡ Events that trigger state changes
│   │   └── counter_state.dart  # 📦 States representing the counter's UI
│   └── ui/               # 🖼️ UI components for the Counter
│       └── counter_screen.dart # 🖥️ Screen displaying the counter
└── equatable_demo/       # ✨ Demonstration of the Equatable package
    └── equatable_demo.dart # 🧑‍🔬 Example usage of Equatable
```

## ✨ Core Components

### 🔢 Counter App (BLoC Implementation)

This module demonstrates a simple counter application using the BLoC (Business Logic Component) pattern for state management.

#### 🧱 BLoC Components:

*   **`counter_event.dart`**: Defines the events that can be dispatched to the `CounterBloc`.
    *   `IncrementEvent`: Signals the intention to increment the counter.
    *   `DecrementEvent`: Signals the intention to decrement the counter.
*   **`counter_state.dart`**: Defines the states that the `CounterBloc` can emit.
    *   `CounterInitial`: The initial state of the counter.
    *   `CounterValueChanged`: Represents the state when the counter's value has changed, holding the current `count`.
*   **`counter_bloc.dart`**: The core of the counter feature.
    *   It listens to `CounterEvent`s.
    *   Manages the `count` state.
    *   Emits `CounterState`s in response to events.
    *   For example, on receiving an `IncrementEvent`, it increments the internal count and emits a `CounterValueChanged` state with the new count.

#### 🖼️ UI:

*   **`counter_screen.dart`**: The user interface for the counter.
    *   Displays the current counter value from `CounterBloc`.
    *   Provides buttons to dispatch `IncrementEvent` and `DecrementEvent` to the `CounterBloc`.
    *   Uses `BlocBuilder` or `BlocListener` to react to state changes from `CounterBloc` and update the UI.

#### 🌊 Data Flow:

1.  **UI Interaction**: User taps the "+" or "-" button on `CounterScreen`.
2.  **Event Dispatch**: `CounterScreen` dispatches an `IncrementEvent` or `DecrementEvent` to the `CounterBloc`.
3.  **Bloc Processing**: `CounterBloc` receives the event, updates its internal state (the count).
4.  **State Emission**: `CounterBloc` emits a new `CounterValueChanged` state with the updated count.
5.  **UI Update**: `CounterScreen` (listening via `BlocBuilder`) receives the new state and re-renders the UI to display the new count.

---

### ✨ Equatable Demo

*   **`equatable_demo.dart`**: This file likely contains examples demonstrating the use of the `equatable` package.
    *   **Purpose**: `Equatable` is used to enable value equality for objects, which is particularly useful in BLoC/Cubit states and events to prevent unnecessary rebuilds if the actual data hasn't changed.
    *   It overrides `==` and `hashCode` for you, based on the properties you provide in the `props` getter.

    ```dart
    // Example from a typical Equatable class
    // class MyState extends Equatable {
    //   final int value;
    //   final String name;

    //   const MyState(this.value, this.name);

    //   @override
    //   List<Object?> get props => [value, name];
    // }
    ```

## 🛠️ Key Patterns & Libraries Used

*   **BLoC Pattern**: For robust and scalable state management.
    *   Separates business logic from the UI.
    *   Uses Events to signify user actions or system occurrences.
    *   Uses States to represent the condition of the UI at any given time.
*   **Equatable**: To simplify value comparisons of objects, especially for BLoC states and events, ensuring that UI rebuilds or bloc state changes occur only when actual data values change.
*   **Flutter**: The UI toolkit for building natively compiled applications for mobile, web, and desktop from a single codebase.
*   **Dart**: The programming language used for Flutter development.

---
This README provides a good overview of your project's structure and main components. You can further enhance it by adding more specific details about the logic within your classes or any other unique aspects of your project.
