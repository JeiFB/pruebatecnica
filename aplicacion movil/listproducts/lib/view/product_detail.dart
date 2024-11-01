import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:listproducts/view/home.dart';

class ProductDetail extends StatelessWidget {
  final Product product;
  const ProductDetail(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_rounded)),
          title: const Text('Producto'),
          centerTitle: true,
        ),
        body: SizedBox(
          height: 450,
          child: Align(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      product.imageUrl,
                      width: 50,
                      height: 50,
                      colorFilter:
                          const ColorFilter.mode(Colors.green, BlendMode.srcIn),
                    ),
                    const SizedBox(height: 8), // Espacio entre imagen y nombre
                    Text(
                      product.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.green),
                    ),
                    const SizedBox(
                        height: 4), // Espacio entre nombre y descripción
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        product.description,
                        style: const TextStyle(
                            fontSize: 14, color: Colors.black54),
                      ),
                    ),
                    const SizedBox(
                        height: 8), // Espacio entre descripción y precio
                    Text(
                      "\$${product.price.toStringAsFixed(2)}",
                      style: const TextStyle(
                          fontSize: 25,
                          color: Colors.green,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
