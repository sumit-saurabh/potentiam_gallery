part of '../album_bloc.dart';

@immutable
abstract class AlbumState extends Equatable {
  const AlbumState();

  @override
  List<Object> get props => [];
}

class AlbumFetchingState extends AlbumState {
  String? message = "Loading Albums...";

  AlbumFetchingState({
    this.message
  });

  @override
  List<Object> get props => [message??""];
}

class AlbumFetchedState extends AlbumState {
  List<Album>? albums;

  AlbumFetchedState({
    this.albums
  });

  @override
  List<Object> get props => [albums??""];
}

class EmptyAlbumState extends AlbumState {
  String? message = "No Album Found";

  EmptyAlbumState({
    this.message
  });

  @override
  List<Object> get props => [message??""];
}

class AlbumErrorState extends AlbumState {
  String? message = "Error while fetching Albums";

  AlbumErrorState({
    this.message
  });

  @override
  List<Object> get props => [message??""];
}