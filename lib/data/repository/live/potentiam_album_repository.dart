import 'dart:async';

import 'package:potentiam_gallery/data/convertor/response_object_to_entity_convertor.dart';
import 'package:potentiam_gallery/data/network/api/album_remote_api.dart';
import 'package:potentiam_gallery/domain/entity/album.dart';
import 'package:potentiam_gallery/domain/entity/album_photo.dart';
import 'package:potentiam_gallery/domain/repository_interface/album_repository.dart';
import 'package:potentiam_gallery/utils/app_logger.dart';

class PotentiamAlbumRepository extends AlbumRepository {
  late final AlbumRemoteApi _albumRemoteApi;

  PotentiamAlbumRepository(
    this._albumRemoteApi
  );

  @override
  Future<AlbumPhotos?> fetchAlbumPhotosByAlbumId(int id) {
    return _albumRemoteApi.getAlbumPhotosByAlbumId(id).then((response) {
      return toAlbumPhotos(response);
    }).catchError((e, s) {
      logger.e(
          "Error while fetching the album photo by id - $e\n$s"
      );
      return null;
    });
  }

  @override
  Future<List<Album>?> fetchAllAlbums() async {
    logger.v("Fetching all albums");
    return _albumRemoteApi.getAlbums().then((response) {
      logger.v("Fetched album data - $response");
      return toAlbums(response);
    }).catchError((e, s) {
      logger.e(
          "Error while fetching the albums- $e\n$s"
      );
      return null;
    });
  }

  @override
  Future<List<Album>?> searchAlbumsByTitle(String title) {
    return _albumRemoteApi.getAlbumsByTitle(title).then((response) {
      return toAlbums(response);
    }).catchError((e, s) {
      logger.e(
          "Error while fetching the albums by title- $e\n$s"
      );
      return null;
    });
  }
}