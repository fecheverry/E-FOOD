import 'dart:developer';

import 'package:e_food/app/data/models/list.dart';
import 'package:flutter/material.dart';

class ListService extends ChangeNotifier {
  ListService() {
    // TODO: Load database from Hive
    log('Load database from Hive');
  }

  Folder? _currentFolder;

  List<Folder> _folders = [
    Folder(id: 'asdasd', name: 'Desayuno', tasks: [
      Task(id: 'asdasd', name: 'Huevos', isCompleted: false, value: '1L'),
      Task(id: 'asdasd', name: 'Pan', isCompleted: true, value: '1L'),
      Task(id: 'asdasd', name: 'Leche', isCompleted: false, value: '1L'),
      Task(id: 'asdasd', name: 'Leche', isCompleted: false, value: '1L'),
      Task(id: 'asdasd', name: 'Leche', isCompleted: true, value: '1L'),
      Task(id: 'asdasd', name: 'Leche', isCompleted: false, value: '1L'),
      Task(id: 'asdasd', name: 'Leche', isCompleted: true, value: '1L'),
      Task(id: 'asdasd', name: 'Leche', isCompleted: false, value: '1L'),
      Task(id: 'asdasd', name: 'Leche', isCompleted: false, value: '1L'),
    ]),
    Folder(id: 'asdasd', name: 'Desayuno', tasks: []),
  ];

  Folder? get currentFolder => _currentFolder;

  set currentFolder(Folder? value) {
    _currentFolder = value;
    notifyListeners();
  }

  List<Folder> get folders => _folders;

  set folders(List<Folder> value) {
    _folders = value;
    notifyListeners();
  }

  void addFolder(Folder folder) {
    _folders.add(folder);
    // TODO: Save database to Hive
    notifyListeners();
  }

  void addTask(Task task) {
    _currentFolder!.tasks.add(task);
    // TODO: Save database to Hive
    notifyListeners();
  }
}
