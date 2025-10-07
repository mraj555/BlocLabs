import 'dart:developer';

import 'package:bloclabs/freezed_package_demo/model/animal/animal_model.dart';
import 'package:bloclabs/freezed_package_demo/model/animal/animal_model.dart';
import 'package:bloclabs/freezed_package_demo/model/animal/animal_model.dart';
import 'package:bloclabs/freezed_package_demo/model/animal/animal_model.dart';
import 'package:bloclabs/freezed_package_demo/model/animal/animal_model.dart';
import 'package:bloclabs/freezed_package_demo/model/person_model.dart';
import 'package:flutter/material.dart';

class FreezedPackageDemo extends StatefulWidget {
  const FreezedPackageDemo({super.key});

  @override
  State<FreezedPackageDemo> createState() => _FreezedPackageDemoState();
}

class _FreezedPackageDemoState extends State<FreezedPackageDemo> {
  List<PersonModel> persons = <PersonModel>[PersonModel(name: null), PersonModel(name: 'Flutter'), PersonModel(name: 'Dart')];

  List<Map<String, dynamic>> data = [
    {'name': 'Dog'},
    {'name': 'Lion'},
    {'name': null},
    {'name': 'Tiger'},
  ];

  List<AnimalModel> animals = [];

  @override
  void initState() {
    animals.addAll(data.map((e) => AnimalModel.fromJson(e)).toList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(centerTitle: true, title: Text("Freezed Package")),
        body: ListView.builder(
          // itemCount: persons.length,
          // itemBuilder: (context, index) => ListTile(title: Text(persons[index].name!)),
          itemCount: animals.length,
          itemBuilder: (context, index) => ListTile(title: Text(animals[index].name)),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // PersonModel person = PersonModel(name: "John");
            // PersonModel person1 = PersonModel(name: "John");

            // log("${person.hashCode}", name: "Hashcode");
            // log("${person1.hashCode}", name: "Hashcode 1");
            //
            // log("${person == person1}", name: "Comparison");

            Map<String, dynamic> data = {'name': "Mr.AJ"};

            PersonModel model = PersonModel.fromJson(data);
            log("${model.name}", name: "Name");

            model = model.copyWith(name: "White Devil");
            log("${model.name}", name: "Updated Name");
          },
          child: Icon(Icons.shuffle_rounded),
        ),
      ),
    );
  }
}
