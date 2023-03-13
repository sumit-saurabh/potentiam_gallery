import 'dart:async';
import 'package:potentiam_gallery/domain/entity/album.dart';
import 'package:potentiam_gallery/domain/usecase/fetch_album_photos_usecase.dart';
import 'package:potentiam_gallery/domain/usecase/fetch_albums_usecase.dart';
import 'package:potentiam_gallery/ui/view_model/common/base_view_model.dart';
import 'package:potentiam_gallery/ui/view_model/common/base_view_out_state.dart';
import 'package:potentiam_gallery/ui/view_model/common/base_view_state.dart';
import 'package:rxdart/rxdart.dart';

/**
 * We can use View model (Reactive) Pattern approach rather than Bloc Pattern for complex use-case
 * Cons of Using Bloc:
 * 1. Boilerplate code
 * 2. Too many Event and States for complex view
 * 3. One to one mapping of event and state
 * 4. Communication between multiple blocs add up more conffusion
 *
 * Note: Have just added the view model, inorder to use it in the widget,
 * use viewmodel provier and stream builder in the view
 */
class AlbumViewModel extends ViewModel<AlbumViewState, AlbumViewOutState> {
  FetchAlbumsUseCase _fetchAlbumsUseCase;
  FetchAlbumPhotosUseCase _fetchAlbumPhotosUseCase;

  AlbumViewModel(this._fetchAlbumsUseCase, this._fetchAlbumPhotosUseCase);

  @override
  AlbumViewOutState initializeOutState() {
    return AlbumViewOutState();
  }

  @override
  AlbumViewState initializeState() {
    return AlbumViewState();
  }

  Future<List<Album>?> getAlbums() async {

  }

}

class AlbumViewState extends BaseViewState {
  // List<Album>? _albums;
  BehaviorSubject<List<Album>?> _albums = new BehaviorSubject();

  Stream<List<Album>?> get albums => _albums;

  @override
  dispose() {
    _albums.close();
  }
}

class AlbumViewOutState extends BaseViewOutState {}
