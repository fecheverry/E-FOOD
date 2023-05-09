import 'package:e_food/app/data/data_source/local/product_provider.dart';
import 'package:e_food/app/ui/global_controllers/session_controller.dart';
import 'package:e_food/app/ui/pages/product/add_product_page.dart';
import 'package:e_food/app/ui/pages/product/product_detail_page.dart';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';

import 'package:flutter_meedu/ui.dart';

import '../../../../main.dart';

// ignore: prefer_typing_uninitialized_variables
var productos;

class FridgePage extends StatefulWidget {
  const FridgePage({super.key});

  @override
  State<FridgePage> createState() => _FridgePageState();
}

class _FridgePageState extends State<FridgePage> {
  final productProvider = ProductProvider();
  final sessionController = SessionController();
  @override
  void initState() {
    super.initState();
    productos = productProvider.getProducts(sessionProvider.read.user!.uid);
  }

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
                      color: const Color.fromRGBO(54, 140, 114, 1),
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
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () async {},
                child: SizedBox(
                  width: 46,
                  height: 46,
                  child: Image.asset(
                    'assets/icono_lupa.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 30),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: GridView.count(
                crossAxisCount: 3,
                childAspectRatio: 0.8,
                children: List.generate(
                  productos.length,
                  (index) => GestureDetector(
                    onTap: () {
                      var productToUpdate = productos[index];
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProductDetailPage(
                                  productToUpdate: productToUpdate,
                                  indexProduct: index,
                                  product: productos[index],
                                )),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(0),
                      child: Card(
                        margin: const EdgeInsets.all(5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                          side: const BorderSide(
                            color: Color.fromRGBO(167, 233, 209, 1),
                            width: 2.0,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 18,
                                  width: 18,
                                  child: CircularProgressIndicator(
                                    color:
                                        const Color.fromRGBO(54, 140, 114, 1),
                                    value: calculateProgress(
                                        productos[index].expiration),
                                    strokeWidth: 3,
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Column(
                                  children: [
                                    const Text(
                                      "Caduca en",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Color.fromRGBO(95, 95, 95, 1),
                                      ),
                                    ),
                                    Text(
                                      "${calculateDaysLeft(productos[index].expiration)} días",
                                      style: const TextStyle(
                                        fontSize: 15,
                                        color: Color.fromRGBO(95, 95, 95, 1),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 3),
                            SizedBox(
                              width: 70,
                              height: 70,
                              child: Image.asset(
                                getIcon(productos[index].category),
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(height: 3),
                            Text(
                              productos[index].name,
                              style: const TextStyle(
                                  fontSize: 14,
                                  color: Color.fromRGBO(169, 169, 169, 1)),
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
                var newProduct = Product(
                    category: '',
                    expiration: '',
                    name: '',
                    quantity: 0,
                    storage: '',
                    user: sessionProvider.read.user!.uid);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AddProductPage(
                            product: newProduct,
                          )),
                );
              },
              backgroundColor: const Color.fromRGBO(54, 140, 114, 1),
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
            if (index == 0) {
              router.pushNamed("/fridge");
            }
            if (index == 1) {
              router.pushNamed("/list");
            }
            if (index == 2) {
              router.pushNamed("/profile");
            }
<<<<<<< Updated upstream
            if (index == 0) {}
=======
>>>>>>> Stashed changes
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

int calculateDaysLeft(String dateStr) {
  final dateFormat = DateFormat('yyyy-MM-dd');
  final date = dateFormat.parse(dateStr);
  final now = DateTime.now();
  final difference = date.difference(DateTime(now.year, now.month, now.day));
  return difference.inDays;
}

double calculateProgress(String dateStr) {
  final daysLeft = calculateDaysLeft(dateStr);

  if (daysLeft < 36) {
    return 1;
  }

  if (daysLeft > 37 && daysLeft < 73) {
    return 0.9;
  }
  if (daysLeft > 74 && daysLeft < 109) {
    return 0.8;
  }
  if (daysLeft > 110 && daysLeft < 145) {
    return 0.7;
  }
  if (daysLeft > 146 && daysLeft < 181) {
    return 0.6;
  }
  if (daysLeft > 182 && daysLeft < 217) {
    return 0.5;
  }
  if (daysLeft > 218 && daysLeft < 253) {
    return 0.4;
  }
  if (daysLeft > 254 && daysLeft < 289) {
    return 0.3;
  }
  if (daysLeft > 290 && daysLeft < 325) {
    return 0.2;
  }
  if (daysLeft > 326) {
    return 0.1;
  }
  return 1;
}

String getIcon(String category) {
  switch (category) {
    case "Embutidos":
      return 'assets/salchicha.png';
    case "Granos":
      return 'assets/circulitos.png';
    case "Cereales":
      return 'assets/circulitos.png';
    case "Postres":
      return 'assets/dona_negra.png';
    case "Condimentos":
      return 'assets/bolsa_de_mata.png';
    case "Frutas":
      return 'assets/frutas_negro.png';
    case "Verduras":
      return 'assets/canasta_frutas.png';
    case "Pescados":
      return 'assets/pescado.png';
    case "Mariscos":
      return 'assets/pescado.png';
    case "Salsas":
      return 'assets/botellas.png';
    case "Panes":
      return 'assets/pan_negro.png';
    case "Enlatados":
      return 'assets/lata.png';
    case "Lácteos":
      return 'assets/lacteos_negro.png';
    default:
      return 'assets/lacteos_negro.png';
  }
}
