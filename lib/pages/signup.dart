import 'package:chat_app/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chat_app/components/my_button.dart';
import 'package:chat_app/components/my_text.dart';

class SignUpPage extends StatefulWidget {
  final void Function()? onTap;
  const SignUpPage({super.key, required this.onTap});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // State variables to toggle password visibility
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  void signup() async {
    // Check if passwords match
    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Passwords do not match."),
        ),
      );
      return;
    }

    // Get AuthService instance
    final authService = Provider.of<AuthService>(context, listen: false);

    try {
      // Attempt to sign up
      await authService.signUpWithEmailandPassword(
        emailController.text.trim(),
        passwordController.text.trim(),
      );
      // Navigate to the next screen or display success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Account created successfully!"),
        ),
      );
    } catch (e) {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error: ${e.toString()}"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 5),
                const Icon(
                  Icons.message,
                  size: 70,
                  color: Colors.red,
                ),
                const SizedBox(height: 15),
                const Text(
                  "Create a new account",
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 25),
                // Email input
                MyText(
                  controller: emailController,
                  hintText: 'Email',
                  obsecureText: false,
                ),
                const SizedBox(height: 25),
                // Password input with visibility toggle
                TextField(
                  controller: passwordController,
                  obscureText: !isPasswordVisible,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                    ),
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 25),
                // Confirm password input with visibility toggle
                TextField(
                  controller: confirmPasswordController,
                  obscureText: !isConfirmPasswordVisible,
                  decoration: InputDecoration(
                    hintText: 'Confirm Password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        isConfirmPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          isConfirmPasswordVisible = !isConfirmPasswordVisible;
                        });
                      },
                    ),
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 25),
                // Sign up button
                MyButton(onTap: signup, text: "Sign Up"),
                const SizedBox(height: 30),
                // Navigate to login
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account?',
                      style:
                          TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                    ),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Login',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
