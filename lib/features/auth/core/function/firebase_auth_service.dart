import 'package:firebase_auth/firebase_auth.dart';

Future<void> registerUser(
  dynamic emailController,
  dynamic passwordController,
) async {
  await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: emailController.text.trim(),
    password: passwordController.text.trim(),
  );
}

Future<UserCredential> loginUser(
  dynamic emailController,
  dynamic passwordController,
) async {
  return await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: emailController.text.trim(),
    password: passwordController.text.trim(),
  );
}
