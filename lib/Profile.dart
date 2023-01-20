import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:news_app/validator.dart';

void main() => runApp(const Profile());

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  User? user = Auth().currentUser;
  late AnimationController controller;
  late Animation animation;
  @override
  void initState() {

    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    controller.forward();
    animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);
    // animation.addListener(() {setState(() {
    //   print(animation.value);
    // });});

    controller.addListener(() {
      setState(() {
        print(controller.value);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: InkWell(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                CupertinoIcons.back,
                color: Colors.black,
              ),
            ),
            leadingWidth: 55,
            title: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.65,
                ),
                const Icon(
                  CupertinoIcons.bell,
                  color: Colors.black,
                ),
              ],
            )),
        body: Stack(fit: StackFit.expand, children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                height: MediaQuery.of(context).size.height * 0.6,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(50), bottom: Radius.zero)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 150,
                    ),
                    Text("Account",
                        style: GoogleFonts.ubuntu(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 20,
                    ),
                    Text("Subscription",
                        style: GoogleFonts.ubuntu(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 20,
                    ),
                    Text("Your News Request",
                        style: GoogleFonts.ubuntu(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 130,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: (){
                            const snackbar = SnackBar(content: Text("Successfully Logged out"));
                            Auth().signout();
                            ScaffoldMessenger.of(context).showSnackBar(snackbar);
                            setState(() {});
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(20)),
                            height: 35,
                            width: 100,
                            child: Center(
                                child: Text("Logout",
                                    style: GoogleFonts.ubuntu(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold))),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome",
                  style: GoogleFonts.ubuntu(fontSize: 35),
                ),
                Text("Keshav Gautam",
                    style:
                        GoogleFonts.ubuntu(fontSize: 30, color: Colors.blue)),
                const SizedBox(
                  height: 50,
                ),
                Center(
                    child: Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Colors.black,
                            offset: Offset(0, 6),
                            blurRadius: 15)
                      ], shape: BoxShape.circle),
                      child: const Hero(
                        tag: 'hero',
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://lh3.googleusercontent.com/a/ALm5wu1HuE4hUq29555HzaMK6r50_R0hQdjwJB_x6lFd5A=s288-p-rw-no"),
                          radius: 70,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(user?.email??"",
                        style: GoogleFonts.ubuntu(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                  ],
                ))
              ],
            ),
          ),
        ]));
  }
}
