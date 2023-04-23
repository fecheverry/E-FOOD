import 'package:e_food/ui/pages/fridge_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            const Text(
              'POR FAVOR LLENA TUS DATOS',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 82, 212, 87),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 380,
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
                        decoration: InputDecoration(
                          labelText: 'Tu nombre',
                          prefixIcon: const Icon(Icons.person,
                              color: Color.fromARGB(255, 82, 212, 87),
                              size: 25),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.green,
                              width: 2.0,
                            ),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey.shade300,
                            ),
                          ),
                        ),
                        cursorColor: Colors.green,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Correo electrónico',
                          prefixIcon: const Icon(Icons.email,
                              color: Color.fromARGB(255, 82, 212, 87),
                              size: 25),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Contraseña',
                          prefixIcon: const Icon(Icons.lock,
                              color: Color.fromARGB(255, 82, 212, 87),
                              size: 25),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Repita la contraseña',
                          prefixIcon: const Icon(Icons.lock,
                              color: Color.fromARGB(255, 82, 212, 87),
                              size: 25),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                        ),
                      ),
                      const SizedBox(height: 35.0),
                      const Text(
                        'Leer términos y condiciones',
                        style: TextStyle(
                          color: Color.fromARGB(255, 82, 212, 87),
                          fontSize: 12.0,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
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
                              'Acepto los términos y condiciones',
                              style: TextStyle(
                                color: Color.fromARGB(255, 82, 212, 87),
                                fontSize: 12.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              width: 250,
              height: 50.0,
              child: ElevatedButton(
                onPressed: () {   Get.to(() =>  const FridgePage());},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 82, 212, 87),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                child: const Text(
                  'REGISTRARSE',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
