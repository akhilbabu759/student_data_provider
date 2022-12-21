import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stu/provider/provide.dart';
import 'package:stu/scren/add_student.dart';
import 'package:stu/scren/update.dart';

import '../functions/db_function.dart';

class Home extends StatelessWidget {
  const Home({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) =>
          Provider.of<ProvideClass>(context, listen: false).getAllStudent(),
    );

    return Scaffold(
     
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('Student Database'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Consumer<ProvideClass>(builder: (context, value, child) {
            return ListView.separated(
              itemBuilder: (ctx, index) {
                final data = value.studentListNotifier[index];
                return ListTile(
                    title: Text(data.name),
                    subtitle: Text(data.age),
                    trailing: IconButton(
                      onPressed: () => deleteStudent(ctx, data.id),
                      icon: const Icon(Icons.delete, color: Colors.red),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UpdateStudent(model: data),
                        ),
                      );
                    });
              },
              separatorBuilder: (ctx, index) {
                return const Divider();
              },
              itemCount: value.studentListNotifier.length,
            );
          })),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) {
              return AddStudent();
            },
          ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
