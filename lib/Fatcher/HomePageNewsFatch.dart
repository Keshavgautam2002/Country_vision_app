import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:news_app/Models/HomePageNewsModel.dart';


Future<List<HomePageNews>> getList()
async {
  var json = await rootBundle.loadString('https://newsapi.org/v2/everything?q=apple&from=2022-12-08&to=2022-12-08&sortBy=popularity&apiKey=cbc131deb3e046b0870c2bb968404ed6');
  var decodedData = jsonDecode(json);
  var news = decodedData['articles'];
  List<HomePageNews> list = List.from(news).map((e) => HomePageNews.fromMap(e)).toList();
  return list;
}



/*
"author": "investing.com",
"title": "Tesla's Full Self-Driving Beta now available to all in N. America, Musk says By Reuters",
"description": "(Reuters) - Tesla (NASDAQ:TSLA) Inc's Full Self-Driving Beta software is now available to everyone in North America, Elon Musk said early on Thursday, as the automaker awaits regulatory approval for its cars to be driven without human oversight. \"Tesla Full S…",
"url": "https://biztoc.com/x/2fa677cb87931303",
"urlToImage": "https://c.biztoc.com/p/2fa677cb87931303/og.webp",
"publishedAt": "2022-11-24T16:10:10Z",
"content": "(Reuters) - Tesla (NASDAQ:TSLA) Inc's Full Self-Driving Beta software is now available to everyone in North America, Elon Musk said early on Thursday, as the automaker awaits regulatory approval for … [+959 chars]"

 */