import 'package:flutter/material.dart';

class GridCard extends StatelessWidget {
  final List<IconData> icons;
  final List<String> titles;

  const GridCard({super.key, required this.icons, required this.titles});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: icons.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: MediaQuery.of(context).size.width /
            (MediaQuery.of(context).size.height / 2),
      ),
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icons[index], size: 48),
              const SizedBox(height: 8),
              Text(titles[index], style: TextStyle(fontSize: 16)),
            ],
          ),
        );
      },
    );
  }
}
