import 'dart:convert';

import 'package:get/get.dart';
import 'package:smart_biniyog/App/data/model/transactions_model.dart';

import '../../../../data/service/network_caller.dart';

class TransactionHistoryController extends GetxController {


  RxBool isLoading = RxBool(false);

  var transactions = <TransactionsModel>[].obs;


  void getTransactions () async {

    isLoading.value = true;

    final response = await NetworkUtils().getTransactions();

    print(response.body);
    isLoading.value = false;

    final decoded = jsonDecode(response.body)['transaction'];

    transactions.value = transactionsModelFromJson(jsonEncode(decoded));

    update();
  }



  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getTransactions();
  }
}