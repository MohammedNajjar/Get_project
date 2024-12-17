import 'package:get/get.dart';

class HomeController extends GetxController {
  var students = <Map<String, String>>[].obs;
  void addStudent(String name, String id, String avg) {
    students.add(
        {
          "name": name,
          "id": id,
          "avg": avg
        }
    );
  }

  void deleteStudent(int index) {
    students.removeAt(index);
  }

  int get studentCount => students.length;
}
