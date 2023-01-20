import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:news_app/First_page.dart';
import 'package:news_app/Login_page.dart';
import 'package:news_app/validator.dart';
import 'package:page_transition/page_transition.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Welcome_page());
}

class Welcome_page extends StatefulWidget {
  const Welcome_page({Key? key}) : super(key: key);

  @override
  State<Welcome_page> createState() => _Welcome_pageState();
}

class _Welcome_pageState extends State<Welcome_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnimatedSplashScreen(
        nextScreen: StreamBuilder<User?>(
          stream: Auth().authStateChanges,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return First_page();
            } else {
              return  Login_page();
            }
          },
        ),
        splash: "Asset/cv_1.jpg",
        duration: 10,
        splashTransition: SplashTransition.fadeTransition,
        splashIconSize: 200,
        pageTransitionType: PageTransitionType.leftToRight,
      ),
    );
  }
}
