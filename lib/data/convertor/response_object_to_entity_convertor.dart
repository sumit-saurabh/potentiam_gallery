
import 'package:potentiam_gallery/data/network/service_objects/album_photo_response.dart';
import 'package:potentiam_gallery/data/network/service_objects/album_response.dart';
import 'package:potentiam_gallery/domain/entity/album.dart';
import 'package:potentiam_gallery/domain/entity/album_photo.dart';
import 'package:potentiam_gallery/domain/entity/photo.dart';

Album toAlbum(AlbumResponse response) {
  return Album(
      id: response.id,
      title: response.title
  );
}

List<Album>? toAlbums(List<AlbumResponse>? response) {
  return response?.map((e) => toAlbum(e)).toList();
}

Photo toPhoto(AlbumPhotoResponse response) {
  return Photo(
    id: response.id,
    title: response.title,
    thumbnailUrl: response.thumbnailUrl,
    url: response.url
  );
}

AlbumPhotos? toAlbumPhotos(List<AlbumPhotoResponse> response) {
  if (response.isNotEmpty) {
    return AlbumPhotos(
        id: response[0].albumId,
        photos: response.map((e) => toPhoto(e)).toList()
    );
  }
  else {
    return null;
  }
}
