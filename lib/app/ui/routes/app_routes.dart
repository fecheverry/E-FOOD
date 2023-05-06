import 'package:e_food/app/ui/pages/auth/login/login_page.dart';
import "package:e_food/app/ui/pages/auth/start_page.dart";
import "package:e_food/app/ui/pages/decription/description_page.dart";
import "package:e_food/app/ui/pages/product/add_product_page.dart";
import "package:e_food/app/ui/pages/product/fridge_page.dart";
import "package:e_food/app/ui/pages/product/notifications_page.dart";
import "package:e_food/app/ui/pages/product/product_detail_page.dart";
import "package:e_food/app/ui/routes/routes.dart";
import "package:e_food/app/ui/pages/auth/register/register_page.dart";
import "package:flutter/widgets.dart" show Widget, BuildContext;

import '../pages/decription/initial_page.dart';

Map<String, Widget Function(BuildContext)> get appRoutes => {

  Routes.E_FOOD : (_) =>  const InitialPage(),
    Routes.ADDPRODUCT : (_) =>  const AddProductPage(),
      Routes.DESCRIPTION : (_) =>  const DescriptionPage(),
        Routes.DETAILPRODUCT : (_) =>  const ProductDetailPage(),
          Routes.FRIDGE : (_) =>  const FridgePage(),
            Routes.LOGIN : (_) =>  const LoginPage(),
              Routes.NOTIFICATIONS : (_) =>  const NotificationsPage(),
                Routes.REGISTER : (_) =>    const RegisterPage(),
                  Routes.START : (_) =>  const StartPage(),
};
