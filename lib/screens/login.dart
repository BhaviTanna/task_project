import 'package:flutter/material.dart';
import 'package:task_project/screens/create_account.dart';
import 'package:task_project/widgets/custom_widgets.dart';

import '../service/api_service.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool passToggle = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 20),
                  Center(
                    child: Image.asset(
                      'assets/logo_with_name.png',
                      color: Colors.green,
                      height: 70,
                      width: 250,
                    ),
                  ),
                  SizedBox(height: 30),
                  Center(
                    child: Text(
                      'Welcome Back!',
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 3),
                  Center(
                    child: Text(
                      'Login to your account to discover all\ngreat features in this item',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey.shade800),
                    ),
                  ),
                  SizedBox(height: 25),
                  customTextField(
                    title: 'Email',
                    hintText: 'johndoe@gmail.com',
                    controller: emailController,
                  ),
                  SizedBox(height: 15),
                  customTextField(
                    title: 'Password',
                    hintText: 'Enter Password',
                    controller: passwordController,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          passToggle = !passToggle;
                        });
                      },
                      icon: Icon(
                        passToggle ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                      ),
                    ),
                    obscureText: passToggle,
                  ),
                  SizedBox(height: 10),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot Password?',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 18, color: Colors.grey.shade400),
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        print('object');
                        await loginCheck(
                          context,
                          email: emailController.text,
                          password: passwordController.text,
                        );
                      }
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 18,color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                      shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                      ),
                      primary: Colors.green,
                    ),
                  ),
                  SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(child: Divider()),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text('Or'),
                      ),
                      Expanded(child: Divider()),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Image.asset(
                          'assets/facebook.png',
                          height: 40,
                          width: 40,
                        ),
                        onPressed: () {},
                      ),
                      SizedBox(width: 10),
                      IconButton(
                        icon: Image.asset(
                          'assets/google.png',
                          height: 40,
                          width: 40,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t have an account?'),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => CreateAccount(),
                            ),
                          );
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.green,
                            decoration: TextDecoration.underline,
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
    );
  }
}
