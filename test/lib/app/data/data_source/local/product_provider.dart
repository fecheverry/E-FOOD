import 'package:e_food/main.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive/hive.dart';

class ProductProvider {
  final Box _productBox;

  ProductProvider() : _productBox = Hive.box('productosBox');

  Future<bool> addProduct(var product) async {
    await _productBox.add(product);
    return true;
  }

  List<dynamic> getProducts(String user) {
    final products = _productBox.values.where((p) => p.user == user).toList();
    return products;
  }

  Future<bool> updateProduct(var productToUpdate, var newProductData) async {
    // Buscar el objeto correcto
    final product = _productBox.values.firstWhere(
      (elem) => elem == productToUpdate,
      orElse: () => null,
    );
    final index = _productBox.values.toList().indexOf(product);

    // Actualizar el objeto en el índice encontrado
    await _productBox.putAt(index, newProductData);
    return true;
  }

  Future<bool> removeProduct() async {
    print("REMOVIDO");
    final objetoAEliminar = _productBox.values
        .firstWhere((producto) => producto.nombre == "Mantequilla");
    await objetoAEliminar.delete();
    return true;
  }
}
