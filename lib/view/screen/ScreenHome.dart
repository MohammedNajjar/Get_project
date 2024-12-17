import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/HomeController.dart';


class ScreenHome extends StatelessWidget {
  ScreenHome({super.key});

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      appBar: AppBar(
        backgroundColor: const Color(0xFF007F6A),
        title: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'UCAS',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '${controller.studentCount} student',
                style: const TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        centerTitle: false,
        elevation: 0,
      ),

      // Body
      body: Obx(() => ListView.builder(
            itemCount: controller.students.length,
            itemBuilder: (context, index) {
              var student = controller.students[index];
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          'name: ${student['name']}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),

                      Text(
                        'Avg is: ${student['avg']}',
                        style: const TextStyle(
                          color: Color(0xFF007F6A),
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  subtitle: Text(
                    'Id: ${student['id']}',
                    style: const TextStyle(
                      color: Color(0xFFEBA41D),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  trailing: IconButton(
                    icon:  const Icon(
                      Icons.cancel,
                      color: Color(0xFFD4D100),
                    ),
                    onPressed: () {
                      controller.deleteStudent(index);
                    },
                  ),
                ),
              );
            },
          )),
      // Floating Action Button
      floatingActionButton: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF007F6A),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(vertical: 14),
          ),
          onPressed: () => _showAddStudentDialog(context),
          child: const Text(
            'Add',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void _showAddStudentDialog(BuildContext context) {
    final nameController = TextEditingController();
    final idController = TextEditingController();
    final avgController = TextEditingController();

    Get.defaultDialog(
      title: 'Add Student',
      titleStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 22,
        color: Color(0xFF007F6A),
      ),
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildLargeTextField(nameController, 'Add name Student'),
            const SizedBox(height: 12),
            _buildLargeTextField(idController, 'Add id Student'),
            const SizedBox(height: 12),
            _buildLargeTextField(avgController, 'AVG'),
          ],
        ),
      ),
      textConfirm: 'Add',
      confirmTextColor: Colors.white,
      buttonColor: const Color(0xFF007F6A),
      onConfirm: () {
        if (nameController.text.isNotEmpty &&
            idController.text.isNotEmpty &&
            avgController.text.isNotEmpty) {
          controller.addStudent(
            nameController.text,
            idController.text,
            avgController.text,
          );
          Get.back();
        } else {
          Get.snackbar('Error', 'All fields are required!',
              backgroundColor: Colors.redAccent, colorText: Colors.white);
        }
      },
    );
  }


  Widget _buildLargeTextField(TextEditingController controller, String label) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(
          fontSize: 18,
          color: Color(0xFF007F6A),
          fontWeight: FontWeight.bold,
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF007F6A), width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
      style: const TextStyle(fontSize: 18),
    );
  }
}
