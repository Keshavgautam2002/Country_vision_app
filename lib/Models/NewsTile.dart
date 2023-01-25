import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher_string.dart';

class NewsTile extends StatefulWidget {
  final String title;
  final String imageUrl;
  final String url;
  const NewsTile({super.key, required this.imageUrl, required this.title,required this.url});

  @override
  State<NewsTile> createState() => _NewsTileState();
}

class _NewsTileState extends State<NewsTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> launchUrlString(widget.url),
      child: Container(
        padding: EdgeInsets.all(7),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                  blurRadius: 5,
                  blurStyle: BlurStyle.solid,
                  spreadRadius: 1,
                  color: Colors.grey)
            ]),
        margin: EdgeInsets.all(8),
        child: Column(
          children: [
            Image(
              image: NetworkImage(widget.imageUrl),
              fit: BoxFit.fill,
            ),
            Text(widget.title,style: GoogleFonts.openSans(fontSize: 15,fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    );
  }
}