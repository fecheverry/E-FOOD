import 'package:flutter/material.dart' show GlobalKey, FormState;
import 'package:flutter_meedu/meedu.dart';

class LoginController extends SimpleNotifier {
  String _email = "", _password = "";
  final GlobalKey<FormState> formKey = GlobalKey();

  void onEmailChanged(String text) {
    _email = text;
  }

  void onPasswordChanged(String text) {
    _password = text;
  }
}
