import 'package:flutter/material.dart';

class AddHallScreen extends StatelessWidget {
  const AddHallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('إضافة قاعة')),
      body: const Center(child: Text('هنا يمكنك إضافة قاعة جديدة')),
    );
  }
}
