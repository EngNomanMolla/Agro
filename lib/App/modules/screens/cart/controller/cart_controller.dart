import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:smart_biniyog/App/data/model/product_model.dart';


class CartController extends GetxController {
  List<ProductModel> productList = [];
  double totalPrice=0.0;
  Box<ProductModel> productBox = Hive.box<ProductModel>('products');

  @override
  void onInit() {
    super.onInit();
    loadProducts();
    calculateTotalPrice();
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
    calculateTotalPrice();
  }

  // Delete a product
  void deleteProduct(int index) {
    productBox.deleteAt(index);
    loadProducts();
    calculateTotalPrice();
  }

  calculateTotalPrice(){
    totalPrice=0.0;
    productList.forEach((product) => totalPrice += product.price);
    update(); // Update UI
  }

}