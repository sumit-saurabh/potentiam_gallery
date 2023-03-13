import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:potentiam_gallery/domain/entity/album.dart';
import 'package:potentiam_gallery/domain/usecase/fetch_albums_usecase.dart';

part 'event/album_event.dart';
part 'state/album_state.dart';

class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  final FetchAlbumsUseCase _fetchAlbumsUseCase;

  AlbumBloc(
      this._fetchAlbumsUseCase,
  ) : super(AlbumFetchingState(message: "Loading Albums...")) {

    on<AlbumEvent>(_onAlbumEvent);
  }

  Future<void> _onAlbumEvent(AlbumEvent event, Emitter<AlbumState> emit) async {
    if (event is GetAlbumsEvent) {

      // Showing Loading state
      String message = "Fetching Album ";
      if (event.filterTitle?.isNotEmpty == true) {
        message += " with title as '${event.filterTitle}'";
      }
      emit(AlbumFetchingState(message: "$message..."));

      // Fetching the albums
      List<Album>? albums = await _fetchAlbumsUseCase.execute(event.filterTitle);

      if (null != albums && albums.isNotEmpty) {
        emit(AlbumFetchedState(albums: albums));
      }
      else {
        // Emit empty album state
        String message = "No Album Found";
        if (event.filterTitle?.isNotEmpty == true) {
          message += " with title as '${event.filterTitle}'";
        }
        emit(EmptyAlbumState(
            message: message
        ));
      }
    }
    else {
      emit(AlbumErrorState(
          message: "Unknown Event"
      ));
    }
  }
}
