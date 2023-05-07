import 'package:hive/hive.dart';

part 'product_model.g.dart';

@HiveType(typeId: 0)
class ProductModel {
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

  ProductModel({
    required this.name,
    required this.expiration,
    required this.storage,
    required this.category,
    required this.quantity,
  });
}
