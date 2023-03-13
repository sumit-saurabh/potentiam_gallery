import 'package:bloc/bloc.dart';
import 'package:potentiam_gallery/ui/bloc/album_bloc.dart';
import 'package:potentiam_gallery/ui/bloc/album_photo_bloc.dart';
import 'package:potentiam_gallery/ui/module/album_module.dart';

class BlocFactory {
  final _albumModule = AlbumModule();

  static final BlocFactory _instance = BlocFactory._();

  factory BlocFactory() {
    return _instance;
  }

  BlocFactory._();

  initialise() async {}

  T get<T>({String? name, bool newInstance = true}) {
    Bloc view = _get<T>();
    return view as T;
  }

  Bloc _get<T>() {
    switch (T) {
      case AlbumBloc:
        return _albumModule.provideAlbumBloc();
      case AlbumPhotoBloc:
        return _albumModule.provideAlbumPhotoBloc();
      default:
        return throw Exception("Bloc is not created for $T");
    }
  }
}
