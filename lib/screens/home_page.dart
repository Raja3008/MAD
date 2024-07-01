import 'dart:async';
import 'package:flutter/material.dart';

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
        _currentPage++;
      } else {
        _currentPage = 0;
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
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/7.webp'), // Updated logo image
            ),
            SizedBox(width: 10),
            Text('Plantify'),
          ],
        ),
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
                      Image.asset('assets/15.webp', fit: BoxFit.cover), // Add your sliding images in assets
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
                  CategoryItem('Plant Care', 'assets/9.webp'),
                  CategoryItem('Blog', 'assets/10.webp'),
                  CategoryItem('Offers', 'assets/11.webp'),
                  CategoryItem('Plants', 'assets/12.webp'),
                  CategoryItem('Garden', 'assets/13.webp'),
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
                  GridView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.75, // Adjusted to fit content better
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    children: [
                      TrendingProductItem('assets/2.webp', 'Product 1'),
                      TrendingProductItem('assets/3.webp', 'Product 2'),
                      TrendingProductItem('assets/4.webp', 'Product 3'),
                      TrendingProductItem('assets/5.webp', 'Product 4'),
                    ],
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

  TrendingProductItem(this.imagePath, this.productName);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: 80, // Reduced size
              height: 80, // Reduced size
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10),
            Text(productName),
            SizedBox(height: 5),
            ElevatedButton(
              onPressed: () {
                // Add your add to cart functionality here
              },
              child: Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
