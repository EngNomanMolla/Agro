import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:hive/hive.dart';
import 'package:smart_biniyog/App/data/model/product_model.dart';
import 'package:smart_biniyog/App/data/service/data_saver.dart';
import 'package:smart_biniyog/App/data/service/network_caller.dart';
import 'package:smart_biniyog/App/modules/screens/cart/views/checkout.dart';
import 'package:smart_biniyog/App/modules/screens/profile/controller/profile_controller.dart';
import 'package:smart_biniyog/App/modules/utils/snackbar_message.dart';
import 'package:smart_biniyog/App/routes/route_names.dart';

import '../../../../data/model/personInfo.dart';
import '../../../../data/urls/urls.dart';

class CartController extends GetxController {
  List<ProductModel> productList = [];
  List<ProductModel> tempProductList = [];
  double totalPrice = 0.0;
  Box<ProductModel> productBox = Hive.box<ProductModel>('products');

  @override
  void onInit() {
    super.onInit();
    getPersonInfo();
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

  calculateTotalPrice() {
    totalPrice = 0.0;
    productList.forEach((product) => totalPrice += product.price);
    update(); // Update UI
  }

  RxString tempTotalPrice = RxString('');
  RxString tempTotalQuantity = RxString('');

  RxBool isLoading = RxBool(false);
  RxBool isInsurance = RxBool(false);

  placeOrder(String? type) async {
    if (!AuthUtils.isLoggedIn) {
      showSnackBarMessage(Get.context!, 'Please login to continue!');
      Get.toNamed(RouteNames.logInScreen);
      return;
    }

    isLoading.value = true;

    final isUpToDate = await NetworkUtils().checkUpToDate();

    if (!isUpToDate) {
      showSnackBarMessage(Get.context!,
          'Please setup your profile before you want to place an order!');
      isLoading.value = false;
      Get.toNamed(RouteNames.profile);
      return;
    }

    final projects = type == 'book_now'
        ? tempProductList
            .map((e) => {
                  'id': e.id,
                  'quantity': e.quantity,
                  'price': e.price,
                })
            .toList()
        : productList
            .map((e) => {
                  'id': e.id,
                  'quantity': e.quantity,
                  'price': e.price,
                })
            .toList();

    print(projects);

    final response = await NetworkUtils().order(orderData: {
      "total_amount": totalPrice,
      "projects": projects,
      "transaction_number": "TRX123456789",
      "payment_method": "bkash",
      "refferal_code": "",
      "customer_note": "Thank you for your purchase"
    });

    isLoading.value = false;

    if (response.statusCode == 200) {
      showSnackBarMessage(Get.context!, 'Order successfully placed!');
      Get.offAllNamed(RouteNames.mainNavigationScreen, arguments: {
        'index': 2,
      });
      await productBox.clear();
      productList.clear();
      return;
    } else {
      print(response.body);

      final status = jsonDecode(response.body);

      if (status.containsKey('errors')) {
        status['errors'].forEach((key, value) {
          if (value is List) {
            for (var message in value) {
              showSnackBarMessage(Get.context!, message);
            }
          }
        });
      } else {
        showSnackBarMessage(Get.context!, 'Something is wrong');
      }


    }
  }

  final profileController = Get.put(ProfileController());

  goToCheckout() async {
    if (!AuthUtils.isLoggedIn) {
      showSnackBarMessage(Get.context!, 'Please login to continue!');
      Get.toNamed(RouteNames.logInScreen);
      return;
    }

    isLoading.value = true;

    final isUpToDate = await NetworkUtils().checkUpToDate();

    isLoading.value = false;

    if (!isUpToDate) {
      showSnackBarMessage(
        Get.context!,
        'Please setup your profile before you want to place an order!',
      );
      isLoading.value = false;

      profileController.type.value = 1;

      Get.toNamed(
        RouteNames.profile,
        arguments: {
          'from_cart': true,
        },
      );
      return;
    }

    Get.to(() => const CheckoutScreen());
  }

  bool personInfoProgress = false;
  var personInfoDataModel = PersonInfoModel().obs;

  Future<bool> getPersonInfo() async {
    personInfoProgress = true;
    update();
    final response = await NetworkUtils().getMethod(
      Urls.PersonInfowurl,
    );
    print("personInfo:$response");
    personInfoProgress = false;
    if (response != null) {
      personInfoDataModel.value = PersonInfoModel.fromJson(response);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}
