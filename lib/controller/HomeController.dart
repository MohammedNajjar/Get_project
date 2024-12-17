import 'package:get/get.dart';
import '../model/student.dart';

class HomeController extends GetxController {
  var students = <Student>[].obs;

  void addStudent(String name, String id, String avg) {
    Student newStudent = Student(name: name, id: id, avg: avg);
    students.add(newStudent);
  }

  void deleteStudent(int index) {
    students.removeAt(index);
  }

  int get studentCount => students.length;
}
