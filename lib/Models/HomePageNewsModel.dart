class HomePageNews
{
  String imageUrl;
  String title;
  String author;
  String desc;
  String content;


  HomePageNews({required this.imageUrl, required this.title, required this.author,required this.content, required this.desc});
  factory HomePageNews.fromMap(Map<dynamic,dynamic> map)
  {
    return HomePageNews(
      imageUrl: map['urlToImage'],
      title: map['title'],
      author: map['author'],
      content: map['content'],
      desc: map['description'],
    );
  }
}

