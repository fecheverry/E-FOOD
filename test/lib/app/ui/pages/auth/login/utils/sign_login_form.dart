import 'package:e_food/app/ui/pages/auth/login/login_page.dart'
    show loginProvider;
import 'package:e_food/app/ui/pages/widgets/dialogs/progress_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';

import '../../../../../domain/responses/sign_in_response.dart';
import '../../../../routes/routes.dart';
import '../../../widgets/dialogs/dialogs.dart';

Future<void> sendLoginForm(BuildContext context) async {
  final controller = loginProvider.read;

  final isValidForm = controller.formKey.currentState!.validate();

  if (isValidForm) {
    ProgressDialog.show(context);

    final response = await controller.submit();

    router.pop();

    if (response.error != null) {
      String errorMessage = "";

      switch (response.error) {
        case SignInError.networkRequestFailed:
          errorMessage = "network Request Failed";
          break;
        case SignInError.userDisabled:
          errorMessage = "user Disabled";
          break;
        case SignInError.userNotFound:
          errorMessage = "user Not Found";
          break;
        case SignInError.wrongPassword:
          errorMessage = "wrong Password";
          break;
        case SignInError.unknown:
          errorMessage = "unknown error";
          break;
        default:
          errorMessage = "unknown error";
          break;
      }

      // ignore: use_build_context_synchronously
      Dialogs.alert(context, title: "ERROR", content: errorMessage);
    } else {
      router.pushReplacementNamed(Routes.FRIDGE);
    }
  }
}
