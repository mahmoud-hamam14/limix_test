import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:limix_test/features/auth/view/login_view.dart';
import 'package:limix_test/features/auth/widget/custom_button.dart';
import 'package:limix_test/features/auth/widget/custom_text_field.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignupView extends StatefulWidget {
  SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final TextEditingController fullNameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final TextEditingController locationController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();

  bool isLoading = false;

  // final String? email;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Color(0xff01378E),
            ),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
                (route) => false,
              );
            },
          ),
          title: const Text(
            "Sign Up",
            style: TextStyle(
              color: Color(0xff01378E),
              fontWeight: FontWeight.bold,
            ),
          ),
          // centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFFEFF6FF), Color(0xFFFFFFFF), Color(0xFFDBEAFE)],
              stops: [0.0, 0.5, 1.0],
            ),
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    const Text(
                      'Limix',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff01378E),
                      ),
                    ),

                    const Text(
                      'Manage your aquaculture farm',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      controller: fullNameController,
                      label: "Full Name",
                      prefixIcon: Icons.person_outline,
                      hint: 'Enter your full name',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Full name is required';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 8),

                    ////////////// * Email ///////////////////////////////////////////////////////////
                    CustomTextField(
                      controller: emailController,
                      label: "Email",
                      prefixIcon: Icons.email_outlined,
                      hint: 'Enter your email',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email is required';
                        }
                        // Simple email regex
                        String pattern = r'^[^@]+@[^@]+\.[^@]+';
                        RegExp regex = RegExp(pattern);
                        if (!regex.hasMatch(value)) {
                          return 'Enter a valid email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 8),
                    CustomTextField(
                      controller: phoneController,
                      label: "Phone Number",
                      prefixIcon: Icons.phone_outlined,
                      hint: 'Enter your phone number',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Phone number is required';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 8),
                    CustomTextField(
                      controller: locationController,
                      label: "Location",
                      prefixIcon: Icons.location_on_outlined,
                      hint: 'Enter your location',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Location is required';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 8),

                    ////////////// * Password ///////////////////////////////////////////////////////////
                    CustomTextField(
                      controller: passwordController,
                      label: "Password",
                      prefixIcon: Icons.lock_outline,
                      hint: 'Enter your password',
                      isPassword: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password is required';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 8),
                    CustomTextField(
                      controller: confirmPasswordController,
                      label: "Confirm Password",
                      prefixIcon: Icons.lock_outline,
                      hint: 'Re-enter your password',
                      isPassword: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please confirm your password';
                        }
                        if (value != passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24),

                    ////////////// * Sign Up ////////////////////////////////////////////////////////////
                    CustomButton(
                      text: 'Sign Up',
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          isLoading = true; // Show loading indicator
                          setState(() {}); // Update UI to show loading
                          try {
                            //? Sign up logic here
                            await registerUser(context);
                          } on FirebaseAuthException catch (e) {
                            // ? Error message
                            String message = '';
                            message = checkErrorForSignup(e, message);
                            // ? Show error message
                            showSnackBar(context, message, Colors.red);
                          } catch (e) {
                            // ? Show error message
                            showSnackBar(
                              context,
                              'Something went wrong, please try again later',
                              Colors.red,
                            );
                          }
                          isLoading = false; // Hide loading indicator
                          setState(() {}); // Update UI to hide loading
                        } else {
                          // ? Show error message
                          showSnackBar(
                            context,
                            'Please fix the errors in red',
                            Colors.red,
                          );
                        }
                      },
                    ),

                    const SizedBox(height: 30),
                    Row(
                      children: const [
                        Expanded(
                          child: Divider(thickness: 1, color: Colors.grey),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            "Or continue with",
                            style: TextStyle(
                              color: Color(0xff6A7282),
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 1,
                            color: Color(0xff6A7282),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 375,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              // decoration: BoxDecoration(color: Colors.blue),
                              child: Image.network(
                                'http://pngimg.com/uploads/google/google_PNG19635.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              'Continue with Google',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have an account?"),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff01378E),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // * Check FirebaseAuthException and return user-friendly message
  String checkErrorForSignup(FirebaseAuthException e, String message) {
    switch (e.code) {
      case 'weak-password':
        message = 'Password is too weak';
        break;

      case 'email-already-in-use':
        message = 'This email is already in use';
        break;

      case 'invalid-email':
        message = 'Invalid email format';
        break;

      case 'network-request-failed':
        message = 'Check your internet connection';
        break;

      default:
        message = 'Something went wrong';
    }
    return message;
  }

  // * Show error message in a SnackBar
  void showSnackBar(BuildContext context, String message, Color color) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message), backgroundColor: color));
  }

  // * Register user with Firebase Authentication
  Future<void> registerUser(BuildContext context) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );

    showSnackBar(context, 'Registration successful', Colors.green);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }
}
