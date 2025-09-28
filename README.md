# 🚀 BlocLabs Flutter Project

Welcome to BlocLabs! This project serves as a practical demonstration of various Flutter concepts, with a primary focus on state management using the **BLoC (Business Logic Component)** pattern. It also showcases the usage of the `equatable` package for efficient model comparisons.

## ✨ Badges

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white) ![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white) ![BLoC](https://img.shields.io/badge/BLoC-4A4A4A?style=for-the-badge&logo=flutter&logoColor=white) ![Equatable](https://img.shields.io/badge/Equatable-FF6F00?style=for-the-badge)

## 📂 Project Structure

The project is organized into modules, each demonstrating a specific feature or concept:

```
lib/
├── main.dart                   # 🏁 Main application entry point
├── counter_app/                # 🔢 Counter Demo Module
│   ├── bloc/
│   │   ├── counter_bloc.dart   # BLoC for counter logic
│   │   ├── counter_event.dart  # Events for counter (e.g., Increment, Decrement)
│   │   └── counter_state.dart  # State for counter (e.g., current count)
│   └── ui/
│       └── counter_screen.dart # UI for the Counter App
├── equatable_demo/             #⚖️ Equatable Package Demo Module
│   └── equatable_demo.dart     # Screen demonstrating Equatable usage
└── slider_and_switch_demo/     # 🎚️ Slider & Switch Demo Module
    ├── bloc/
    │   ├── slider/
    │   │   ├── slider_bloc.dart  # BLoC for slider logic (e.g., opacity)
    │   │   ├── slider_event.dart # Events for slider
    │   │   └── slider_state.dart # State for slider
    │   └── switch/
    │       ├── switch_bloc.dart  # BLoC for switch logic (e.g., notification toggle)
    │       ├── switch_event.dart # Events for switch
    │       └── switch_state.dart # State for switch
    └── ui/
        └── slider_and_switch_screen.dart # UI for Slider and Switch Demo
```

## 🎯 Main Application (`main.dart`)

The `main.dart` file initializes the Flutter application. 

```dart
import 'package:bloclabs/counter_app/ui/counter_screen.dart';
import 'package:bloclabs/equatable_demo/equatable_demo.dart';
import 'package:bloclabs/slider_and_switch_demo/bloc/slider/slider_bloc.dart';
import 'package:bloclabs/slider_and_switch_demo/ui/slider_and_switch_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_app/bloc/counter_bloc.dart';
import 'slider_and_switch_demo/bloc/switch/switch_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterBloc>(create: (context) => CounterBloc()),
        BlocProvider<SwitchBloc>(create: (context) => SwitchBloc()),
        BlocProvider<SliderBloc>(create: (context) => SliderBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.green)),
        home: SliderAndSwitchScreen(), // Initial screen
      ),
    );
  }
}
```

Key aspects:
- It uses `MultiBlocProvider` to make multiple BLoCs (`CounterBloc`, `SwitchBloc`, `SliderBloc`) available to the widget tree.
- The application theme is set with a `seedColor` of green.
- The `SliderAndSwitchScreen` is set as the initial screen of the application.

## 🧩 Modules & Features

### 1. Counter App 🔢

This module demonstrates a simple counter application using the BLoC pattern.

- **`CounterBloc`**: 
    - Manages the counter's state (`CounterState`).
    - Responds to `CounterEvent`s: `IncrementCounter` and `DecrementCounter`.
    - Emits new states with the updated counter value.
    ```dart
    // From: lib/counter_app/bloc/counter_bloc.dart
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
- **`CounterScreen`**: 
    - A `StatelessWidget` that displays the current count from `CounterBloc` using `BlocBuilder`.
    - Provides "Increment" and "Decrement" buttons that dispatch events to the `CounterBloc`.
    ```dart
    // From: lib/counter_app/ui/counter_screen.dart
    // ...
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
    // ...
    ```

### 2. Equatable Demo ⚖️

This module showcases the use of the `equatable` package to simplify object comparisons.

- **`EquatableDemoScreen`**: 
    - Demonstrates the difference between comparing class instances with and without `Equatable`.
- **`Person` class**: A plain Dart class where equality `==` operator and `hashCode` are manually overridden.
- **`NewPerson` class**: Extends `Equatable` and overrides `props` to achieve value equality with less boilerplate code.

    ```dart
    // From: lib/equatable_demo/equatable_demo.dart
    
    ///Writing Manual Code for Comparison
    class Person {
      // ... manual == and hashCode ...
    }
    
    ///Equatable Package Auto Generate Comparison code for us
    class NewPerson extends Equatable {
      final String name;
      final int age;
    
      const NewPerson({required this.name, required this.age});
    
      @override
      List<Object?> get props => [name, age]; // Important for Equatable!
    }
    ```
    The screen includes a `FloatingActionButton` that, when pressed, prints the results of comparing instances of `Person` and `NewPerson`, highlighting how `Equatable` makes it easier to compare objects by their properties rather than their references.

### 3. Slider and Switch Demo 🎚️

This module demonstrates UI controls like a Slider and Switch, managed by their respective BLoCs.

- **`SliderBloc`**:
    - Manages `SliderState`, which likely holds a value (e.g., opacity) controlled by a slider.
    - Responds to `ChangeOpacity` event to update the opacity value.
    ```dart
    // From: lib/slider_and_switch_demo/bloc/slider/slider_bloc.dart
    class SliderBloc extends Bloc<SliderEvent, SliderState> {
      SliderBloc() : super(SliderState()) { // Assuming SliderState initializes default opacity
        on<ChangeOpacity>(_onChangeOpacity);
      }
    
      void _onChangeOpacity(ChangeOpacity event, Emitter<SliderState> emit) {
        emit(state.copyWith(opacity: event.opacity));
      }
    }
    ```
- **`SwitchBloc`**:
    - Manages `SwitchState`, which likely holds a boolean value (e.g., for enabling/disabling notifications).
    - Responds to `EnableOrDisableNotification` event to toggle the boolean state.
    ```dart
    // From: lib/slider_and_switch_demo/bloc/switch/switch_bloc.dart
    class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
      SwitchBloc() : super(SwitchState()) { // Assuming SwitchState initializes default switch status
        on<EnableOrDisableNotification>(_onEnableOrDisableNotification);
      }
    
      void _onEnableOrDisableNotification(EnableOrDisableNotification event, Emitter<SwitchState> emit) {
        emit(state.copyWith(isNotification: !state.isNotification));
      }
    }
    ```
- **`SliderAndSwitchScreen`**: 
    - The UI for this demo. It integrates the `SliderBloc` and `SwitchBloc` to control UI elements and reflect state changes.
    - This screen is also the `home` screen for the application.

## 🛠️ Key Libraries & Patterns

- **Flutter BLoC (`bloc`, `flutter_bloc`)**: Used extensively for state management, separating business logic from UI. This promotes testability and maintainability.
  - `BlocProvider` / `MultiBlocProvider`: To provide BLoCs to the widget tree.
  - `BlocBuilder`: To rebuild UI components in response to state changes in a BLoC.
  - `context.read<BlocName>()`: To access BLoC instances and add events.
- **Equatable**: Simplifies value equality comparisons for classes, often used in BLoC states and events to prevent unnecessary rebuilds if the actual data hasn't changed.
- **Material Design**: The project uses Flutter's Material components for UI elements.

## 📊 Data Flow

1.  **UI Interaction**: User interacts with widgets (e.g., presses a button, moves a slider).
2.  **Event Dispatch**: The UI dispatches an `Event` to the relevant `BLoC`.
3.  **BLoC Processing**: The `BLoC` receives the event, processes it (applies business logic), and may interact with data sources or services.
4.  **State Emission**: The `BLoC` emits a new `State` reflecting the changes.
5.  **UI Update**: Widgets listening to the `BLoC` (e.g., via `BlocBuilder`) rebuild themselves with the new state information.

This unidirectional data flow is a core principle of the BLoC pattern, leading to more predictable and manageable application states.

--- 

This README provides an overview of the BlocLabs project, its structure, and the core concepts demonstrated within. Enjoy exploring the code! 🎉
