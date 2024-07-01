import 'package:flutter/material.dart';
import 'home_page.dart'; // Import HomePage

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Username',
                prefixIcon: Icon(Icons.person),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter Email',
                prefixIcon: Icon(Icons.email),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock),
                suffixIcon: Icon(Icons.visibility_off),
              ),
              obscureText: true,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                prefixIcon: Icon(Icons.lock),
                suffixIcon: Icon(Icons.visibility_off),
              ),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
