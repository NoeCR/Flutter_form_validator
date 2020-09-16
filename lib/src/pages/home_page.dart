import 'package:flutter/material.dart';
import 'package:formvalidator_bloc/src/bloc/provider.dart';

class HomePage extends StatelessWidget {
  static final String pageName = 'home';
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Email ${bloc.email}'),
          Divider(),
          Text('Password ${bloc.password}'),
        ],
      ),
    );
  }
}
