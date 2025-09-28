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
