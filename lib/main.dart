import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:squareone_sam/pages/login_page/login_phno.dart';
import 'package:squareone_sam/pages/mainPage.dart';
import 'package:squareone_sam/pages/product_detail.dart';
import 'package:squareone_sam/themes/theme.dart';
import 'package:squareone_sam/widgets/customRoute.dart';
import 'config/route.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    Firebase.initializeApp();
    return MaterialApp(
      title: 'SquareOne ',
      theme: AppTheme.lightTheme.copyWith(
        textTheme: GoogleFonts.mulishTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      debugShowCheckedModeBanner: false,
      routes: Routes.getRoute(),
      onGenerateRoute: (RouteSettings settings) {
        if (settings.name.contains('detail')) {
          return CustomRoute<bool>(
              builder: (BuildContext context) => ProductDetailPage());
        } else {
          return CustomRoute<bool>(
              builder: (BuildContext context) => Login_Phno());
        }
      },
      initialRoute: "./login_page",
    );
  }
}
