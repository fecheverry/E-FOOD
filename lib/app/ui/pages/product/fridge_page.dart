import 'package:e_food/app/domain/repositories/authentication_repository.dart';
import 'package:e_food/app/ui/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/ui.dart';

class FridgePage extends StatelessWidget {
  const FridgePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Row(
            children: [
              const SizedBox(
                width: 38,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: SizedBox(
                    height: 35,
                    child: TextField(
                      enabled: false,
                      decoration: InputDecoration(
                        hintText: "Ejemplo de texto decorado",
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 16.0),
                        border: InputBorder.none,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(5),
                          child: SizedBox(
                            width: 0,
                            height: 0,
                            child: Image.asset(
                              'assets/icono_filtros.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        // Centro el texto
                        hintTextDirection: TextDirection.ltr,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () async {

             
                },
                child: SizedBox(
                  width: 46,
                  height: 46,
                  child: Image.asset(
                    'assets/icono_lupa.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 30,
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: GridView.count(
                crossAxisCount: 3,
                children: List.generate(
                  16,
                  (index) => GestureDetector(
                    onTap: () {
                      router.pushNamed("/detailproduct",
                          backGestureEnabled: true);
                    },
                    child: Card(
                      margin: const EdgeInsets.all(5.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        side: const BorderSide(
                          color: Color.fromARGB(255, 187, 181, 181),
                          width: 2.0,
                        ),
                      ),
                      child: SizedBox(
                        height: 80,
                        width: 80,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 10,
                                  width: 10,
                                  child: CircularProgressIndicator(
                                    color: Colors.grey,
                                    value: 0.7,
                                    strokeWidth: 2,
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Caduca en ${index + 1} días",
                                  style: const TextStyle(
                                    fontSize: 11,
                                    color: Color.fromARGB(255, 187, 181, 181),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 8.0),
                            SizedBox(
                              width: 60,
                              height: 60,
                              child: Image.asset(
                                'assets/lacteos_negro.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            const Text(
                              "Mantequilla",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color.fromARGB(255, 196, 191, 191)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Stack(
        children: [
          Positioned(
            bottom: 0,
            right: 0,
            child: FloatingActionButton(
              key: const Key("add_button"),
              heroTag: "btn2",
              onPressed: () {
                router.pushNamed("/addproduct", backGestureEnabled: true);
              },
              backgroundColor: const Color.fromARGB(255, 82, 212, 87),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                  Icons.add), // Establece la forma del botón como cuadrado
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
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
          currentIndex: 0,
          onTap: (index) {
            if (index == 2) {
              router.pushNamed("/profile");
            }
            if (index == 1) {}
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.kitchen, size: 40),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list, size: 40),
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
