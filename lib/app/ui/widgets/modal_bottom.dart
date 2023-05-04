import 'package:flutter/material.dart';

final List<Alimento> alimentos = [
  Alimento(
    asset: "assets/lacteos.png",
    nombre: 'Lechuga',
    diasCaducidad: 5,
  ),
  Alimento(
    asset: "assets/lacteos.png",
    nombre: 'Lechuga',
    diasCaducidad: 5,
  ),
  Alimento(
    asset: "assets/lacteos.png",
    nombre: 'Lechuga',
    diasCaducidad: 5,
  ),
  Alimento(
    asset: "assets/lacteos.png",
    nombre: 'Lechuga',
    diasCaducidad: 5,
  ),
  Alimento(
    asset: "assets/lacteos.png",
    nombre: 'Lechuga',
    diasCaducidad: 5,
  ),
  Alimento(
    asset: "assets/lacteos.png",
    nombre: 'Lechuga',
    diasCaducidad: 5,
  ),
  Alimento(
    asset: "assets/lacteos.png",
    nombre: 'Lechuga',
    diasCaducidad: 5,
  ),
  Alimento(
    asset: "assets/lacteos.png",
    nombre: 'Lechuga',
    diasCaducidad: 5,
  ),
  Alimento(
    asset: "assets/lacteos.png",
    nombre: 'Lechuga',
    diasCaducidad: 5,
  ),
  Alimento(
    asset: "assets/lacteos.png",
    nombre: 'Lechuga',
    diasCaducidad: 5,
  ),
];

class Alimento {
  String asset;
  String nombre;
  int diasCaducidad;
  Alimento({
    required this.asset,
    required this.nombre,
    required this.diasCaducidad,
  });
}

Future<dynamic> showBottomSheetList(BuildContext context) {
  return showModalBottomSheet(
    backgroundColor: Colors.transparent,
    elevation: 0,
    isScrollControlled: true,
    context: context,
    shape: const ContinuousRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Material(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          clipBehavior: Clip.antiAlias,
          child: Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height * 0.9,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
                  child: Row(
                    children: [
                      const Text(
                        'INICIO RAPIDO',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        height: 25,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor:
                                const Color.fromARGB(255, 82, 212, 87),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Text(
                            'FINALIZAR',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 7),
                Text(
                  'Selecciona tus alimentos principales y agregalos con un solo toque',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 18),
                Container(
                  height: 1,
                  color: Colors.grey[300],
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: ListView.builder(
                    itemCount: alimentos.length,
                    itemBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: 70,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: const BorderSide(
                              color: Color.fromARGB(255, 207, 206, 206),
                              width: 1.4,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 40,
                                  height: 40,
                                  child: Image.asset(
                                    alimentos[index].asset,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        alimentos[index].nombre,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        'Fecha de caducidad sugerida - ${alimentos[index].diasCaducidad} días',
                                        style: TextStyle(
                                          color: Colors.grey[700],
                                          fontSize: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Center(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // Acción al presionar el botón de agregar
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromARGB(
                                          255, 82, 212, 87),
                                      shape: const CircleBorder(),
                                      minimumSize: const Size(35,
                                          35), // Ajustar el tamaño del botón
                                    ),
                                    child: Ink(
                                      decoration: const ShapeDecoration(
                                        color: Color.fromARGB(255, 82, 212, 87),
                                        shape: CircleBorder(),
                                      ),
                                      child: const Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size:
                                            30, // Ajustar el tamaño deseado del icono
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
