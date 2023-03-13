import 'package:flutter/material.dart';

import 'base_view_out_state.dart';
import 'base_view_state.dart';

abstract class ViewModel<T extends BaseViewState, S extends BaseViewOutState> {
  late T state;
  late S outState;

  @protected
  @mustCallSuper
  ViewModel() {
    state = initializeState();
    outState = initializeOutState();
    initialise();
  }

  initialise() {}

  T initializeState();

  S initializeOutState();
}
