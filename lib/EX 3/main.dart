import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Products"), centerTitle: false),
        backgroundColor: Colors.amber,
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ProductCard(type: Product.dart),
              SizedBox(height: 10),
              ProductCard(type: Product.flutter),
              SizedBox(height: 10),
              ProductCard(type: Product.firebase),
            ],
          ),
        ),
      ),
    );
  }
}

enum Product {
  dart(title: "Dart", description: "the best object language.", image: "dart"),
  flutter(
    title: "Flutter",
    description: "the best mobile widget library.",
    image: "flutter",
  ),
  firebase(
    title: "Firebase",
    description: "the best cloud database.",
    image: "firebase",
  );

  final String title;
  final String description;
  final String image;

  const Product({
    required this.title,
    required this.description,
    required this.image,
  });
}

class ProductCard extends StatelessWidget {
  final Product type;

  const ProductCard({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/ex3/${type.image}.png', width: 100),
            SizedBox(height: 10),
            Text(
              type.title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(type.description),
          ],
        ),
      ),
    );
  }
}
