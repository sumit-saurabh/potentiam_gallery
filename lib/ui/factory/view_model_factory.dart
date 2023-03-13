import 'dart:developer' as developer;

import 'package:potentiam_gallery/ui/bloc/album_bloc.dart';
import 'package:potentiam_gallery/ui/module/album_module.dart';
import 'package:potentiam_gallery/ui/view_model/album_view_model.dart';
import 'package:potentiam_gallery/ui/view_model/common/base_view_model.dart';
import 'package:potentiam_gallery/utils/app_logger.dart';

class ViewModelFactory {
  final _albumModule = AlbumModule();

  static final ViewModelFactory _instance = ViewModelFactory._();

  factory ViewModelFactory() {
    return _instance;
  }

  ViewModelFactory._();

  final Map<Type, ViewModel> _viewMap = {};
  final Map<String, ViewModel> _namedViewMap = {};

  initialise() async {}

  T get<T>({String? name, bool newInstance = false}) {
    if (newInstance) _get<T>();

    if (name != null && name.trim().isNotEmpty) {
      String key = "$name${T.runtimeType}";
      if (_namedViewMap.containsKey(key)) {
        logger.v("AppViewFactory : Returning cached ViewModel  $key");
        return _namedViewMap[key] as T;
      } else {
        logger.v("AppViewFactory : Returning new ViewModel $key");
        ViewModel view = _get<T>();
        _namedViewMap[key] = view;
        return view as T;
      }
    }

    if (_viewMap.containsKey(T)) {
      return _viewMap[T] as T;
    } else {
      ViewModel view = _get<T>();
      _viewMap[T] = view;
      return view as T;
    }
  }

  ViewModel _get<T>() {
    switch (T) {
      case AlbumViewModel:
        return _albumModule.provideAlbumViewModel();
      default:
        return throw Exception("ViewModel is not created for $T");
    }
  }
}
