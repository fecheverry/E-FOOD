import 'package:e_food/ui/pages/product_detail_page.dart';
import 'package:flutter/material.dart';

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
                  child: const SizedBox(
                    height: 35,
                    child: TextField(
                      enabled: false,
                      decoration: InputDecoration(
                        hintText: "Ejemplo de texto decorado",
                        contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                        border: InputBorder.none,
                        prefixIcon:
                            Icon(Icons.manage_search, color: Colors.black),
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
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black, width: 2),
                ),
                child: const CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.search, color: Colors.black, size: 30),
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
                      // Navegar a la pantalla de detalles del producto
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProductDetailPage()),
                      );
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
                            const Icon(
                              Icons.fastfood_outlined,
                              size: 48.0,
                              color: Colors.black87,
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
              onPressed: () {},
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
        margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.black),
          ),
        ),
        child: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Colors.white,
          selectedItemColor: const Color.fromARGB(255, 82, 212, 87),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.kitchen,
                size: 40,
                color: Color.fromARGB(255, 82, 212, 87),
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.list,
                size: 40,
                color: Color.fromARGB(255, 82, 212, 87),
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 40,
                color: Color.fromARGB(255, 82, 212, 87),
              ),
              label: "",
            ),
          ],
        ),
      ),
    );
  }
}
