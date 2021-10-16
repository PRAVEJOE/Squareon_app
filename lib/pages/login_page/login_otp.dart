import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:squareone_sam/pages/home.dart';

import '../home_page.dart';
import '../mainPage.dart';

class Login_OTP extends StatefulWidget {
  final String phone;

  Login_OTP(this.phone);

  @override
  _Login_OTPState createState() => _Login_OTPState();
}

class _Login_OTPState extends State<Login_OTP> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
   String _verficationCode;
  final _pinPutController = TextEditingController();
  final _pinPutFocusNode = FocusNode();
  final _pageController = PageController();
  final BoxDecoration pinPutDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(50.0),
    color: Colors.white,
    border: Border.all(
      color: const Color.fromRGBO(255, 255, 255, 1.0),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        key: _scaffoldkey,
        backgroundColor: Color(0xFFEEEEEE),
        body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            backgroundBlendMode: BlendMode.color,
            image: DecorationImage(
                image: AssetImage("assets/sample.jpeg"), fit: BoxFit.cover),
          ),

          child: SafeArea(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(image: AssetImage("assets/logo.png")),
                  SizedBox(height: 40),
                    DefaultTextStyle(
                   style: const TextStyle(
                    fontSize: 20.0,
                     color: Colors.white
                 ),
                  child: AnimatedTextKit(
                    repeatForever: true,
                    animatedTexts: [
                      TypewriterAnimatedText('Enter 6 Digit OTP',
                          curve: Curves.bounceInOut,speed: Duration(milliseconds: 120),),
                    ],isRepeatingAnimation: false,
                  ),
              ),
                  SizedBox(height: 30),
                  Text(
                    "We've sent the OTP via SMS to",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "+91-${widget.phone}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(60.0),
                    child: PinPut(
                      fieldsCount: 6,
                      withCursor: true,
                      textStyle:
                          const TextStyle(fontSize: 25.0, color: Colors.black),
                      eachFieldWidth: 20.0,
                      eachFieldHeight: 55.0,
                      focusNode: _pinPutFocusNode,
                      controller: _pinPutController,
                      submittedFieldDecoration: pinPutDecoration,
                      selectedFieldDecoration: pinPutDecoration,
                      followingFieldDecoration: pinPutDecoration,
                      pinAnimationType: PinAnimationType.rotation,
                        onSubmit: (pin) async {
                        try {
                          await FirebaseAuth.instance
                              .signInWithCredential(
                                  PhoneAuthProvider.credential(
                                      verificationId: _verficationCode,
                                      smsCode: pin))
                              .then((value) async {
                            if (value.user != null) {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (Context) =>
                                          MainPage()),
                                  (route) => false);
                              print('pass to home');
                            }
                          });
                        } catch (e) {
                          FocusScope.of(context).unfocus();
                          _scaffoldkey.currentState.showSnackBar(
                              SnackBar(content: Text('Invaild OTP')));
                        }
                      },
                    ),
                  ),
                  Container(
                    height: 50.0,
                    margin: EdgeInsets.all(10),
                    child: RaisedButton(
                      onPressed: () {
                        (pin) async {
                          try {
                            await FirebaseAuth.instance
                                .signInWithCredential(
                                    PhoneAuthProvider.credential(
                                        verificationId: _verficationCode,
                                        smsCode: pin))
                                .then((value) async {
                              if (value.user != null) {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (Context) =>
                                            MainPage()),
                                    (route) => false);
                                print('pass to home');
                              }
                            });
                          } catch (e) {
                            FocusScope.of(context).unfocus();
                            _scaffoldkey.currentState.showSnackBar(
                                SnackBar(content: Text('Invaild OTP')));
                          }
                        };
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(80.0)),
                      padding: EdgeInsets.all(0.0),
                      child: Ink(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [ Color(0xff66664d),
                                Color(0xfff59e5b)],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.circular(30.0)),
                        child: Container(
                          constraints:
                              BoxConstraints(maxWidth: 250.0, minHeight: 50.0),
                          alignment: Alignment.center,
                          child: Text(
                            "VALIDATE",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  //Firebase Auth
  _verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+91${widget.phone}',
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (Context) => MainPage()),
                  (route) => false);
              print('user logged in');
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String verficationID, int resendToken) {
          setState(() {
            _verficationCode = verficationID;
          });
        },
        codeAutoRetrievalTimeout: (String verficationID) {
          setState(() {
            _verficationCode = verficationID;
          });
        },
        timeout: Duration(seconds: 60));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _verifyPhone();
  }
}
