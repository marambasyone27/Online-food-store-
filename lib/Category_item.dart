import 'package:flutter/material.dart';
import 'Category_Model.dart'; // Import CategoryModel

class CategoryItem extends StatelessWidget {
  final CategoryModel categoryModel;

  const CategoryItem({
    super.key,
    required this.categoryModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage("${categoryModel.picture}"),
          fit: BoxFit.cover,
        ),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal:40 , vertical: 150 ),
       
      title: Align(
  alignment: Alignment.topLeft, // Aligns the text to the bottom center
  child: Text(
    "${categoryModel.title}",
    style: const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
  ),
),
    subtitle: Align(
  alignment: Alignment.topLeft,
        child: Text(
          "\$${categoryModel.price}",
          style: const TextStyle(color: Colors.white),
        ),
    ),
        trailing: const Icon(
          Icons.favorite,
          color: Colors.red,
        ),
      ),
    );
  }
}
