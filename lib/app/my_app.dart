import 'package:e_food/app/ui/pages/initial_page.dart';
import 'package:e_food/app/ui/routes/app_routes.dart';
import 'package:e_food/app/ui/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: Routes.E_FOOD,
      routes: appRoutes,
      debugShowCheckedModeBanner: false,
      title: 'E-FOOD',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
    );
  }
}
