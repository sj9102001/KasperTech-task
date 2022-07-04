import 'package:flutter/material.dart';
import 'package:kaspertechtask/common/dialogs.dart';
import 'package:kaspertechtask/providers/auth.dart';
import 'package:provider/provider.dart';

import '../signup/signup_page.dart';

class LoginForm extends StatefulWidget {
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String email = '';

  String password = '';

  void submitSignin(BuildContext ctx, signinCallback, email, password) async {
    try {
      await signinCallback(email, password);
    } catch (error) {
      await Dialogs.customShowDialog(ctx, 'Oops!', error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<Auth>(context);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              decoration: _buildInputDecoration('Email'),
              onChanged: (value) {
                setState(() {
                  email = value.toString();
                });
              },
            ),
            TextField(
              decoration: _buildInputDecoration('Password'),
              obscureText: true,
              onChanged: (value) {
                setState(() {
                  password = value.toString();
                });
              },
            ),
            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              child: GestureDetector(
                  child: Text('Recover Password'),
                  onTap: () {
                    print('Recover Password tapped');
                  }),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Don\'t have an account?'),
                  GestureDetector(
                      child: const Text(
                        '  Sign up',
                        style:
                            TextStyle(color: Color.fromARGB(255, 255, 182, 29)),
                      ),
                      onTap: () {
                        Navigator.of(context).pushNamed(SignupPage.routeName);
                      }),
                ],
              ),
            ),
            GestureDetector(
                child: Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * 0.07,
                  margin:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 182, 29),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: double.infinity,
                  child: const Text(
                    'Sign In',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
                onTap: () =>
                    submitSignin(context, authProvider.login, email, password))
          ],
        ),
      ),
    );
  }
}

InputDecoration _buildInputDecoration(text) {
  return InputDecoration(
      hintText: text,
      labelText: text,
      labelStyle: TextStyle(color: Colors.black54),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black54, width: 2),
      ),
      contentPadding: EdgeInsets.all(20),
      border: InputBorder.none);
}
