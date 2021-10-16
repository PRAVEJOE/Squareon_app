import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'login_otp.dart';

enum MobileVerficationState { SHOW_MOBILE_FROM_STATE, SHOW_OTP_FROM_STATE }

class Login_Phno extends StatefulWidget {
  @override
  _Login_PhnoState createState() => _Login_PhnoState();
}

class _Login_PhnoState extends State<Login_Phno> {
  TextEditingController _controller = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
          body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.2),
          backgroundBlendMode: BlendMode.color,
          image: DecorationImage(
              image: AssetImage("assets/sample.jpeg"), fit: BoxFit.cover),
        ),
        child: Center(
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
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    child: AnimatedTextKit(
                      repeatForever: true,
                      animatedTexts: [
                        TypewriterAnimatedText(
                          'Enter your Phone Number to login',
                          curve: Curves.easeIn,
                          speed: Duration(milliseconds: 120),
                        ),
                      ],
                      isRepeatingAnimation: false,
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                      width: 300,
                      child: TextFormField(
                        controller: _controller,
                        maxLength: 10,
                        keyboardType: TextInputType.number,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          floatingLabelStyle: TextStyle(color: Colors.white),
                          prefixStyle: TextStyle(
                            color: Colors.white,
                          ),
                          labelStyle: TextStyle(
                            color: Colors.white,
                          ),
                          prefixIcon: Icon(
                            Icons.smartphone,
                            color: Colors.white,
                          ),
                          prefixText: '+91 ',
                          labelText: "Enter Your Phone Number",
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.white, width: 2.0),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 2.0,
                            ),
                          ),
                        ),
                      )),
                  SizedBox(height: 30),
                  Container(
                    height: 50.0,
                    margin: EdgeInsets.all(10),
                    child: RaisedButton(
                      onPressed: () {
                        if (_controller.text.length == 10) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  Login_OTP(_controller.text)));
                        } else {
                          Fluttertoast.showToast(
                              msg: "The number is invalid..Check Again",
                              backgroundColor: Colors.red);
                        }
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(80.0)),
                      padding: EdgeInsets.all(0.0),
                      child: Ink(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xff66664d), Color(0xfff59e5b)],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.circular(30.0)),
                        child: Container(
                          constraints:
                              BoxConstraints(maxWidth: 200.0, minHeight: 50.0),
                          alignment: Alignment.center,
                          child: Text(
                            "SEND OTP",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 15),
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
      )),
    );
  }
}
