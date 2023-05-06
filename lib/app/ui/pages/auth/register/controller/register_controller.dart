import 'package:e_food/app/domain/inputs/sign_up.dart';
import 'package:e_food/app/domain/repositories/sign_up_repository.dart';
import 'package:e_food/app/ui/pages/auth/register/controller/register_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_meedu/meedu.dart';

class RegisterController extends StateNotifier<RegisterState> {
  RegisterController() : super(RegisterState.initialState);

  final GlobalKey<FormState> formKey = GlobalKey();
  final SignUpRepository _signUpRepository = Get.find();

  Future<SignUpResponse> submit() {
    return _signUpRepository.register(SignUpData(
        name: state.name, email: state.email, password: state.password));
  }

  void onNameChanged(String text) {
    state = state.copyWith(name: text);
  }

  void onEmailChanged(String text) {
    state = state.copyWith(email: text);
  }

  void onPasswordChanged(String text) {
    state = state.copyWith(password: text);
  }

  void onVPasswordChange(String text) {
    state = state.copyWith(vPassword: text);
  }
}
