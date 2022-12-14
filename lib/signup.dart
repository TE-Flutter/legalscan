import 'package:flutter/material.dart';
import 'package:flutter_app/file_reader.dart';
import 'package:flutter_app/home.dart';
import 'package:flutter_app/signin.dart';

class SignUpView extends StatelessWidget {
  var passwordController = TextEditingController();
  var passwordConfirmationController = TextEditingController();
  
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
                
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Password', hintText: 'Enter your password'),
                controller: passwordController,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Password confirmation', hintText: 'Enter your password again'),
                controller: passwordConfirmationController,
              ),
              ElevatedButton(
                onPressed: () {
                  if (passwordController.text != passwordConfirmationController.text) {
                    print('Passwords do not match');
                  } else {
                    print('Passwords match');
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen())
                    );
                  }
                },
                child: Text('Sign Up'),
              ),
              // Add a button to navigate to the sign in view
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignInView())
                  );
                },
                child: Text('Sign In'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
