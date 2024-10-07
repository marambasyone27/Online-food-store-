class CategoryModel {
  String? picture;
  String? title;
  double? price;

  CategoryModel({
    this.picture,
    this.title,
    this.price,
  });
}

// List of product data
List<CategoryModel> CategoryData = [
  CategoryModel(
    picture: "assets/images/pizza.jpg",
    title: "Pizza",
    price: 300,
    
  ),
  CategoryModel(
    picture: "assets/images/humburger.jpg",
    title: "Hamburger",
    price: 200,
  ),
  CategoryModel(
    picture: "assets/images/food.jpg",
    title: "Sandwich",
    price: 150,
  ),
  CategoryModel(
    picture: "assets/images/Sticky_beef.jpg",
    title: "Sticky Beef Noodles",
    price: 100,
  ),
  CategoryModel(
    picture: "assets/images/chicken.jpg",
    title: "Crispy Chicken",
    price: 90,
  ),
  CategoryModel(
    picture: "assets/images/chickenPasta.jpg",
    title: "Gralic Chicken Pasta",
    price: 120,
  ),
   CategoryModel(
    picture: "assets/images/food1.jpg",
    title: " Kebab",
    price: 120,
  ),
   CategoryModel(
    picture: "assets/images/fish.jpg",
    title: "Grilled Fish",
    price: 120,
  ),
   CategoryModel(
    picture: "assets/images/Chicken_Frensh_fries.jpg",
    title: "Chicken Frensh fries",
    price: 105,
  ),
    CategoryModel(
    picture: "assets/images/Crispy_fries_with_chicken.jpg",
    title: "Crispy fries with chicken",
    price: 130,
  ),
 
  
];
