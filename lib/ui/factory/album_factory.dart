import 'package:potentiam_gallery/data/network/api/album_remote_api.dart';
import 'package:potentiam_gallery/data/repository/live/potentiam_album_repository.dart';
import 'package:potentiam_gallery/data/repository/mock/mock_album_repository.dart';
import 'package:potentiam_gallery/domain/repository_interface/album_repository.dart';

class AlbumFactory {
  AlbumRepository getInstance(AlbumRemoteApi albumRemoteApi) {
    return PotentiamAlbumRepository(albumRemoteApi);
  }

  AlbumRepository getMockInstance() {
    return MockAlbumRepository();
  }
}
