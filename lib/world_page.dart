import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/Profile.dart';
import 'package:news_app/Search_page.dart';
import 'package:news_app/validator.dart';
import 'Models/HomePageNewsModel.dart';
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'Models/NewsTile.dart';

const String apiKey = "eb96c5fa61324cde9d24619eddefa76d";

void main() => runApp(const World_page());

// ignore: camel_case_types
class World_page extends StatefulWidget {
  const World_page({Key? key}) : super(key: key);
  @override
  State<World_page> createState() => _World_pageState();
}

class _World_pageState extends State<World_page> {
  //Variables
  bool isEmpty = true;

  List<HomePageNews> list = [];

  Future<void> getList() async {
    http.Response json = await http.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey"));
    Map decodedData = jsonDecode(json.body);
    decodedData['articles']?.forEach((element) {
      if (element['urlToImage'] != null &&
          element['description'] != null &&
          element['title'] != null &&
          element['author'] != null &&
          element['content'] != null  &&
          element['url'] != null) {
        HomePageNews news = HomePageNews(
            url: element['url'],
            imageUrl: element['urlToImage'],
            title: element['title'],
            author: element['author'],
            content: element['content'],
            desc: element['description']);
        list.add(news);
      }
    });
    setState(() {
      if (list.isNotEmpty) {
        isEmpty = false;
      }
    });
  }

  @override
  void initState() {
    getList();
    super.initState();
  }
  final User? user = Auth().currentUser;

  @override
  Widget build(BuildContext context) {
    getList();
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Row(
                children: [
                  Text(
                    "Country Vision",
                    style: GoogleFonts.lato(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .25,
                  ),

                  //Search Icon
                  InkWell(
                    child: const Icon(
                      CupertinoIcons.search,
                      color: Colors.black,
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Search_page()));
                    },
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .05,
                  ),

                  //Account Icon
                  InkWell(
                    child: const Hero(
                        tag: 'hero',
                        child: CircleAvatar(
                            radius: 17,
                            backgroundImage: NetworkImage(
                                "https://lh3.googleusercontent.com/a/ALm5wu1HuE4hUq29555HzaMK6r50_R0hQdjwJB_x6lFd5A=s288-p-rw-no"))),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Profile()));
                    },
                  ),
                ],
              ),
            ),
            body: ModalProgressHUD(
              inAsyncCall: isEmpty,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: list.length,
                    itemBuilder: (context, index) => NewsTile(
                        url: list[index].url,
                        imageUrl: list[index].imageUrl,
                        title: list[index].title)),
              ),
            )));
  }
}


