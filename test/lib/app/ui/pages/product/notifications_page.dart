import 'package:e_food/app/ui/pages/widgets/hour_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  String? _selectedOptionTime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 16),
              child: IconButton(
                icon: const Icon(
                  Icons.close, // aquí se establece el icono de X
                  color: Color.fromARGB(255, 196, 193, 193),
                  size: 40,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
          toolbarHeight: 44,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20, bottom: 10),
              child: Text(
                "RECORDATORIOS",
                style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 82, 212, 87)),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "¿Con cuantos dias de anticipacion le gustaria recibir un recordatorio de  que sus articulos estan a punto de caducar?",
                style: TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(255, 27, 26, 26),
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            const SizedBox(
              height: 28,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 32,
                  height: 32,
                  child: Image.asset(
                    'assets/calendario.png',
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                SizedBox(
                  height: 21,
                  width: 180,
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
                            title: const Text('Selecciona una opción'),
                            content: DropdownButton<String>(
                              value: _selectedOptionTime,
                              items: <String>[
                                'Opción 1',
                                'Opción 2',
                                'Opción 3'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  _selectedOptionTime = newValue;
                                });
                                Navigator.pop(context); // Cierra el AlertDialog
                              },
                            ),
                          );
                        },
                      );
                    },
                    controller:
                        TextEditingController(text: _selectedOptionTime),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            const Center(
              child: Text(
                "(Escoja una opcion en el menu desplegable)",
                style: TextStyle(
                  color: Color.fromARGB(255, 189, 184, 184),
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(
              height: 28,
            ),
            Container(
              height: 1.3,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              color: const Color.fromARGB(255, 182, 176, 176),
            ),
            const SizedBox(
              height: 38,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "¿A que hora del dia le gustaria recibir la notificacion?",
                style: TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(255, 27, 26, 26),
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: TimePickerWidget(),
            ),
            const SizedBox(
              height: 10,
            ),
            const Center(
              child: SizedBox(
                width: 200,
                child: Text(
                  "(Desliza hacia arriba o hacia abajo para elegir una hora)",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromARGB(255, 189, 184, 184),
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 55,
            ),
            Center(
              child: SizedBox(
                width: 140,
                height: 38,
                child: ElevatedButton(
                  onPressed: () {
                    router.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 82, 212,
                        87), // aquí se establece el color de fondo del botón
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          20), // aquí se establece el radio de los bordes circulares
                    ),
                  ),

                  child: const Text(
                    "GUARDAR",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                    ),
                  ), // aquí se agrega el texto en blanco
                ),
              ),
            ),
          ],
        ));
  }
}
