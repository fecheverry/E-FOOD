import 'package:e_food/app/ui/pages/auth/register/controller/register_state.dart';
import 'package:flutter_meedu/meedu.dart';

class RegisterController extends StateNotifier<RegisterState> {
  RegisterController() : super(RegisterState.initialState);

  submit() {}

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
