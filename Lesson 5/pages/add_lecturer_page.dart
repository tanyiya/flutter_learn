import 'package:flutter/material.dart';
import '../models/lecturer.dart';

class AddLecturerPage extends StatefulWidget {
  const AddLecturerPage({super.key});

  @override
  State<AddLecturerPage> createState() => _AddLecturerPageState();
}

class _AddLecturerPageState extends State<AddLecturerPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController employeeIdController = TextEditingController();
  final TextEditingController departmentController = TextEditingController();

  void saveLecturer() {
    final String name = nameController.text.trim();
    final String employeeId = employeeIdController.text.trim();
    final String department = departmentController.text.trim();

    if (name.isEmpty || employeeId.isEmpty || department.isEmpty) {
      showMessage('Please fill in all fields');
      return;
    }

    final Lecturer newLecturer = Lecturer(
      name: name,
      employeeId: employeeId,
      department: department,
    );

    Navigator.pop(context, newLecturer);
  }

  void showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: label,
          prefixIcon: Icon(icon),
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    employeeIdController.dispose();
    departmentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Lecturer'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            buildTextField(
              controller: nameController,
              label: 'Lecturer Name',
              icon: Icons.person,
            ),
            buildTextField(
              controller: employeeIdController,
              label: 'Employee ID',
              icon: Icons.badge,
            ),
            buildTextField(
              controller: departmentController,
              label: 'Department',
              icon: Icons.school,
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: saveLecturer,
                child: const Text('Save Lecturer'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}