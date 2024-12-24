import 'dart:developer';

import '../screens/chat.dart';

import '../widgets/custom_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_form_field.dart';
import '../widgets/image_container.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();
  var _isLogin = true;
  var _enteredEmail = '';
  var _enteredPassword = '';

  void _showSnackBar(String message) {
    if (context.mounted) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            message,
          ),
        ),
      );
    }
  }

  void _submitForm() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();
    try {
      if (_isLogin) {
        if (context.mounted) {
          _showSnackBar('Logged in!');
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (ctx) => ChatScreen(),
            ),
          );
        }
      } else {
        setState(() {
          _isLogin = true;
        });
      }
    } catch (e) {
      _showSnackBar(e.toString());
    }
  }

  void _toggleIsLogin() {
    setState(() {
      _isLogin = !_isLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageContainer(
                imagePath: 'assets/images/chat.png',
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(
                    width: 2.0,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                margin: EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomFormField.email(
                            key: ValueKey('email'),
                            onSaved: (value) => _enteredEmail = value!,
                            isLast: false,
                          ),
                          Gap(20),
                          CustomFormField(
                            key: ValueKey('password'),
                            onSaved: (value) => _enteredPassword = value!,
                            label: 'Password',
                          ),
                          Gap(20),
                          CustomElevatedButton(
                            label: _isLogin ? 'Login' : 'Sign Up',
                            onPressed: _submitForm,
                          ),
                          Gap(10),
                          CustomRichText(
                            preTappableText: _isLogin
                                ? 'Don\'t have an account yet? '
                                : 'Already have an account? ',
                            tappableText: _isLogin ? 'Sign up ' : 'Login ',
                            tappableOnTap: _toggleIsLogin,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
