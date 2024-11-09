import 'package:flutter/material.dart';
import 'package:spatial/app/auth/sign_up_screen.dart';
import 'package:stacked/stacked.dart';
import 'auth_viewmodel.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>.reactive(
      viewModelBuilder: () => AuthViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: model.isBusy
                ? Center(child: CircularProgressIndicator())
                : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    // Handle avatar tap (for changing profile picture)
                    // You could use an image picker here
                    print("Tapped on the profile picture");
                  },
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                      'https://example.com/your-profile-picture-url.jpg', // Replace with a dynamic URL or asset
                    ),
                    child: model.isBusy
                        ? CircularProgressIndicator() // Show loading indicator if busy
                        : null,
                  ),
                ),
                SizedBox(height: 20),

                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      labelText: 'Email',
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(labelText: 'Password'),
                ),
                SizedBox(height: 20),
                if (model.errorMessage != null)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      model.errorMessage!,
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ElevatedButton(
                  onPressed: () {
                    model.login(
                      emailController.text,
                      passwordController.text,
                    );
                  },
                  child: Text('Login'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => SignUpScreen()),
                    );
                  },
                  child: Text('Don\'t have an account? Sign Up'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
