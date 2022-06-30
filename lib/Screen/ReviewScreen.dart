import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:note_app/helper/funcs.dart';

import '../constants.dart';

class ReviewScreen extends StatefulWidget {
  var description;
  var title;
  var date;
  var done;

  ReviewScreen({this.description, this.title, this.date, this.done});

  @override
  _ReviewScreenState createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "${widget.title}",
            style: TextStyle(
              color: textcolor,
              fontSize: fontLarge,
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: textcolor,
              size: 25,
            ),
          ),
          backgroundColor: primarydarkcolor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(RadiusCircular),
              bottomRight: Radius.circular(RadiusCircular),
            ),
          ),
        ),
        backgroundColor: primarycolor,
        body: Padding(
          padding: const EdgeInsets.all(DPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "${widget.description}",
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40.0, vertical: 30),
                child: Text(
                  "${widget.date}",
                  style: TextStyle(
                    color: textcolor,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            funs.shareLink(
                "Title: ${widget.title}\ndate: ${widget.date}\ndescription: ${widget.description}");
          },
          backgroundColor: primarydarkcolor,
          child: const Icon(
            Icons.share,
            color: textcolor,
          ),
        ),
      ),
    );
  }
}
