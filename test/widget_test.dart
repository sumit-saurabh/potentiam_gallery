// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:potentiam_gallery/ui/widget/album_filter_widget.dart';
import 'package:potentiam_gallery/ui/widget/row_album.dart';
import 'package:potentiam_gallery/ui/widget/row_album_photo.dart';

void main() {
  testWidgets('Album Row Smoke Test', (WidgetTester tester) async {
    // Build the album row by passing title.
    await tester.pumpWidget(const AlbumRowWidget(title: "quidem molestiae enim"));

    // Verify if title is rendered properly.
    expect(find.text('quidem molestiae enim'), skip: false, findsOneWidget);
    expect(find.text('quidem molestiae'), findsNothing);
  });

  testWidgets('Album Photo Row Smoke Test', (WidgetTester tester) async {
    // Build the album photo row by passing title and image url.
    await tester.pumpWidget(const AlbumPhotoRowWidget(
      title: "accusamus beatae ad facilis cum similique qui sunt",
      thumbnailUrl: "https://via.placeholder.com/150/92c952",
    ));

    // Verify if title and image are rendered properly.
    expect(find.text('accusamus beatae ad facilis cum similique qui sunt'), skip: false, findsOneWidget);
    expect(find.text('accusamus beatae'), findsNothing);
    expect(find.image(const CachedNetworkImageProvider("https://via.placeholder.com/150/92c952")), findsOneWidget);
  });

  testWidgets('Album Filter Widget Smoke Test', (WidgetTester tester) async {
    final searchController = TextEditingController();
    // Build the album filter view by passing the required param.
    String enteredAlbumName = "quidem molestiae enim";

    await tester.pumpWidget(
        MaterialApp(
          home: AlbumFilterWidget(
            hintText: "Enter Album Name To Filter",
            buttonText: "Search",
            searchController: searchController,
            onPressSearch: (searchText) {
              print ("Search Button Tapped");
              // Verify if the widget return the correct search text
              expect(find.text(enteredAlbumName), skip: false, findsOneWidget);
            },
          ),
        )
    );

    // Enter the text in the TextInput View
    await tester.enterText(find.byKey(const Key('album_filter')), enteredAlbumName);
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();

    // Find the Search button by its name
    final saveButton = find.widgetWithText(ElevatedButton, 'Search');
    expect(saveButton, findsOneWidget);

    // Tap the Search button
    await tester.tap(saveButton);
    await tester.pump();

    // Verify that the button click updated the state
    expect(find.text(enteredAlbumName), findsOneWidget);
  });
}
