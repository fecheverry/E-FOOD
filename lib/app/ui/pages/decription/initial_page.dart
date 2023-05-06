import 'package:e_food/app/ui/pages/decription/description_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/ui.dart';

import '../../global_controllers/session_controller.dart';

final descriptionProvider = SimpleProvider((_) => DescriptionController(sessionProvider.read));

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderListener(
        provider: descriptionProvider,
        onChange: (_, controller) {
          final routeName = controller.routeName;
          if (routeName != null) {
            router.pushNamed(routeName,backGestureEnabled: true);
          }
        },
        builder: (_, __) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: GestureDetector(
              onTap: () {
         },
              child: Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'E',
                        style: TextStyle(
                          color: Color.fromARGB(255, 82, 212, 87),
                        ),
                      ),
                      TextSpan(
                        text: '-FOOD',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
