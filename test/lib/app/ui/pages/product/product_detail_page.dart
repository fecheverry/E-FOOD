// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:intl/intl.dart';
import '../../../data/data_source/local/product_provider.dart';

class ProductDetailPage extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final product;
  final productToUpdate;
  final int indexProduct;
  const ProductDetailPage(
      {super.key,
      required this.product,
      required this.indexProduct,
      required this.productToUpdate});

  @override
  // ignore: library_private_types_in_public_api
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  final productProvider = ProductProvider();

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
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
                router.pop(context);
              },
            ),
          ),
          toolbarHeight: 44,
        ),
        body: Form(
          key: formKey,
          child: Padding(
              padding: const EdgeInsets.all(0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "DETALLES DEL PRODUCTO",
                      style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(54, 140, 114, 1)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 1.3,
                      color: const Color.fromRGBO(192, 192, 192, 1),
                    ),
                    const Spacer(),
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
                          decoration: const BoxDecoration(),
                          width: 290,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: "Nombre del Producto",
                                labelStyle: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Color.fromRGBO(95, 95, 95, 1),
                                ),
                              ),
                              initialValue: widget.product.name,
                              onChanged: (newName) =>
                                  widget.product.name = newName,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
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
                            fontSize: 16,
                            color: Color.fromRGBO(95, 95, 95, 1),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          height: 26,
                          width: 170,
                          child: TextFormField(
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 10),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: const BorderSide(
                                  color: Color.fromRGBO(95, 95, 95, 1),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: const BorderSide(
                                  color: Color.fromRGBO(95, 95, 95, 1),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide(
                                  color: Colors.grey[400]!,
                                ),
                              ),
                            ),
                            initialValue: widget.product.expiration,
                            onSaved: (newExpiration) =>
                                widget.product.expiration = newExpiration,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      height: 1.3,
                      color: const Color.fromRGBO(192, 192, 192, 1),
                    ),
                    const Spacer(),
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
                                      fontSize: 16,
                                      color: Color.fromRGBO(95, 95, 95, 1)),
                                ),
                              ),
                              SizedBox(
                                height: 25,
                                width: 200,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    suffixIcon: const Icon(
                                      Icons.keyboard_arrow_down_sharp,
                                      color: Color.fromRGBO(95, 95, 95, 1),
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 10),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50),
                                      borderSide: const BorderSide(
                                        color: Color.fromRGBO(95, 95, 95, 1),
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50),
                                      borderSide: const BorderSide(
                                        color: Color.fromRGBO(95, 95, 95, 1),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50),
                                      borderSide: const BorderSide(
                                        color: Color.fromRGBO(95, 95, 95, 1),
                                      ),
                                    ),
                                  ),
                                  initialValue: widget.product.storage,
                                  onSaved: (newStorage) =>
                                      widget.product.storage = newStorage,
                                  readOnly: true,
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text(
                                              'Selecciona una opción'),
                                          content: DropdownButton<String>(
                                            value: widget.product.storage,
                                            items: <String>[
                                              'Congelador',
                                              'Despensa',
                                              'Armario',
                                              'Refrigerador',
                                              "Botiquin",
                                            ].map<DropdownMenuItem<String>>(
                                                (String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                            onChanged: (String? newValue) {
                                              setState(() {
                                                widget.product.storage =
                                                    newValue;
                                              });
                                              Navigator.pop(context);
                                            },
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      height: 1.3,
                      color: const Color.fromRGBO(192, 192, 192, 1),
                    ),
                    const Spacer(),
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
                                    fontSize: 16,
                                    color: Color.fromRGBO(95, 95, 95, 1),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 25,
                                width: 200,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    suffixIcon: const Icon(
                                      Icons.keyboard_arrow_down_sharp,
                                      color: Color.fromRGBO(95, 95, 95, 1),
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 10),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50),
                                      borderSide: const BorderSide(
                                        color: Color.fromRGBO(95, 95, 95, 1),
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50),
                                      borderSide: const BorderSide(
                                        color: Color.fromRGBO(95, 95, 95, 1),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50),
                                      borderSide: const BorderSide(
                                        color: Color.fromRGBO(95, 95, 95, 1),
                                      ),
                                    ),
                                  ),
                                  initialValue: widget.product.category,
                                  onSaved: (newCategory) =>
                                      widget.product.category = newCategory,
                                  readOnly: true,
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text(
                                              'Selecciona una opción'),
                                          content: DropdownButton<String>(
                                            value: widget.product.category,
                                            items: <String>[
                                              'Lácteos',
                                              'Carnes',
                                              'Congelados',
                                              "Panadería",
                                              "Cereales",
                                              "Granos",
                                              "Bebidas",
                                              "Limpieza"
                                            ].map<DropdownMenuItem<String>>(
                                                (String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                            onChanged: (String? newValue) {
                                              setState(() {
                                                widget.product.category =
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
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                        height: 1.3,
                        color: const Color.fromRGBO(192, 192, 192, 1)),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Cantidad",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: Color.fromRGBO(95, 95, 95, 1),
                          ),
                        ),
                        const SizedBox(width: 50),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              widget.product.quantity--;
                            });
                          },
                          child: Image.asset(
                            "assets/menos.png",
                            width: 36,
                            height: 36,
                          ),
                        ),
                        const SizedBox(width: 22),
                        Text(
                          widget.product.quantity.toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 22,
                            color: Color.fromRGBO(95, 95, 95, 1),
                          ),
                        ),
                        const SizedBox(width: 22),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              widget.product.quantity++;
                            });
                          },
                          child: Image.asset(
                            "assets/mas.png",
                            width: 36,
                            height: 36,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          formKey.currentState!.save();
                          if (isValidDate(widget.product.expiration)) {
                            formKey.currentState!.save();
                            productProvider.updateProduct(
                                widget.productToUpdate, widget.product);
                            router.pushNamedAndRemoveUntil("/fridge");
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    'Por favor corrija los errores antes de continuar'),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromRGBO(54, 140, 114, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          minimumSize: const Size(250, 40),
                        ),
                        child: const Text(
                          'Guardar',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ])),
        ));
  }
}

bool isValidDate(String dateStr) {
  print(dateStr);
  try {
    // Intentar analizar la cadena de fecha en formato 'yyyy-MM-dd'
    final dateFormat = DateFormat('yyyy-MM-dd');
    final date = dateFormat.parse(dateStr);
    print("HOLAAAA");
    print(dateFormat.format(date) == dateStr);
    // Verificar que la fecha analizada es igual a la fecha de entrada original
    return dateFormat.format(date) == dateStr;
  } catch (e) {
    // Si se produce un error al analizar la cadena de fecha, no es válida
    return false;
  }
}
