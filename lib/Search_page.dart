import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import 'main.dart';
import 'package:flutter/material.dart';

void main() => runApp(Search_page());


class Search_page extends StatefulWidget {
  const Search_page({Key? key}) : super(key: key);

  @override
  State<Search_page> createState() => _Search_pageState();
}

class _Search_pageState extends State<Search_page> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 25,horizontal: 15),
              child: TextFormField(
                decoration: InputDecoration(
                  icon: Icon(CupertinoIcons.search,color: Colors.blue,),
                ),
              )
            ),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .40,
                  ),
                  Container(
                    child: Text(
                      "Tell us!",
                      style: GoogleFonts.lato(
                        fontSize: 30,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  Container(child: Text(" What you are looking for?",
                  style: GoogleFonts.b612(),),),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
