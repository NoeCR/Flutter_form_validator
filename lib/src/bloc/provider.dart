import 'package:flutter/material.dart';
import 'package:formvalidator_bloc/src/bloc/login_bloc.dart';
export 'package:formvalidator_bloc/src/bloc/login_bloc.dart';

class Provider extends InheritedWidget {
  static Provider _instance;

  factory Provider({Key key, Widget child}) {
    if (_instance == null)
      _instance = new Provider._internal(key: key, child: child);

    return _instance;
  }

  final loginBloc = LoginBloc();

  // Constructor
  // Provider({Key key, Widget child}) : super(key: key, child: child);
  Provider._internal({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static LoginBloc of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider>().loginBloc;
  }
}
