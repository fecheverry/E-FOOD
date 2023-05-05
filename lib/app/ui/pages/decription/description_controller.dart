import 'package:e_food/app/domain/repositories/authentication_repository.dart';
import 'package:flutter_meedu/meedu.dart';

import '../../routes/routes.dart';

class DescriptionController extends SimpleNotifier {
  final AuthenticationRepository _authRepository = Get.find();

  String? _routeName;
  String? get routeName => _routeName;

  DescriptionController() {
    _init();
  }

  void _init() async {
    final user = await _authRepository.user;
    _routeName = user != null ? Routes.FRIDGE : Routes.DESCRIPTION;
    notify();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
