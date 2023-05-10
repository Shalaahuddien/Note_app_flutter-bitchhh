import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:lottie/lottie.dart';
import 'package:note_app/services/signUpServices.dart';
import 'package:note_app/views/signInScreen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController userPhoneController = TextEditingController();
  TextEditingController userEmailController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();

  User? currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("SignUp Screen"),
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
                
                Container(
                margin: EdgeInsets.symmetric(horizontal: 30.0),
                child: TextFormField(
                  controller: userNameController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    // suffixIcon: Icon(Icons.email),
                    hintText: 'UserName',
                    enabledBorder: OutlineInputBorder(),
                    ),
                ),
                ),
                   SizedBox(
                  height: 10.0,
                  ),
                Container(
                margin: EdgeInsets.symmetric(horizontal: 30.0),
                child: TextFormField(
                  controller: userPhoneController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone),
                    // suffixIcon: Icon(Icons.email),
                    hintText: 'Phone',
                    enabledBorder: OutlineInputBorder(),
                    ),
                ),
                ),
                 SizedBox(
                  height: 10.0,
                  ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30.0),
                child: TextFormField(
                  controller: userEmailController,
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
                 Container(
                margin: EdgeInsets.symmetric(horizontal: 30.0),
                child: TextFormField(
                  controller: userPasswordController,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    enabledBorder: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.password),
                    suffixIcon: Icon(
                      Icons.visibility,
                      ),
                    ),
                ),
                ),
                  SizedBox(
                  height: 10.0,
                  ),
                ElevatedButton(
                  onPressed: () async {
                    var userName = userNameController.text.trim();
                    var userPhone = userPhoneController.text.trim();
                    var userEmail = userEmailController.text.trim();
                    var userPassword = userPasswordController.text.trim();

                    await FirebaseAuth.instance
                    .createUserWithEmailAndPassword(
                      email: userEmail, password: userPassword)
                    .then((value) => {
                      print("User Created"),
                      signUpUser(
                         userName,
                         userPhone,
                         userEmail,
                         userPassword,
                      ),
                    });
                  }, 
                  child: Text("Sign Up"),
                  ),
                     SizedBox(
                  height: 10.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(()=> LoginScreen());
                    },
                    child: Container(
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text("AllReady have an account SignIn"),
                        ),
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