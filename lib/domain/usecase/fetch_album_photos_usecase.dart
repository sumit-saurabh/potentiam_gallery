
import 'dart:async';

import 'package:potentiam_gallery/domain/entity/album.dart';
import 'package:potentiam_gallery/domain/entity/album_photo.dart';
import 'package:potentiam_gallery/domain/repository_interface/album_repository.dart';
import 'package:potentiam_gallery/domain/usecase/base_usecase.dart';

class FetchAlbumPhotosUseCase extends BaseUseCase<AlbumPhotos?, Album> {
  late final AlbumRepository _albumRepository;

  FetchAlbumPhotosUseCase(
     this._albumRepository
  );

  @override
  Future<AlbumPhotos?> execute(Album album) async {
    AlbumPhotos? albumPhotos =
      await _albumRepository.fetchAlbumPhotosByAlbumId(album.id!);
    if (null != albumPhotos) {
      albumPhotos.title = album.title;
    }
    return albumPhotos;
  }
}