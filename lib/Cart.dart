import 'package:flutter/material.dart';
import 'Category_Model.dart';

class Cart extends StatefulWidget {
  final List<CategoryModel> cartItems;

  const Cart({super.key, required this.cartItems});

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  void removeFromCart(int index) {
    setState(() {
      widget.cartItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cart",
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
      ),
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              "assets/images/cart2.jpg",
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Positioned(
            top: 16,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      "You have ${widget.cartItems.length} items in your cart",
                      style: const TextStyle(
                        fontSize: 18,
                        fontFamily: 'RobotoMono',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 70,
            left: 0,
            right: 0,
            bottom: 0,
            child: ListView.builder(
              itemCount: widget.cartItems.length,
              itemBuilder: (context, index) {
                final item = widget.cartItems[index];
                return Card(
                  margin: const EdgeInsets.all(10.0),
                  color: Colors.orange[200],
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(item.picture ?? ''),
                    ),
                    title: Text(
                      item.title ?? "No Title",
                      style: const TextStyle(
                        fontSize: 18,
                        fontFamily: 'RobotoMono',
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      "${item.price?.toStringAsFixed(2) ?? "N/A"} EGP",
                      style: const TextStyle(
                        fontSize: 16,
                        fontFamily: 'RobotoMono',
                        color: Colors.black,
                      ),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        removeFromCart(index);
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    Navigator.pop(context, widget.cartItems);
    super.dispose();
  }
}
