import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:news_app/sign_up.dart';
import 'package:news_app/validator.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

void main() => runApp(Login_page());

class Login_page extends StatefulWidget {
  const Login_page({Key? key}) : super(key: key);

  @override
  State<Login_page> createState() => _Login_pageState();
}

class _Login_pageState extends State<Login_page> {
  static bool isLogin = false;
  bool isGoogle = false;
  String? errorMessage = "";
  
  //Controllers to control text-field inputs
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  //Creating user
  final User? user = Auth().currentUser;
  GoogleSignIn _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _currentUser;

  //login function
  Future<void> singin() async {
    setState(() {
      isLogin = true;
    });
    try {
      await Auth().signinwithemailandpassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }

    setState(() {
      isLogin = false;
    });
  }

  Future<void> signup() async {
    try {
      await Auth().createnewuserwithemailandpassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
      isLogin = true;
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Future<void> loginwithgoogle() async {
    isLogin = true;
    isGoogle = true;
    try {
      _googleSignIn.signIn();
      print(_currentUser?.email);
    } catch (e) {
      print(e);
    }
  }

  void logoutwithgoogle() {
    _googleSignIn.disconnect();
    isLogin = false;
  }

  @override
  void initState() {
    _googleSignIn.onCurrentUserChanged.listen((account) {
      setState(() {
        _currentUser = account;
      });
      _googleSignIn.signInSilently();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: isLogin,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.35,
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: const Image(
                        image: AssetImage("Asset/login_image.jpg"),
                        fit: BoxFit.cover,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 13),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "WELCOME !",
                        style: GoogleFonts.roboto(
                            color: Colors.blue,
                            fontSize: 35,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Please login to your account",
                        style: GoogleFonts.montserrat(
                            color: Color.fromRGBO(43, 52, 103, 10),
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(1, 1),
                                  blurRadius: 10)
                            ]),
                        height: 45,
                        child: TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                              label: Text(
                                "Email",
                                style: GoogleFonts.lato(
                                    color: Colors.grey, fontSize: 15),
                              ),
                              border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(30)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.white,
                                  ),
                                  borderRadius: BorderRadius.circular(30)),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.blue),
                                borderRadius: BorderRadius.circular(30),
                              )),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(1, 1),
                                  blurRadius: 10)
                            ]),
                        height: 45,
                        child: TextField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                              label: Text(
                                "Password",
                                style: GoogleFonts.lato(
                                    color: Colors.grey, fontSize: 15),
                              ),
                              border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(30)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.white,
                                  ),
                                  borderRadius: BorderRadius.circular(30)),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.blue),
                                borderRadius: BorderRadius.circular(30),
                              )),
                        ),
                      ),
                      const SizedBox(height: 10),
                      InkWell(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Text("Forgot Password ?",
                              style: GoogleFonts.openSans(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold)),
                        ),
                        onTap: () {
                          print("Forgot Password.... sent to link");
                        },
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Center(
                        child: InkWell(
                          onTap: () => singin(),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            height: 30,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(11, 84, 170, 1),
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                                child: Text(
                              "Login",
                              style: GoogleFonts.montserrat(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )),
                          ),
                        ),
                      ),
                      SizedBox(
                          height: 60,
                          child: Center(
                              child: Text(
                            "OR",
                            style: GoogleFonts.lato(
                                color: Colors.blue, fontWeight: FontWeight.bold),
                          ))),
                      Center(
                        child: InkWell(
                          onTap: () => loginwithgoogle(),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.55,
                            height: 35,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Color.fromRGBO(160, 197, 202, 1)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Sign in with ",
                                  style: GoogleFonts.openSans(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  height: 30,
                                  width: 30,
                                  child: Image(
                                    image: AssetImage("Asset/icon_google.png"),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                              onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));},
                              child: Text(
                                "Sign up",
                                style: GoogleFonts.openSans(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold),
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
