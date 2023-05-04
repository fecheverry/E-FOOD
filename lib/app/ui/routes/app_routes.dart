import "package:e_food/app/ui/routes/routes.dart";
import "package:flutter/widgets.dart" show Widget, BuildContext;

import "../pages/initial_page.dart";

Map<String, Widget Function(BuildContext)> get appRoutes => {

  Routes.E_FOOD : (_) =>  const InitialPage()
};
