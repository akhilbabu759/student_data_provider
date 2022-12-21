import 'package:flutter/material.dart';
import 'package:stu/model/data_model.dart';

import '../functions/db_function.dart';
import 'home.dart';

class AddStudent extends StatelessWidget {
  AddStudent({Key? key}) : super(key: key);
  final _name = TextEditingController();
  final _age = TextEditingController();
  final _standard = TextEditingController();
  final _place = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: SafeArea(
          child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextFormField(
                controller: _name,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Student Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Name is Empty';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: _age,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Student age'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'age is Empty';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _place,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Student place'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'place is Empty';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: _standard,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Student standard'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'standard is Empty';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton.icon(
                  onPressed: () {
                    addClick(context);
                  },
                  icon: const Icon(null),
                  label: const Text('Add'))
            ],
          ),
        ),
      )),
    );
  }

  Future<void> addClick(BuildContext ctx) async {
    final name = _name.text.trim();
    final age = _age.text.trim();
    final standard = _standard.text.trim();
    final place = _place.text.trim();

    if (_formKey.currentState!.validate()) {
      final student = StudentModel(
        id: DateTime.now().millisecond.toString(),
        name: name,
        age: age,
        stradard: standard,
        place: place,
      );

      await addStudent(student);

      ScaffoldMessenger.of(ctx).showSnackBar(
          const SnackBar(content: Text('data added successfully...')));
      Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (context) {
        return const Home();
      }));
    }
  }
}
