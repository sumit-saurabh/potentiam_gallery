import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:potentiam_gallery/domain/entity/album.dart';
import 'package:potentiam_gallery/domain/entity/album_photo.dart';
import 'package:potentiam_gallery/domain/usecase/fetch_album_photos_usecase.dart';

part 'event/album_photo_event.dart';
part 'state/album_photo_state.dart';

class AlbumPhotoBloc extends Bloc<AlbumPhotoEvent, AlbumPhotoState> {
  final FetchAlbumPhotosUseCase _fetchAlbumPhotosUseCase;

  AlbumPhotoBloc(
      this._fetchAlbumPhotosUseCase
      ) : super(AlbumPhotoFetchingState(message: "Loading Album Photos...")) {

    on<AlbumPhotoEvent>(_onAlbumPhotoEvent);
  }

  Future<void> _onAlbumPhotoEvent(AlbumPhotoEvent event, Emitter<AlbumPhotoState> emit) async {
    if (event is GetAlbumPhotoEvent) {

      // Showing Loading state
      String message = "Fetching Album (${event.album.title}) Photos...";
      emit(AlbumPhotoFetchingState(message: "$message..."));

      // Fetching the albums
      AlbumPhotos? albumPhotos = await _fetchAlbumPhotosUseCase.execute(event.album);

      if (null != albumPhotos && true == albumPhotos.photos?.isNotEmpty) {
        emit(AlbumPhotoFetchedState(albumPhotos: albumPhotos));
      }
      else {
        // Emit empty album state
        String message = "No Photo Found in Album - ${event.album.title}";
        emit(EmptyAlbumPhotoState(
            message: message
        ));
      }
    }
    else {
      emit(AlbumPhotoFetchErrorState(
          message: "Unknown Event"
      ));
    }
  }
}
