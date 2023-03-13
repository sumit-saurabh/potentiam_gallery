import 'package:potentiam_gallery/domain/entity/album.dart';
import 'package:potentiam_gallery/domain/entity/album_photo.dart';
import 'package:potentiam_gallery/domain/repository_interface/album_repository.dart';

class MockAlbumRepository extends AlbumRepository {

  MockAlbumRepository(

      );

  @override
  Future<AlbumPhotos?> fetchAlbumPhotosByAlbumId(int id) {
    // TODO: implement fetchAlbumPhotosByAlbumId
    throw UnimplementedError();
  }

  @override
  Future<List<Album>?> fetchAllAlbums() {
    // TODO: implement fetchAllAlbums
    throw UnimplementedError();
  }

  @override
  Future<List<Album>?> searchAlbumsByTitle(String title) {
    // TODO: implement searchAlbumsByTitle
    throw UnimplementedError();
  }

}