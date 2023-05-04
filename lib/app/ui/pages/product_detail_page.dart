import 'package:flutter/material.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
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
          toolbarHeight: 44,
        ),
        body: Padding(
            padding: const EdgeInsets.all(0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "DETALLES DEL PRODUCTO",
                    style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 82, 212, 87)),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            width: 40,
                            height: 40,
                            child: Image.asset(
                              'assets/cubiertos.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                      const SizedBox(width: 10),
                      Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color.fromARGB(255, 182, 176, 176),
                              width: 1.3,
                            ),
                          ),
                        ),
                        width: 290,
                        child: const Padding(
                          padding: EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            "Nombre del Producto",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 23,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ],
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
                  const SizedBox(height: 17),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 55,
                        height: 55,
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
                  Container(
                    height: 1.3,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    color: const Color.fromARGB(255, 182, 176, 176),
                  ),
                  const SizedBox(height: 17),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 46,
                        height: 46,
                        child: Image.asset(
                          'assets/categorias.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        width: 7,
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
                  const SizedBox(height: 19),
                  Container(
                    height: 1.3,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    color: const Color.fromARGB(255, 182, 176, 176),
                  ),
                  const SizedBox(height: 19),
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
                          height: 30,
                        ),
                      ),
                    ],
                  )
                ])));
  }
}
