import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:squareone_sam/pages/home.dart';
import 'package:squareone_sam/pages/login_otp.dart';
import 'package:squareone_sam/pages/login_phno.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MaterialApp(
    initialRoute: '/login_phno',
    routes: {
      '/':(context)=>Login_Phno(),
      '/login_phno':(context)=>Login_Phno(),
    },
  ));
}