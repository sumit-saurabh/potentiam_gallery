import 'package:flutter/material.dart';

class AlbumFilterWidget extends StatelessWidget {
  final String hintText;
  final String buttonText;
  final TextEditingController searchController;
  final Function onPressSearch;

  const AlbumFilterWidget({
    super.key,
    required this.hintText,
    required this.buttonText,
    required this.searchController,
    required this.onPressSearch,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Material(
              child: TextField(
                key: const Key('album_filter'),
                controller: searchController,
                decoration: const InputDecoration(
                  hintText: 'Filter Album by title',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          SizedBox(
            height: 52.0,
            child: ElevatedButton(
              onPressed: () {
                onPressSearch(searchController.text);
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero, // remove default padding
              ),
              child: const Center(child: Text('Search')),
            ),
          ),
        ],
      ),
    );
  }
}
