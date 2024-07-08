import 'package:flutter/material.dart';
import 'package:plantify/screens/indoor_screen.dart';
import 'package:plantify/screens/offers_screen.dart';
import 'package:plantify/screens/outdoor_screen.dart';
import 'package:plantify/screens/seasonal_screen.dart';
import 'package:provider/provider.dart';
import 'models/cart.dart';
import 'screens/cart_screen.dart';
import 'screens/tools_screen.dart';
import 'screens/home_page.dart';
import 'screens/register_screen.dart';
import 'screens/home_screen.dart';
import 'screens/profile_page.dart'; // Import the profile page

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Cart(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Plantify',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: HomePage(), // Set LoginScreen as the initial screen
        routes: {
          '/register': (context) => RegisterScreen(),
          '/home': (context) => HomeScreen(),
          '/cart': (ctx) => CartScreen(),
          '/tools': (ctx) => ToolsScreen(),
          '/profile': (ctx) => ProfilePage(), // Add the route for profile page
          '/indoor': (ctx) => IndoorScreen(),
          '/outdoor': (ctx) => OutdoorScreen(),
          '/seasonal': (ctx) => SeasonalScreen(),
          '/offers': (ctx) => OffersScreen()
        },
      ),
    );
  }
}

