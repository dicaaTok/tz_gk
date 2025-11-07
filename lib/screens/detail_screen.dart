import 'package:flutter/material.dart';

import '../models/Item_model.dart';

class DetailScreen extends StatelessWidget {
  final ItemModel item;

  const DetailScreen({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(item.name)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(item.image, height: 250, width: double.infinity, fit: BoxFit.cover),
            ),
            SizedBox(height: 20),
            Text(
              item.name,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            Text(
              "Year: ${item.year}",
              style: TextStyle(fontSize: 22, color: Colors.grey[700]),
            ),
          ],
        ),
      ),
    );
  }
}
