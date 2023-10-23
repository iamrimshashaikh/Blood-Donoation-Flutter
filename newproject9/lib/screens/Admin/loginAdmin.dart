import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newproject9/screens/Admin/showmanagers.dart';
import 'package:newproject9/screens/Admin/signinadmin.dart';
import 'package:newproject9/screens/home.dart';

class LoginAdminView extends StatefulWidget {
  const LoginAdminView({Key? key}) : super(key: key);

  @override
  State<LoginAdminView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginAdminView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  loginUser() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      emailController.clear();
      passwordController.clear();
      print("Logged In Successfully");

      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFEB3738),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/water1.png',
                width: 83,
                height: 83,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 5),
              Text(
                'ZINDGI',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Quando',
                  fontSize: 23,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 40),
              Container(
                width: 320,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: 'Email',
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Password',
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: 254,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {
                          loginUser();
                        },
                        child: Text('LOGIN'),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Color(0xFFEB3738),
                          ),
                          shape: MaterialStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => SignUpAdminView(),
                  ));
                },
                child: const Text(
                  'Not registered? Sign up',
                  style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
