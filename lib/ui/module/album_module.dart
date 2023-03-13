import 'package:dio/dio.dart';
import 'package:potentiam_gallery/data/network/api/album_remote_api.dart';
import 'package:potentiam_gallery/domain/repository_interface/album_repository.dart';
import 'package:potentiam_gallery/domain/usecase/fetch_album_photos_usecase.dart';
import 'package:potentiam_gallery/domain/usecase/fetch_albums_usecase.dart';
import 'package:potentiam_gallery/ui/bloc/album_bloc.dart';
import 'package:potentiam_gallery/ui/bloc/album_photo_bloc.dart';
import 'package:potentiam_gallery/ui/factory/album_factory.dart';
import 'package:potentiam_gallery/ui/view_model/album_view_model.dart';

class AlbumModule {
  static final AlbumModule _instance = AlbumModule._internal();

  factory AlbumModule() {
    return _instance;
  }

  AlbumModule._internal();

  late AlbumRepository albumRepository = _enableMock
      ? AlbumFactory().getMockInstance()
      : AlbumFactory().getInstance(_albumRemoteApi);

  late bool _enableMock;
  late AlbumRemoteApi _albumRemoteApi;

  Future<void> initialise({
    bool? enableMock,
    required Dio dio
  }) async {
    _enableMock = enableMock?? false;
    _albumRemoteApi = AlbumRemoteApi(dio);
  }


  AlbumViewModel provideAlbumViewModel() {
    return AlbumViewModel(
        FetchAlbumsUseCase(albumRepository),
        FetchAlbumPhotosUseCase(albumRepository)
    );
  }

  AlbumBloc provideAlbumBloc() {
    return AlbumBloc(
        FetchAlbumsUseCase(albumRepository)
    );
  }

  AlbumPhotoBloc provideAlbumPhotoBloc() {
    return AlbumPhotoBloc(
        FetchAlbumPhotosUseCase(albumRepository)
    );
  }
}
