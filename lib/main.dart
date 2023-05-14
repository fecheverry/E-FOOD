import 'package:e_food/app/domain/services/list_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import 'app/inject_dependencies.dart';
import 'app/my_app.dart';
import 'firebase_options.dart';

part 'main.g.dart';

@HiveType(typeId: 3)
class Product {
  Product({
    required this.name,
    required this.expiration,
    required this.storage,
    required this.category,
    required this.quantity,
    required this.user,
  });

  @HiveField(0)
  String name;
  @HiveField(1)
  String expiration;
  @HiveField(2)
  String storage;
  @HiveField(3)
  String category;
  @HiveField(4)
  int quantity;
  @HiveField(5)
  String user;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final directorio = await getApplicationSupportDirectory();
  Hive
    ..init(directorio.path)
    ..registerAdapter(ProductAdapter());

  var box = await Hive.openBox('productosBox');
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  injectDependencies();

  runApp(
    ChangeNotifierProvider(
      create: (context) => ListService(),
      child: const MyApp(),
    ),
  );
}
