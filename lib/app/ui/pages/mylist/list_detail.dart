import 'package:e_food/app/data/models/list.dart';
import 'package:e_food/app/domain/services/list_service.dart';
import 'package:e_food/app/ui/pages/mylist/mi_lista.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListDetailScreen extends StatelessWidget {
  const ListDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listService = Provider.of<ListService>(context);

    final currentFolder = listService.currentFolder!;

    final productNameController = TextEditingController();
    final productQuantityController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(54, 140, 114, 1),
        title: Text(currentFolder.name),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
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
          showModalBottomSheet<void>(
            context: context,
            isScrollControlled: true,
            builder: (BuildContext context) {
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
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        TextFormField(
                          controller: productNameController,
                          decoration: const InputDecoration(
                            hintText: 'Nombre del producto',
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
                              name: productNameController.text,
                              isCompleted: false,
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
