import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_biniyog/App/Constant/Colors.dart';
import 'package:smart_biniyog/App/routes/route_names.dart';

import '../controller/cart_controller.dart';

class CheckoutScreen extends StatefulWidget {
  final String? type;
  const CheckoutScreen({super.key, this.type});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {

  final CartController cartController = Get.put(CartController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: IconButton(
            onPressed: () => Get.back(), icon: Icon(Icons.arrow_back)),
        title: Text('Checkout'),
      ),
      body: GetBuilder<CartController>(builder: (cartController) {
        return Obx(() =>
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total Investment',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black.withOpacity(.7),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(.1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  children: widget.type == 'book_now' ? cartController.tempProductList
                                      .map((product) =>
                                      Row(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '${product.name} x ${product.quantity}',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.black.withOpacity(.8),
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text(
                                            '৳ ${product.price}',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.black.withOpacity(.8),
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ))
                                      .toList() : cartController.productList
                                      .map((product) =>
                                      Row(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '${product.name} x ${product.quantity}',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.black.withOpacity(.8),
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text(
                                            '৳ ${product.price}',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.black.withOpacity(.8),
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ))
                                      .toList(),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Divider(
                                  color: Colors.black.withOpacity(.1),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Total',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.black.withOpacity(.8),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      '৳ ${cartController.tempTotalPrice}',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.black.withOpacity(.8),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Checkbox(
                                value: cartController.isInsurance.value,
                                onChanged: (value) {
                                  cartController.isInsurance.value =
                                  !cartController.isInsurance.value;
                                },
                              ),
                              Text(
                                'I am interested about insurance',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Insurance is only applicable for selected projects and can be availed upon payment of insurance premium. Details to be shared via our customer care team after the booking.',
                            style: TextStyle(
                                color: Colors.black.withOpacity(.5),
                                fontSize: 11,
                                fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                      
                          // Payment
                          Text(
                            'Payment',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black.withOpacity(.7),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xff0ff38b579).withOpacity(.15),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Color(0xff0ff38b579),
                              ),
                            ),
                            child: ListTile(
                              leading: Container(
                                height: 30,
                                width: 30,
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xff0ff38b579),
                                ),
                                child: Container(
                                  padding: EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              title: Text('Cheque/Online Transfer'),
                              subtitle: Text(
                                'The payment can be made to the following payment method.',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 12,
                                ),),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                      
                          // Bank Info
                          GetBuilder<CartController>(builder: (cartController) {
                            if (!cartController.personInfoProgress) {
                              return Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Bank Info',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black.withOpacity(.7),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () => Get.toNamed(RouteNames.profile),
                                        child: Text(
                                          'Change',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: greyColor,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    'Return of Investment will be disbursed to the following account. Change the account info before booking if required.',
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(.5),
                                        fontSize: 11,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    width: double.infinity,
                                    padding: EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(.1),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Bank Name',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.black.withOpacity(.8),
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Text(
                                              '${cartController.personInfoDataModel.value.client!.banking?.bankName}',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.black.withOpacity(.8),
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        Divider(
                                          color: Colors.black.withOpacity(.1),
                                        ),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Branch Name',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.black.withOpacity(.8),
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Text(
                                              '${cartController.personInfoDataModel.value.client!.banking?.branchName}',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.black.withOpacity(.8),
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        Divider(
                                          color: Colors.black.withOpacity(.1),
                                        ),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'A/C Name',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.black.withOpacity(.8),
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Text(
                                              '${cartController.personInfoDataModel.value.client!.banking?.acName}',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.black.withOpacity(.8),
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        Divider(
                                          color: Colors.black.withOpacity(.1),
                                        ),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'A/C No',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.black.withOpacity(.8),
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Text(
                                              '${cartController.personInfoDataModel.value.client!.banking?.acNo}',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.black.withOpacity(.8),
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        Divider(
                                          color: Colors.black.withOpacity(.1),
                                        ),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                      
                            } else {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          }),
                      
                          
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () => cartController.placeOrder(widget.type ?? ''),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Color(0xff38b579),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (cartController.isLoading.value)
                              Center(
                                child: SizedBox(
                                  height: 25,
                                  width: 25,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            else
                              Text('Place Order',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 17.0,
                                  )),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ));
      }),
    );
  }
}
