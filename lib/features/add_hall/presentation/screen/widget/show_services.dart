
import 'package:flutter/material.dart';

class ShowServices extends StatelessWidget {
  const ShowServices({
    super.key,
    required this.services,
  });

  final List<Map<String, String>> services;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: services.map((service) {
        return Card(
          child: ListTile(
            title: Text(service["name"]!),
            subtitle: Text(service["desc"]!),
          ),
        );
      }).toList(),
    );
  }
}
