import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'auth_viewmodel.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>.reactive(
      viewModelBuilder: () => AuthViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(title: Text('Sign Up'),
            backgroundColor: Colors.blueAccent,
            elevation: 0,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: model.isBusy
                ? Center(child: CircularProgressIndicator())
                : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Icon(
                    Icons.directions_car, // Transportation icon
                    size: 90,
                    color: Colors.blueAccent,
                  ),
                ),
                SizedBox(height: 35),

                TextField(
                  controller: emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                ),
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
                    model.signUp(
                      emailController.text,
                      passwordController.text,
                    );
                  },
        style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueAccent,
        padding: EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        ),
        ),
                  child: Text('Sign Up'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: Text('Already have an account? Login'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
