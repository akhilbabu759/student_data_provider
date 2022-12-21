import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';

import 'package:provider/provider.dart';
import 'package:stu/model/data_model.dart';
import 'package:stu/provider/provide.dart';

Future<int> addStudent(StudentModel value) async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');

  studentDB.put(value.id, value);

  return 0;
}

Future<void> deleteStudent(context, String id) async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  await studentDB.delete(id);
  WidgetsBinding.instance.addPostFrameCallback(
    (timeStamp) =>
        Provider.of<ProvideClass>(context, listen: false).getAllStudent(),
  );
}

Future<void> updateStudent(StudentModel model) async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  await studentDB.put(model.id, model);
}
