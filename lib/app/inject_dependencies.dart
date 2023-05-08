import 'package:e_food/app/domain/repositories/sign_up_repository.dart';
import 'package:e_food/app/ui/global_controllers/session_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'data/repositories_impl/authentication_repository_impl.dart';
import 'data/repositories_impl/sign_up_repository_impl.dart';
import 'domain/repositories/authentication_repository.dart';
import 'package:flutter_meedu/meedu.dart';

void injectDependencies() {
  Get.lazyPut<AuthenticationRepository>(
      () => AuthenticationRepositoryImpl(FirebaseAuth.instance));

  Get.lazyPut<SignUpRepository>(
      () => SignUpRepositoryImpl(FirebaseAuth.instance));

}
