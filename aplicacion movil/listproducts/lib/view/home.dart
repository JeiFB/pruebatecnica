import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:listproducts/view/product_detail.dart';

class Product {
  final String name;
  final String imageUrl;
  final String description;
  final double price;
  final String category;

  Product(
      this.name, this.imageUrl, this.description, this.price, this.category);
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Product> _initialProducts = [
    // Productos iniciales...
    // Categoría: Perros
    Product("Dogourmet", "assets/dog.svg",
        "Alimento para perros, sabor a carne.", 15000, "perros"),
    Product("Purina Pro Plan", "assets/dog.svg",
        "Alimento premium para perros pequeños.", 20000, "perros"),

    // Categoría: Gatos
    Product("Cat Chow", "assets/cat.svg", "Alimento para gatos adultos.", 12000,
        "gatos"),
    Product("Whiskas", "assets/cat.svg", "Comida húmeda para gatos.", 8000,
        "gatos"),

    // Categoría: Aves
    Product("Vitapol", "assets/bird.svg", "Alimento balanceado para canarios.",
        5000, "aves"),
    Product("Lolo Pets", "assets/bird.svg", "Comida para loros con frutas.",
        8000, "aves"),

    // Categoría: Peces
    Product("TetraMin", "assets/fish.svg",
        "Alimento en escamas para peces tropicales.", 6000, "peces"),
    Product("Fluval Bug Bites", "assets/fish.svg",
        "Comida para peces de agua dulce.", 8500, "peces"),

    // Categoría: Roedores
    Product("Hamster Mix", "assets/rodent.svg",
        "Mezcla de semillas para hámsters.", 5500, "roedores"),
    Product("Ratty Delights", "assets/rodent.svg",
        "Comida para ratas y ratones.", 6500, "roedores"),
  ];

  List<Product> _products = [
    // Categoría: Perros
    Product("Dogourmet", "assets/dog.svg",
        "Alimento para perros, sabor a carne.", 15000, "perros"),
    Product("Purina Pro Plan", "assets/dog.svg",
        "Alimento premium para perros pequeños.", 20000, "perros"),
    Product("Pedigree Cachorros", "assets/dog.svg",
        "Alimento para cachorros de todas las razas.", 14000, "perros"),
    Product("Hill's Science Diet", "assets/dog.svg",
        "Alimento para perros con problemas digestivos.", 22000, "perros"),
    Product("Dog Chow Adultos", "assets/dog.svg",
        "Alimento para perros adultos de todas las razas.", 16000, "perros"),

    // Categoría: Gatos
    Product("Cat Chow", "assets/cat.svg", "Alimento para gatos adultos.", 12000,
        "gatos"),
    Product("Whiskas", "assets/cat.svg", "Comida húmeda para gatos.", 8000,
        "gatos"),
    Product("Royal Canin Gatos", "assets/cat.svg",
        "Alimento especializado para gatos adultos.", 18000, "gatos"),
    Product("Pro Plan Gatos", "assets/cat.svg",
        "Alimento premium para gatos esterilizados.", 19000, "gatos"),
    Product("Gati", "assets/cat.svg", "Alimento económico para gatos.", 7000,
        "gatos"),

    // Categoría: Aves
    Product("Vitapol", "assets/bird.svg", "Alimento balanceado para canarios.",
        5000, "aves"),
    Product("Lolo Pets", "assets/bird.svg", "Comida para loros con frutas.",
        8000, "aves"),
    Product("Birdy Crunch", "assets/bird.svg",
        "Mezcla de semillas para periquitos.", 4500, "aves"),
    Product("Tropican", "assets/bird.svg",
        "Alimento premium para aves tropicales.", 12000, "aves"),
    Product("Prestige Aves", "assets/bird.svg",
        "Alimento completo para aves pequeñas.", 7000, "aves"),

    // Categoría: Peces
    Product("TetraMin", "assets/fish.svg",
        "Alimento en escamas para peces tropicales.", 6000, "peces"),
    Product("Fluval Bug Bites", "assets/fish.svg",
        "Comida para peces de agua dulce.", 8500, "peces"),
    Product("Hikari Betta Bio-Gold", "assets/fish.svg",
        "Alimento especial para peces Betta.", 5000, "peces"),
    Product("Omega One", "assets/fish.svg",
        "Comida en pellets para peces de acuario.", 7500, "peces"),
    Product("Aquafin", "assets/fish.svg",
        "Alimento completo para peces dorados.", 7000, "peces"),

    // Categoría: Roedores
    Product("Hamster Mix", "assets/rodent.svg",
        "Mezcla de semillas para hámsters.", 5500, "roedores"),
    Product("Ratty Delights", "assets/rodent.svg",
        "Comida para ratas y ratones.", 6500, "roedores"),
    Product("Bunny Essentials", "assets/rodent.svg",
        "Alimento balanceado para conejos.", 9000, "roedores"),
    Product("Guinea Pig Granules", "assets/rodent.svg",
        "Comida completa para cobayas.", 8500, "roedores"),
    Product("Rodentia Select", "assets/rodent.svg",
        "Mezcla premium para roedores pequeños.", 8000, "roedores"),
  ];
  final List<String> _categories = [
    "Todo",
    "perros",
    "gatos",
    "aves",
    "peces",
    "roedores"
  ];
  String _selectedCategory = "Todo";
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _products = List.from(_initialProducts); // Copia inicial de productos
    _scrollController.addListener(_loadMore);
  }

  void _loadMore() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      // Si la categoría es "Todo", duplicamos la lista de productos al final para simular scroll infinito
      if (_selectedCategory == "Todo") {
        setState(() {
          _products
              .addAll(_initialProducts); // Añade los mismos productos de nuevo
        });
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose(); // Limpia el controlador de scroll
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Productos"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _categories.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (_categories[index] == 'Todo') {
                        _selectedCategory = "Todo";
                        _products =
                            List.from(_initialProducts); // Reinicia la lista
                      } else {
                        _selectedCategory = _categories[index];
                      }
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    margin: const EdgeInsets.all(8),
                    color: Colors.green[100],
                    child: Center(child: Text(_categories[index])),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: _products.length,
              itemBuilder: (context, index) {
                final product = _products[index];
                if (_selectedCategory != "Todo" &&
                    product.category != _selectedCategory) {
                  return Container(); // Si la categoría no coincide, no mostrar el producto
                } else {
                  return Card(
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductDetail(product)));
                      },
                      leading: SvgPicture.asset(product.imageUrl,
                          width: 35,
                          colorFilter: const ColorFilter.mode(
                              Colors.green, BlendMode.srcIn)),
                      title: Text(
                        product.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.green),
                      ),
                      subtitle: Text(product.description),
                      trailing: Text(
                        "\$${product.price.toStringAsFixed(2)}",
                        style: const TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
