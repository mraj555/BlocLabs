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
