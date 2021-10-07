import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  late final String phone;
    HomePage(this.phone);
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<HomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("Welcome");
  }

  @override
  Widget build(BuildContext context) {
    print("Welcome");
    return Scaffold(
      backgroundColor: Color(0xff762929),
      body: Center(
        child: Text(
          "HOME - Hi,${widget.phone}",
          style: TextStyle(fontSize: 10, color: Colors.white),
        ),
      ),
    );
  }
}
