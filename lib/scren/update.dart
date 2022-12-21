import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stu/functions/db_function.dart';
import 'package:stu/model/data_model.dart';
import 'package:stu/provider/provide.dart';

import 'home.dart';

class UpdateStudent extends StatelessWidget {
  UpdateStudent({
    Key? key,
    required this.model,
  }) : super(key: key);

  final StudentModel model;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) => Provider.of<ProvideClass>(context, listen: false)
          .textControllerUpdte(model),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
          child: Consumer<ProvideClass>(
        builder: (context, values, child) => Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextFormField(
                  controller: values.name,
                  decoration: const InputDecoration(labelText:'Enter Student Name',
                      border: OutlineInputBorder(),
                      ),
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
                  controller: values.age,
                  decoration: const InputDecoration(labelText: 'Enter Student age',
                      border: OutlineInputBorder(),
                       ),
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
                  controller: values.strandard,
                  decoration: const InputDecoration(labelText: 'Enter Student place',
                      border: OutlineInputBorder(),
                      ),
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
                  controller: values.place,
                  decoration: const InputDecoration(labelText:  'Enter Student standard',
                      border: OutlineInputBorder(),
                     ),
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
                      if (_formKey.currentState!.validate()) {
                        update(values, context);
                      }
                    },
                    icon: const Icon(null),
                    label: const Text('Add'))
              ],
            ),
          ),
        ),
      )),
    );
  }

  Future<void> update(ProvideClass values, ctx) async {
    final names = values.name.text.trim();
    final ages = values.age.text.trim();
    final standard = values.strandard.text.trim();
    final places = values.place.text.trim();

    final student = StudentModel(
      id: model.id,
      name: names,
      age: ages,
      stradard: standard,
      place: places,
    );
    updateStudent(student);

    ScaffoldMessenger.of(ctx).showSnackBar(
        const SnackBar(content: Text('data updated successfully...')));
    Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (context) {
      return const Home();
    }));
  }
}
