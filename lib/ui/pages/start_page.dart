import 'package:e_food/ui/pages/login_page.dart';
import 'package:e_food/ui/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '!VAMOS A COMENZAR!',
              style: TextStyle(
                fontSize: 32,
                color: Color.fromARGB(255, 127, 199, 129),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 48),
            Image.asset(
              'assets/1.png', // Reemplazar por la ruta de la imagen
              height: 300,
              width: 300,
            ),
            const SizedBox(height: 48),
            ElevatedButton(
              onPressed: () {
              Get.to(() => const RegisterPage());
              },
              style: ElevatedButton.styleFrom(
                
                backgroundColor: const Color.fromARGB(255, 127, 199, 129),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                minimumSize: const Size(300, 48),
              ),
              child: const Text(
                'REGISTRARSE',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Get.to(() => const LoginPage());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 127, 199, 129),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                minimumSize: const Size(300, 48),
              ),
              child: const Text(
                'INICIAR SESIÓN',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
