import 'package:flutter/material.dart';
import 'package:formvalidator_bloc/src/bloc/provider.dart';
import 'package:formvalidator_bloc/src/pages/home_page.dart';
import 'package:formvalidator_bloc/src/pages/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      // key: ,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Login App',
        initialRoute: LoginPage.pageName,
        routes: {
          LoginPage.pageName: (BuildContext context) => LoginPage(),
          HomePage.pageName: (BuildContext context) => HomePage(),
        },
        theme: ThemeData(primaryColor: Colors.deepPurple),
      ),
    );
  }
}
