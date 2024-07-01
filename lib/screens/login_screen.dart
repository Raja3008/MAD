import 'package:flutter/material.dart';
import 'home_page.dart'; // Import HomePage

class LoginScreen extends StatelessWidget {
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
            Row(
              children: [
                Checkbox(value: false, onChanged: (value) {}),
                Text('Remember me'),
                Spacer(),
                TextButton(onPressed: () {}, child: Text('Forgot Password?')),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: Text('Login'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: Text("Don't have an account? Sign Up"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.g_translate),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.facebook),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.apple),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
