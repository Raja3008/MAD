import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/cart.dart';
import 'screens/cart_screen.dart';
import 'screens/tools_screen.dart';
import 'screens/home_page.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart'; // Import RegisterScreen

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
        home: LoginScreen(), // Set LoginScreen as the initial screen
        routes: {
          '/register': (context) => RegisterScreen(),
          '/home': (context) => HomePage(),
          '/cart': (ctx) => CartScreen(),
          '/tools': (ctx) => ToolsScreen(),
        },
      ),
    );
  }
}
