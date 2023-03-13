import 'dart:async';

import 'package:potentiam_gallery/domain/entity/album.dart';
import 'package:potentiam_gallery/domain/entity/album_photo.dart';

abstract class AlbumRepository{
  Future<List<Album>?> fetchAllAlbums();

  Future<List<Album>?> searchAlbumsByTitle(String title);

  Future<AlbumPhotos?> fetchAlbumPhotosByAlbumId(int id);
}