import 'package:flutter/material.dart';
import 'package:flutter_app/file_reader.dart';

import 'signup.dart';


class SignInView extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Email', hintText: 'Enter your email'),
                controller: emailController,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Password', hintText: 'Enter your password'),
                controller: passwordController,
              ),
              
              ElevatedButton(
                onPressed: () {
                  if (emailController.text == 'admin' && passwordController.text == 'admin') {
                    print('Login successful');
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FileReader())
                    );
                  } else {
                    print('Login failed');
                  }
                },
                child: Text('Sign In'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignUpView())
                  );
                },
                child: Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
