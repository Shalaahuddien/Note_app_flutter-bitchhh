import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:lottie/lottie.dart';
import 'package:note_app/views/signInScreen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController forgetPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Forgot Password"),
        // actions: [
        //   Icon(Icons.more_vert),
        // ],
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                height: 250.0,
                child: Lottie.asset("assets/38435-register.json"),
                ),
                SizedBox(
                  height: 10.0,
                  ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30.0),
                child: TextFormField(
                  controller: forgetPasswordController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    // suffixIcon: Icon(Icons.email),
                    hintText: 'Email',
                    enabledBorder: OutlineInputBorder(),
                    ),
                ),
                ),
                SizedBox(
                  height: 10.0,
                  ),
                ElevatedButton(
                  onPressed: () async {
                      var forgotEmail = forgetPasswordController.text.trim();

                      try {
                        await FirebaseAuth.instance
                        .sendPasswordResetEmail(email: forgotEmail)
                        .then((value) => {
                          print("Email Send!"),
                          Get.off(()=> LoginScreen()),
                          });
                      }on FirebaseAuthException catch(e){
                        print("Error $e");
                      }
                  }, 
                  child: Text("Forgot Password"),
                  ),  
            ],
          ),
          ),
        ),
      );
  }
}