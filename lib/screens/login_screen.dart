import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import '../translations.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  String _email;
  String _password;

  void _submitCommand() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();

      _loginCommand();
    }
  }

  void _loginCommand() {
    // This is just a demo, so no actual login here.
    final snackbar = SnackBar(
      content: Text('Email: $_email, password: $_password'),

    );

    scaffoldKey.currentState.showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate('app_title')),
      ),

      body:
      Padding(
        padding: const EdgeInsets.all(16.0),

        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(height: 50.0),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                validator: (val) => !EmailValidator.validate(val, true)
                    ? 'Not a valid email.'
                    : null, ////validator wrong
                onSaved: (val) => _email = val,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Password'),
                validator: (val) =>
                    val.length < 4 ? 'Password too short..' : null,
                onSaved: (val) => _password = val,
                obscureText: true,
              ),
              RaisedButton(
                  child: Text(AppLocalizations.of(context).translate('login'),
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      )),
                  color: Colors.pink,
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      '/type-edl',
                      // RaisedButton(
                      // onPressed: _submitCommand,
                      // child: Text('Sign in'),
                      // ),
                    );
                  }),

            ],

          ),

        ),

      ),

    );

  }
}
