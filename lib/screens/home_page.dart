import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async';

import '../models/cart.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();
  Timer? _timer;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 10), (Timer timer) {
      if (_currentPage < 2) {
        setState(() {
          _currentPage++;
        });
      } else {
        setState(() {
          _currentPage = 0;
        });
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/7.webp'),
            ),
            SizedBox(width: 10),
            Text('Plantify'),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.of(context).pushNamed('/profile');
            },
          ),
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.of(context).pushNamed('/cart');
                },
              ),
              Positioned(
                right: 8,
                top: 8,
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
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search any item',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
                Container(
                  height: 200,
                  child: PageView(
                    controller: _pageController,
                    children: [
                      Image.asset('assets/15.webp', fit: BoxFit.cover),
                      Image.asset('assets/16.png', fit: BoxFit.cover),
                      Image.asset('assets/17.png', fit: BoxFit.cover),
                    ],
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 1,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed('/indoor');
                    },
                    child: CategoryItem('Indoor', 'assets/9.webp'),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed('/outdoor');
                    },
                    child: CategoryItem('Outdoor', 'assets/10.webp'),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed('/offers');
                    },
                    child: CategoryItem('Offers', 'assets/11.webp'),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed('/seasonal');
                    },
                    child: CategoryItem('Seasonal', 'assets/12.webp'),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed('/home');
                    },
                    child: CategoryItem('Seeds', 'assets/6.webp'),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed('/tools');
                    },
                    child: CategoryItem('Tools', 'assets/8.webp'),
                  ),
                  CategoryItem('FAQ s', 'assets/13.webp'),
                  CategoryItem('Others', 'assets/14.webp'),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Trending',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.75,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    itemCount: trendingProducts.length,
                    itemBuilder: (context, index) {
                      return TrendingProductItem(
                        trendingProducts[index]['imagePath'],
                        trendingProducts[index]['productName'],
                        trendingProducts[index]['price'],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String title;
  final String imagePath;

  CategoryItem(this.title, this.imagePath);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(imagePath),
          radius: 30,
        ),
        SizedBox(height: 5),
        Text(title),
      ],
    );
  }
}

class TrendingProductItem extends StatelessWidget {
  final String imagePath;
  final String productName;
  final double price;

  TrendingProductItem(this.imagePath, this.productName, this.price);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.asset(
                imagePath,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 5),
            Text(
              productName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('₹$price'),
            SizedBox(height: 5),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Add your add to cart functionality here
                },
                child: Text('Add to Cart'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final List<Map<String, dynamic>> trendingProducts = [
  {
    'imagePath': 'assets/2.webp',
    'productName': 'Product 1',
    'price': 29.0,
  },
  {
    'imagePath': 'assets/3.webp',
    'productName': 'Product 2',
    'price': 49.0,
  },
  {
    'imagePath': 'assets/4.webp',
    'productName': 'Product 3',
    'price': 99.0,
  },
  {
    'imagePath': 'assets/5.webp',
    'productName': 'Product 4',
    'price': 69.0,
  },
];
