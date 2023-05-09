import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';


class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '¡VAMOS A COMENZAR!',
              style: TextStyle(
                fontSize: 32,
                color: Color.fromARGB(255, 82, 212, 87),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 48),
            Image.asset(
              "assets/fresa.png", // Reemplazar por la ruta de la imagen
              height: 320,
              width: 320,
            ),
            const SizedBox(height: 35),
            ElevatedButton(
              onPressed: () {
                 router.pushNamed("/register",backGestureEnabled: true);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 82, 212, 87),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                minimumSize: const Size(250, 40),
              ),
              child: const Text(
                'REGISTRARSE',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                router.pushNamed("/login",backGestureEnabled: true);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 82, 212, 87),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                minimumSize: const Size(250, 40),
              ),
              child: const Text(
                'INICIAR SESIÓN',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
