import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final String username = 'admin';
  final String password = 'password';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Check username and password
                // For simplicity, just print a message
                if (username == 'admin' && password == 'password') {
                  print('Login successful');
                } else {
                  print('Invalid username or password');
                }
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
