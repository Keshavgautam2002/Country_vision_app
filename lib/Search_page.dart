import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Home_page.dart';
import 'Models/HomePageNewsModel.dart';
import 'Models/NewsTile.dart';

void main() => runApp(Search_page());

class Search_page extends StatefulWidget {
  const Search_page({Key? key}) : super(key: key);

  @override
  State<Search_page> createState() => _Search_pageState();
}

class _Search_pageState extends State<Search_page> {
  final TextEditingController _searchController = TextEditingController();
  List<HomePageNews> list = [];
  String _search = '';
  bool isFinding = false;

  //function to find news

  Future<void> _showNews() async {
    _search = _searchController.text.trim();
    http.Response json = await http.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=in&q=$_search&apiKey=$apiKey"));
    Map decodedData = jsonDecode(json.body);
    decodedData['articles']?.forEach((element) {
      if (element['urlToImage'] != null &&
          element['description'] != null &&
          element['title'] != null &&
          element['author'] != null &&
          element['content'] != null &&
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

    isFinding = false;
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ModalProgressHUD(
        inAsyncCall: isFinding,
        child: Scaffold(
          body: Column(
            children: [
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  padding:
                      const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
                  child: TextField(
                    onSubmitted: (value) {
                      isFinding = true;
                      _showNews();
                    },
                    cursorColor: Colors.black,
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: "type here to search",
                      hintStyle: GoogleFonts.lato(color: Colors.grey),
                      icon: const Icon(
                        CupertinoIcons.search,
                        color: Colors.blue,
                      ),
                    ),
                  )),
              list.isEmpty
                  ? Center(
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
                          Container(
                            child: Text(
                              " What you are looking for?",
                              style: GoogleFonts.b612(),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container(
                      margin: const EdgeInsets.all(10),
                      child: ListView.builder(
                          itemCount: list.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => NewsTile(
                              imageUrl: list[index].imageUrl,
                              title: list[index].title,
                              url: list[index].url)),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
