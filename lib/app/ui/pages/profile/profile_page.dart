import 'package:e_food/app/ui/global_controllers/session_controller.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/ui.dart';

import '../../routes/routes.dart';

class ProfilePage extends ConsumerWidget {
  ProfilePage({super.key});

  final ValueNotifier<bool> _clicked = ValueNotifier<bool>(false);

  void _handleTap() async {
    _clicked.value = true;
    await sessionProvider.read.signOut();
    router.pushNamedAndRemoveUntil(Routes.START);
  }

  @override
  Widget build(BuildContext context, ref) {
    final sessionController = ref.watch(sessionProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 35),
          const CircleAvatar(
            radius: 80,
            backgroundColor: Color.fromRGBO(167, 233, 209, 1),
            child: Icon(
              Icons.person,
              size: 161,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          Consumer(builder: (_, ref, __) {
            final user = ref.watch(sessionProvider).user!;
            return Text(
              user.displayName ?? "",
              style: const TextStyle(
                fontSize: 20,
                color: Color.fromRGBO(54, 140, 114, 1),
                fontWeight: FontWeight.bold,
              ),
            );
          }),
          const SizedBox(height: 40),
          const Divider(
            height: 0,
            thickness: 1,
            color: Color.fromRGBO(192, 192, 192, 1),
            indent: 0,
            endIndent: 0,
          ),
          ListTile(
            leading: const Icon(
              Icons.notifications,
              color: Colors.grey,
              size: 28,
            ),
            title: const Text('Notificaciones',
                style: TextStyle(color: Colors.grey, fontSize: 15)),
            trailing: Switch(
              value: true,
              onChanged: (value) {},
            ),
          ),
          const Divider(
            height: 0,
            thickness: 1,
            color: Color.fromRGBO(192, 192, 192, 1),
            indent: 0,
            endIndent: 0,
          ),
          const SizedBox(
            height: 5,
          ),
          const Divider(
            height: 0,
            thickness: 1,
            color: Color.fromRGBO(192, 192, 192, 1),
            indent: 0,
            endIndent: 0,
          ),
          const ListTile(
            leading: Icon(Icons.notification_important,
                color: Colors.grey, size: 28),
            title: Text('Personalizar alertas',
                style: TextStyle(color: Colors.grey, fontSize: 15)),
          ),
          const Divider(
            height: 0,
            thickness: 1,
            color: Color.fromRGBO(192, 192, 192, 1),
            indent: 0,
            endIndent: 0,
          ),
          const SizedBox(
            height: 5,
          ),
          const Divider(
            height: 0,
            thickness: 1,
            color: Color.fromRGBO(192, 192, 192, 1),
            indent: 0,
            endIndent: 0,
          ),
          const ListTile(
            leading: Icon(Icons.language, color: Colors.grey, size: 28),
            title: Text('Idioma',
                style: TextStyle(color: Colors.grey, fontSize: 15)),
          ),
          const Divider(
            height: 0,
            thickness: 1,
            color: Color.fromRGBO(192, 192, 192, 1),
            indent: 0,
            endIndent: 2,
          ),
          const SizedBox(
            height: 5,
          ),
          const Divider(
            height: 0,
            thickness: 1,
            color: Color.fromRGBO(192, 192, 192, 1),
            indent: 0,
            endIndent: 0,
          ),
          const ListTile(
            leading: Icon(Icons.settings, color: Colors.grey, size: 28),
            title: Text('Configuracion',
                style: TextStyle(color: Colors.grey, fontSize: 15)),
          ),
          const Divider(
            height: 0,
            thickness: 1,
            color: Color.fromRGBO(192, 192, 192, 1),
            indent: 0,
            endIndent: 0,
          ),
          const SizedBox(
            height: 5,
          ),
          const Divider(
            height: 0,
            thickness: 1,
            color: Color.fromRGBO(192, 192, 192, 1),
            indent: 0,
            endIndent: 0,
          ),
          const ListTile(
            leading: Icon(
              Icons.refresh,
              color: Colors.grey,
              size: 28,
            ),
            title: Text('Restablecer datos',
                style: TextStyle(color: Colors.grey, fontSize: 15)),
          ),
          const Divider(
            height: 0,
            thickness: 1,
            color: Color.fromRGBO(192, 192, 192, 1),
            indent: 0,
            endIndent: 0,
          ),
          const SizedBox(
            height: 5,
          ),
          const Divider(
            height: 0,
            thickness: 1,
            color: Color.fromRGBO(192, 192, 192, 1),
            indent: 0,
            endIndent: 0,
          ),
          GestureDetector(
            onTap: _handleTap,
            child: ValueListenableBuilder<bool>(
              valueListenable: _clicked,
              builder: (context, clicked, child) {
                return Container(
                  color: clicked
                      ? const Color.fromRGBO(54, 140, 114, 1)
                      : Colors.transparent,
                  child: ListTile(
                    leading: Icon(
                      Icons.logout,
                      color: clicked ? Colors.white : Colors.grey,
                      size: 28,
                    ),
                    title: Text(
                      'Cerrar Sesión',
                      style: TextStyle(
                        color: clicked ? Colors.white : Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const Divider(
            height: 0,
            thickness: 1,
            color: Color.fromRGBO(192, 192, 192, 1),
            indent: 0,
            endIndent: 0,
          ),
          const SizedBox(
            height: 50,
          ),
          RichText(
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
                      color: Color.fromRGBO(54, 140, 114, 4), fontSize: 48),
                ),
                TextSpan(
                  text: '-FOOD',
                  style: TextStyle(
                      color: Color.fromRGBO(167, 233, 209, 1), fontSize: 40),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(54, 140, 114, 1),
        ),
        child: BottomNavigationBar(
          elevation: 0,
          backgroundColor: const Color.fromRGBO(54, 140, 114, 1),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          currentIndex: 2,
          onTap: (index) {
            if (index == 0) {
        
            }
            if (index == 1) {
                    router.pushNamed("/fridge");
            }
          },
          items: const [
          
            BottomNavigationBarItem(
              icon: Icon(Icons.list, size: 40),
              label: "",
            ),
              BottomNavigationBarItem(
              icon: Icon(Icons.kitchen, size: 40),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, size: 40),
              label: "",
            ),
          ],
        ),
      ),
    );
  }
}
