part of '../album_bloc.dart';

@immutable
abstract class AlbumEvent extends Equatable {
  const AlbumEvent();

  @override
  List<Object?> get props => [];
}

class GetAlbumsEvent extends AlbumEvent{
  final String? filterTitle;

  const GetAlbumsEvent({
    this.filterTitle
  });

  @override
  List<Object?> get props => [filterTitle];
}


