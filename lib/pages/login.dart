import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

// final emailController = TextFormFieldController();

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  // ignore: override_on_non_overriding_member
  // @override
  void _onLoginPressed() {
    // Here, you can implement your login logic.
    // For example, you might call an API to authenticate the user.
    String email = _emailController.text;
    String password = _passwordController.text;

    // Add your authentication logic here...

    // For now, let's just print the user's email and password for testing purposes.
    print('Email: $email');
    print('Password: $password');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Textme'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Email',
                hintText: 'Enter your email',
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                hintText: 'Enter your password',
              ),
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              // style:
              // onPressed: _onLoginPressed,
              onPressed: () {
                FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: _emailController.text.trim(),
                    password: _passwordController.text.trim());
              },
              child: const Text('Login'),
            ),
            ElevatedButton(
              // style:
              // onPressed: _onLoginPressed,
              onPressed: () {
                FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: _emailController.text.trim(),
                    password: _passwordController.text.trim());
              },
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
