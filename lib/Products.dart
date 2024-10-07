import 'package:firstapplication/Edit_product.dart';
import 'package:flutter/material.dart';
import 'Category_Model.dart';
import 'Cart.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  List<CategoryModel> cartItems = [];

  void removeProduct(int index) {
    setState(() {
      CategoryData.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Foods",
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono',
            color: Colors.white,
            shadows: [
              Shadow(
                color: Colors.orange,
                offset: Offset(2, 2),
                blurRadius: 3.0,
              ),
            ],
          ),
        ),
        centerTitle: true,
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.shopping_cart,
                  color: Colors.orange,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Cart(cartItems: cartItems),
                    ),
                  );
                },
              ),
              //  Positioned(
              //   right: 4,
              //   top: 4,
              //   child: cartItems.isNotEmpty
              //       ? Container(
              //           padding: const EdgeInsets.all(4.0),
              //           decoration: BoxDecoration(
              //             color: Colors.red,
              //             borderRadius: BorderRadius.circular(12.0),
              //           ),
              //           constraints: const BoxConstraints(
              //             minWidth: 20,
              //             minHeight: 20,
              //           ),
              //           child: Text(
              //             cartItems.length.toString(),
              //             style: const TextStyle(
              //               color: Colors.white,
              //               fontSize: 12,
              //               fontWeight: FontWeight.bold,
              //             ),
              //             textAlign: TextAlign.center,
              //           ),
              //         )
              //       : Container(),
              // ),
            ],
          ),
        ],
      ),
      body: GridView.builder(
        itemCount: CategoryData.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,//
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
          childAspectRatio: .5,
        ),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          final category = CategoryData[index];

          return Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(15),
                      ),
                      image: DecorationImage(
                        image: AssetImage(
                          category.picture ?? 'assets/images/placeholder.jpg',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        category.title ?? "No Title",
                        style: const TextStyle(
                          fontSize: 16,
                          fontFamily: 'RobotoMono',
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "${category.price?.toStringAsFixed(2) ?? "N/A"} EGP",
                        style: const TextStyle(
                          color: Colors.orange,
                          fontSize: 15,
                          fontFamily: 'RobotoMono',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [

                              MaterialButton(//Editing 
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(19.0),
                                splashColor: Colors.white,
                                color: Colors.orange,
                                focusColor: Colors.grey,
                                onPressed: () async {
                                  final updatedProduct = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          EditProductPage(product: category),
                                    ),
                                  );

                                  if (updatedProduct != null) {
                                    setState(() {
                                      CategoryData[index] = updatedProduct;
                                    });
                                  }
                                },
                                child: const Text(// edit product  (price or name or photo or edit with another product)
                                  "Edit",
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontFamily: 'RobotoMono',
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),

                              MaterialButton(//  Delete
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(19.0),
                                splashColor: Colors.white,
                                color: Colors.red,
                                focusColor: Colors.grey,
                                onPressed: () {
                                  // Remove product from the list
                                  removeProduct(index);
                                },
                                child: const Text(// delete the items from foods list
                                  "Delete",
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontFamily: 'RobotoMono',
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),

                          MaterialButton(// Add to cart
                            shape: CircleBorder(),
                            splashColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                vertical: 19.0, horizontal: 10.0),
                            color: Colors.green,
                            focusColor: Colors.grey,
                            onPressed: () {
                              setState(() {
                                cartItems.add(category);
                              });
                            },
                            child: const Text(// add the item to the cart
                              "ADD",
                              style: TextStyle(
                                fontSize: 17,
                                fontFamily: 'RobotoMono',
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
