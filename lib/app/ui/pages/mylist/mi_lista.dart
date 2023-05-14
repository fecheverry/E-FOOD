import 'package:e_food/app/data/models/list.dart';
import 'package:e_food/app/domain/services/list_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:provider/provider.dart';

class MyListView extends StatelessWidget {
  const MyListView({super.key});

  @override
  Widget build(BuildContext context) {
    final listService = Provider.of<ListService>(context);
    final folders = listService.folders;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Mis listas',
          style: TextStyle(
            color: Color.fromRGBO(54, 140, 114, 1),
          ),
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            folders.isEmpty
                ? const Center(
                    child: Text('Vale mia, no tienes ningún folder creado'),
                  )
                : Container(),
            Wrap(
              spacing: 8.0, // gap between adjacent chips
              runSpacing: 4.0,
              children: List.generate(
                folders.length,
                (index) => CustomUserFolder(
                  title: folders[index].name,
                  folder: folders[index],
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        key: const Key("add_button"),
        heroTag: "btn2",
        onPressed: () {
          listService.addFolder(
            Folder(
              id: '12345',
              name: 'Nueva lista',
              tasks: [],
              isPublic: false,
            ),
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
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: const Color.fromRGBO(54, 140, 114, 1),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        currentIndex: 2,
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
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.kitchen, size: 40),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list, size: 40),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 40),
            label: "",
          ),
        ],
      ),
    );
  }
}

class CustomUserFolder extends StatelessWidget {
  const CustomUserFolder({
    super.key,
    required this.title,
    required this.folder,
  });

  final String title;
  final Folder folder;

  @override
  Widget build(BuildContext context) {
    final listService = Provider.of<ListService>(context);
    return InkWell(
      onTap: () {
        listService.currentFolder = folder;
        router.pushNamed("/list_detail");
      },
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: const Color.fromRGBO(54, 140, 114, 1),
            width: 2,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            ...List.generate(
              folder.tasks.length >= 4 ? 4 : folder.tasks.length,
              (index) {
                return SingleTask(
                  task: folder.tasks[index],
                );
              },
            ),
            const SizedBox(height: 10),
            if (folder.tasks.length > 4)
              Row(
                children: [
                  const Spacer(),
                  Text(
                    '${folder.tasks.length - 4} más',
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            if (folder.tasks.isEmpty)
              Row(
                children: const [
                  Text(
                    'No hay ingredientes',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              )
          ],
        ),
      ),
    );
  }
}

class SingleTask extends StatelessWidget {
  const SingleTask({
    super.key,
    required this.task,
  });

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          task.isCompleted ? Icons.check_box : Icons.check_box_outline_blank,
          color: const Color.fromRGBO(
            54,
            140,
            114,
            1,
          ),
        ),
        const SizedBox(width: 10),
        SizedBox(
          width: 100,
          child: Text(
            task.name,
            style: const TextStyle(
              overflow: TextOverflow.ellipsis,
            ),
            maxLines: 1,
          ),
        ),
      ],
    );
  }
}
