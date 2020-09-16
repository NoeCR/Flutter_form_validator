import 'package:flutter/material.dart';
import 'package:formvalidator_bloc/src/bloc/provider.dart';
import 'package:formvalidator_bloc/src/pages/home_page.dart';

class LoginPage extends StatelessWidget {
  static final String pageName = 'login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        _createBackground(context),
        _loginForm(context),
      ],
    ));
  }

  Stack _createBackground(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final purpleBackground = Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: <Color>[
        Color.fromRGBO(63, 63, 156, 1.0),
        Color.fromRGBO(90, 70, 178, 1.0)
      ])),
    );

    final circle = Container(
        height: 80.0,
        width: 80.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.0),
            color: Color.fromRGBO(255, 255, 255, 0.05)));

    final mark = Container(
      padding: EdgeInsets.only(top: 80.0),
      child: Column(
        children: [
          Icon(Icons.person_pin_circle, color: Colors.white, size: 75.0),
          SizedBox(height: 10.0, width: double.infinity),
          Text('Inicia sesión',
              style: TextStyle(color: Colors.white, fontSize: 17.0))
        ],
      ),
    );

    return Stack(
      alignment: AlignmentDirectional.topEnd,
      // fit: StackFit.expand,
      children: [
        purpleBackground,
        Positioned(child: circle, top: 75.0, left: 30.0),
        Positioned(child: circle, top: -40.0, right: -30.0),
        Positioned(child: circle, top: 150.0, right: 30.0),
        Positioned(child: circle, top: 220.0, left: 20.0),
        Positioned(child: circle, top: -10.0, left: 210.0),
        mark
      ],
    );
  }

  SingleChildScrollView _loginForm(BuildContext context) {
    final bloc = Provider.of(context);
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SafeArea(child: Container(height: 180.0)),
          Container(
            width: size.width * 0.85,
            margin: EdgeInsets.symmetric(vertical: 30.0),
            padding: EdgeInsets.symmetric(vertical: 50.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black38,
                      blurRadius: 3.0,
                      offset: Offset(0.0, 5.0),
                      spreadRadius: 3.0),
                ]),
            child: Column(
              children: [
                Text('Rellene el formulario', style: TextStyle(fontSize: 17.0)),
                SizedBox(height: 60.0),
                _createEmail(bloc),
                SizedBox(height: 30.0),
                _createPassword(bloc),
                SizedBox(height: 30.0),
                _createButton(bloc, context),
              ],
            ),
          ),
          Text('¿Olvido la contraseña?'),
          SizedBox(height: 100.0),
        ],
      ),
    );
  }

  Widget _createEmail(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (context, snapshot) => Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              icon: Icon(Icons.alternate_email, color: Colors.deepPurple),
              hintText: 'email@gmail.com',
              labelText: 'Correo electrónico',
              counterText: snapshot.data,
              errorText: snapshot.error),
          // El primer argumento del evento onChanged sera enviado al método changeEmail del stream
          onChanged: bloc.changeEmail,
        ),
      ),
    );
  }

  Widget _createPassword(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (context, snapshot) => Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          obscureText: true,
          keyboardType: TextInputType.visiblePassword,
          decoration: InputDecoration(
            icon: Icon(Icons.lock_outline, color: Colors.deepPurple),
            labelText: 'Contraseña',
            counterText: snapshot.data,
            errorText: snapshot.error,
          ),
          onChanged: bloc.changePassword,
        ),
      ),
    );
  }

  Widget _createButton(LoginBloc bloc, BuildContext context) {
    return StreamBuilder(
      stream: bloc.formValidStream,
      builder: (context, snapshot) => RaisedButton(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
          child: Text('Enviar'),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.circular(5.0)),
        elevation: 0.0,
        color: Colors.deepPurple,
        textColor: Colors.white,
        onPressed: snapshot.hasData ? () => _login(bloc, context) : null,
      ),
    );
  }

  _login(LoginBloc bloc, BuildContext context) {
    Navigator.pushReplacementNamed(context, HomePage.pageName);
  }
}
