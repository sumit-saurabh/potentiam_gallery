part of '../album_photo_bloc.dart';

@immutable
abstract class AlbumPhotoEvent extends Equatable {
  const AlbumPhotoEvent();
}

class GetAlbumPhotoEvent extends AlbumPhotoEvent{
  final Album album;

  const GetAlbumPhotoEvent(
      this.album
      );

  @override
  List<Object?> get props => [album];
}
