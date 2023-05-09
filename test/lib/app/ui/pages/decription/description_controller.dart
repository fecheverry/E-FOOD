import 'package:e_food/app/domain/repositories/authentication_repository.dart';
import 'package:e_food/app/ui/global_controllers/session_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_meedu/meedu.dart';

import '../../routes/routes.dart';

class DescriptionController extends SimpleNotifier {
  final SessionController _sessionController;

  final AuthenticationRepository _authRepository = Get.find();

  String? _routeName;
  String? get routeName => _routeName;

  DescriptionController(this._sessionController) {
    _init();
  }

  void _init() async {
    final user = await _authRepository.user;
    if (user != null) {
      _routeName = Routes.FRIDGE;
      _sessionController.setUser(user);
    } else {
      _routeName = Routes.DESCRIPTION;
    }

    notify();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
