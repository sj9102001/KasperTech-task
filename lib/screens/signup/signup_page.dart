import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  static const routeName = '/signup';

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();

  String name = '';
  String userName = '';
  String email = '';
  String phoneNumber = '';
  String password = '';
  String confirmPassword = '';

  void _submitSignupForm() {
    bool isValid = _formKey.currentState!.validate();
    print(isValid);
    if (isValid) {
      _formKey.currentState!.save();

      print(name);
      print(userName);
      print(email);
      print(phoneNumber);
      print(password);
      print(confirmPassword);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Sign Up',
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.w700, color: Colors.black),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.black,
          ),
          backgroundColor: Colors.white,
          elevation: 0),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                          decoration: _buildInputDecoration('Name'),
                          onSaved: (value) {
                            name = value.toString();
                          },
                          validator: (value) {
                            if (value.toString().isEmpty) {
                              return 'Name is required';
                            }
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                          decoration: _buildInputDecoration('Username'),
                          onSaved: (value) {
                            userName = value.toString();
                          },
                          validator: (value) {
                            if (value.toString().isEmpty) {
                              return 'Username is required';
                            }
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: _buildInputDecoration('Email'),
                        onSaved: (value) {
                          email = value.toString();
                        },
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return 'Email is required';
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                          decoration: _buildInputDecoration('Phone Number'),
                          keyboardType: TextInputType.phone,
                          onSaved: (value) {
                            phoneNumber = value.toString();
                          },
                          validator: (value) {
                            if (value.toString().isEmpty) {
                              return 'Phone number is required';
                            }
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                          decoration: _buildInputDecoration('Enter Password'),
                          obscureText: true,
                          onSaved: (value) {
                            password = value.toString();
                          },
                          validator: (value) {
                            if (value.toString().isEmpty) {
                              return 'Please enter password';
                            }
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                          decoration: _buildInputDecoration('Confirm Password'),
                          obscureText: true,
                          onSaved: (value) {
                            confirmPassword = value.toString();
                          },
                          validator: (value) {
                            if (value.toString().isEmpty) {
                              return 'Confirm password!';
                            }
                          }),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                  onTap: _submitSignupForm,
                  child: Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height * 0.07,
                    margin: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 15),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 182, 29),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: double.infinity,
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ))
            ],
          ),
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
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 2),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 2),
      ),
      contentPadding: EdgeInsets.all(20),
      border: InputBorder.none);
}
