# <p align="center">🚀 BlocLabs - Flutter Counter App 🚀</p>

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white" alt="Flutter"/>
  <img src="https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white" alt="Dart"/>
  <img src="https://img.shields.io/badge/Bloc-4A4A4A?style=for-the-badge&logo=bloc&logoColor=white" alt="Bloc"/>
  <img src="https://img.shields.io/badge/Equatable-FFDD00?style=for-the-badge&logoColor=black" alt="Equatable"/>
</p>

This project, `bloclabs`, serves as a demonstration of implementing a counter application using Flutter and the BLoC state management library. It also includes an example of using the `equatable` package for value equality.

## 📂 Project Structure

The project follows a standard Flutter project structure, with the core application logic residing in the `lib` folder.

```
bloclabs/
├── android/            # Android specific files
├── ios/                # iOS specific files
├── lib/                # Main Dart code
│   ├── main.dart       # Entry point of the application
│   ├── counter_app/    # Counter feature module
│   │   ├── bloc/       # BLoC logic for the counter
│   │   │   ├── counter_bloc.dart
│   │   │   ├── counter_event.dart
│   │   │   └── counter_state.dart
│   │   └── ui/         # UI for the counter screen
│   │       └── counter_screen.dart
│   └── equatable_demo/ # Demonstration of Equatable package
│       └── equatable_demo.dart
├── test/               # Unit and widget tests
├── pubspec.yaml        # Project dependencies and metadata
└── README.md           # This file
```

## ✨ Main Modules & Features

### 1. 🚦 Counter App

This is the primary feature of the `bloclabs` project. It demonstrates a simple screen with a counter that can be incremented or decremented.

#### Key Components:

*   **`CounterScreen`**: (`lib/counter_app/ui/counter_screen.dart`)
    *   A `StatelessWidget` that displays the current counter value and two buttons for incrementing and decrementing.
    *   Uses `BlocBuilder` to listen to state changes from `CounterBloc` and rebuild the UI accordingly.
    *   Dispatches `IncrementCounter` and `DecrementCounter` events to the `CounterBloc` when buttons are pressed.

    ```dart
    // Snippet from lib/counter_app/ui/counter_screen.dart
    BlocBuilder<CounterBloc, CounterState>(
      builder: (context, state) {
        return Text("${state.counter}", style: TextStyle(fontSize: 60));
      },
    ),
    // ...
    ElevatedButton.icon(
      onPressed: () => context.read<CounterBloc>().add(IncrementCounter()),
      label: Text("Increment"),
      icon: Icon(Icons.add_circle_rounded),
    ),
    ```

*   **`CounterBloc`**: (`lib/counter_app/bloc/counter_bloc.dart`)
    *   Manages the state of the counter.
    *   Extends `Bloc<CounterEvent, CounterState>`.
    *   Responds to `IncrementCounter` and `DecrementCounter` events by updating the `CounterState`.

    ```dart
    // Snippet from lib/counter_app/bloc/counter_bloc.dart
    class CounterBloc extends Bloc<CounterEvent, CounterState> {
      CounterBloc() : super(const CounterState()) {
        on<IncrementCounter>(_onIncrement);
        on<DecrementCounter>(_onDecrement);
      }

      void _onIncrement(IncrementCounter event, Emitter<CounterState> emit) {
        emit(state.copyWith(counter: state.counter + 1));
      }

      void _onDecrement(DecrementCounter event, Emitter<CounterState> emit) {
        emit(state.copyWith(counter: state.counter - 1));
      }
    }
    ```

*   **`CounterEvent`**: (`lib/counter_app/bloc/counter_event.dart`)
    *   Defines the events that can be dispatched to the `CounterBloc`.
    *   Includes `IncrementCounter` and `DecrementCounter`.

*   **`CounterState`**: (`lib/counter_app/bloc/counter_state.dart`)
    *   Represents the state of the counter, holding the current `counter` value.
    *   Uses `copyWith` method for immutability.
    *   Extends `Equatable` for easy state comparison.

    ```dart
    // Snippet from lib/counter_app/bloc/counter_state.dart
    class CounterState extends Equatable {
      final int counter;

      const CounterState({this.counter = 0});

      CounterState copyWith({int? counter}) {
        return CounterState(counter: counter ?? this.counter);
      }

      @override
      List<Object> get props => [counter];
    }
    ```

#### Data Flow:

1.  **`CounterScreen`** UI elements (buttons) dispatch events (`IncrementCounter` or `DecrementCounter`).
2.  The **`CounterBloc`** receives these events.
3.  Based on the event, the `CounterBloc` emits a new **`CounterState`** with the updated counter value.
4.  The **`CounterScreen`** (specifically the `BlocBuilder`) listens to the `CounterBloc` and rebuilds the UI to reflect the new state.

### 2. ⚖️ Equatable Demo

Located in `lib/equatable_demo/equatable_demo.dart`, this module demonstrates the use of the `equatable` package. This package is used to enable value equality for objects without needing to override `==` and `hashCode` manually. This is particularly useful in BLoC for comparing states.

```dart
// Snippet from lib/equatable_demo/equatable_demo.dart
import 'package:equatable/equatable.dart';

class Person extends Equatable {
  final String name;
  final int age;

  const Person({required this.name, required this.age});

  @override
  List<Object?> get props => [name, age];
}

void main() {
  Person person1 = const Person(name: "John", age: 30);
  Person person2 = const Person(name: "John", age: 30);

  print(person1 == person2); // True, because of Equatable
}
```

## 🚀 Application Entry Point

*   **`main.dart`**: (`lib/main.dart`)
    *   The main entry point for the Flutter application.
    *   Initializes the `MyApp` widget.
    *   Sets up a `BlocProvider` for the `CounterBloc`, making it available to the widget tree (specifically to `CounterScreen`).

    ```dart
    // Snippet from lib/main.dart
    void main() {
      runApp(const MyApp());
    }

    class MyApp extends StatelessWidget {
      const MyApp({super.key});

      @override
      Widget build(BuildContext context) {
        //Bloc Provider use for Single Bloc Instance
        return BlocProvider(
          create: (context) => CounterBloc(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.green)),
            home: CounterScreen(),
          ),
        );
      }
    }
    ```

## 🛠️ Key Libraries & Utilities

*   **Flutter**: The UI toolkit for building natively compiled applications for mobile, web, and desktop from a single codebase.
*   **Dart**: The programming language used by Flutter.
*   **flutter_bloc / bloc**: State management libraries that help implement the BLoC (Business Logic Component) design pattern, separating presentation from business logic.
*   **Equatable**: A package to simplify equality comparisons in Dart objects.

This `README.md` provides a concise overview of the `bloclabs` project, its structure, and its core functionalities. It is designed to be reader-friendly and informative for anyone looking to understand the project's codebase.
=======
# BlocLabs Project 🚀

[![Flutter Version](https://img.shields.io/badge/Flutter-3.x-blue.svg?style=for-the-badge&logo=flutter)](https://flutter.dev)
[![Dart Version](https://img.shields.io/badge/Dart-3.x-orange.svg?style=for-the-badge&logo=dart)](https://dart.dev)
[![Equatable Package](https://img.shields.io/pub/v/equatable.svg?style=for-the-badge)](https://pub.dev/packages/equatable)

This README provides a comprehensive overview of the **BlocLabs** Flutter project, detailing its architecture, components, and key functionalities.

## 📝 Table of Contents

- [Project Overview](#project-overview)
- [Folder Structure](#folder-structure)
- [Core Components](#core-components)
  - [Application Entry Point](#application-entry-point)
  - [Equatable Demo](#equatable-demo)
- [Key Libraries & Patterns](#key-libraries--patterns)
  - [Equatable Package](#equatable-package)
- [Data Flow](#data-flow)

## 🌟 Project Overview

**BlocLabs** is a Flutter application designed to demonstrate and explore various Flutter concepts and packages. Currently, it focuses on showcasing the usage of the `equatable` package for value equality in Dart classes.

## 📁 Folder Structure

The project follows a standard Flutter project structure:

```
bloclabs/
├── android/            # Android specific files
├── ios/                # iOS specific files
├── lib/                # Main Dart code
│   ├── main.dart       # Application entry point
│   └── equatable_demo/ # Module for Equatable demonstration
│       └── equatable_demo.dart
├── test/               # Unit and widget tests
├── .gitignore
├── pubspec.yaml        # Project dependencies and metadata
└── README.md           # This file
```

## ⚙️ Core Components

### 🏁 Application Entry Point

#### `lib/main.dart`

This file is the starting point of the application.

-   **`main()` function**: Initializes and runs the Flutter application.
    ```dart
    void main() {
      runApp(const MyApp());
    }
    ```
-   **`MyApp` class**: The root widget of the application.
    -   It's a `StatelessWidget`.
    -   Sets up `MaterialApp` with basic theming and routes the initial screen to `EquatableDemoScreen`.
    ```dart
    class MyApp extends StatelessWidget {
      const MyApp({super.key});

      @override
      Widget build(BuildContext context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
          home: EquatableDemoScreen(), // Initial screen
        );
      }
    }
    ```

### ✨ Equatable Demo

#### `lib/equatable_demo/equatable_demo.dart`

This module demonstrates the concept of value equality in Dart, comparing manual implementation with the `equatable` package.

-   **`EquatableDemoScreen` class**:
    -   A `StatefulWidget` that provides a UI with a `FloatingActionButton`.
    -   When the button is pressed, it instantiates and compares objects of `Person` and `NewPerson` classes, printing the results to the debug console. This highlights the differences in equality checking.
    ```dart
    class _EquatableDemoScreenState extends State<EquatableDemoScreen> {
      @override
      Widget build(BuildContext context) {
        return SafeArea(
          child: Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                // ... comparison logic ...
                debugPrint("${person == person1}"); // Manual comparison
                debugPrint("${_person == _person1}"); // Equatable comparison
              },
            ),
          ),
        );
      }
    }
    ```

-   **`Person` class**:
    -   A plain Dart class with `name` and `age` properties.
    -   Manually overrides the `==` operator and `hashCode` getter to achieve value equality. This requires boilerplate code.
    ```dart
    class Person {
      final String name;
      final int age;

      const Person({required this.name, required this.age});

      @override
      bool operator ==(Object other) =>
          identical(this, other) || other is Person && runtimeType == other.runtimeType && name == other.name && age == other.age;

      @override
      int get hashCode => name.hashCode ^ age.hashCode;
    }
    ```

-   **`NewPerson` class**:
    -   Extends the `Equatable` class.
    -   Also has `name` and `age` properties.
    -   Overrides the `props` getter, listing the properties that should be used for equality comparison. This significantly simplifies the implementation of value equality.
    ```dart
    class NewPerson extends Equatable {
      final String name;
      final int age;

      const NewPerson({required this.name, required this.age});

      @override
      List<Object?> get props => [name, age];
    }
    ```

## 📚 Key Libraries & Patterns

### Equatable Package

[![Equatable Package](https://img.shields.io/pub/v/equatable.svg?label=equatable&style=flat-square)](https://pub.dev/packages/equatable)

The project utilizes the **`equatable`** package to simplify value comparison in Dart objects.

-   **Purpose**: To avoid manual overriding of `==` and `hashCode` for classes where instances should be considered equal if their properties are equal.
-   **Usage**:
    1.  Add `equatable` to `pubspec.yaml`.
    2.  Make your class extend `Equatable`.
    3.  Override the `props` getter and return a list of the properties you want to include in the equality check.

    ```dart
    // Example from equatable_demo.dart
    import 'package:equatable/equatable.dart';

    class NewPerson extends Equatable {
      final String name;
      final int age;

      const NewPerson({required this.name, required this.age});

      @override
      List<Object?> get props => [name, age]; // Properties for comparison
    }
    ```
-   **Benefit**: Reduces boilerplate code and makes classes cleaner and less error-prone when dealing with value equality.

## 🔄 Data Flow

The current data flow is simple and primarily contained within the `EquatableDemoScreen`:

1.  **User Interaction**: The user taps the `FloatingActionButton` on the `EquatableDemoScreen`.
2.  **Object Instantiation**:
    -   Two instances of `Person` (e.g., `person` and `person1`) are created with identical `name` and `age` values.
    -   Two instances of `NewPerson` (e.g., `_person` and `_person1`) are created with identical `name` and `age` values.
3.  **Comparison Logic**:
    -   The `==` operator is used to compare `person` with `person1`. Since `Person` manually implements `==` and `hashCode`, this comparison will evaluate to `true`.
    -   The `==` operator is used to compare `_person` with `_person1`. Since `NewPerson` uses `Equatable`, this comparison also evaluates to `true` because their `props` (name and age) are the same.
    -   Hash codes are also compared.
4.  **Output**: Results of these comparisons (boolean values and hash codes) are printed to the debug console using `debugPrint()`.

This demonstrates how `Equatable` simplifies achieving correct value-based equality compared to manual implementation.

---

This README aims to be a living document. As the **BlocLabs** project grows, this file will be updated to reflect new features, architectural changes, and important components.
