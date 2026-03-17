import 'package:flutter/material.dart';

class ShowPackages extends StatelessWidget {
  const ShowPackages({
    super.key,
    required this.packages,
  });

  final List<Map<String, String>> packages;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: packages.map((pkg) {
        return Card(
          child: ListTile(
            title: Text(pkg["name"]!),
            subtitle: Text("${pkg["price"]} جنيه - ${pkg["desc"]}"),
          ),
        );
      }).toList(),
    );
  }
}