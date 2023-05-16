import 'package:e_food/app/data/models/list.dart';
import 'package:e_food/app/domain/services/list_service.dart';
import 'package:e_food/app/ui/pages/mylist/mi_lista.dart';
import 'package:e_food/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListDetailScreen extends StatefulWidget {
  const ListDetailScreen({Key? key}) : super(key: key);

  @override
  State<ListDetailScreen> createState() => _ListDetailScreenState();
}

class _ListDetailScreenState extends State<ListDetailScreen> {
  List<Product> inventory = [];
  String dropdownValue = '';

  bool isSelectingProductFromInventory = true;

  @override
  void initState() {
    super.initState();
    final listService = Provider.of<ListService>(context, listen: false);

    inventory = listService.inventory;
    dropdownValue = inventory[0].name;
  }

  @override
  Widget build(BuildContext context) {
    final listService = Provider.of<ListService>(context);

    final currentFolder = listService.currentFolder!;

    final productNameController = TextEditingController();
    final productQuantityController = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MyListView(),
              ),
            );
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color.fromRGBO(54, 140, 114, 1),
          ),
        ),
        elevation: 0,
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      currentFolder.name,
                      style: const TextStyle(
                        color: Color.fromRGBO(54, 140, 114, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        // TODO: Share this list to Firebase
                        const nuevoProducto = {
  nombreProducto: 'Nombre del producto',
  cantidad: 10
};

agregarProducto(nuevoProducto);

                        listService.changeFolderPrivacy(
                          !currentFolder.isPublic,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(
                          54,
                          140,
                          114,
                          1,
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        currentFolder.isPublic ? 'Hacer privado' : 'Compartir',
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Prductos',
                    ),
                    Text(
                      'Cantidad',
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ...List.generate(
                  currentFolder.tasks.length,
                  (index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SingleTask(
                          task: currentFolder.tasks[index],
                        ),
                        Text(
                          currentFolder.tasks[index].value.toString(),
                        )
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        key: const Key("add_button"),
        heroTag: "btn2",
        onPressed: () {
          // TODO: Create new task
          // Obtener referencia a la colección
const db = firebase.firestore();
const misListas = db.collection('mis listas');

function agregarProducto(nuevoProducto) {  
  // Agregar producto a la colección
  misListas.add(nuevoProducto)
    .then(function(docRef) {
      // Producto agregado exitosamente
    })
    .catch(function(error) {
      console.error('Error al agregar producto: ', error);
    });
}
          showModalBottomSheet<void>(
            context: context,
            isScrollControlled: true,
            builder: (BuildContext context) {
              return StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
                  return Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                    child: Container(
                      height: 300,
                      color: Colors.white,
                      padding: const EdgeInsets.all(20),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            isSelectingProductFromInventory
                                ? DropdownButton<String>(
                                    value: dropdownValue,
                                    elevation: 0,
                                    style: const TextStyle(
                                        color: Color.fromRGBO(54, 140, 114, 1)),
                                    underline: Container(
                                      height: 2,
                                      color:
                                          const Color.fromRGBO(54, 140, 114, 1),
                                    ),
                                    onChanged: (String? value) {
                                      setState(() {
                                        dropdownValue = value!;
                                      });
                                    },
                                    items:
                                        inventory.map<DropdownMenuItem<String>>(
                                      (value) {
                                        return DropdownMenuItem<String>(
                                          value: value.name,
                                          child: Text(value.name),
                                        );
                                      },
                                    ).toList(),
                                    isExpanded: true,
                                  )
                                : TextFormField(
                                    controller: productNameController,
                                    decoration: const InputDecoration(
                                      hintText: 'Nombre del producto',
                                    ),
                                  ),
                            ElevatedButton(
                              onPressed: () {
                                isSelectingProductFromInventory =
                                    !isSelectingProductFromInventory;
                                setState(() {});
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromRGBO(54, 140, 114, 1),
                              ),
                              child: Text(
                                isSelectingProductFromInventory
                                    ? 'Agregar nuevo producto'
                                    : 'Seleccionar de inventario',
                              ),
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              controller: productQuantityController,
                              decoration: const InputDecoration(
                                hintText: 'Cantidad',
                              ),
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () {
                                final newTask = Task(
                                  id: '123123123',
                                  name: isSelectingProductFromInventory
                                      ? dropdownValue
                                      : productNameController.text,
                                  isCompleted: isSelectingProductFromInventory,
                                  value: productQuantityController.text,
                                );

                                listService.addTask(newTask);

                                Navigator.pop(context);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromRGBO(
                                  54,
                                  140,
                                  114,
                                  1,
                                ),
                                minimumSize: const Size(double.infinity, 50),
                              ),
                              child: const Text('Agregar producto'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
        backgroundColor: const Color.fromRGBO(54, 140, 114, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Icon(
          Icons.add,
        ), // Establece la forma del botón como cuadrado
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
