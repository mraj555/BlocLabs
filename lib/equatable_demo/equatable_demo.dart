import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class EquatableDemoScreen extends StatefulWidget {
  const EquatableDemoScreen({super.key});

  @override
  State<EquatableDemoScreen> createState() => _EquatableDemoScreenState();
}

class _EquatableDemoScreenState extends State<EquatableDemoScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Person person = Person(name: "Mr.AJ", age: 27);
            Person person1 = Person(name: "Mr.AJ", age: 27);

            NewPerson _person = NewPerson(name: "Mr.AJ", age: 27);
            NewPerson _person1 = NewPerson(name: "Mr.AJ", age: 27);

            //in Flutter, By Default one instance equals to same own instance (not another instance)
            debugPrint("${person == person}");
            debugPrint("${person1 == person1}");

            debugPrint("${person.hashCode}");
            debugPrint("${person1.hashCode}");

            debugPrint("${person == person1}");

            //Using Equatable Package
            debugPrint("${_person == _person}");
            debugPrint("${_person1 == _person1}");

            debugPrint("${_person.hashCode}");
            debugPrint("${_person1.hashCode}");

            debugPrint("${_person == _person1}");
          },
        ),
      ),
    );
  }
}

///Writing Manual Code for Comparison
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

///Equatable Package Auto Generate Comparison code for us
class NewPerson extends Equatable {
  final String name;
  final int age;

  const NewPerson({required this.name, required this.age});

  @override
  List<Object?> get props => [name, age];
}
