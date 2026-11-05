import 'package:flutter/material.dart';

class ActivityTile extends StatelessWidget {
  final String title;
  final String detail;

  const ActivityTile({super.key, required this.title, required this.detail});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: const Icon(Icons.run_circle, color: Colors.green),
        title: Text(title),
        subtitle: Text(detail),
      ),
    );
  }
}
