import 'package:flutter/material.dart';
import '../mixins/validation_mixin.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> with ValidationMixin {
  String emailAddress;
  String password;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            emailFormField(),
            // Padding(padding: EdgeInsets.only(bottom: 30.0)),
            Container(
              margin: EdgeInsets.only(bottom: 30.0),
            ),
            passwordFormField(),
            // Padding(padding: EdgeInsets.all(20.0)),
            Container(
              margin: EdgeInsets.only(bottom: 30.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                resetButton(),
                Container(
                  margin: EdgeInsets.only(right: 30.0),
                ),
                submitButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget emailFormField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Email Address',
        hintText: 'johhdoe@example.com',
        hintStyle: TextStyle(fontSize: 10.0),
        contentPadding: EdgeInsets.all(8.0),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue.shade200,
            width: 1.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red.shade100,
            width: 1.0,
          ),
        ),
        labelStyle: TextStyle(
          fontSize: 12.0,
        ),
      ),
      keyboardType: TextInputType.emailAddress,
      validator: validateEmail,
      onSaved: (email) {
        emailAddress = email;
      },
    );
  }

  Widget passwordFormField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Must contain 8 characters',
        hintStyle: TextStyle(fontSize: 10.0),
        contentPadding: EdgeInsets.all(8.0),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue.shade200,
            width: 2.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red.shade100,
            width: 1.0,
          ),
        ),
        labelStyle: TextStyle(
          fontSize: 12.0,
        ),
      ),
      obscureText: true,
      obscuringCharacter: '*',
      validator: validatePassword,
      onSaved: (password) {
        this.password = password;
      },
    );
  }

  Widget submitButton() {
    return ElevatedButton(
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          print('Email is : ' + emailAddress);
          print('Password is : ' + password);
        }
      },
      child: Text('Submit'),
    );
  }

  Widget resetButton() {
    return ElevatedButton(
      onPressed: () {
        formKey.currentState.reset();
        print('Email is : ' + emailAddress);
        print('Password is : ' + password);
      },
      child: Text('Reset'),
    );
  }
}
