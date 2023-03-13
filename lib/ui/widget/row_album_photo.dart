import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AlbumPhotoRowWidget extends StatelessWidget {
  final String title;
  final String thumbnailUrl;

  const AlbumPhotoRowWidget({
    super.key,
    required this.title,
    required this.thumbnailUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(2.0),
      child: Card(
        child: Container(
          margin: const EdgeInsets.all(16.0),
          child:  Row(
            textDirection: TextDirection.ltr,
            children: [
              CachedNetworkImage(
                imageUrl: thumbnailUrl,
                width: 100.0,
                height: 100.0,
                fit: BoxFit.cover,
                placeholder: (context, url) {
                  return const Padding(
                    padding: EdgeInsets.all(30),
                    child: CircularProgressIndicator(),
                  );
                },
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              const SizedBox(width: 12.0),
              Expanded(
                child: Text(
                    title,
                    style: const TextStyle(fontSize: 14.0),
                    softWrap: true,
                    overflow: TextOverflow.visible,
                    textDirection: TextDirection.ltr
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
