import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:note_app/views/signInScreen.dart';

signUpUser(
  String userName, 
  String userPhone, 
  String userEmail, 
  String userPassword,
  )async{
    User? userid = FirebaseAuth.instance.currentUser;

   try{
    await FirebaseFirestore.instance
                      .collection("users")
                      .doc(userid!.uid)
                      .set({
                        'userName': userName,
                        'userPhone': userPhone,
                        'userEmail': userEmail,
                        'createdAt': DateTime.now(),
                        'userId': userid.uid,
                      }).then((value) => {
                        FirebaseAuth.instance.signOut(),
                        Get.to(()=> LoginScreen()),
                      });
   } on FirebaseAuthException catch (e){
    print("Error $e: ");
   }
  }