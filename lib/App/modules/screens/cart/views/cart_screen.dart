import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_biniyog/App/data/model/product_model.dart';
import 'package:smart_biniyog/App/modules/screens/cart/controller/cart_controller.dart';

class CartScreen extends StatefulWidget {
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final CartController cartController = Get.put(CartController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff38b579),
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(Icons.arrow_back_ios, color: Colors.white)),
        title: Text('Cart List', style: TextStyle(color: Colors.white)),
      ),
      body: GetBuilder<CartController>(
        builder: (_) {
          return Column(
            children: [
              Expanded(
                child: GetBuilder<CartController>(
                  builder: (controller) {
                    if (controller.productList.isEmpty) {
                      return Center(
                        child: Text('No products available!'),
                      );
                    } else {
                      return ListView.separated(
                        itemCount: controller.productList.length,
                        itemBuilder: (context, index) {
                          final product = controller.productList[index];
                          return ProductTile(product: product, index: index);
                        },
                        separatorBuilder: (context, index) {
                          return Divider(color: Colors.grey.withOpacity(0.3));
                        },
                      );
                    }
                  },
                ),
              ),
              // Fixed Button at the bottom
              if (cartController.productList.isEmpty)
                SizedBox()
              else
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GetBuilder<CartController>(
                      builder: (_) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8.0,
                                vertical: 10,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Total Quantity: ${cartController.productList.map((e) => e.quantity).fold(0, (sum, quantity) => sum + quantity)}',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                  Text(
                                      'Total Price: ৳${cartController.totalPrice}',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 14.0)),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    Obx(() => Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: InkWell(
                          onTap: () => cartController.placeOrder(),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Color(0xff38b579),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [

                                  if(cartController.isLoading.value)
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
                                  Text('Order Now',
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
                        ))),
                  ],
                ),
            ],
          );
        },
      ),
    );
  }
}

class ProductTile extends StatelessWidget {
  final ProductModel product;
  final int index;

  ProductTile({required this.product, required this.index});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ImageLoader(imageUrl: product.image),
      // Loading indicator added here
      title: Text(product.name,
          style: TextStyle(color: Colors.black.withOpacity(0.7))),
      subtitle: Text('Quantity: ${product.quantity}  Price: ৳${product.price}'),
      trailing: IconButton(
        icon: Icon(Icons.delete, color: Colors.red.withOpacity(0.6)),
        onPressed: () {
          Get.find<CartController>().deleteProduct(index);
        },
      ),
    );
  }
}

class ImageLoader extends StatelessWidget {
  final String imageUrl;

  ImageLoader({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Image.network(
        imageUrl,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child; // Image has finished loading
          } else {
            return CircularProgressIndicator(
              color: Color(0xff38b579),
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                  : null,
            );
          }
        },
        errorBuilder: (context, error, stackTrace) {
          return Icon(Icons.error); // Error icon when loading fails
        },
        width: 50,
        height: 50,
        fit: BoxFit.cover,
      ),
    );
  }
}
