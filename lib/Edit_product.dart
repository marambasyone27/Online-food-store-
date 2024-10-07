import 'package:flutter/material.dart';
import 'Category_Model.dart';

class EditProductPage extends StatefulWidget {
  final CategoryModel product;

  const EditProductPage({super.key, required this.product});

  @override
  _EditProductPageState createState() => _EditProductPageState();
}

class _EditProductPageState extends State<EditProductPage> {
  // Controllers for text fields
  late TextEditingController titleController;
  late TextEditingController priceController;
  late TextEditingController imageController;

  @override
  void initState() {
    super.initState();
    // Initialize controllers with the current product values
    titleController = TextEditingController(text: widget.product.title);
    priceController = TextEditingController(
        text: widget.product.price?.toStringAsFixed(2) ?? "");
    imageController = TextEditingController(text: widget.product.picture);
  }

  @override
  void dispose() {
    // Dispose the controllers to free memory
    titleController.dispose();
    priceController.dispose();
    imageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Edit Product",
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Show current product image
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      widget.product.picture ?? 'assets/images/placeholder.jpg'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            const SizedBox(height: 20),
            // Title input field
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Product Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            // Price input field
            TextField(
              controller: priceController,
              decoration: const InputDecoration(
                labelText: 'Product Price (EGP)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 15),
            // Image URL input field
            TextField(
              controller: imageController,
              decoration: const InputDecoration(
                labelText: 'Image Path',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 25),
            // Update button
            ElevatedButton(
              onPressed: () {
                setState(() {
                  // Update the product with new values
                  widget.product.title = titleController.text;
                  widget.product.price =
                      double.tryParse(priceController.text) ?? widget.product.price;
                  widget.product.picture = imageController.text;
                });
                Navigator.pop(context, widget.product); // Return to Products with updated product
              },
              child: const Text(
                "Update Product",
                style: TextStyle(
            fontSize: 18.0,
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
              ),
          ],
        ),
      ),
    );
  }
}
