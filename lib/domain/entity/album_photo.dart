import 'package:potentiam_gallery/domain/entity/photo.dart';

class AlbumPhotos {
  int? id;
  String? title;
  List<Photo>? photos;

  AlbumPhotos({
    this.id,
    this.title,
    this.photos,
  });
}
