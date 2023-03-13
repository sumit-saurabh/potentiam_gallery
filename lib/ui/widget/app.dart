import 'package:flutter/material.dart';
import 'package:potentiam_gallery/ui/widget/album_listing_widget.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sumit Saurabh Gallery',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AlbumListingWidget(),
    );
  }
}