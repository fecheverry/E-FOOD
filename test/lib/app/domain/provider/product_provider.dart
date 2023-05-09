import "package:path_provider/path_provider.dart";
import 'package:hive/hive.dart';

class ProductProvider {
  late Box box;

  Future<bool> initializeBox() async {
    final direcroty = await getApplicationSupportDirectory();
    Hive.init(direcroty.path);
    box = await Hive.openBox("productsBox");
    return box.isOpen;
  }

  Future<bool> addProduct(var product) async {
    await box.add(product);
    return true;
  }

  Map<dynamic, dynamic> getProducts() {
    Map<dynamic, dynamic> productsMap = box.toMap();
    return productsMap;
  }

  Future<bool> updateProduct(int index, var product) async {
    await box.putAt(index, product);
    return true;
  }

  dispose() {
    box.close();
  }
}
