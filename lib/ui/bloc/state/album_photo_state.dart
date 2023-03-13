part of '../album_photo_bloc.dart';

abstract class AlbumPhotoState extends Equatable {
  const AlbumPhotoState();

  @override
  List<Object> get props => [];
}

class AlbumPhotoFetchingState extends AlbumPhotoState {
  String? message = "Loading Album Photo...";

  AlbumPhotoFetchingState({
    this.message
  });

  @override
  List<Object> get props => [message??""];
}

class AlbumPhotoFetchedState extends AlbumPhotoState {
  AlbumPhotos? albumPhotos;

  AlbumPhotoFetchedState({
    this.albumPhotos
  });

  @override
  List<Object> get props => [albumPhotos??""];
}

class EmptyAlbumPhotoState extends AlbumPhotoState {
  String? message = "Empty Album: No Photo Found";

  EmptyAlbumPhotoState({
    this.message
  });

  @override
  List<Object> get props => [message??""];
}

class AlbumPhotoFetchErrorState extends AlbumPhotoState {
  String? message = "Error while fetching Album photo";

  AlbumPhotoFetchErrorState({
    this.message
  });

  @override
  List<Object> get props => [message??""];
}