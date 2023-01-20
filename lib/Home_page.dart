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

const String apiKey = "eb96c5fa61324cde9d24619eddefa76d";

void main() => runApp(const Home_page());

// ignore: camel_case_types
class Home_page extends StatefulWidget {
  const Home_page({Key? key}) : super(key: key);
  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  //Variables

  List<HomePageNews> list = [];

  Future<void> getList() async {
    http.Response json = await http.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=$apiKey"));
    Map decodedData = jsonDecode(json.body);
    var news = decodedData['articles'];
    print(news);
    news.forEach((element) => list.add(HomePageNews.fromMap(news[element])));
    print(list.length);
    print(list[0].title);
    print(list[2].title);
    // news.forEach((element) {
    //   list.add(HomePageNews.fromMap(news[element]));
    //   print(list[element].title);
    // });
  }

  //Fetching List from GetList method
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Search_page()));
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
          body: list.isEmpty
              ? ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (context, index) => ListTile(
                      leading: Text(list[index].title),
                    ),
                  )
              : const Center(
                  child: CircularProgressIndicator(
                    color: Colors.green,
                  ),
                ),
        ));
  }
}

class NewsTile extends StatefulWidget {
  final String title;
  final String imageUrl;
  const NewsTile({super.key, required this.imageUrl, required this.title});

  @override
  State<NewsTile> createState() => _NewsTileState();
}

class _NewsTileState extends State<NewsTile> {
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 10,
        child: Card(
          child: Column(
            children: [
              Text(widget.title),
              Image(image: NetworkImage(widget.imageUrl)),
            ],
          ),
        ));
  }
}
