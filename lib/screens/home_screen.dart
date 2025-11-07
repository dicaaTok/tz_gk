import 'package:flutter/material.dart';

import 'detail_screen.dart';
import '../models/Item_model.dart';

class HomeScreen extends StatelessWidget {
  final List<ItemModel> items = [
    ItemModel(
      image: 'https://picsum.photos/200',
      name: 'Item One',
      year: 2021,
    ),
    ItemModel(
      image: 'https://picsum.photos/300',
      name: 'Item Two',
      year: 2023,
    ),
    ItemModel(
      image: 'https://picsum.photos/250',
      name: 'Item Three',
      year: 2019,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Items')),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                    transitionDuration: Duration(milliseconds: 400),
                  pageBuilder: ( , ,  ) => DetailScreen(item: item),
                transitionsBuilder: ( , animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  )
              );
            },
            child: Card(
              margin: EdgeInsets.all(12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 4,
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.horizontal(left: Radius.circular(16)),
                    child: Image.network(
                      item.image,
                      width: 120,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.name,
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 6),
                      Text(
                        "Year: ${item.year}",
                        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
