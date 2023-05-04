import 'package:e_food/app/ui/pages/fridge_page.dart';
import 'package:e_food/app/ui/pages/notifications_page.dart';
import 'package:e_food/app/ui/widgets/modal_bottom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  int _quantity = 1;
  String? _selectedOptionStorage;
  String? _selectedOptionCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: Container(
            margin: const EdgeInsets.only(left: 16),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_rounded,
                color: Color.fromARGB(255, 196, 193, 193),
                size: 40,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 30, top: 10),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NotificationsPage()),
                  );
                },
                child: Image.asset(
                  "assets/campana.png",
                  width: 40,
                  height: 40,
                ),
              ),
            ),
          ],
          toolbarHeight: 44,
        ),
        body: Padding(
            padding: const EdgeInsets.all(0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "AGREGAR PRODUCTO",
                    style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 82, 212, 87)),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    "Nombre del Producto",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 23,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 1.3,
                    margin: const EdgeInsets.symmetric(horizontal: 70),
                    color: const Color.fromARGB(255, 241, 239, 239),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 30,
                        height: 30,
                        child: Image.asset(
                          'assets/calendario.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      const Text(
                        "Fecha aprox. de caducidad",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Color.fromARGB(255, 172, 169, 169),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 7),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        height: 26,
                        width: 170,
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(0),
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 187, 185, 185),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(0),
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 187, 185, 185),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(0),
                              borderSide: BorderSide(
                                color: Colors.grey[400]!,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 1.3,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    color: const Color.fromARGB(255, 182, 176, 176),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.symmetric(
                        horizontal:
                            30), // aquí se establece la alineación a la izquierda
                    child: const Text(
                      "Detalles",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 82, 212, 87),
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 49,
                        height: 49,
                        child: Image.asset(
                          'assets/almacenamiento.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                "Almacenamiento",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 172, 169, 169),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 25,
                              width: 200,
                              child: TextField(
                                decoration: InputDecoration(
                                  suffixIcon: const Icon(
                                    Icons.keyboard_arrow_down_sharp,
                                    color: Color.fromARGB(255, 187, 185, 185),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 10),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(0),
                                    borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 187, 185, 185),
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(0),
                                    borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 187, 185, 185),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(0),
                                    borderSide: BorderSide(
                                      color: Colors.grey[400]!,
                                    ),
                                  ),
                                ),
                                readOnly: true,
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title:
                                            const Text('Selecciona una opción'),
                                        content: DropdownButton<String>(
                                          value: _selectedOptionStorage,
                                          items: <String>[
                                            'Opción 1',
                                            'Opción 2',
                                            'Opción 3'
                                          ].map<DropdownMenuItem<String>>(
                                              (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              _selectedOptionStorage = newValue;
                                            });
                                            Navigator.pop(
                                                context); // Cierra el AlertDialog
                                          },
                                        ),
                                      );
                                    },
                                  );
                                },
                                controller: TextEditingController(
                                    text: _selectedOptionStorage),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 40,
                        height: 40,
                        child: Image.asset(
                          'assets/categorias.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        width: 9,
                      ),
                      SizedBox(
                        width: 200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                "Categoria",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 172, 169, 169),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 25,
                              width: 200,
                              child: TextField(
                                decoration: InputDecoration(
                                  suffixIcon: const Icon(
                                    Icons.keyboard_arrow_down_sharp,
                                    color: Color.fromARGB(255, 187, 185, 185),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 10),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(0),
                                    borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 187, 185, 185),
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(0),
                                    borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 187, 185, 185),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(0),
                                    borderSide: BorderSide(
                                      color: Colors.grey[400]!,
                                    ),
                                  ),
                                ),
                                readOnly: true,
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title:
                                            const Text('Selecciona una opción'),
                                        content: DropdownButton<String>(
                                          value: _selectedOptionCategory,
                                          items: <String>[
                                            'Opción 1',
                                            'Opción 2',
                                            'Opción 3'
                                          ].map<DropdownMenuItem<String>>(
                                              (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              _selectedOptionCategory =
                                                  newValue;
                                            });
                                            Navigator.pop(
                                                context); // Cierra el AlertDialog
                                          },
                                        ),
                                      );
                                    },
                                  );
                                },
                                controller: TextEditingController(
                                    text: _selectedOptionCategory),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Cantidad",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 22,
                          color: Color.fromARGB(255, 172, 169, 169),
                        ),
                      ),
                      const SizedBox(width: 25),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _quantity--;
                          });
                        },
                        child: Image.asset(
                          "assets/menos.png",
                          width: 30,
                          height: 30,
                        ),
                      ),
                      const SizedBox(width: 22),
                      Text(
                        _quantity.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 22,
                          color: Color.fromARGB(255, 172, 169, 169),
                        ),
                      ),
                      const SizedBox(width: 22),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _quantity++;
                          });
                        },
                        child: Image.asset(
                          "assets/mas.png",
                          width: 30,
                          height: 31,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 215,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(() => const FridgePage());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 82, 212,
                            87), // aquí se establece el color de fondo del botón
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              15), // aquí se establece el radio de los bordes circulares
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.add,
                              size: 13,
                              color: Colors
                                  .white), // aquí se agrega el icono "+" en blanco
                          SizedBox(width: 5),
                          Text(
                            "AGREGAR PRODUCTO",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                            ),
                          ), // aquí se agrega el texto en blanco
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 1.3,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    color: const Color.fromARGB(255, 182, 176, 176),
                  ),
                  GestureDetector(
                    onTap: () {
                      showBottomSheetList(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        SizedBox(
                          width: 40,
                        ),
                        Icon(
                          Icons.keyboard_arrow_up_outlined,
                          color: Color.fromARGB(255, 182, 176, 176),
                          size: 40,
                        ),
                        Text(
                          "Mostrar sugerencias",
                          style: TextStyle(
                              color: Color.fromARGB(255, 182, 176, 176),
                              fontSize: 15,
                              fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                  ),
                ])));
  }
}
