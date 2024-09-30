import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:smart_biniyog/App/data/model/product_model.dart';


class CartController extends GetxController {
  List<ProductModel> productList = [];
  Box<ProductModel> productBox = Hive.box<ProductModel>('products');

  @override
  void onInit() {
    super.onInit();
    loadProducts();
  }

  // Load all products from Hive
  void loadProducts() {
    productList = productBox.values.toList();
    update(); // Update UI
  }

  // Add a product
  void addProduct(ProductModel product) {
    productBox.add(product);
    loadProducts();
  }

  // Delete a product
  void deleteProduct(int index) {
    productBox.deleteAt(index);
    loadProducts();
  }
}