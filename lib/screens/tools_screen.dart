import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../widgets/product_item.dart';
import '../models/cart.dart';

class ToolsScreen extends StatefulWidget {
  @override
  _ToolsScreenState createState() => _ToolsScreenState();
}

class _ToolsScreenState extends State<ToolsScreen> {
  final List<Product> products = [
    Product(
      id: 't1',
      name: 'Tool 1',
      price: 29,
      imageName: '1.webp',
    ),
    Product(
      id: 't2',
      name: 'Tool 2',
      price: 49,
      imageName: '2.webp',
    ),
    Product(
      id: 't3',
      name: 'Tool 3',
      price: 99,
      imageName: '3.webp',
    ),
    Product(
      id: 't4',
      name: 'Tool 4',
      price: 69,
      imageName: '4.webp',
    ),
    Product(
      id: 't5',
      name: 'Tool 5',
      price: 49,
      imageName: '5.webp',
    ),
    Product(
      id: 't6',
      name: 'Tool 6',
      price: 59,
      imageName: '1.webp',
    ),
  ];

  final List<String> categories = [
    'Seeds',
    'Tools',
    'Plants',
    'Blog',
    'Offers',
    'Plant Care'
  ];

  String selectedCategory = 'Tools';
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final filteredProducts = products.where((product) {
      final query = searchQuery.toLowerCase();
      return product.name.toLowerCase().contains(query) &&
          (selectedCategory == 'Tools');
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Tools'),
        actions: [
          Consumer<Cart>(
            builder: (_, cart, ch) => Stack(
              children: [
                IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/cart');
                  },
                ),
                if (cart.items.isNotEmpty)
                  Positioned(
                    right: 5,
                    top: 5,
                    child: Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      constraints: BoxConstraints(
                        minWidth: 16,
                        minHeight: 16,
                      ),
                      child: Text(
                        '${cart.items.length}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (ctx, i) => GestureDetector(
                onTap: () {
                  setState(() {
                    selectedCategory = categories[i];
                  });
                  if (categories[i] == 'Seeds') {
                    Navigator.of(context).pushNamed('/home');
                  } else if (categories[i] == 'Tools') {
                    Navigator.of(context).pushNamed('/tools');
                  }
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: selectedCategory == categories[i]
                        ? Colors.green
                        : Colors.grey[200],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    categories[i],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: selectedCategory == categories[i]
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search Products',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10.0),
              itemCount: filteredProducts.length,
              itemBuilder: (ctx, i) => ProductItem(filteredProducts[i], product: filteredProducts[i],),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
