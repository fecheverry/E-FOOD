import 'dart:developer';

import 'package:e_food/app/data/models/list.dart';
import 'package:e_food/main.dart';
import 'package:flutter/material.dart';

class ListService extends ChangeNotifier {
  ListService() {
    // TODO: Load database from Hive
    log('Load database from Hive');
  }

  List<Product> _inventory = [
    Product(
      name: 'Producto 1',
      expiration: '2023-10-12',
      storage: 'Congelador',
      category: 'Carnes',
      quantity: 2,
      user: 'L8Jzzy9mw2XxfOPR8DIuNhTfbdg2',
    ),
    Product(
      name: 'Producto 2',
      expiration: '2023-10-12',
      storage: 'Congelador',
      category: 'Carnes',
      quantity: 0,
      user: 'L8Jzzy9mw2XxfOPR8DIuNhTfbdg2',
    ),
    Product(
      name: 'Producto 3',
      expiration: '2023-10-12',
      storage: 'Congelador',
      category: 'Carnes',
      quantity: 20,
      user: 'L8Jzzy9mw2XxfOPR8DIuNhTfbdg2',
    ),
    Product(
      name: 'Producto 4',
      expiration: '2023-10-12',
      storage: 'Congelador',
      category: 'Carnes',
      quantity: 3,
      user: 'L8Jzzy9mw2XxfOPR8DIuNhTfbdg2',
    ),
  ];

  Folder? _currentFolder;

  List<Folder> _folders = [
    Folder(
      id: '123',
      name: 'Desayuno',
      tasks: [
        Task(id: 'asdasd', name: 'Huevos', isCompleted: false, value: '1L'),
        Task(id: 'asdasd', name: 'Pan', isCompleted: true, value: '1L'),
        Task(id: 'asdasd', name: 'Leche', isCompleted: false, value: '1L'),
        Task(id: 'asdasd', name: 'Leche', isCompleted: false, value: '1L'),
        Task(id: 'asdasd', name: 'Leche', isCompleted: true, value: '1L'),
        Task(id: 'asdasd', name: 'Leche', isCompleted: false, value: '1L'),
        Task(id: 'asdasd', name: 'Leche', isCompleted: true, value: '1L'),
        Task(id: 'asdasd', name: 'Leche', isCompleted: false, value: '1L'),
        Task(id: 'asdasd', name: 'Leche', isCompleted: false, value: '1L'),
      ],
      isPublic: true,
    ),
    Folder(id: '456', name: 'Desayuno', tasks: [], isPublic: false),
  ];

  get inventory => _inventory;

  set inventory(final value) {
    _inventory = value;
    notifyListeners();
  }

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

  void addProductToInventory(Product product) {
    _inventory.add(product);
    notifyListeners();
  }

  void changeFolderPrivacy(bool isPublic) {
    _currentFolder!.isPublic = isPublic;
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
