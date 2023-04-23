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
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_rounded,
              color: Color.fromARGB(255, 212, 209, 209),
              size: 40,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
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
                        children: const [
                          Icon(
                            Icons.fastfood,
                            color: Color.fromARGB(255, 82, 212, 87),
                            size: 38,
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                      const SizedBox(width: 10),
                      Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color.fromARGB(255, 216, 205, 205),
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
                    children: const [
                      Icon(
                        Icons.calendar_month,
                        color: Color.fromARGB(255, 82, 212, 87),
                        size: 30,
                      ),
                      Text(
                        "Fecha aprox. de caducidad",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Color.fromARGB(255, 172, 169, 169),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
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
                  const SizedBox(height: 30),
                  Container(
                    height: 1.3,
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    color: const Color.fromARGB(255, 216, 205, 205),
                  ),
                  const SizedBox(height: 17),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.food_bank,
                        color: Color.fromARGB(255, 82, 212, 87),
                        size: 60,
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
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    color: const Color.fromARGB(255, 216, 205, 205),
                  ),
                  const SizedBox(height: 17),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.category_outlined,
                        color: Color.fromARGB(255, 82, 212, 87),
                        size: 60,
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
                  const SizedBox(height: 19),
                  Container(
                    height: 1.3,
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    color: const Color.fromARGB(255, 216, 205, 205),
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
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _quantity--;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 82, 212, 87),
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(4),
                        ),
                        child: const Icon(Icons.remove),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        _quantity.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 22,
                          color: Color.fromARGB(255, 172, 169, 169),
                        ),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _quantity++;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 82, 212, 87),
                          shape: const CircleBorder(),
                          padding:
                              const EdgeInsets.all(4), // disminuye el padding
                        ),
                        child: const Icon(
                          Icons.add,
                          size: 24, // cambia el tamaño del icono
                        ),
                      )
                    ],
                  )
                ])));
  }
}
