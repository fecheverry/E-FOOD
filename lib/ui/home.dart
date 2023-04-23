import 'package:e_food/ui/pages/initial_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: InitialPage(),
    );
  }
}