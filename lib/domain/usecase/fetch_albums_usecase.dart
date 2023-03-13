
import 'dart:async';

import 'package:potentiam_gallery/domain/entity/album.dart';
import 'package:potentiam_gallery/domain/repository_interface/album_repository.dart';
import 'package:potentiam_gallery/domain/usecase/base_usecase.dart';

class FetchAlbumsUseCase extends BaseUseCase<List<Album>?, String?> {
  late final AlbumRepository _albumRepository;

  FetchAlbumsUseCase(
     this._albumRepository
  );

  @override
  Future<List<Album>?> execute([String? titleFilter]) async {
    if (null != titleFilter && titleFilter.isNotEmpty == true) {
      return _albumRepository.searchAlbumsByTitle(titleFilter);
    }
    else {
      return _albumRepository.fetchAllAlbums();
    }
  }
}