// import 'package:hive_flutter/adapters.dart';
import'package:hive_flutter/hive_flutter.dart';
part 'data_model.g.dart';

@HiveType(typeId: 0)
class StudentModel {
  @HiveField(0)
 final String id;
  @HiveField(1)
 final String name;
  @HiveField(2)
 final String age;
  @HiveField(3)
  final String stradard;
  @HiveField(4)
  final String place;
  StudentModel(
      {required this.name,
      required this.age,
      required this.stradard,
      required this.place,
     required this.id
     })
     ;
     
}
