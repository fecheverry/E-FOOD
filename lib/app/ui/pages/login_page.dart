import 'package:e_food/app/ui/pages/fridge_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(
              height: 55,
            ),
            Container(
              alignment: Alignment.center, // Establecer la alineación al centro
              child: const Text(
                'POR FAVOR LLENA TUS DATOS',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 82, 212, 87),
                ),
              ),
            ),
            const SizedBox(height: 70),
            SizedBox(
              height: 215,
              width: 290,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(
                    width: 3,
                    color: Colors.grey.shade300,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(13, 12, 13, 10),
                  child: Column(
                    children: [
                      TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          labelText: 'Correo electrónico',
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(10),
                            child: SizedBox(
                              width: 15,
                              height: 15,
                              child: Image.asset(
                                'assets/icono_perfil.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                        ),
                      ),
                      TextField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          labelText: 'Contraseña',
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(10),
                            child: SizedBox(
                              width: 15,
                              height: 15,
                              child: Image.asset(
                                'assets/icono_candado.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            height: 40,
                            width: 24.0,
                            child: Checkbox(
                              value: false,
                              onChanged: (value) {},
                            ),
                          ),
                          const SizedBox(width: 10.0),
                          const Text(
                            'Recordar cuenta',
                            style: TextStyle(
                              color: Color.fromARGB(255, 82, 212, 87),
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () {
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