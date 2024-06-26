import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver implements BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    debugPrint('change: $bloc : $change');
  }

  @override
  void onClose(BlocBase bloc) {
    debugPrint('close: $bloc');
  }

  @override
  void onCreate(BlocBase bloc) {
    debugPrint('create: $bloc');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    debugPrint('create: $bloc : $error : $stackTrace');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    debugPrint('create: $bloc : $event');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    debugPrint('create: $bloc : $transition');
  }
}
