import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

void main() => runApp(const Contact_page());

class Contact_page extends StatefulWidget {
  const Contact_page({Key? key}) : super(key: key);

  @override
  State<Contact_page> createState() => _Contact_pageState();
}

TextEditingController _messageController = TextEditingController();
TextEditingController _nameController = TextEditingController();
TextEditingController _emailController = TextEditingController();

class _Contact_pageState extends State<Contact_page> {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const InkWell(
          child: Icon(
            CupertinoIcons.back,
            color: Colors.black,
          ),
        ),
        title: Text("Contact Us",
            style: GoogleFonts.lato(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 23)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Center(
              child: Image(
                image: AssetImage("Asset/contact_us.jpg"),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blueGrey.shade50,
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 10,
                            offset: Offset(0, 3))
                      ]),
                  width: 80,
                  height: 80,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(CupertinoIcons.phone,color: Colors.deepPurple.shade300,),
                      const SizedBox(height: 10,),
                      Text(
                        "Call",
                        style: GoogleFonts.ubuntu(
                            color: Colors.deepOrangeAccent,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blueGrey.shade50,
                      boxShadow:const [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 10,
                            offset: Offset(0, 3))
                      ]),
                  width: 80,
                  height: 80,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(CupertinoIcons.mail,color: Colors.deepPurple.shade300,),
                      const SizedBox(height: 10,),
                      Text(
                        "E-mail",
                        style: GoogleFonts.ubuntu(
                            color: Colors.deepOrangeAccent,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blueGrey.shade50,
                      boxShadow:const [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 10,
                            offset: Offset(0, 3))
                      ]),
                  width: 80,
                  height: 80,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(CupertinoIcons.chat_bubble_2,color: Colors.deepPurple.shade300,),
                      const SizedBox(height: 10,),
                      Text(
                        "Chat",
                        style: GoogleFonts.ubuntu(
                            color: Colors.deepOrangeAccent,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20,),
            Center(child: Text("Quick Contact", style: GoogleFonts.openSans(color: Colors.deepOrangeAccent,fontWeight: FontWeight.bold,fontSize: 20),)
            ),
            const SizedBox(height: 10,),
            Container(
              margin:const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.grey,
                        offset: Offset(1, 1),
                        blurRadius: 10)
                  ]),
              height: 50,
              child: TextField(
                controller: _nameController,
                decoration: InputDecoration(
                    label: Text(
                      "Your Name",
                      style: GoogleFonts.lato(color: Colors.grey),
                    ),
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
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
            const SizedBox(height: 15,),
            Container(
              margin:const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.grey,
                        offset: Offset(1, 1),
                        blurRadius: 10)
                  ]),
              height: 50,
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                    label: Text(
                      "E-mail",
                      style: GoogleFonts.lato(color: Colors.grey),
                    ),
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
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
            const SizedBox(height: 15,),
            Container(
              margin:const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.grey,
                        offset: Offset(1, 1),
                        blurRadius: 10)
                  ]),
              height: 120,
              child: TextField(
                controller: _messageController,
                decoration: InputDecoration(
                    label: Text(
                      "Message",
                      style: GoogleFonts.lato(color: Colors.grey),
                    ),
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
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
            const SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    try{
                      _firebaseFirestore.collection('messeges').add({
                        'email' : _emailController.text.trim(),
                        'message' : _messageController.text.trim(),
                        'name' : _nameController.text.trim(),
                      });
                    }catch(e){print(e);}
                    const snackBar = SnackBar(content : Text("Message sent"),);
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20)),
                    height: 35,
                    width: 100,
                    child: Center(
                        child: Text("Send",
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
      ),
    );
  }
}
