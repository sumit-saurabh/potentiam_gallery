import 'package:flutter/material.dart';

class AlbumRowWidget extends StatelessWidget {
  final String title;

  const AlbumRowWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(2.0),
      child: Card(
        child: Container(
          margin: const EdgeInsets.all(16.0),
          child: Text(title, textDirection: TextDirection.ltr),
        ),
      ),
    );
  }
}
