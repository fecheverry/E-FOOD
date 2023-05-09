import 'package:e_food/app/domain/inputs/sign_up.dart';
import 'package:e_food/app/ui/pages/auth/register/register_page.dart'
    show registerProvider;
import 'package:e_food/app/ui/pages/widgets/dialogs/progress_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';

import '../../../../../domain/responses/sign_up_response.dart';
import '../../../../routes/routes.dart';
import '../../../widgets/dialogs/dialogs.dart';

Future<void> sendRegisterForm(BuildContext context) async {
  final controller = registerProvider.read;
  final isValidForm = controller.formKey.currentState!.validate();

  if (isValidForm) {
    ProgressDialog.show(context);
    final response = await controller.submit();
    router.pop();
    if (response.error != null) {
      late String content;
      switch (response.error) {
        case SignUpError.emailAlreadyInUse:
          content = "email already in use";
          break;
        case SignUpError.weakPassword:
          content = "Weak Password";
          break;
        case SignUpError.networkRequestFailed:
          content = "network Request Failed";
          break;
        case SignUpError.unknown:
          content = "Unknown Error";
          break;
        default:
      }

      Dialogs.alert(context, title: "ERROR", content: content);
    } else {
      router.pushNamedAndRemoveUntil(Routes.FRIDGE);
    }
  } else {
    Dialogs.alert(context, title: "ERROR", content: "Invalid fields");
  }
}
