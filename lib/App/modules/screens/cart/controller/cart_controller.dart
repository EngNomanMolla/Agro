import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:hive/hive.dart';
import 'package:smart_biniyog/App/data/model/product_model.dart';
import 'package:smart_biniyog/App/data/service/network_caller.dart';
import 'package:smart_biniyog/App/modules/utils/snackbar_message.dart';
import 'package:smart_biniyog/App/routes/route_names.dart';


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

  RxString tempTotalPrice = RxString('');
  RxString tempTotalQuantity = RxString('');

  RxBool isLoading = RxBool(false);

  placeOrder () async {

    isLoading.value = true;

    final isUpToDate = await NetworkUtils().checkUpToDate();

    if (!isUpToDate) {
      showSnackBarMessage(Get.context!, 'Please login to continue!');
      return;
    }

    final projects = productList.map((e) => {
      'id' : e.id,
      'quantity' : e.quantity,
      'price' : e.price,
    }).toList();

    print(projects);

    final response = await NetworkUtils().order(orderData: {
      "total_amount": totalPrice,
      "projects": projects,
      "transaction_number": "TRX123456789",
      "payment_method": "bkash",
      "refferal_code":"",
      "customer_note": "Thank you for your purchase"
    });

    isLoading.value = false;

    if (response.statusCode == 200) {
      showSnackBarMessage(Get.context!, 'Order successfully placed!');
      Get.offAllNamed(RouteNames.mainNavigationScreen);
      await productBox.clear();
      productList.clear();
      return;
    } else {
      print(response.body);
      showSnackBarMessage(Get.context!, 'Something is wrong, Please try again');
    }
  }

}