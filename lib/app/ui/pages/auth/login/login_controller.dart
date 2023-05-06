import 'package:e_food/app/domain/repositories/authentication_repository.dart';
import 'package:e_food/app/ui/global_controllers/session_controller.dart';
import 'package:flutter/material.dart' show GlobalKey, FormState;
import 'package:flutter_meedu/meedu.dart';

import '../../../../domain/responses/sign_in_response.dart';

class LoginController extends SimpleNotifier {
  final SessionController _sessionController;

  String _email = "", _password = "";

  final AuthenticationRepository _authenticationRepository = Get.find();

  final GlobalKey<FormState> formKey = GlobalKey();

  LoginController(this._sessionController);

  void onEmailChanged(String text) {
    _email = text;
  }

  void onPasswordChanged(String text) {
    _password = text;
  }

  Future<SignInResponse> submit() async {
    final response = await _authenticationRepository.signInWithEmailAndPassword(
        _email, _password);

    if (response.error == null) {
      _sessionController.setUser(response.user!);
    }

    return response;
  }
}
