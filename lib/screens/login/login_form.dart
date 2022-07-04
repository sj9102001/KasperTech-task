import 'package:flutter/material.dart';
import 'package:kaspertechtask/common/custom_button.dart';
import 'package:kaspertechtask/common/dialogs.dart';
import 'package:kaspertechtask/providers/auth.dart';
import 'package:provider/provider.dart';

import '../signup/signup_page.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

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
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
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
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              child: GestureDetector(
                  child: const Text('Recover Password'), onTap: () {}),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
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
            CustomButton(
              callbackFunction: () =>
                  submitSignin(context, authProvider.login, email, password),
              height: MediaQuery.of(context).size.height * 0.07,
              width: double.infinity,
              child: Text(
                'Sign In',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            )
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
      labelStyle: const TextStyle(color: Colors.black54),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black54, width: 2),
      ),
      contentPadding: const EdgeInsets.all(20),
      border: InputBorder.none);
}
