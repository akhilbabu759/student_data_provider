import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:stu/model/data_model.dart';

class ProvideClass with ChangeNotifier {
  List<StudentModel> studentListNotifier = [];
  late TextEditingController name;
  late TextEditingController age;
  late TextEditingController strandard;
  late TextEditingController place;

  Future<void> getAllStudent() async {
    final studentDB = await Hive.openBox<StudentModel>('student_db');
    studentListNotifier.clear();
    studentListNotifier.addAll(studentDB.values);

    notifyListeners();
  }

  void textControllerUpdte(StudentModel model) {
    name = TextEditingController(text: model.name);
    age = TextEditingController(text: model.age);
    strandard = TextEditingController(text: model.stradard);
    place = TextEditingController(text: model.place);
    notifyListeners();
  }
}
